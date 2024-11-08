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

@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        // Input validation
        if (name == null || email == null || message == null ||
                name.trim().isEmpty() || email.trim().isEmpty() || message.trim().isEmpty()) {
            out.println("<h3>Error: All fields are required.</h3>");
            return;
        }

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Updated driver class
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/iu_db?useSSL=false", "root", "0515");
            String sql = "INSERT INTO contact_messages (name, email, message) VALUES (?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, name.trim());
            stmt.setString(2, email.trim());
            stmt.setString(3, message.trim());
            int result = stmt.executeUpdate();

            if (result > 0) {
                out.println("<h3>Thank you for your message! We will get back to you soon.</h3>");
                request.getRequestDispatcher("contact.jsp").include(request, response);
            } else {
                out.println("<h3>Error submitting message. Please try again.</h3>");
                request.getRequestDispatcher("contact.jsp").include(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3>Database connection error.</h3>");
            request.getRequestDispatcher("contact.jsp").include(request, response);
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
}
