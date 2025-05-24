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
long mobile;
String stid=request.getParameter("id");
int studentid=Integer.parseInt(stid);

HttpSession httpSession = request.getSession();
//Object mob = httpSession.getAttribute("dbmobile");
//Long mobile=(Long)mob;
try {
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/payment","root", "root");
	PreparedStatement pst1=	 conn.prepareStatement("select * from parent where studentid='"+studentid+"'  ");
	ResultSet rs=pst1.executeQuery();
	if(rs.next()){
	mobile=rs.getLong(3);

	PreparedStatement pst=	 conn.prepareStatement("update parent set studentid='"+studentid+"' where mobile='"+mobile+"'  ");
	 int i=pst.executeUpdate();
   // pst.setLong(1, mobile);
    if (i>0) {
   	 //HttpSession httpSession=	request.getSession();
   	 httpSession.setAttribute("studentid", studentid);

        out.println("<script>");
			out.println("alert('Strored');");
			out.println("window.location.href='parentpane.jsp';");
			out.println("</script>"); 
    }
    else{
    	 out.println("<script>");
			out.println("alert('Not Strored');");
			out.println("window.location.href='parentpane.jsp';");
			out.println("</script>"); 
    }
	}
	else{
		 out.println("<script>");
			out.println("alert('Enter Valid id');");
			out.println("window.location.href='parentpane.jsp';");
			out.println("</script>"); 
	}
}catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>