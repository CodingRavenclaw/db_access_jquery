<?php

require ('masterAccessor.php');

$studentId = $_POST['studentId'];
$firstName = $_POST['firstName'];
$lastName = $_POST['lastName'];
$gender = $_POST['gender'];
$house = $_POST['house'];
$bloodStatus = $_POST['bloodStatus'];
$dateOfBirth = $_POST['dateOfBirth'];
$dateOfEnrollment = $_POST['dateOfEnrollment'];
$dateOfLeaving = $_POST['dateOfLeaving'];
$diploma = $_POST['diploma'];

if($dateOfLeaving == '' || $dateOfLeaving == '0001-01-01') {
    $dateOfLeaving = '0000-00-00';
}

try {
    $pdo = new PDO('mysql:host='.$db_host_address.';dbname='.$db_name.'', $db_username, $db_password);
    $sqlStatement = "UPDATE hogwarts.student SET 
        student.firstName = :firstName,
        student.lastName = :lastName,
        student.gender = :gender,
        student.house = :house,
        student.bloodstatus = :bloodStatus,
        student.birthday = :dateOfBirth,
        student.date_of_enrollment = :dateOfEnrollment,
        student.date_of_leaving = :dateOfLeaving,
        student.diploma = :diploma WHERE student.studentId = :studentId";
    $preparedStatement = $pdo->prepare($sqlStatement);
    $preparedStatement->bindParam(':firstName', $firstName);
    $preparedStatement->bindParam(':lastName', $lastName);
    $preparedStatement->bindParam(':gender', $gender);
    $preparedStatement->bindParam(':house', $house);
    $preparedStatement->bindParam(':bloodStatus', $bloodStatus);
    $preparedStatement->bindParam(':dateOfBirth', $dateOfBirth);
    $preparedStatement->bindParam(':dateOfEnrollment', $dateOfEnrollment);
    $preparedStatement->bindParam(':dateOfLeaving', $dateOfLeaving);
    $preparedStatement->bindParam(':diploma', $diploma);
    $preparedStatement->bindParam(':studentId', $studentId);
    if ($preparedStatement->execute()) {
        header('location: ../students.html');
    } else {
        var_dump($preparedStatement->errorInfo());
        echo "Fehler beim Ausführen des Statements!";
    }
    $preparedStatement = null;
    $pdo = null;
} catch(PDOException $PDOex) {
    echo "Fehler bei der Verbindung zur Datenbank!";
}