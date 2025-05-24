<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Parent Feedback Form</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(to right, #6a11cb, #2575fc);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .feedback-form {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(10px);
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
        }
        .form-control {
            border-radius: 10px;
        }
        .btn-custom {
            background: #ff7eb3;
            border: none;
            width: 100%;
            padding: 10px;
            font-size: 18px;
            border-radius: 10px;
            transition: all 0.3s ease;
        }
        .btn-custom:hover {
            background: #ff4d94;
            transform: scale(1.05);
        }
        .form-label {
            font-weight: bold;
            color: white;
        }
        a{
        text-decoration: none;
        color: red;}
    </style>
</head>
<body>

    <div class="feedback-form p-4 text-white">
        <h3 class="text-center mb-3">Parent Feedback Form</h3>
        <form action="parentfeedstore.jsp" method="post">
            <div class="mb-3">
                <label for="name" class="form-label">Parent Name</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="Enter your name" required>
            </div>
            <div class="mb-3">
                <label for="mobile" class="form-label">Mobile Number</label>
                <input type="number" class="form-control" id="mobile" name="mobile" placeholder="Enter your mobile number" pattern="[0-9]{10}" required>
            </div>
            <div class="mb-3">
                <label for="query" class="form-label">Your Query</label>
                <textarea class="form-control" id="query" name="query" rows="4" placeholder="Write your feedback or query..." required></textarea>
            </div>
            <button type="submit" class="btn btn-custom">Submit Feedback</button>
        </form>
        <a href="parentpane.jsp">Back</a>
    </div>

</body>
</html>
