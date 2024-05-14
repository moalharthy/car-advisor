<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Your database connection details
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "player";

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    if (isset($_POST["player"])) {
        // Generate a unique player name based on the number of players already in the database
        $sql_count_players = "SELECT COUNT(*) as total_players FROM players";
        $result_count_players = $conn->query($sql_count_players);
        if ($result_count_players->num_rows > 0) {
            $row = $result_count_players->fetch_assoc();
            $total_players = $row["total_players"];
            $player_name = "Player" . ($total_players + 1);
        } else {
            // If no players exist, start with Player1
            $player_name = "Player1";
        }

        // Insert the new player into the database
        $sql_insert_player = "INSERT INTO players (name) VALUES ('$player_name')";
        if ($conn->query($sql_insert_player) === TRUE) {
            $last_id = $conn->insert_id;
            echo json_encode(array("player_id" => $last_id, "player_name" => $player_name));
        } else {
            echo json_encode(array("error" => "Error inserting player"));
        }
    } elseif (isset($_POST["ttplayers"])) {
        // Retrieve players from the database
        $sql_select_players = "SELECT * FROM players";
        $result_players = $conn->query($sql_select_players);

        if ($result_players->num_rows > 0) {
            echo "<style>
                table {
                    width: 100%;
                    border-collapse: collapse;
                }
                th, td {
                    padding: 12px;
                    text-align: left;
                    border-bottom: 1px solid #ddd;
                }
                th {
                    background-color: #f2f2f2;
                }
                tr:nth-child(even) {
                    background-color: #f2f2f2;
                }
                tr:hover {
                    background-color: #f5f5f5;
                }
                </style>";

            echo "<table>";
            echo "<tr><th>ID</th><th>Name</th></tr>";
            while ($row = $result_players->fetch_assoc()) {
                echo "<tr><td>" . $row["id"] . "</td><td>" . $row["name"] . "</td></tr>";
            }
            echo "</table>";
        } else {
            echo "No players found.";
        }
    }

    $conn->close();
}
?>
