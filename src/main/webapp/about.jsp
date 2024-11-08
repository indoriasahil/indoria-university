<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>About Us - Indoria University</title>
    <style>
        /* General page settings */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            color: #333;
            line-height: 1.6;
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
        .infrastructure-section{
     
       }
        .gallery img{
         background-color:red;
         margin-top:20px;
        display:flex;
        width:100%;
        height:400px;
      background-size: contain;}
      .gallery h3{
      text-align:center;
      font-size:30px;
        color: #0044cc;
        text-shadow:5px 6px 10px }
    </style>
</head>
<body>
    <header>
        <h2 style="color:white;">About Indoria University</h2>
        <nav>
            <a href="home.jsp">Home</a>
            <a href="about.jsp">About Us</a>
            <a href="register.jsp">Register</a>
            <a href="login.jsp">Login</a>
            <a href="contact.jsp">Contact Us</a>
        </nav>
    </header>
    
    <section class="about-section">
        <h2>Our Mission & Values</h2>
        <p>Indoria University is dedicated to providing quality education and fostering research that positively impacts society. Our mission is to cultivate a community of learners and innovators who are prepared to excel in a dynamic world.</p>
        
        <h3>Core Values</h3>
        <ul>
            <li><strong>Excellence:</strong> Striving for the highest standards in education and research.</li>
            <li><strong>Integrity:</strong> Promoting honesty, transparency, and accountability.</li>
            <li><strong>Innovation:</strong> Encouraging creative thinking and problem-solving.</li>
            <li><strong>
            
            <section class="infrastructure-section">
             <h2>Our State-of-the-Art Infrastructure</h2>
              <div class="gallery"> 
              <h3 >library</h3>
              <img src="https://www.culibrary.ac.in/assets/images/bnr/banner-2.jpg" alt="Library"> 
             <h3 >Laboratory</h3>
              <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBCb-Dtw4rnUSqzmoMGegSgiZkEpNjnpPwmmJ36VzDNy3TRuV6OqG7FtcJZUT8ZnHmFoI&usqp=CAU" alt="Laboratory"> 
              <h3 >Auditorium</h3>
              <img src="https://www.nimsuniversity.org/images/life-at-nims/rajeswari-auditorium.webp" alt="Auditorium">
               <h3 >complex</h3>
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYZBWs4IrIYQmubPCBFprl7-dBKIHGcd9LWd0hrAzAwVLyncZPBByT4qJEN5JdDZOE2kc&usqp=CAU" alt="Sports Complex">
        <h3 >dormitory</h3>
         <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8k0UAxoJteF4s3ZRYUB0X1NyTgbdyMQrkmlJpmxd5qRoGDjC8t3g88-x6dlxx-Sbihns&usqp=CAU" alt="Dormitory"> </div>
         
         </section>
         </body>
