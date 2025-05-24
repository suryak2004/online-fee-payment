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
String sid=request.getParameter("id");
int id=Integer.parseInt(sid);
String email=request.getParameter("email");
String data=request.getParameter("data");
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/payment","root", "root");
	PreparedStatement pst=	 conn.prepareStatement("insert  into stfeed values(?,?,?,?,?)");
	// ResultSet rs= pst.executeQuery();
	pst.setString(1, name);
	pst.setInt(2, id);
	pst.setString(3, email);
	pst.setString(4, data);
	pst.setString(5, "");
	int i=pst.executeUpdate();
	 if(i>0){
		 out.println("<script>");
			out.println("alert('Feedback Added Successfull');");
			out.println("window.location.href='studentpane.jsp';");
			out.println("</script>");
	 }
}
catch(Exception e){
	e.printStackTrace();
	out.println("<script>");
	out.println("alert('Error in feedback');");
	//out.println("window.location.href='studentpane.jsp';");
	out.println("</script>");
}






%>
</body>
</html>