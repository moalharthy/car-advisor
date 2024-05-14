<?php
// Check if there's an error from previous login attempt
$error_message = isset($_GET['error']) ? 'Invalid username or password. Please try again.' : '';

// Start session
session_start();

// Check if user is already logged in
if (isset($_SESSION['username'])) {
    // Redirect to welcome page
    header("Location: welcome.php");
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Sign In Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
    <style media="screen">
        /* Your CSS styles here */
        /* I'll include your CSS styles here for simplicity */
        body {
            background-color: #080710;
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
        }
        .background {
            width: 430px;
            height: 520px;
            position: absolute;
            transform: translate(-50%, -50%);
            left: 50%;
            top: 50%;
        }
        .background .shape {
            height: 200px;
            width: 200px;
            position: absolute;
            border-radius: 50%;
        }
        .shape:first-child {
            background: linear-gradient(
                #1845ad,
                #23a2f6
            );
            left: -80px;
            top: -80px;
        }
        .shape:last-child {
            background: linear-gradient(
                to right,
                #ff512f,
                #f09819
            );
            right: -30px;
            bottom: -80px;
        }
        form {
            height: 520px;
            width: 400px;
            background-color: rgba(255, 255, 255, 0.13);
            position: absolute;
            transform: translate(-50%, -50%);
            top: 50%;
            left: 50%;
            border-radius: 10px;
            backdrop-filter: blur(10px);
            border: 2px solid rgba(255, 255, 255, 0.1);
            box-shadow: 0 0 40px rgba(8, 7, 16, 0.6);
            padding: 50px 35px;
        }
        form * {
            color: #ffffff;
            letter-spacing: 0.5px;
            outline: none;
            border: none;
            font-size: 14px;
            font-weight: 300;
        }
        form h3 {
            font-size: 32px;
            font-weight: 500;
            line-height: 42px;
            text-align: center;
        }
        label {
            display: block;
            margin-top: 30px;
            font-size: 16px;
            font-weight: 500;
        }
        input {
            display: block;
            height: 50px;
            width: 100%;
            background-color: rgba(255, 255, 255, 0.07);
            border-radius: 3px;
            padding: 0 10px;
            margin-top: 8px;
            font-size: 14px;
            font-weight: 300;
        }
        ::placeholder {
            color: #e5e5e5;
        }
        button {
            margin-top: 50px;
            width: 100%;
            background-color: #ffffff;
            color: #080710;
            padding: 15px 0;
            font-size: 18px;
            font-weight: 600;
            border-radius: 5px;
            cursor: pointer;
        }
        .social {
            margin-top: 30px;
            display: flex;
        }
        .social div {
            background: red;
            width: 150px;
            border-radius: 3px;
            padding: 5px 10px 10px 5px;
            background-color: rgba(255, 255, 255, 0.27);
            color: #eaf0fb;
            text-align: center;
        }
        .social div:hover {
            background-color: rgba(255, 255, 255, 0.47);
        }
        .social .fb {
            margin-left: 25px;
        }
        .social i {
            margin-right: 4px;
        }
    </style>
</head>
<body>
    <div class="background">
        <div class="shape"></div>
        <div class="shape"></div>
    </div>
    <form method="POST" action="login.php">
        <h3>Login Here</h3>

        <label for="username">Username</label>
        <input type="email" name="username" placeholder="Email or Phone" id="username" required>

        <label for="password">Password</label>
        <input type="password" name="password" placeholder="Password" id="password" required>

        <button type="submit">Log In</button>
        <div class="social">
            <a href="https://www.google.com"><div class="go"><i class="fab fa-google"></i>  Google</div></a>
            <a href="https://www.facebook.com"><div class="fb"><i class="fab fa-facebook"></i>  Facebook</div></a>
        </div>
        <p style="color: red;"><?php echo $error_message; ?></p>
    </form>
</body>
</html>
