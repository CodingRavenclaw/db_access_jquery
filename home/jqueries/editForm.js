$(document).ready(function() {

  let arrStudentToEdit = JSON.parse(Cookies.get('studentToEdit'));
  let strUrlToGroupGenders = "../home/dbaccess/groupGenders.php";
  let strUrlToSelectAllHouses = "../home/dbaccess/selectAllHouses.php";
  let strUrlToSelectAllBloodstati = "../home/dbaccess/selectAllBloodstati.php";
  let strUrlToSelectAllDiplomas = "../home/dbaccess/selectAllDiplomas.php";
  let intNumberOfGenders = 0;
  let intNumberOfHouses = 0;
  let intNumberOfBloodStati = 0;
  let intNumberOfDiplomas = 0;
  let arrGenders = [];

  $('#studentId').val(arrStudentToEdit[0]);
  $('#firstName').val(arrStudentToEdit[1]);
  $('#lastName').val(arrStudentToEdit[2]);
  $('#dateOfBirth').val(arrStudentToEdit[6]);
  $('#dateOfEnrollment').val(arrStudentToEdit[7]);

  $.getJSON(strUrlToGroupGenders, function(result) {
    intNumberOfGenders = Object.keys(result).length;
    for(let intGenderIndexCounter = 0; intGenderIndexCounter < intNumberOfGenders; intGenderIndexCounter++) {
      arrGenders.push(result[intGenderIndexCounter].gender);
    }
  }).then(function() {
    for(let intGenderIndexCounter = 0; intGenderIndexCounter < intNumberOfGenders; intGenderIndexCounter++) {
      if(arrStudentToEdit[3] === arrGenders[intGenderIndexCounter]) {
        $('#' + arrGenders[intGenderIndexCounter]).attr('checked', true);
      }
    }
  });

  $.getJSON(strUrlToSelectAllHouses, function(result) {
    intNumberOfHouses = Object.keys(result).length;
    for(let intHouseIndexCounter = 0; intHouseIndexCounter < intNumberOfHouses; intHouseIndexCounter++) {
      if(arrStudentToEdit[4] === result[intHouseIndexCounter].abbreviation) {
        $('#house').children('[value="' + result[intHouseIndexCounter].abbreviation + '"]').attr('selected', true);
      }
    }
  });

  $.getJSON(strUrlToSelectAllBloodstati, function(result) {
    intNumberOfBloodStati = Object.keys(result).length;
    for(let intBloodStatiIndexCounter = 0; intBloodStatiIndexCounter < intNumberOfBloodStati; intBloodStatiIndexCounter++) {
      if(arrStudentToEdit[5] === result[intBloodStatiIndexCounter].abbreviation) {
        let strBloodStati = result[intBloodStatiIndexCounter].denotation;
        $('#' + strBloodStati.replace(/\s/, '').toLowerCase()).attr('checked', true);
      }
    }
  });

  $.getJSON(strUrlToSelectAllDiplomas, function(result) {
    intNumberOfDiplomas = Object.keys(result).length;
    for(let intDiplomaIndexCounter = 0; intDiplomaIndexCounter < intNumberOfDiplomas; intDiplomaIndexCounter++) {
      if(arrStudentToEdit[9] === result[intDiplomaIndexCounter].abbreviation) {
        $('#' + result[intDiplomaIndexCounter].abbreviation).attr('checked', true);
      }
    }
  });

});

