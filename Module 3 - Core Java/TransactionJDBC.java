
import java.sql.*;

public class TransactionJDBC {

    public static void main(String[] args) throws Exception {
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "*password*");
        conn.setAutoCommit(false);

        try {
            Statement stmt = conn.createStatement();
            stmt.executeUpdate("UPDATE accounts SET balance = balance - 500 WHERE id = 1");
            stmt.executeUpdate("UPDATE accounts SET balance = balance + 500 WHERE id = 2");
            conn.commit();
            System.out.println("Transaction successful");
        } catch (Exception e) {
            conn.rollback();
            System.out.println("Transaction failed");
        }
    }
}
