@students.controller 'DeleteStudentsController', [
  '$scope', 'Student', '$timeout'
  ($scope, Student, $timeout) ->
    $scope.alert = false
    $scope.clicked = true

    $scope.formAction = (user) ->
      $scope.currentUser = user
      $scope.clicked = false

    $scope.remove = ->
      $scope.currentUser.delete().then (student) ->
        $scope.alert = true

      index = _.indexOf($scope.students, $scope.currentUser)
      $scope.students.splice(index, 1)

    $scope.itemsPerPage = 5
    $scope.currentPage = 1

    $scope.pageCount = ->
      Math.ceil($scope.students.length / $scope.itemsPerPage)
]
