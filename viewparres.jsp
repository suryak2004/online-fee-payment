<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Students</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('web/images/clg.jpg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
            color: white;
        }

        /* Dark overlay for better readability */
        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.6); /* Dark overlay */
            z-index: -1;
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
            font-size: 28px;
            text-transform: uppercase;
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
            text-transform: uppercase;
        }

        tr:nth-child(even) {
            background-color: rgba(255, 255, 255, 0.2);
        }

        /* Updated Back Button Style */
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
        background: gold;
        color: black;
        transform: scale(1.1); /* Slight hover effect */
    }

    </style>
</head>
<body>

<div class="container">
    <h2>Admin Response</h2>
    <table>
        <tr>
            <th>Name</th>
            <th>Response</th>
        </tr>
        <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/payment", "root", "root");
            PreparedStatement pst = conn.prepareStatement("SELECT * FROM parfeed");
            ResultSet rs = pst.executeQuery();
            
            while (rs.next()) {
                String name = rs.getString("Name");
                String data = rs.getString("Response");
        %>
        <tr>
            <td><%= name %></td>
            <td><%= data %></td>
        </tr>
        <%
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<tr><td colspan='2' style='color: red;'>Database Error!</td></tr>");
        }
        %>
    </table>
    <a href="parentpane.jsp" class="back-btn">Back</a>
</div>

</body>
</html>
