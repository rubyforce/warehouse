@students.controller 'CreateStudentsController', [
  '$scope', 'Student', 'uuid4'
  ($scope, Student, uuid4) ->
    $scope.dateOptions =
      changeMonth: true
      changeYear: true
      yearRange: "1950:-0"

    DEFAULT_STUDENT =
      entry_no: uuid4.generate()

    build = -> _.clone(DEFAULT_STUDENT)

    $scope.student = build()

    $scope.alert = false

    $scope.generate = ->
      $scope.student.entry_no = uuid4.generate()

    $scope.generate()

    $scope.create = ->
      new Student($scope.student).create().then (response) ->
        $scope.students.push(new Student(response))
        $scope.student = build()
        $scope.alert = true
]
