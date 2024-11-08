<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html>
<head>
 <link rel="icon" href="img2/iu_logo.png" type="image/x-icon">
    <title>Student Dashboard</title>
    <style>
        /* General page settings */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f9;
            color: #333;
        }
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

        /* About section styling */
        .about-section {
            max-width: 800px;
            margin: 3rem auto;
            padding: 3rem;
            background-color: #ffffff;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            transform: translateY(0);
            transition: transform 0.3s ease;
        }

        .about-section:hover {
            transform: translateY(-5px);
        }

        h2 {
            color: #0044cc;
            text-align: center;
            margin-bottom: 2rem;
            font-size: 2.2em;
            position: relative;
            padding-bottom: 15px;
        }

        h2::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 3px;
            background: linear-gradient(90deg, #0044cc, #0066ff);
            border-radius: 2px;
        }

        h3 {
            color: #2c3e50;
            margin: 2rem 0 1.5rem;
            border-bottom: 2px solid #0044cc;
            padding-bottom: 0.8rem;
            font-size: 1.6em;
        }

        p {
            margin-bottom: 2rem;
            font-size: 1.2em;
            color: #444;
            line-height: 1.8;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            margin-bottom: 1.2rem;
            padding: 1.2rem;
            background-color: #f8f9fa;
            border-radius: 10px;
            transition: all 0.3s ease;
            border-left: 4px solid #0044cc;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
        }

        li:hover {
            transform: translateX(10px);
            background-color: #f0f4ff;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        strong {
            color: #0044cc;
            margin-right: 0.8rem;
            font-size: 1.1em;
            display: inline-block;
            position: relative;
        }

        strong::after {
            content: '→';
            margin-left: 8px;
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        li:hover strong::after {
            opacity: 1;
        }
        
        /* Logo styling */
        .logo {
            width: 200px;
            height: auto;
        }
        h2 {
            color: #0044cc;
            text-align: center;
            margin-bottom: 30px;
            font-size: 2.2em;
        }

        h3 {
            color: #2c3e50;
            margin: 20px 0;
            padding-bottom: 10px;
            border-bottom: 2px solid #0044cc;
        }

        .course-list {
            max-width: 800px;
            margin: 30px auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            padding: 20px;
        }

        .course-item {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .course-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .course-item h4 {
            color: #0044cc;
            margin: 0 0 15px 0;
            font-size: 1.2em;
        }

        .download-btn {
            display: inline-block;
            padding: 10px 20px;
            color: #fff;
            background: linear-gradient(135deg, #0044cc, #0066ff);
            text-decoration: none;
            border-radius: 5px;
            font-weight: 500;
            transition: all 0.3s ease;
            width: 100%;
            text-align: center;
            box-sizing: border-box;
        }

        .download-btn:hover {
            background: linear-gradient(135deg, #003399, #0044cc);
            transform: scale(1.02);
        }
    </style>
</head>
<body>
      <header>
        <img src="img2/iu_logo.png" alt="Indoria University Logo" class="logo">
        <h1>Welcome to Indoria University</h1>
        <nav>
            <a href="about.jsp">About Us</a>
            <a href="register.jsp">Register</a>
            <a href="login.jsp">Logout</a>
            <a href="contact.jsp">Contact Us</a>
        </nav>
    </header>
    
    <h2 style="color:green;">Welcome,   <span style="color:red;"><%= session.getAttribute("name") %></span></h2>
    <h3>Your Courses and Notes:</h3>

    <div class="course-list">
        <div class="course-item">
            <h4>Computer Science</h4>
            <a href="https://drive.google.com/drive/folders/1X-Oxf80abq-z3gOyT6Crh87tPsYy4xCZ?usp=drive_link1" target="_blank" class="download-btn">Download Notes</a>
        </div>
        
        <div class="course-item">
            <h4>Electrical Engineering</h4>
            <a href="https://drive.google.com/sample-link-2" target="_blank" class="download-btn">Download Notes</a>
        </div>
        
        <div class="course-item">
            <h4>Artificial Intelligence</h4>
            <a href="https://drive.google.com/sample-link-3" target="_blank" class="download-btn">Download Notes</a>
        </div>
        
        <div class="course-item">
            <h4>Mechanical Engineering</h4>
            <a href="https://drive.google.com/sample-link-4" target="_blank" class="download-btn">Download Notes</a>
        </div>
        
        <div class="course-item">
            <h4>Data Science</h4>
            <a href="https://drive.google.com/sample-link-5" target="_blank" class="download-btn">Download Notes</a>
        </div>
    </div>
</body>
</html>
