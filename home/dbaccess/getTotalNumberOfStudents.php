<?php

require('masterAccessor.php');

$firstname = "%". $_POST['firstname'] ."%";
$lastname = "%". $_POST['lastname'] ."%";

try {
    $pdo = new PDO('mysql:host='.$db_host_address.';dbname='.$db_name.'', $db_username, $db_password);
    $sqlStatement = "SELECT COUNT(*) as 'total_number_of_students' FROM hogwarts.student WHERE student.firstname LIKE :firstname AND student.lastname LIKE :lastname;";
    $preparedStatement = $pdo->prepare($sqlStatement);
    $preparedStatement->bindParam(':firstname', $firstname);
    $preparedStatement->bindParam(':lastname', $lastname);
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