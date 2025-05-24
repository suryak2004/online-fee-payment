<%@page import="java.sql.*"%>
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
String name=request.getParameter("name");
String number=request.getParameter("mobile");
Long mobile=Long.parseLong(number);
String query=request.getParameter("query");
try {
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/payment","root","root");
	PreparedStatement pst=	 conn.prepareStatement("insert into parfeed values(?,?,?,?)  ");
	pst.setString(1, name);
	pst.setLong(2, mobile);
	pst.setString(3, query);
	pst.setString(4, "");
	int i=pst.executeUpdate();
	if(i>0){
		out.println("<script>");
		out.println("alert('Feedback stored sucessfull');");
		out.println("window.location.href='parentfeed.jsp';");
		out.println("</script>");
	}
	else{
		out.println("<script>");
		out.println("alert('Error in feedback');");
		out.println("window.location.href='parentfeed.jsp';");
		out.println("</script>");
	}
}
catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>