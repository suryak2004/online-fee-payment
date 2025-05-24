import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/DownloadPatientsServlet")
public class DownloadPatientsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment; filename=Studentattendence.csv");
        try (PrintWriter out = response.getWriter()) {
            String connectionUrl = "jdbc:mysql://localhost:3306/fee";
            String userId = "root";
            String password = "admin";
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(connectionUrl, userId, password);
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from studentlogin");
            // Writing CSV headers
            out.println("Name,Email,Contact No");
            // Writing CSV rows
            while (resultSet.next()) {
                out.println(resultSet.getInt("studentid") + "," +
                            resultSet.getInt("totalclasses") + "," +
                            resultSet.getInt("presented") + "," +
                            resultSet.getDouble("attendance") + "," 
                            );
            }
            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}