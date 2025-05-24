<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fee Form</title>
    <style>
        :root {
            --primary-color: #FF6B6B;
            --secondary-color: #4ECDC4;
            --dark-color: #2C3E50;
            --light-color: #ffffff;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(45deg, #FF6B6B, #4ECDC4);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .fee-form {
            background: var(--light-color);
            padding: 2.5rem;
            border-radius: 20px;
            width: 100%;
            max-width: 460px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
        }

        .fee-form h2 {
            color: var(--dark-color);
            text-align: center;
            margin-bottom: 2rem;
        }
a{
text-decoration: none;}
        .form-group {
            margin-bottom: 1.5rem;
        }

        .fee-form label {
            display: block;
            margin-bottom: 0.5rem;
            color: var(--dark-color);
            font-weight: 500;
        }

        .fee-form input {
            width: 100%;
            padding: 0.8rem 1rem;
            border: 2px solid #e1e1e1;
            border-radius: 12px;
            font-size: 1rem;
            background: #f8f9fa;
            color: var(--dark-color);
        }

        .fee-form button {
            width: 100%;
            padding: 1rem;
            border: none;
            border-radius: 12px;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form class="fee-form" action="addfeecontrol.jsp" method="post">
        <h2>Fee Details</h2>
        
        <div class="form-group">
            <label for="student-id">Student ID</label>
            <input type="text" id="student-id" name="student_id" placeholder="Enter Student ID" required>
        </div>
        
        <div class="form-group">
            <label for="tuition-fee">Tutition Fee</label>
            <input type="number" id="tuition-fee" name="tutition_fee" placeholder="Enter Tuition Fee" required>
        </div>
        
        <div class="form-group">
            <label for="bus-fee">Bus Fee</label>
            <input type="number" id="bus-fee" name="bus_fee" placeholder="Enter Bus Fee" required>
        </div>
        
        <div class="form-group">
            <label for="hostel-fee">Hostel Fee</label>
            <input type="number" id="hostel-fee" name="hostel_fee" placeholder="Enter Hostel Fee" required>
        </div>
        
        <div class="form-group">
            <label for="due-date">Due Date</label>
            <input type="date" id="due-date" name="due_date" required>
        </div>
        <a href="adminpane.jsp">Back</a>
        <button type="submit">Add Fee</button>
    </form>
</body>
</html>
