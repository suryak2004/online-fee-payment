<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enhanced Feedback Form</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.0/font/bootstrap-icons.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        /* Custom variables */
        :root {
            --primary-color: #6a11cb;
            --primary-gradient: linear-gradient(to right, #6a11cb, #2575fc);
            --secondary-color: #ff9a9e;
            --secondary-gradient: linear-gradient(to right, #ff9a9e, #fad0c4);
            --accent-color: #1fd1f9;
            --text-color: #3a3f51;
            --light-bg: #f8f9fa;
            --custom-shadow: 0 5px 20px rgba(106, 17, 203, 0.15);
            --transition-time: 0.3s;
        }

        /* Body styling */
        body {
            font-family: 'Poppins', sans-serif;
            background-image: radial-gradient(circle at top right, rgba(106, 17, 203, 0.1), transparent 400px), 
                              radial-gradient(circle at bottom left, rgba(37, 117, 252, 0.1), transparent 400px);
            background-attachment: fixed;
            color: var(--text-color);
            line-height: 1.7;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        /* Container styling */
        .container {
            max-width: 800px;
        }

        .form-container {
            background-color: white;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: var(--custom-shadow);
            transform: translateY(0);
            transition: transform var(--transition-time), box-shadow var(--transition-time);
        }

        .form-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(106, 17, 203, 0.2);
        }

        /* Header styling */
        .form-header {
            background-image: var(--primary-gradient);
            padding: 35px 30px;
            color: white;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .form-header::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background-image: radial-gradient(circle, rgba(255,255,255,0.3) 10%, transparent 10.5%);
            background-size: 20px 20px;
            transform: rotate(30deg);
            z-index: 1;
        }

        .form-header h1 {
            font-weight: 700;
            margin-bottom: 10px;
            position: relative;
            z-index: 2;
        }

        .form-header p {
            font-weight: 300;
            opacity: 0.9;
            margin-bottom: 0;
            position: relative;
            z-index: 2;
        }

        /* Form body styling */
        .form-body {
            padding: 40px;
        }

        /* Label styling */
        label {
            font-weight: 500;
            color: var(--text-color);
            margin-bottom: 8px;
            transition: color var(--transition-time);
        }

        .form-group:focus-within label {
            color: var(--primary-color);
        }

        /* Required indicator */
        .required::after {
            content: " *";
            color: var(--secondary-color);
            font-size: 1.2em;
        }

        /* Input styling */
        .form-control, .form-select {
            border: 2px solid #e9ecef;
            border-radius: 8px;
            padding: 12px 15px;
            font-size: 1rem;
            transition: all var(--transition-time);
        }

        .form-control:focus, .form-select:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 4px rgba(106, 17, 203, 0.15);
        }

        /* Custom radio buttons */
        .custom-radio-group {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-top: 12px;
        }

        .custom-radio {
            display: none;
        }

        .custom-radio-label {
            display: flex;
            align-items: center;
            background-color: var(--light-bg);
            border: 2px solid var(--light-bg);
            border-radius: 8px;
            padding: 10px 15px;
            cursor: pointer;
            transition: all var(--transition-time);
        }

        .custom-radio-label:hover {
            background-color: #f0f2f5;
        }

        .custom-radio:checked + .custom-radio-label {
            background-color: rgba(106, 17, 203, 0.1);
            border-color: var(--primary-color);
            color: var(--primary-color);
            font-weight: 500;
        }

        .emoji {
            margin-right: 8px;
            font-size: 1.2em;
        }

        /* Checkbox styling */
        .form-check {
            margin-bottom: 10px;
            padding-left: 28px;
        }

        .form-check-input {
            width: 20px;
            height: 20px;
            margin-left: -28px;
            border: 2px solid #e9ecef;
            background-color: #fff;
            margin-top: 0.25em;
        }

        .form-check-input:checked {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }

        .form-check-input:focus {
            box-shadow: 0 0 0 4px rgba(106, 17, 203, 0.15);
            border-color: var(--primary-color);
        }

        /* Button styling */
        .btn-gradient {
            background-image: var(--primary-gradient);
            border: none;
            color: white;
            border-radius: 8px;
            padding: 12px 24px;
            font-weight: 600;
            letter-spacing: 0.5px;
            position: relative;
            z-index: 1;
            transition: all var(--transition-time);
            overflow: hidden;
        }

        .btn-gradient::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: var(--secondary-gradient);
            z-index: -1;
            opacity: 0;
            transition: opacity var(--transition-time);
        }

        .btn-gradient:hover::before {
            opacity: 1;
        }

        .btn-gradient:focus {
            box-shadow: 0 0 0 4px rgba(106, 17, 203, 0.25);
        }

        /* Success message */
        .success-message {
            background-image: linear-gradient(to right, #00b09b, #96c93d);
            color: white;
            border-radius: 8px;
            padding: 30px;
            text-align: center;
            box-shadow: var(--custom-shadow);
            display: none;
            position: relative;
            overflow: hidden;
        }

        .success-message::before {
            content: '';
            position: absolute;
            width: 60px;
            height: 60px;
            background-color: rgba(255, 255, 255, 0.3);
            border-radius: 50%;
            top: -30px;
            left: -30px;
        }

        .success-message::after {
            content: '';
            position: absolute;
            width: 40px;
            height: 40px;
            background-color: rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            bottom: -20px;
            right: -20px;
        }

        .success-message h3 {
            font-weight: 700;
            margin-bottom: 15px;
        }

        .success-icon {
            font-size: 50px;
            margin-bottom: 20px;
        }

        /* Floating label animation */
        .floating-group {
            position: relative;
        }

        .floating-input {
            padding-top: 20px;
            padding-bottom: 10px;
        }

        .floating-label {
            position: absolute;
            top: 50%;
            left: 15px;
            transform: translateY(-50%);
            background-color: transparent;
            color: #6c757d;
            transition: all 0.2s ease;
            pointer-events: none;
        }

        .floating-input:focus ~ .floating-label,
        .floating-input:not(:placeholder-shown) ~ .floating-label {
            top: 25%;
            font-size: 0.75rem;
            color: var(--primary-color);
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .form-body {
                padding: 25px;
            }
            
            .custom-radio-group {
                flex-direction: column;
                gap: 8px;
            }
        }
        a{
text-decoration: none;}
    </style>
</head>
<body>
    <div class="container">
        <div class="form-container">
            <div class="form-header">
                <h1>Feedback Form</h1>

            </div>
            
            <div class="form-body">
                <form id="feedbackForm" action="storefeed.jsp">
                    <div class="row mb-4">
                        <!-- Name field with floating label -->
                        <div class="col-md-6 mb-3 mb-md-0">
                            <div class="form-group floating-group">
                                <input type="text" id="name" class="form-control floating-input" placeholder=" " required name="name">
                                <label for="name" class="floating-label required">Full Name</label><br>
                            </div>
                        </div>
                        
                        <!-- Email field with floating label -->
                        <div class="col-md-6">
                            <div class="form-group floating-group">
                                <input type="number" id="email" class="form-control floating-input" placeholder=" " required name="id">
                                <label for="id" class="floating-label required">id</label>
                            </div>
                        </div>
                         <div class="col-md-6">
                            <div class="form-group floating-group">
                                <input type="email" id="email" class="form-control floating-input" placeholder=" " required name="email">
                                <label for="email" class="floating-label required">Email Address</label>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Rating with custom radio buttons and Bootstrap icons -->
                    
                    
                    <!-- Comments textarea -->
                    <div class="form-group mb-4">
                        <label for="comments" class="required">Tell us more about your experience</label>
                        <textarea id="comments" class="form-control" rows="4" required name="data"></textarea>
                    </div>
                    
                    <!-- Submit button with gradient -->
                    <div class="text-center">
                        <button type="submit" class="btn btn-gradient">Submit Feedback</button>
                    </div>
                    <a href="index.html">Back</a>
                </form>
                
                <!-- Success message with icon -->
                
            </div>
            
        </div>
        
    </div>

    <!-- Bootstrap JS Bundle (includes Popper) -->
    