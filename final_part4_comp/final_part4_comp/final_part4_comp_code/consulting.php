<?php
// Check if form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Database connection
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "consulting";

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Get user input
    $category = $_POST['question1'];
    $country = $_POST['question2'];
    $transmission = $_POST['question3'];
    $priceRange = $_POST['question4'];
    $specialCars = $_POST['question5'];

    // Construct SQL query based on user input
    $sql = "SELECT * FROM car WHERE 1=1";
    if (!empty($category)) {
        $sql .= " AND category = '$category'";
    }
    if (!empty($country)) {
        $sql .= " AND country = '$country'";
    }
    if (!empty($transmission)) {
        $sql .= " AND transmission = '$transmission'";
    }
    if (!empty($priceRange)) {
        $sql .= " AND price = '$priceRange'";
    }
    if (!empty($specialCars)) {
        $sql .= " AND class = '$specialCars'";
    }

    // Execute query
    $result = $conn->query($sql);

    // Display results in a table
    if ($result->num_rows > 0) {
        ?>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
              crossorigin="anonymous">
        <div class="container">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th scope="col">Car Name</th>
                    <th scope="col">Category</th>
                    <th scope="col">Country</th>
                    <th scope="col">Transmission</th>
                    <th scope="col">Price</th>
                    <th scope="col">Class</th>
                </tr>
                </thead>
                <tbody>
                <?php
                while ($row = $result->fetch_assoc()) {
                    ?>
                    <tr>
                        <td><?php echo $row["cname"]; ?></td>
                        <td><?php echo $row["category"]; ?></td>
                        <td><?php echo $row["country"]; ?></td>
                        <td><?php echo $row["transmission"]; ?></td>
                        <td><?php echo $row["price"]; ?></td>
                        <td><?php echo $row["class"]; ?></td>
                    </tr>
                    <?php
                }
                ?>
                </tbody>
            </table>
        </div>
        <?php
    } else {
        echo "No matching cars found.";
    }

    // Close connection
    $conn->close();
}
?>