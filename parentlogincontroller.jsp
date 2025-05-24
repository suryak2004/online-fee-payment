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
String number=  request.getParameter("number");
Long mobile=Long.parseLong(number);
String sotp=  request.getParameter("otp");
int otp=Integer.parseInt(sotp);



try {
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/payment","root", "root");
	PreparedStatement pst=	 conn.prepareStatement("select *from parent where mobile='"+mobile+"' and otp='"+otp+"'  ");
	 ResultSet rs= pst.executeQuery();	 
		 
		if(rs.next()) {
		String dbmobile=	rs.getString("mobile");
	 HttpSession httpSession=	request.getSession();
	 httpSession.setAttribute("dbmobile", dbmobile);
	 System.out.print(dbmobile);
		
	 out.println("<script>");
		out.println("alert('Logged sucessfully');");
		out.println("window.location.href='parentpane.jsp';");
		out.println("</script>");
    	  
      	 
      	  
        }
		else{
			out.println("<script>");
   			out.println("alert('Invalid Username and password');");
   			out.println("window.location.href='parentlogin.jsp';");
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