<?php

require('masterAccessor.php');

try {
    $pdo = new PDO('mysql:host='.$db_host_address.';dbname='.$db_name.'', $db_username, $db_password);
    $sqlStatement = "SELECT COUNT(*) as 'total_number_of_students' FROM hogwarts.student;";
    $preparedStatement = $pdo->prepare($sqlStatement);
    if ($preparedStatement->execute()) {
        $results = $preparedStatement->fetchAll(PDO::FETCH_ASSOC);
        echo json_encode($results);
    } else {
        echo "Fehler beim Ausführen des Statements!";
    }
    $preparedStatement = null;
    $pdo = null;
} catch(PDOException $PDOex) {
    echo "Fehler bei der Verbindung zur Datenbank!";
}

?>