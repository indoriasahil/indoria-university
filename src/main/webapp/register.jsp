<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Registration</title>
     <link rel="icon" href="img2/iu_logo.png" type="image/x-icon">
    <style>
        /* General page settings */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            color: #333;
        }

        /* Header styling */
        header {
            background-color: #0044cc;
            color: #ffffff;
            padding: 20px;
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .logo {
            width: 150px;
            max-width: 100%;
            height: auto;
            margin-bottom: 15px;
        }

        header h2 {
            margin: 0;
            font-size: 2em;
        }

        /* Container styling */
        .container {
            max-width: 600px;
            margin: 30px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #0044cc;
            margin-bottom: 30px;
        }

        /* Form styling */
        .registration-form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        label {
            font-weight: bold;
            color: #555;
        }

        .form-control {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }

        .form-control:focus {
            outline: none;
            border-color: #0044cc;
            box-shadow: 0 0 5px rgba(0, 68, 204, 0.3);
        }

        select.form-control {
            cursor: pointer;
        }

        /* Button styling */
        .btn-primary {
            background-color: #0044cc;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        .btn-primary:hover {
            background-color: #003399;
        }

        /* Login link styling */
        .login-link {
            text-align: center;
            margin-top: 20px;
        }

        .login-link a {
            color: #0044cc;
            text-decoration: none;
        }

        .login-link a:hover {
            text-decoration: underline;
        }
        
        
        
        
      /* Header styling */
        header {
            background: linear-gradient(135deg, #0044cc, #0066ff);
            color: #ffffff;
            padding: 2rem;
            text-align: center;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            position: relative;
            overflow: hidden;
        }

        header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(45deg, rgba(255,255,255,0.1) 25%, transparent 25%);
            background-size: 3em 3em;
            animation: moveBackground 20s linear infinite;
        }

        @keyframes moveBackground {
            0% { background-position: 0 0; }
            100% { background-position: 3em 3em; }
        }

        header h1 {
            margin: 0;
            font-size: 2.8em;
            font-weight: 700;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
            position: relative;
            letter-spacing: 1px;
        }
      /* Navigation styling */
        nav {
            margin-top: 1.5rem;
            padding: 1rem 0;
            display: flex;
            justify-content: center;
            gap: 1.5rem;
            position: relative;
            z-index: 1;
        }

        nav a {
            color: #ffffff;
            text-decoration: none;
            padding: 0.8rem 1.5rem;
            border-radius: 25px;
            transition: all 0.3s ease;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(5px);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        nav a:hover {
            background: rgba(255, 255, 255, 0.25);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
               
        }
    </style>
</head>
<body>
  
       
        <header>
        
       <h2 style="color:white;">Register here</h2>
        <nav>
            <a href="about.jsp">About Us</a>
            <a href="register.jsp">Register</a>
            <a href="login.jsp">Login</a>
            <a href="contact.jsp">Contact Us</a>
        </nav>
    </header>
 

    <div class="container">
        <h2>Student Registration</h2>
     
        <form  class="registration-form" action="register" method="post";>
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required 
                       class="form-control" placeholder="Enter your full name">
            </div>
            
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required 
                       class="form-control" placeholder="Enter your email">
            </div>
            
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required 
                       class="form-control" placeholder="Enter your password">
            </div>
            
            <div class="form-group">
                <label for="course">Course:</label>
                <select id="course" name="course" required class="form-control">
                    <option value="" disabled selected>Select your course</option>
                    <option value="Computer Science">Computer Science</option>
                    <option value="Electrical">Electrical</option>
                    <option value="Artificial Intelligence">Artificial Intelligence</option>
                    <option value="Mechanical">Mechanical</option>
                    <option value="Civil">Civil</option>
                    <option value="Data Science">Data Science</option>
                    <option value="Information Technology">Information Technology</option>
                </select>
            </div>

            <button type="submit" class="btn btn-primary"> Register</button>
            
            <div class="login-link">
                Already have an account? <a href="login.jsp">Login here</a>
            </div>
        </form>
    </div>
</body>
</html>
