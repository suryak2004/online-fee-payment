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
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: rgba(0, 0, 0, 0.5); /* Transparent black */
            border-radius: 10px;
            overflow: hidden;
            color: white;
        }

        th, td {
            padding: 12px;
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

        img {
            width: 80px;
            height: 80px;
            border-radius: 10px;
            display: block;
            margin: auto;
            border: 2px solid white;
        }

        a {
            text-decoration: none;
            color: white;
            font-weight: bold;
            display: inline-block;
            margin-top: 15px;
            padding: 10px 20px;
            border: 2px solid white;
            border-radius: 5px;
            transition: 0.3s ease;
        }

        a:hover {
            background: white;
            color: black;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>List of Students</h2>
    <table>
        <tr>
            <th>Student ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Mobile</th>
            <th>Pin</th>
            <th>DOB</th>
            <th>Gender</th>
            <th>Location</th>
            <th>Profile</th>
            <th>Password</th>
            <th>Attendance</th>
        </tr>
        <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/payment", "root", "root");
            PreparedStatement pst = conn.prepareStatement("SELECT * FROM studentlogin");
            ResultSet rs = pst.executeQuery();
            
            while (rs.next()) {
                int id = rs.getInt("studentid");
                String fname = rs.getString("FName");
                String lname = rs.getString("Lname");
                String email = rs.getString("Email");
                Long mobile = rs.getLong("Mobile");
                int pin = rs.getInt("Pin");
                String dob = rs.getString("dob");
                String gender = rs.getString("gender");
                String location = rs.getString("location");
                String profile = rs.getString("profile");
                String password = rs.getString("password");
                double attend = rs.getDouble("attendance");
        %>
        <tr>
            <td><%= id %></td>
            <td><%= fname %></td>
            <td><%= lname %></td>
            <td><%= email %></td>
            <td><%= mobile %></td>
            <td><%= pin %></td>
            <td><%= dob %></td>
            <td><%= gender %></td>
            <td><%= location %></td>
            <td><img src="images/<%= profile %>" alt="Profile Picture"></td>
            <td><%= password %></td>
            <td><%= attend %></td>
        </tr>
        <%
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<tr><td colspan='11' style='color: red;'>Database Error!</td></tr>");
        }
        %>
    </table>
    <a href="adminpane.jsp">Back</a>
</div>

</body>
</html>
