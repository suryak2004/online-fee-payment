<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String stid=  request.getParameter("Regdno");
String password=  request.getParameter("pass");



System.out.print(stid);

try {
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/payment","root", "root");
	PreparedStatement pst=	 conn.prepareStatement("select studentid,password from studentlogin where studentid='"+stid+"' and password='"+password+"'  ");
	 ResultSet rs= pst.executeQuery();	 
		 
		if(rs.next()) {
			
			int dbid=	rs.getInt("studentid");
			 HttpSession httpSession=	request.getSession();
			 
			 httpSession.setAttribute("studentid", dbid);
			// System.out.print(dbid);
			out.println("<script>");
   			out.println("alert('Login sucessfull');");
   			out.println("window.location.href='studentpane.jsp';");
   			out.println("</script>");
      	  
      	 
      	  
        }
		else{
			out.println("<script>");
   			out.println("alert('Invalid Username and password');");
   			out.println("window.location.href='Studentlogin.html';");
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