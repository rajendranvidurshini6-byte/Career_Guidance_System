package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String URL  = "jdbc:postgresql://localhost:5432/career_guidance";
    private static final String USER = "postgres";
    private static final String PASS = "your_password";   // ← CHANGE THIS

    static {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            System.err.println("❌ PostgreSQL driver not found!");
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASS);
    }

    // ============================================================
    // TEMPORARY — Run this once to test the connection.
    // Right-click the file → Run File.  Delete afterwards.
    // ============================================================
    public static void main(String[] args) {
        try (Connection c = getConnection()) {
            System.out.println("✅ DB OK: " + c.getMetaData().getURL());
            System.out.println("   User: " + c.getMetaData().getUserName());
        } catch (Exception e) {
            System.err.println("❌ DB FAILED:");
            e.printStackTrace();
        }
    }
}