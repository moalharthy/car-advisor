<!DOCTYPE html>
<html>
<head>
    <title>Feedback Submitted</title>
    <style>
        /* CSS styles for the table */
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }

        /* CSS styles for the thank you message */
        .thank-you {
            text-align: center;
            margin-top: 50px;
            font-size: 24px;
            color: #4CAF50;
        }
    </style>
    <script>
        // JavaScript function to clear the form after submission
        function clearForm() {
            document.getElementById("questionnaire").reset();
        }
    </script>
</head>
<body>
<?php
// Check if the form was submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Database connection details
    $servername = "localhost";
    $username = "root";
    $password = ""; 
    $dbname = "feedback2"; 

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Prepare data for insertion
    $name = $_POST["name"];
    $country = $_POST["country"];
    $experience = $_POST["experience"];
    $age = $_POST["age"];
    $comments = $_POST["comments"];
    $rating = $_POST["rating"];
    $news = isset($_POST["news"]) ? "Yes" : "No"; 

    // Prepare and bind SQL statement
    $stmt = $conn->prepare("INSERT INTO feedback (name, country, experience, age, comments, rating, news) VALUES (?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("ssssssi", $name, $country, $experience, $age, $comments, $rating, $news);

    // Execute the statement
    if ($stmt->execute()) {
        // Thank the user for their feedback
        echo '<div class="thank-you">Thank you for your feedback!</div>';
        
        // Display the submitted feedback in a table
        echo '<table>';
        echo '<tr><th>Name</th><th>Country</th><th>Experience</th><th>Age</th><th>Comments</th><th>Rating</th><th>Receive News</th></tr>';
        echo '<tr><td>' . $name . '</td><td>' . $country . '</td><td>' . $experience . '</td><td>' . $age . '</td><td>' . $comments . '</td><td>' . $rating . '</td><td>' . $news . '</td></tr>';
        echo '</table>';

        // Clear the form
        echo '<script>clearForm();</script>';
    } else {
        echo "Error: " . $stmt->error;
    }

    // Close statement and connection
    $stmt->close();
    $conn->close();
}
?>
</body>
</html>
