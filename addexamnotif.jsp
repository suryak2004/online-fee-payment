<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Upload Exam Notification</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        /* General Styles */
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            background: url("web/images/notif.jpg");
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            height: 100vh;
            background-size: cover;
        }

        /* Upload Container */
        .container {
            width: 420px;
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            text-align: center;
            animation: fadeIn 0.5s ease-in-out;
        }

        /* Heading */
        h2 {
            margin-bottom: 15px;
            color: #2c3e50;
            font-size: 22px;
            font-weight: bold;
        }

        /* Upload Button */
        input[type="file"] {
            display: none;
        }
        .upload-btn {
            display: inline-block;
            padding: 12px 20px;
            background: #3498db;
            color: white;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            transition: 0.3s;
        }
        .upload-btn:hover {
            background: #2980b9;
        }

        /* Image Preview */
        #preview {
            margin-top: 20px;
            max-width: 100%;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            display: none;
        }

        /* Submit Button */
        .submit-btn {
            margin-top: 20px;
            padding: 12px 22px;
            background: #2ecc71;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            transition: 0.3s;
        }
        .submit-btn:hover {
            background: #27ae60;
        }

        /* Back Button (Fixed at Bottom Center) */
        .back-btn {
            position: fixed;
            bottom: 30px;
            left: 50%;
            transform: translateX(-50%);
            width: 200px;
            padding: 15px 25px;
            font-size: 18px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
            border: 3px solid white;
            border-radius: 8px;
            background: transparent;
            color: white;
            transition: 0.3s ease-in-out;
        }

        .back-btn:hover {
            background: white;
            color: black;
            transform: scale(1.1);
        }
      
        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Upload Exam Notification</h2>
        <form action="uploadExamNotification.jsp" method="post" enctype="multipart/form-data">
            <label for="file-upload" class="upload-btn">
                <i class="fa-solid fa-upload"></i> Choose Image
            </label>
            <input type="file" id="file-upload" name="examImage" accept="image/*" onchange="previewImage(event)">
            <br>
            <img id="preview" alt="Image Preview">
            <br>
            <button type="submit" class="submit-btn"><i class="fa-solid fa-cloud-upload-alt"></i> Upload</button>
        </form>
    </div>

    <a href="adminpane.jsp" class="back-btn">Back</a>

    <script>
        function previewImage(event) {
            var reader = new FileReader();
            reader.onload = function () {
                var preview = document.getElementById('preview');
                preview.src = reader.result;
                preview.style.display = "block";
            };
            reader.readAsDataURL(event.target.files[0]);
        }
    </script>

</body>
</html>
