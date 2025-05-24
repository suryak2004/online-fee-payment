import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
@MultipartConfig
@WebServlet("/studentregcontrol")
public class studentregcontrol extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String sid=request.getParameter("id");
		int id=Integer.parseInt(sid);
		String fname=request.getParameter("Fname");
		String lname=request.getParameter("Lname");
		String email=request.getParameter("Email");
		String Mob=request.getParameter("Mobile");
		Long mobile=Long.parseLong(Mob);
		String Pin=request.getParameter("Pin");
		int pin=Integer.parseInt(Pin);
		String dob=request.getParameter("dob");
		String gender=request.getParameter("gender");
		String location =request.getParameter("location");
		String password=request.getParameter("pass");
		Part filepart=request.getPart("Profile");
		String fileName=      Paths.get(filepart.getSubmittedFileName()).getFileName().toString();
		String uploadpath=   getServletContext().getRealPath("") + File.separator + "images";
		    File file=new File(uploadpath);
		      if(!file.exists()) 
		   	   file.mkdir();
		   	   String filepath=uploadpath + file.separator + fileName;
		   	   filepart.write(filepath);
		   	   try{
		   		Class.forName("com.mysql.cj.jdbc.Driver");
		   		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/fee","root", "admin");
		   		PreparedStatement pst=	 conn.prepareStatement("insert  into studentlogin  values (?,?,?,?, ?, ?, ?, ?, ?, ?,?,?,?,?,?,?,?,?)");
		   		 pst.setInt(1, id);
		   		 pst.setString(2, fname);
		   		 pst.setString(3, lname);
		   		 pst.setString(4, email);
		   		 pst.setLong(5, mobile);
		   		 pst.setLong(6, pin);
		   		 pst.setString(7, dob);
		   		 pst.setString(8, gender);
		   		 pst.setString(9, location);
		   		pst.setString(10, fileName);
       		   	pst.setString(11, password);
		   		pst.setDouble(12, 0.00);
		   		pst.setInt(13, 0);
		   		pst.setInt(14, 0);
		   		pst.setDouble(15, 0.0);
		   		pst.setDouble(16, 0.0);
		   		pst.setDouble(17, 0.0);
		   		pst.setString(18, "");   		
		   	 int i= pst.executeUpdate();
		   		   if(i==1){
		   			out.println("<script>");
		   			out.println("alert('Added Successfull');");
		   			out.println("window.location.href='adminpane.jsp';");
		   			out.println("</script>");
		   		   }else{
		   			out.println("<script>");
		   			out.println("alert('Already exists');");
		   			out.println("window.location.href='adminpane.html';");
		   			out.println("</script>");
		   		   }
		   	   }
		   	catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
	}
}