<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Student Panel Dashboard</title>
    
    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- FontAwesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            background: url('web/images/cse.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #fff;
            transition: all 0.3s ease;
        }
        
        /* Navbar Styling */
        .navbar {
            background: #131722;
            padding: 10px 20px;
        }
        .navbar-brand {
            color: #64dfdf;
            font-weight: bold;
            font-size: 20px;
        }
        .navbar .welcome {
            color: #fff;
            font-size: 26px;
        }
        
        /* Sidebar Styling */
        .sidebar {
            width: 250px;
            background: #131722;
            color: #fff;
            padding-top: 15px;
            position: fixed;
            height: 100%;
            top: 0;
            left: 0;
            z-index: 1000;
            transition: left 0.3s ease-in-out;
            box-shadow: 4px 0 10px rgba(0, 0, 0, 0.1);
            padding-left: 5px;
        }

        .sidebar.hidden {
            left: -250px;
        }

        .sidebar h2 {
            color: #64dfdf;
            text-align: center;
            font-weight: bold;
            font-size: 20px;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
        }

        .sidebar ul li {
            padding: 10px;
            font-size: 17px;
            border-radius: 5px;
        }

        .sidebar ul li a {
            text-decoration: none;
            color: #ddd;
            display: flex;
            align-items: center;
            gap: 8px;
            padding: 6px;
            border-radius: 5px;
            transition: background 0.3s ease-in-out;
        }

        .sidebar ul li a:hover {
            background: #233554;
            color: #64dfdf;
        }

        .sidebar ul li i {
            width: 18px;
            text-align: center;
        }

        .sidebar .logout-btn {
            display: block;
            margin: 5px auto;
            text-align: center;
            padding: 8px;
            background: #e63946;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            transition: background 0.3s ease-in-out;
            bottom:10px;
        }

        .sidebar .logout-btn:hover {
            background: #b52b36;
        }

        /* Hamburger Button */
        #menu-toggle {
            position: fixed;
            top: 15px;
            left: 15px;
            z-index: 1100;
            background: transparent;
            border: none;
            color: white;
            font-size: 22px;
            cursor: pointer;
        }
    </style>
    <%
HttpSession httpSession=request.getSession();
int studentid=(int)httpSession.getAttribute("studentid");
%>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg">
        
        <div class="ms-auto welcome"><%=" 21A21A0" + studentid %></div>
    </nav>

    <button id="menu-toggle">
        <i class="fas fa-bars"></i>
    </button>
    <div class="sidebar hidden">
        <h2>Student Panel</h2>
        <ul>
            <li><a href="checkattendence.jsp"><i class="fa-solid fa-user-check"></i> Check Attendance</a></li>
            <li><a href="checkfee.jsp"><i class="fa-solid fa-money-bill-wave"></i> Check Due's</a></li>
            <li><a href="payment.html"><i class="fa-solid fa-credit-card"></i> Pay Due's</a></li>
            <li><a href="pay.html"><i class="fa-solid fa-credit-card"></i> Based On UPI Pay</a></li>
            <li><a href="recenttrans.jsp"><i class="fa-solid fa-clock-rotate-left"></i> Recent Transactions</a></li>
            <li><a href="stfeed.jsp"><i class="fa-solid fa-comments"></i> Feedback</a></li>
            <li><a href="#"><i class="fa-solid fa-bell"></i> View Exam Notifications</a></li>
            <li><a href="viewres.jsp"><i class="fa-solid fa-comments"></i> View Responses</a></li>
        </ul>
        <a href="index.html" class="logout-btn">
            <i class="fa-solid fa-right-from-bracket"></i> Logout
        </a>
    </div>

    <script>
        document.getElementById('menu-toggle').addEventListener('click', function() {
            document.querySelector('.sidebar').classList.toggle('hidden');
        });
    </script>
</body>
</html>