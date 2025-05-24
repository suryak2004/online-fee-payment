<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Fee Submission</title>
</head>
<body>

<%
    // Retrieve form data
    String studentIdStr = request.getParameter("student_id");
	String tufee = request.getParameter("tutition_fee");
	String bufee = request.getParameter("bus_fee");
    String hufee = request.getParameter("hostel_fee");
    String dueDate = request.getParameter("due_date");

    

        try {
            int studentId = Integer.parseInt(studentIdStr);
            double tfee=Double.parseDouble(tufee);
			double bfee=Double.parseDouble(bufee);
			double hfee=Double.parseDouble(hufee);
			
            // Load MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/payment", "root", "root");

           

            // SQL query to update student fee details in the studentlogin table
            String query = "UPDATE studentlogin SET tfee = ?,bfee=?, hfee=?, ddate = ? WHERE studentid = ?";

            PreparedStatement pst = conn.prepareStatement(query);
            pst.setDouble(1, tfee);
            pst.setDouble(2, bfee);
            pst.setDouble(3, hfee);
            pst.setString(4, dueDate);
            pst.setInt(5, studentId);
			
            int rowsAffected = pst.executeUpdate();

            if (rowsAffected > 0) {
					out.println("<script>");
		   			out.println("alert('Fee Added Successfull');");
		   			out.println("window.location.href='adminpane.jsp';");
		   			out.println("</script>");
            } else {
					out.println("<script>");
		   			out.println("alert('Added Successfull');");
		   			out.println("window.location.href='addfee.jsp';");
		   			out.println("</script>");
            }

            // Close resources
            pst.close();
            conn.close();

        } catch (NumberFormatException e) {
%>
            <h3 style="color: red;">Invalid input. Please enter valid numbers.</h3>
<%
        } catch (Exception e) {
e.printStackTrace();
        }
     
%>

</body>
</html>
