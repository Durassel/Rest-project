package database;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;

public class Database {
    private static String url = "jdbc:mysql://localhost:3306/dbmovies";    
    private static String driverName = "com.mysql.jdbc.Driver";   
    private static String username = "root";   
    private static String password = "software";
    private static Connection db;

    public static Connection getConnection() {
        try {
            Class.forName(driverName);
            try {
            	db = DriverManager.getConnection(url, username, password);
            } catch (SQLException ex) {
                System.out.println("Failed to create the database connection."); 
            }
        } catch (ClassNotFoundException ex) {
            System.out.println("Driver not found."); 
        }
        return db;
    }
}