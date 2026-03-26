<?php
$host = 'db-container'; // Hostname is the container name
$user = 'labuser';
$password = 'labpass';
$database = 'testdb';

$conn = new mysqli($host, $user, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

echo "<h1>Docker Lab Success!</h1>";
echo "<h2>Successfully connected to MariaDB container.</h2>";

$sql = "SELECT first_name, last_name, email FROM users";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "<h3>Users Loaded from Database:</h3><ul>";
    while($row = $result->fetch_assoc()) {
        echo "<li>" . $row["first_name"]. " " . $row["last_name"]. " (" . $row["email"]. ")</li>";
    }
    echo "</ul>";
} else {
    echo "0 results in table.";
}

$conn->close();
?>
