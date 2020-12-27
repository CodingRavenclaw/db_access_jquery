<?php

require('masterAccessor.php');

$firstname = "%". $_POST['firstname'] ."%";
$lastname = "%". $_POST['lastname'] ."%";

try {
    $pdo = new PDO('mysql:host='.$db_host_address.';dbname='.$db_name.'', $db_username, $db_password);
    $pdo->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
    // ! This statement is currently hardcoded in the ORDER BY clause.  I'm looking for a solution to use a prepared statement there.
    $sqlStatement = "SELECT * FROM hogwarts.student WHERE student.firstname LIKE :firstname AND student.lastname LIKE :lastname ORDER BY ".$_POST['orderBy']." ASC LIMIT :dataSet,15";
    $preparedStatement = $pdo->prepare($sqlStatement);
    $preparedStatement->bindParam(':firstname', $firstname);
    $preparedStatement->bindParam(':lastname', $lastname);
    $preparedStatement->bindParam(':dataSet', $_POST['dataSet']);
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