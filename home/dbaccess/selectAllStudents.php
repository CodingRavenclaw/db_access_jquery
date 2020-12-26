<?php

require('masterAccessor.php');

$dataSet = $_POST['dataSet'];
$firstname = "%". $_POST['firstname'] ."%";
$lastname = "%". $_POST['lastname'] ."%";

try {
    $pdo = new PDO('mysql:host='.$db_host_address.';dbname='.$db_name.'', $db_username, $db_password);
    $pdo->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
    $sqlStatement = "SELECT * FROM hogwarts.student WHERE student.firstname LIKE :firstname AND student.lastname LIKE :lastname LIMIT :dataSet,15";
    $preparedStatement = $pdo->prepare($sqlStatement);
    $preparedStatement->bindParam(':firstname', $firstname);
    $preparedStatement->bindParam(':lastname', $lastname);
    $preparedStatement->bindParam(':dataSet', $dataSet);
    if ($preparedStatement->execute()) {
        $results = $preparedStatement->fetchAll(PDO::FETCH_ASSOC);
        echo json_encode($results);
    } else {
        var_dump($preparedStatement->errorInfo());
        echo "Fehler beim Ausführen des Statements!";
    }
    $preparedStatement = null;
    $pdo = null;
} catch(PDOException $PDOex) {
    echo "Fehler bei der Verbindung zur Datenbank!";
}

?>