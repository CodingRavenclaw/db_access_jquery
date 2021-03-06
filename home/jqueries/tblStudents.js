$(document).ready(function() {

  let strUrlToSelectAllStudents = "../home/dbaccess/selectAllStudents.php";
  let strUrlToDeleteAStudent = "../home/dbaccess/deleteStudent.php";
  let strUrlToGetTotalNumberOfStudents = "../home/dbaccess/getTotalNumberOfStudents.php";
  let intNumberOfStudents = 0;
  let intDataSet = 0;
  let intDataSetLimit = 15;
  let intTotalNumberOfStudents = 0;
  let arrAStudent = [];
  let boolBtnHasButtonDeleteAck = false;
  let intTypingTimer = 0;

  let strOrderBy = "student.studentId";

  let strFirstName = "";
  let strLastName = "";

  function getTotalNumberOfStudents() {
    $.ajax({
      url: strUrlToGetTotalNumberOfStudents,
      type: 'POST',
      dataType: 'json',
      data: {
        firstname: strFirstName,
        lastname: strLastName
      },
      success: function (result) {
        intTotalNumberOfStudents = result[0].total_number_of_students;
      },
      error: function (err, textStatus, errorThrown) {
        console.error("Fehler bei der Verbindung zur Datenbank!");
      },
    });
  }

  function checkPagination() {
    if((intNumberOfStudents < intDataSetLimit) && (intNumberOfStudents == intTotalNumberOfStudents)) {
      $('#btnPrevious').prop("disabled", true);
      $('#btnNext').prop("disabled", true);
    } else if(intDataSet >= Math.trunc(intTotalNumberOfStudents / intDataSetLimit) * intDataSetLimit) {
      //  Pagination logic for btnNext
      $('#btnNext').prop("disabled", true);
      $('#btnPrevious').prop("disabled", false);
    } else if(intDataSet <= 0) {
      //  Pagination logic for btnPrevious
      $('#btnPrevious').prop("disabled", true);
      $('#btnNext').prop("disabled", false);
    }
  }

  function loadStudents() {
    $.when(getTotalNumberOfStudents()).then(function() {
      $.ajax({
        url: strUrlToSelectAllStudents,
        type: 'POST',
        dataType: 'json',
        data: {
          dataSet: intDataSet,
          firstname: strFirstName,
          lastname: strLastName,
          orderBy: strOrderBy
        },
        success: function (result) {
          intNumberOfStudents = Object.keys(result).length;
          checkPagination();
          $('#tblBodyStudents').empty();
          for(let intStudentIndexCounter = 0; intStudentIndexCounter < intNumberOfStudents; intStudentIndexCounter++) {
            $('#tblBodyStudents').append(
              "<tr> <td class='studentNo'>" + result[intStudentIndexCounter].studentId + "</td>" +
              "<td class='firstName'>" + result[intStudentIndexCounter].firstname + "</td>" +
              "<td class='lastName'>" + result[intStudentIndexCounter].lastname + "</td>" +
              "<td class='gender'>" + result[intStudentIndexCounter].gender + "</td>" +
              "<td class='house'>" + result[intStudentIndexCounter].house + "</td>" +
              "<td class='bloodStatus'>" + result[intStudentIndexCounter].bloodstatus + "</td>" +
              "<td class='dateOfBirth'>" + result[intStudentIndexCounter].birthday + "</td>" +
              "<td class='dateOfEnrollment'>" + result[intStudentIndexCounter].date_of_enrollment + "</td>" +
              "<td class='dateOfLeaving'>" + result[intStudentIndexCounter].date_of_leaving + "</td>" +
              "<td class='diploma'>" + result[intStudentIndexCounter].diploma + "</td>" +
              "<td class='text-center'> <form action='editStudent.html'> <button class='btn btn-warning' id='btnEdit'> Bearbeiten </button> </form> </td>" +
              "<td class='text-center'> <button class='btn btn-danger' id='btnDelete'> Löschen </button> </td>"
            );
          }

        },
        error: function (err, textStatus, errorThrown) {
          console.error("Fehler bei der Verbindung zur Datenbank! " + errorThrown);
        }
      });
    });
  }

  function deleteStudent(aStudentId) {
    $.ajax({
      type: 'POST',
      url: strUrlToDeleteAStudent,
      data: {
        studentId: aStudentId
      },
      success: function(response) {
        console.log("Schüler wurde erfolgreich gelöscht!");
        location.reload();
      },
      error: function(err) {
        console.error("Fehler beim Löschen des Schülers!");
      }
    });
  }

  $('#thStudentId').click(function() {
    strOrderBy = "student.studentId";
    loadStudents();
  });

  $('#thFirstname').click(function() {
    strOrderBy = "student.firstname";
    loadStudents();
  });

  $('#thLastname').click(function() {
    strOrderBy = "student.lastname";
    loadStudents();
  });

  $('#thGender').click(function() {
    strOrderBy = "student.gender";
    loadStudents();
  });

  $('#thHouse').click(function() {
    strOrderBy = "student.house";
    loadStudents();
  });

  $('#thBloodstatus').click(function() {
    strOrderBy = "student.bloodstatus";
    loadStudents();
  });

  $('#thBirthday').click(function() {
    strOrderBy = "student.birthday";
    loadStudents();
  });

  $('#thDateOfEnrollment').click(function() {
    strOrderBy = "student.date_of_enrollment";
    loadStudents();
  });

  $('#thDateOfLeaving').click(function() {
    strOrderBy = "student.date_of_leaving";
    loadStudents();
  });

  $('#thDiploma').click(function() {
    strOrderBy = "student.diploma";
    loadStudents();
  });

  $('#tblBodyStudents').on("click", "#btnEdit", function () {
    let intStudentId = $(this).closest('tr').find('.studentNo').text();
    let strFirstName = $(this).closest('tr').find('.firstName').text();
    let strLastName = $(this).closest('tr').find('.lastName').text();
    let strGender = $(this).closest('tr').find('.gender').text();
    let strHouse = $(this).closest('tr').find('.house').text();
    let strBloodStatus = $(this).closest('tr').find('.bloodStatus').text();
    let strDateOfBirth = $(this).closest('tr').find('.dateOfBirth').text();
    let strDateOfEnrollment = $(this).closest('tr').find('.dateOfEnrollment').text();
    let strDateOfLeaving = $(this).closest('tr').find('.dateOfLeaving').text();
    let strDiploma = $(this).closest('tr').find('.diploma').text();
    arrAStudent.push(intStudentId, strFirstName, strLastName, strGender, strHouse, strBloodStatus, strDateOfBirth,
      strDateOfEnrollment, strDateOfLeaving, strDiploma);
    Cookies.set('studentToEdit', JSON.stringify(arrAStudent));
  });

  $('#tblBodyStudents').on("click", "#btnDelete", function() {
    $('#modalHeader').addClass('bg-danger');
    $('#modalTitle').text('Wichtig!');
    let intStudentId = $(this).closest('tr').find('.studentNo').text();
    let strFirstName = $(this).closest('tr').find('.firstName').text();
    let strLastName = $(this).closest('tr').find('.lastName').text();
    $('#modalBodyParagraph').text('Soll der Schüler ' + strFirstName + ' ' + strLastName + ' wirklich gelöscht werden? ' +
      'Dies kann nicht mehr rückgängig gemacht werden!');
    $('#modalFooterButton').attr('data-dismiss', 'modal').addClass('btn-success') .text('Zurück');
    if(!boolBtnHasButtonDeleteAck) {
      boolBtnHasButtonDeleteAck = true;
      $('#modalFooter').append(
        "<a class='btn btn-danger' id='btnDeleteAck'> Schüler löschen </a>"
      );
    }
    $('#modal').modal();
    $('#btnDeleteAck').click(function() {
      deleteStudent(intStudentId);
    });
  });

  $('#searchStudent').on("input", function() {
    clearTimeout(intTypingTimer);
    intTypingTimer = setTimeout(function() {
      let strSearchedStudent = "";
      intDataSet = 0;
      strSearchedStudent = strSearchedStudent + $('#searchStudent').val();
      let arrStudentName = strSearchedStudent.split(" ");
      if(!$('#searchStudent').val()) {
        strFirstName = "";
        strLastName = "";
        intDataSet = 0;
      } else if(arrStudentName.length === 1) {
        strFirstName = arrStudentName[0];
      } else if(arrStudentName.length === 2) {
        strFirstName = arrStudentName[0];
        strLastName = arrStudentName[1];
      }
      loadStudents();
    }, 1500);
  });

  $('#btnNext').click(function() {
    intDataSet = intDataSet + intDataSetLimit;
    loadStudents();
  });

  $('#btnPrevious').click(function() {
    intDataSet = intDataSet - intDataSetLimit;
    loadStudents();
  });

  function init() {
    loadStudents();
  }

  init();

});