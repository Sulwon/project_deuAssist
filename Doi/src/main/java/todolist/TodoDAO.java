package todolist;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class TodoDAO {
	private Connection conn;
	private ResultSet rs;
	
	public TodoDAO() {
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
	
	public int create_todo(String userID) {
		String SQL = "INSERT INTO todolist VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, "");
			pstmt.setString(3, "");
			pstmt.setString(4, "");
			pstmt.setString(5, "");
			pstmt.setString(6, "");
			pstmt.setString(7, "");
			pstmt.setString(8, "");
			pstmt.setString(9, "");
			pstmt.setString(10, "");
			pstmt.setString(11, "");
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB error
		
	}
	public ArrayList<Todo> getList(String userID) {
		String SQL = "SELECT * FROM todolist WHERE userID = ?";
		ArrayList<Todo> list = new ArrayList<Todo>();		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Todo todo = new Todo();
				todo.setUserID(rs.getString(1));
				todo.setObject1(rs.getString(2));
				todo.setObject2(rs.getString(3));
				todo.setObject3(rs.getString(4));
				todo.setObject4(rs.getString(5));
				todo.setObject5(rs.getString(6));
				todo.setObject6(rs.getString(7));
				todo.setObject7(rs.getString(8));
				todo.setObject8(rs.getString(9));
				todo.setObject9(rs.getString(10));
				todo.setObject10(rs.getString(11));
				list.add(todo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int fix_todo(String userID, String index_number, String input_text) {
		String SQL = "UPDATE todolist SET object" + index_number + " = ? WHERE userID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, input_text);
			pstmt.setString(2, userID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB error		
	}
	public int delete_todo(String userID, String index_number) {
		String SQL = "UPDATE todolist SET object" + index_number + " = ? WHERE userID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, "");
			pstmt.setString(2, userID);
			return pstmt.executeUpdate();			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //DB error
	}
	
}
