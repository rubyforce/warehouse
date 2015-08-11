@students.controller 'UpdateStudentsController', [
  '$scope', 'Student', '$timeout', 'uuid4'
  ($scope, Student, $timeout, uuid4) ->
    $scope.dateOptions =
      changeMonth: true
      changeYear: true
      yearRange: "1950:-0"

    $scope.formAction = (user) ->
      $scope.currentUser = user
      $scope.show_form = true
      $scope.clicked = true

    $scope.clicked = false

    $scope.show_form = false

    $scope.alert = false

    $scope.update = ->
      $scope.currentUser.update()
      $scope.alert = true

    $scope.itemsPerPage = 5
    $scope.currentPage = 1

    $scope.pageCount = ->
      Math.ceil($scope.students.length / $scope.itemsPerPage)

    $scope.next = ->
      selectIndex = $scope.students.indexOf($scope.currentUser) + 1;
      if selectIndex >= $scope.students.length
        selectIndex = 0
      editing($scope.students[selectIndex])

      $scope.currentPage = Math.ceil(selectIndex / ($scope.itemsPerPage - 1))
      $timeout ->
        $('#objects-list').find("tr[data-index='#{selectIndex}']").click();

    $scope.previous = ->
      selectIndex = $scope.students.indexOf($scope.currentUser) - 1;
      if selectIndex >= $scope.students.length
        selectIndex = 0
      editing($scope.students[selectIndex])

      $scope.currentPage = Math.ceil(selectIndex / ($scope.itemsPerPage - 1))
      $timeout ->
        $('#objects-list').find("tr[data-index='#{selectIndex}']").click();
]
