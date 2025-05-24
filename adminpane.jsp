<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    
    <!-- FontAwesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
            margin: 0;
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 16px;
            font-weight: 400;
            color: #000000;
            background-color: #eaeff4; /* Fallback color */
        }

        .navbar {
            width: 100%;
            background: #343a40;
            color: white;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;	
        }
        
        #bg-video {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            object-fit: cover;
            z-index: -1;
        }
           
        .navbar h2 {
            margin: 0;
        }

        .hamburger {
            font-size: 24px;
            cursor: pointer;
            color: white;
            background: none;
            border: none;
            z-index: 1001;
        }

        .logout {
            position: absolute;
            bottom: 60px;
            left: 0;
            width: 100%;
            text-align: center;
            background: #e74c3c;
            border-radius: 50px;
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

        .sidebar {
            width: 250px;
            height: 100vh;
            background: rgba(44, 62, 80, 0.95);
            padding-top: 20px;
            color: white;
            position: fixed;
            left: -250px;
            transition: all 0.3s ease;
            box-shadow: 5px 0px 15px rgba(0, 0, 0, 0.2);
        }

        .sidebar.active {
            left: 0;
        }

        .sidebar h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 22px;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
        }

        .sidebar ul li {
            padding: 12px 20px;
            display: flex;
            align-items: center;
            gap: 10px;
            transition: background 0.3s ease, transform 0.2s ease;
            border-radius: 8px;
            margin: 5px;
        }

        .sidebar ul li a {
            color: white;
            text-decoration: none;
            font-size: 16px;
            display: flex;
            align-items: center;
            gap: 10px;
            width: 100%;
        }

        .sidebar ul li:hover {
            background: rgba(255, 255, 255, 0.1);
            transform: scale(1.05);
            cursor: pointer;
        }

        .content {
            margin-left: 1000px;
            padding: 40px;
            color: #2c3e50;
            text-align: center;
            flex-grow: 1;
        }
    </style>
</head>
<%
    HttpSession httpSession = request.getSession();
    String username = (String) httpSession.getAttribute("username");
%>
<body>
    <nav class="navbar">
        <button class="hamburger" onclick="toggleSidebar()"><i class="fa-solid fa-bars"></i></button>
      
        <h5><i class="fa-solid fa-user"></i> <%=" " + username %></h5>
    </nav>
   
    <div class="sidebar" id="sidebar">
        <h2>Admin Panel</h2>
        <ul>
            <li><a href="studentreg.html"><i class="fa-solid fa-user-plus"></i> Add Student</a></li>
            <li><a href="parentreg.html"><i class="fa-solid fa-user-group"></i> Add Parent</a></li>
            <li><a href="viewstudents.jsp"><i class="fa-solid fa-users"></i> View Students</a></li>
            <li><a href="attendance.html"><i class="fa-solid fa-calendar-check"></i> Add Attendance</a></li>
            <li><a href="addfee.jsp"><i class="fa-solid fa-dollar-sign"></i> Add Fee</a></li>
            <li><a href="viewstfeed.jsp"><i class="fa-solid fa-comments"></i>Student Feedback</a></li>
            <li><a href="viewparfeed.jsp"><i class="fa-solid fa-comments"></i>Parent Feedback</a></li>
            <li><a href="addexamnotif.jsp"><i class="fa-solid fa-bell"></i> Exam notifications</a></li>
            <li><a href="send.html"><i class="fa-solid fa-bell"></i> Email Alert</a></li>
        </ul>
        <div class="logout">
            <a href="index.html"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
        </div>
    </div>
    <video autoplay muted loop id="bg-video">
        <source src="web/images/bgv.mp4" type="video/mp4" />
    </video>
    
    <script>
        function toggleSidebar() {
            document.getElementById("sidebar").classList.toggle("active");
        }
    </script>
</body>
</html> 