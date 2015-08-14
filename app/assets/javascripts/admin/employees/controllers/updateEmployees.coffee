@employees.controller 'UpdateEmployeesController', [
  '$scope', 'Employee', '$timeout'
  ($scope, Employee, $timeout) ->
    $scope.dateOptions =
      changeMonth: true
      changeYear: true
      yearRange: "1950:-0"

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
              editing(user)

    $scope.$watch 'currentPage', makeTableSelectable

    editing = (user) ->
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
      Math.ceil($scope.employees.length / $scope.itemsPerPage)

    $scope.next = ->
      selectIndex = $scope.employees.indexOf($scope.currentUser) + 1;
      if selectIndex >= $scope.employees.length
        selectIndex = 0
      editing($scope.employees[selectIndex])

      $scope.currentPage = Math.ceil(selectIndex / ($scope.itemsPerPage - 1))
      $timeout ->
        $('#objects-list').find("tr[data-index='#{selectIndex}']").click();

    $scope.previous = ->
      selectIndex = $scope.employees.indexOf($scope.currentUser) - 1;
      if selectIndex >= $scope.employees.length
        selectIndex = 0
      editing($scope.employees[selectIndex])

      $scope.currentPage = Math.ceil(selectIndex / ($scope.itemsPerPage - 1))
      $timeout ->
        $('#objects-list').find("tr[data-index='#{selectIndex}']").click();
]
