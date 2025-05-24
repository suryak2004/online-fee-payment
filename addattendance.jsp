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
String st=request.getParameter("total");
int total=Integer.parseInt(st);
String cam=request.getParameter("came");
int came=Integer.parseInt(cam);
String sid=request.getParameter("id");
int id=Integer.parseInt(sid);
Double t=((double)came/total)*100;
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn=	   DriverManager.getConnection("jdbc:mysql://localhost:3306/payment","root", "root");
PreparedStatement pst= conn.prepareStatement("update studentlogin set attendance=?,totalclasses=?,presented=?  where studentid='"+id+"'");
pst.setDouble(1, t);
pst.setInt(2, total);
pst.setInt(3, came);
int i=pst.executeUpdate();
if(i>0){
	out.println("<script>");
		out.println("alert('Attendance Added Successfull');");
		out.println("window.location.href='adminpane.jsp';");
		out.println("</script>");
}
else{
	out.println("<script>");
		out.println("alert('Added UnSuccessfull');");
		out.println("window.location.href='attendance.html';");
		out.println("</script>");
}
%>
</body>
</html>