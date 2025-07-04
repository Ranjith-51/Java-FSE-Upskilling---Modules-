
import java.sql.*;

public class StudentJDBC {

    Connection conn;

    public StudentJDBC() throws Exception {
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/testdb", "root", "*password*");
    }

    public void insertStudent(int id, String name) throws SQLException {
        PreparedStatement ps = conn.prepareStatement("INSERT INTO students VALUES (?, ?)");
        ps.setInt(1, id);
        ps.setString(2, name);
        ps.executeUpdate();
    }

    public void updateStudent(int id, String newName) throws SQLException {
        PreparedStatement ps = conn.prepareStatement("UPDATE students SET name = ? WHERE id = ?");
        ps.setString(1, newName);
        ps.setInt(2, id);
        ps.executeUpdate();
    }
}
