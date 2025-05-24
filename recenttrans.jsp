<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fee Structure</title>
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
            background: rgba(0, 0, 0, 0.6);
            z-index: -1;
        }

        .container {
            width: 70%;
            margin: 50px auto;
            padding: 20px;
            backdrop-filter: blur(10px);
            border-radius: 10px;
            text-align: center;
        }

        h2 {
            color: #FFD700;
            font-size: 28px;
            text-transform: uppercase;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: rgba(0, 0, 0, 0.5);
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
            background-color: rgba(255, 215, 0, 0.8);
            color: black;
            text-transform: uppercase;
        }

        tr:nth-child(even) {
            background-color: rgba(255, 255, 255, 0.2);
        }

        /* Button Styling */
        .btn {
            display: inline-block;
            padding: 12px 20px;
            font-size: 16px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
            border-radius: 8px;
            background: transparent;
            color: white;
            border: 2px solid white;
            transition: 0.3s ease-in-out;
            margin-top: 20px;
        }

        .btn:hover {
            background: gold;
            color: black;
            transform: scale(1.1);
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Recent Transactions</h2>
    <table>
        <tr>
            <th>Student Id</th>
            <th>UPI ID</th>
            <th>Amount</th>
            <th>Time</th>
        </tr>
        <%
        try {
            HttpSession httpSession = request.getSession(false);
            if (httpSession != null && httpSession.getAttribute("studentid") != null) {
                int studentid = (int) httpSession.getAttribute("studentid");

                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/payment", "root", "root");
                PreparedStatement pst = conn.prepareStatement("SELECT upiID,amount,studentid,Time FROM transamount WHERE studentid = ?");
                pst.setInt(1, studentid);
                ResultSet rs = pst.executeQuery();

                if (rs.next()) {
                    int id = rs.getInt("studentid");
                   String upi = rs.getString("upiID");
                    String amount = rs.getString("amount");
                    String ddate = rs.getString("Time");
        %>
        <tr>
            <td><%= id %></td>
            <td><%= upi %></td>
            <td><%= amount %></td>
            <td><%= ddate %></td>
        </tr>
        <%
                } else {
                    out.println("<tr><td colspan='4' style='color: yellow;'>No fee details found.</td></tr>");
                }
            } else {
                out.println("<tr><td colspan='4' style='color: red;'>Session Expired! Please log in again.</td></tr>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<tr><td colspan='4' style='color: red;'>Database Error!</td></tr>");
        }
        %>
    </table>
    <a href="studentpane.jsp" class="btn">Back</a>
</div>

</body>
</html>
