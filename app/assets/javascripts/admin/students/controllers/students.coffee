@students.controller 'StudentsController', [
  '$scope', '$state', 'Student', 'Admission', 'Religion', 'Caste', 'Standard', 'Division', 'Transport', 'FinanceMode', 'AcademicYear'
  ($scope, $state, Student, Admission, Religion, Caste, Standard, Division, Transport, FinanceMode, AcademicYear) ->
    $state.go('students.new')

    Student.get().then (students) ->
      $scope.students = students

    Admission.get().then (admissions) ->
      $scope.admissions = admissions

    Religion.get().then (religions) ->
      $scope.religions = religions

    Caste.get().then (castes) ->
      $scope.castes = castes

    Standard.get().then (standards) ->
      $scope.standards = standards

    Division.get().then (divisions) ->
      $scope.divisions = divisions

    Transport.get().then (transports) ->
      $scope.transports = transports

    FinanceMode.get().then (finance_modes) ->
      $scope.finance_modes = finance_modes

    AcademicYear.get().then (academic_years) ->
      $scope.academic_years = academic_years
]
