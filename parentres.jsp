<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Parent Response Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea, #764ba2);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .form-container {
            background: rgba(255, 255, 255, 0.2);
            padding: 30px;
            border-radius: 15px;
            backdrop-filter: blur(10px);
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
            animation: fadeIn 1s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .btn-custom {
            background: #ff758c;
            background: linear-gradient(45deg, #ff758c, #ff7eb3);
            border: none;
            transition: transform 0.2s ease-in-out;
        }
        .btn-custom:hover {
            transform: scale(1.05);
            background: linear-gradient(45deg, #ff7eb3, #ff758c);
        }
        .form-control:focus {
            border-color: #ff7eb3;
            box-shadow: 0 0 10px rgba(255, 126, 179, 0.5);
        }
    </style>
</head>
<body>
    <div class="form-container text-white">
        <h2 class="text-center mb-4">Admin Response</h2>
        <form action="updateparResponse.jsp">
            <div class="mb-3">
                <label for="studentId" class="form-label">Name  :</label>
                <input type="text" class="form-control" id="studentId" placeholder="Enter Name" name="name">
            </div>
            <div class="mb-3">
                <label for="response" class="form-label">Response</label>
                <textarea class="form-control" id="response" rows="3" placeholder="Enter your response" name="data"></textarea>
            </div>
            <button type="submit" class="btn btn-custom w-100">Submit</button>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
