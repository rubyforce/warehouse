@employees.controller 'DeleteEmployeesController', [
  '$scope', 'Employee', '$timeout'
  ($scope, Employee, $timeout) ->
    makeTableSelectable = ->
      $timeout ->
        table = $('table')
        table.tableselect
          multiple: false
          activeClass: 'warning'
          onSelectionChanged: (element) ->
            return unless element?
            user = $scope.employees[element.data('index')]
            $scope.$apply ->
              deleting(user)

    $scope.$watch 'currentPage', makeTableSelectable

    $scope.alert = false

    $scope.clicked = true

    deleting = (user) ->
      $scope.currentUser = user
      $scope.clicked = false

    $scope.remove = ->
      $scope.currentUser.delete().then (employee) ->
        $scope.alert = true

      index = _.indexOf($scope.employees, $scope.currentUser)
      $scope.employees.splice(index, 1)

    $scope.itemsPerPage = 5
    $scope.currentPage = 1

    $scope.pageCount = ->
      Math.ceil($scope.employees.length / $scope.itemsPerPage)
]
