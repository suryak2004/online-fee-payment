<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Check Attendance</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('web/images/clg.jpg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
            color: white;
        }

        .container {
            width: 85%;
            margin: 30px auto;
            padding: 20px;
            backdrop-filter: blur(10px); /* Background blur effect */
            border-radius: 10px;
            text-align: center;
        }

        h2 {
            color: #FFD700; /* Gold color */
        }

        table {
            width: 90%;
            border-collapse: collapse;
            margin: 20px auto;
            background: rgba(0, 0, 0, 0.5); /* Transparent black */
            border-radius: 10px;
            overflow: hidden;
            color: white;
        }

        th, td {
            padding: 15px;
            border: 1px solid white;
            text-align: center;
        }

        th {
            background-color: rgba(255, 215, 0, 0.8); /* Gold with transparency */
            color: black;
        }

        tr:nth-child(even) {
            background-color: rgba(255, 255, 255, 0.2);
        }

            .back-btn {
        display: block;
        width: 200px; /* Increased width */
        padding: 15px 25px; /* More padding for a bigger button */
        font-size: 18px; /* Larger font */
        font-weight: bold;
        text-align: center;
        text-decoration: none;
        border: 3px solid white; /* Thicker border */
        border-radius: 8px; /* Slightly rounded edges */
        background: transparent;
        color: white;
        margin: 30px auto; /* More spacing */
        transition: 0.3s ease-in-out;
    }

    .back-btn:hover {
        background: white;
        color: black;
        transform: scale(1.1); /* Slight hover effect */
    }

        }

    </style>
</head>
<body>

<div class="container">
    <h2>Attendance Report</h2>
    <table>
        <tr>
            <th>Student Id</th>
            <th>Working Days</th>
            <th>Presented Days</th>
            <th>Percentage</th>
        </tr>
        <%
        HttpSession httpSession = request.getSession(false);
        int studentid = (int) httpSession.getAttribute("studentid");
        System.out.print(studentid);
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/payment", "root", "root");
            PreparedStatement pst = conn.prepareStatement("SELECT * FROM studentlogin WHERE studentid='" + studentid + "'");
            ResultSet rs = pst.executeQuery();
            
            while (rs.next()) {
                int id = rs.getInt("studentid");
                int total = rs.getInt("totalclasses");
                int attend = rs.getInt("presented");
                Double percentage = rs.getDouble("attendance");
        %>
        <tr>
            <td><%= id %></td>
            <td><%= total %></td>
            <td><%= attend %></td>
            <td><%= percentage %> %</td>
        </tr>
        <%
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<tr><td colspan='4' style='color: red;'>Database Error!</td></tr>");
        }
        %>
    </table>
    <a href="parentpane.jsp" class="back-btn">Back</a>
</div>

</body>
</html>
