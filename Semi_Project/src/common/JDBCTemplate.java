package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCTemplate {
	
	//JDBC을 통해 db와 연결하기 위해 공통으로 사용
	public static Connection getConnection() {
		
		//드라이버 등록
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("01. 드라이버 연결");
		} catch (ClassNotFoundException e) {
			System.out.println("01. 드라이버 연결 실패");
			e.printStackTrace();
		}

		//계정 연결
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "OPYUNG";
		String pw = "OPYUNG";
		
		Connection con = null;
		
		try {
			con = DriverManager.getConnection(url, id, pw);
			System.out.println("02. 계정 연결");
			
			con.setAutoCommit(false);  		//자동 commit처리가 되지 않게끔 세팅해주자
			
		} catch (SQLException e) {
			System.out.println("02. 계정 연결 실패");
			e.printStackTrace();
		}
		
		return con;
	}
	
	
	//close()
	public static void close(Connection con) {
		try {
			con.close();
		} catch (SQLException e) {
			System.out.println("Connection객체 close 오류");
			e.printStackTrace();
		}
	}
	
	public static void close(Statement stmt) {
		try {
			stmt.close();
		} catch (SQLException e) {
			System.out.println("Statement객체 close 오류");
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rs) {
		try {
			rs.close();
		} catch (SQLException e) {
			System.out.println("ResultSet객체 close 오류");
			e.printStackTrace();
		}
	}
	
	
	//commit() & rollback()
	public static void commit(Connection con) {
		try {
			con.commit();
		} catch (SQLException e) {
			System.out.println("Commit 오류");
			e.printStackTrace();
		}
	}

	
	public static void rollback(Connection con) {
		try {
			con.rollback();
		} catch (SQLException e) {
			System.out.println("Rollback 오류");
			e.printStackTrace();
		}
	}
	
	
	
}
