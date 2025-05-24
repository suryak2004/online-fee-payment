<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Parent form</title>
</head>
<body>
<%
String sid=request.getParameter("id");
int id=Integer.parseInt(sid);
String name=request.getParameter("name");
String Mobile=request.getParameter("mobile");
Long mobile=Long.parseLong(Mobile);
String address=request.getParameter("address");



try {
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/payment","root","root");
	PreparedStatement pst=	 conn.prepareStatement("insert into parent(studentid,name,mobile,address) values(?,?,?,?)  ");
	pst.setInt(1, id);
	pst.setString(2, name);
	pst.setLong(3, mobile);
	pst.setString(4, address);
	 int i=pst.executeUpdate(); 
		 
		if(i>0) {;
			out.println("<script>");
   			out.println("alert('Parent Added Successfull');");
   			out.println("window.location.href='adminpane.jsp';");
   			out.println("</script>");	
      	  
        }
		else{
			out.println("<script>");
   			out.println("alert('Parent Added Not sucesdsfull');");
   			out.println("window.location.href='parentreg.html';");
   			out.println("</script>");
		}
		}

 catch (Exception e) {
	// TODO: handle exception
	e.printStackTrace();
}
%>
</body>
</html>