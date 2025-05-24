<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
String sid=request.getParameter("id");
int id=Integer.parseInt(sid);
String data=request.getParameter("data");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/payment", "root", "root");
            PreparedStatement pst = conn.prepareStatement("UPDATE stfeed SET Response = ? WHERE id = ?");
          //  pst.setInt(1, id);
            pst.setString(1, data);
           pst.setInt(2, id);
            
            int i = pst.executeUpdate();
            
            conn.close();

            if (i > 0) {
            	out.println("<script>");
        		out.println("alert('Response stored sucessfull');");
        		out.println("window.location.href='viewfeed.jsp';");
        		out.println("</script>");
        		} else {
        			out.println("<script>");
        			out.println("alert('Error in Response submission');");
        			out.println("window.location.href='viewfeed.jsp';");
        			out.println("</script>");
            } 
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script>alert('Database error!');");
        }
    
%>