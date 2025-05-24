<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Parent Panel Dashboard</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<style>
    body {
        margin: 0;
        font-family: 'Poppins', sans-serif;
        display: flex;
        flex-direction: column;
        height: 100vh;
        background: url("web/images/lib.jpg") no-repeat center center/cover;
    }
    .navbar {
        width: 100%;
        background: #34495e;
        color: white;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 15px 20px;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        position: fixed;
        top: 0;
        left: 0;
        z-index: 1000;
    }
    .welcome {
        font-size: 18px;
        margin-left: auto;
        padding-right: 50px;
    }
    .navbar h1 {
        margin: 0;
        font-size: 22px;
        color: #f1c40f;
    }
    .sidebar {
        width: 280px;
        background: #34495e;
        color: white;
        padding-top: 60px;
        position: fixed;
        height: 100%;
        box-shadow: 5px 0 15px rgba(0, 0, 0, 0.2);
        left: -280px;
        top: 0;
        transition: left 0.3s ease;
    }
    .sidebar.active {
        left: 0;
    }
    .sidebar h2 {
        text-align: center;
        margin-bottom: 30px;
        color: #f1c40f;
    }
    .sidebar ul {
        list-style: none;
        padding: 0;
    }
    .sidebar ul li {
        padding: 15px;
        cursor: pointer;
        transition: 0.3s;
        display: flex;
        align-items: center;
        font-size: 18px;
    }
    .sidebar ul li i {
        margin-right: 12px;
    }
    .sidebar ul li:hover {
        background: #e67e22;
        color: white;
        transform: scale(1.05);
    }
    .sidebar ul li a {
        color: white;
        text-decoration: none;
        display: flex;
        align-items: center;
        gap: 10px;
        width: 100%;
    }
    .logout {
        position: absolute;
        bottom: 100px;
        left: 0;
        width: 100%;
        text-align: center;
        background: #e74c3c;
    }
    .logout a {
        display: block;
        padding: 15px;
        color: white;
        text-decoration: none;
        font-size: 18px;
        transition: 0.3s;
    }
    .logout a:hover {
        background: #c0392b;
    }
    .content {
        margin-left: 280px;
        padding: 40px;
        background: linear-gradient(135deg, rgba(255, 160, 122, 0.85), rgba(176, 196, 222, 0.85));
        text-align: center;
        border-radius: 20px;
        box-shadow: 0px 12px 35px rgba(0, 0, 0, 0.15);
        width: 50%;
        transition: all 0.3s ease-in-out;
        border: 2px solid #34495e;
        position: absolute;
        top: 25%;
        left: 50%;
        transform: translate(-50%, -50%);
        opacity: 0.9;
    }
    .content h1 {
        color: #2c3e50;
        font-size: 32px;
        font-weight: bold;
        margin-bottom: 15px;
    }
    .content p {
        font-size: 18px;
        color: #fff;
    }
    .hamburger {
        position: fixed;
        top: 15px;
        left: 15px;
        font-size: 24px;
        background: none;
        border: none;
        color: white;
        cursor: pointer;
        z-index: 1100;
    }
</style>
</head>
<body>
    <nav class="navbar">
        <div class="welcome">Welcome To Parent Dashboard </div>
    </nav>
    <button class="hamburger" onclick="toggleSidebar()"><i class="fa-solid fa-bars"></i></button>
    
    <div class="sidebar">
        <h2>Parent Panel</h2>
        <ul>
            <li><a href="checkattendence1.jsp"><i class="fa-solid fa-user-check"></i> View Student Attendance</a></li>
            <li><i class="fa-solid fa-money-bill-wave"></i> Check Fee Payments</li>
            <li><a href="parentfeed.jsp"><i class="fa-solid fa-comments"></i> Feedback</a></li>
            <li><a href="viewparres.jsp"><i class="fa-solid fa-comments"></i> View Response</a></li>
        </ul>
        <div class="logout">
            <a href="index.html"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
        </div>
    </div>
   
    <script>
        function toggleSidebar() {
            var sidebar = document.querySelector('.sidebar');
            sidebar.classList.toggle('active');
        }
    </script>
</body>
</html>
