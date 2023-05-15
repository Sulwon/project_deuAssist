package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class BbsDAO {
	private Connection conn;
	private ResultSet rs;
	
	public BbsDAO() {
		try {
			String dbURL ="jdbc:mysql://localhost:3306/DOI";
			String dbID = "root";
			String dbPassword ="0000";
			Class.forName("com.mysql.cj.jdbc.Driver"); //접속을 도와주는 라이브러리
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace(); //오류 출력
		}
	}
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	public int getNext() {
		String SQL = "SELECT b_ID FROM BOARD ORDER BY b_ID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB error
	}
	
	public int write(String b_Title, String userID, String b_Content) {
		String SQL = "INSERT INTO BOARD VALUES (?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, b_Title);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, b_Content);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB error
		
	}
	
	public ArrayList<Bbs> getList(int pageNumber) {
		String SQL = "SELECT * FROM BOARD WHERE b_ID < ? AND b_Available = 1 ORDER BY b_ID DESC LIMIT 10";
		ArrayList<Bbs> list = new ArrayList<Bbs>();		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setB_ID(rs.getInt(1));
				bbs.setB_Title(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setB_Date(rs.getString(4));
				bbs.setB_Content(rs.getString(5));
				bbs.setB_Available(rs.getInt(6));
				list.add(bbs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber)  {
		String SQL = "SELECT * FROM BOARD WHERE b_ID < ? AND b_Available = 1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true; 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;	
	}
	
	public Bbs getBbs(int b_ID) {
		String SQL = "SELECT * FROM BOARD WHERE b_ID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, b_ID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setB_ID(rs.getInt(1));
				bbs.setB_Title(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setB_Date(rs.getString(4));
				bbs.setB_Content(rs.getString(5));
				bbs.setB_Available(rs.getInt(6));
				return bbs;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;	
		
	}
	
	public int fix(int b_ID, String b_Title, String b_Content) {
		String SQL = "UPDATE BOARD SET b_Title = ?, b_Content = ? WHERE b_ID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, b_Title);
			pstmt.setString(2, b_Content);
			pstmt.setInt(3, b_ID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB error		
	}
	
	public int delete(int b_ID) {
		String SQL = "UPDATE BOARD SET b_Available = 0 WHERE b_ID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, b_ID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB error		
		
	}
}
