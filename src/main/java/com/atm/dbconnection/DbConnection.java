package com.atm.dbconnection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class DbConnection {
	private static final String url = "jdbc:postgresql://localhost:5432/Online_ATM_Access"; //  This is url of the Your Database Connection
	private static final String username = "postgres"; // This is username of the your postgre sql database
	private static final String password = "Kingsr@08"; // This the the pass 

	public static Connection dbConnectionPostgres() {
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection(url, username, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return con;
	}

}
