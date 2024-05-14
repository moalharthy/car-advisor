<?php
session_start();

// funder emails and passwords  
$credentials = array(
    'user1@example.com' => 'password1',
    'user2@example.com' => 'password2',
    'user3@example.com' => 'password3',
    // we can add more emails if it needed
);

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Check if email and password were entered
    if (empty($username) || empty($password)) {
        // Redirect back to the sign-in page with an error message
        header("Location: index.php?error=empty");
        exit();
    }

    // Check if the entered email exists in the credentials array
    if (array_key_exists($username, $credentials)) {
        // Check if the entered password matches the password in the credentials array
        if ($credentials[$username] === $password) {
            // Set session variables to indicate user is logged in
            $_SESSION['username'] = $username;

            // Redirect to a welcome page or perform any other actions
            header("Location: welcome.php");
            exit();
        } else {
            // Redirect back to the sign-in page with an error message
            header("Location: index.php?error=invalid");
            exit();
        }
    } else {
        // Redirect back to the sign-in page with an error message
        header("Location: index.php?error=invalid");
        exit();
    }
} else {
    // If the form is not submitted, redirect to the sign-in page
    header("Location: index.php");
    exit();
}
?>
