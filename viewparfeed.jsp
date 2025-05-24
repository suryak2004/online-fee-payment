<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Parent Feedback</title>

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
            color: #FFD700; /* Gold color for heading */
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
            background-color: rgba(255, 255, 255, 0.2); /* Light transparent */
        }

        a {
            text-decoration: none;
            color: white;
            font-weight: bold;
            display: inline-block;
            padding: 10px 15px;
            border-radius: 5px;
            transition: 0.3s ease;
        }

        a:hover {
            background: white;
            color: black;
        }

        .respond-btn {
            background: #28a745;
            padding: 5px 10px;
            color: white;
            border-radius: 5px;
        }

        .respond-btn:hover {
            background: #218838;
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
    </style>
</head>
<body>

<div class="container">
    <h2>Parent Feedback</h2>
    <table>
        <tr>
            <th>Parent Name</th>
            <th>Mobile</th>
            <th>Feedback</th>
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
                Long mobile = rs.getLong("Mobile");
                String data = rs.getString("query");
        %>
        <tr>
            <td><%= name %></td>
            <td><%= mobile %></td>
            <td><%= data %></td>
            <td><a href="parentres.jsp" class="respond-btn">Respond</a></td>
        </tr>
        <%
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<tr><td colspan='4' style='color: red;'>Database Error!</td></tr>");
        }
        %>
    </table>
    <a href="adminpane.jsp" class="back-btn">Back</a>
</div>

</body>
</html>
