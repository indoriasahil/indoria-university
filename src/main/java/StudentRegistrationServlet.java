import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@WebServlet("/register")
public class StudentRegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Fetch form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String course = request.getParameter("course");

        // Input validation
        if (name == null || email == null || password == null || course == null ||
                name.trim().isEmpty() || email.trim().isEmpty() || password.trim().isEmpty()
                || course.trim().isEmpty()) {
            out.println("<h3>Error: All fields are required.</h3>");
            return;
        }

        // Database connection
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Updated driver class name
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/iu_db?useSSL=false", "root", "0515");

            // Hash password
            String hashedPassword = hashPassword(password);

            // Insert student data into database
            String sql = "INSERT INTO students (name, email, password, course) VALUES (?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, name.trim());
            stmt.setString(2, email.trim());
            stmt.setString(3, hashedPassword);
            stmt.setString(4, course.trim());
            int result = stmt.executeUpdate();

            if (result > 0) {
                response.sendRedirect("login.jsp?registered=true");
            } else {
                out.println("<h3>Error during registration. Please try again.</h3>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3>Database connection error: " + e.getMessage() + "</h3>");
        } finally {
            try {
                if (stmt != null)
                    stmt.close();
                if (conn != null)
                    conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    private String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashedBytes = md.digest(password.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : hashedBytes) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Error hashing password", e);
        }
    }
}
