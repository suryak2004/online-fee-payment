<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Enter ID</title>
<style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #121212;
            font-family: Arial, sans-serif;
        }
        .form-container {
            background: #1e1e1e;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(255, 255, 255, 0.1);
            width: 300px;
            text-align: center;
        }
        label {
            color: #fff;
            font-size: 16px;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            border: none;
            border-radius: 5px;
            outline: none;
            background: #2c2c2c;
            color: white;
        }
        button {
            width: 100%;
            padding: 10px;
            margin-top: 15px;
            border: none;
            border-radius: 5px;
            background: #4CAF50;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
        }
        button:hover {
            background: #45a049;
            box-shadow: 0px 4px 10px rgba(76, 175, 80, 0.5);
        }
    </style>
</head>
<body>
<form action="studentid.jsp">
    <div class="form-container">
        <form action="studentid.jsp">
         <label>Student Id  :</label>
           <input type="number" id="student-id" placeholder="Student Id" name="id" required>
           <button type="submit" value="store">Submit</button>
           </form>
    </div>
    </form>
</body>
</html>
