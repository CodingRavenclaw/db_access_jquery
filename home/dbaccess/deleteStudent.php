<?php

require('masterAccessor.php');

$studentId = $_POST['studentId'];

try {
    $pdo = new PDO('mysql:host='.$db_host_address.';dbname='.$db_name.'', $db_username, $db_password);
    $sqlStatement = "DELETE FROM hogwarts.student WHERE student.studentId = :studentId";
    $preparedStatement = $pdo->prepare($sqlStatement);
    $preparedStatement->bindParam(':studentId', $studentId);
    if($preparedStatement->execute()) {

    } else {
        echo "Fehler beim Ausführen des Statements!";
    }
    $preparedStatement = null;
    $pdo = null;
} catch(PDOException $PDOex) {
    echo "Fehler bei der Verbindung zur Datenbank!";
}

?>