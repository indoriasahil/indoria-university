import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("name") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String name = (String) session.getAttribute("name");
        request.setAttribute("studentName", name);

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Updated driver class
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/iu_db?useSSL=false", "root", "0515");

            // Retrieve notes for the student's course
            String sql = "SELECT subject_name, file_path FROM notes JOIN subjects ON notes.subject_id = subjects.subject_id";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            // Convert ResultSet to List to avoid cursor issues
            List<Note> notesList = new ArrayList<>();
            while (rs.next()) {
                Note note = new Note();
                note.setSubjectName(rs.getString("subject_name"));
                note.setFilePath(rs.getString("file_path"));
                notesList.add(note);
            }

            request.setAttribute("notes", notesList);
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3>Database connection error.</h3>");
        } finally {
            try {
                if (rs != null)
                    rs.close();
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

class Note {
    private String subjectName;
    private String filePath;

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }
}
