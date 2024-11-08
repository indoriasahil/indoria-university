<style>
    /* Contact form styling */
    .contact-form {
        max-width: 500px;
        margin: 30px auto;
        padding: 25px;
        background-color: #ffffff;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .form-group {
        margin-bottom: 20px;
    }

    .form-group label {
        display: block;
        margin-bottom: 8px;
        font-weight: bold;
        color: #333;
    }

    .form-control {
        width: 100%;
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

    textarea.form-control {
        min-height: 150px;
        resize: vertical;
    }

    .btn-submit {
        width: 100%;
        padding: 12px;
        background-color: #0044cc;
        color: #ffffff;
        border: none;
        border-radius: 4px;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .btn-submit:hover {
        background-color: #003399;
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

        header h2 {
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
<body>
  <header>
         <h2>Contact us</h2>
        <nav>
            <a href="home.jsp">Home</a>
            <a href="about.jsp">About Us</a>
            <a href="register.jsp">Register</a>
            <a href="login.jsp">Login</a>
            <a href="contact.jsp">Contact Us</a>
        </nav>
    </header>
<form action="ContactServlet" method="post" class="contact-form">
    <div class="form-group">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required class="form-control" placeholder="Enter your name">
    </div>
    
    <div class="form-group">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required class="form-control" placeholder="Enter your email">
    </div>
    
    <div class="form-group">
        <label for="message">Message:</label>
        <textarea id="message" name="message" required class="form-control" placeholder="Enter your message"></textarea>
    </div>

    <button type="submit" class="btn-submit">Submit</button>
</form>
</body>
