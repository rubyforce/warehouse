@managements.controller 'CreateExpensesController', [
  '$scope', 'Expense', '$timeout'
  ($scope, Expense, $timeout) ->
    $scope.alert = false

    $scope.expense = new Expense()

    $scope.select = (expense) ->
      $scope.expense = expense

    $scope.new = ->
      $scope.expense = new Expense()

    $scope.remove = (expense) ->
      expense.delete()
      _.remove($scope.expenses, expense)

    $scope.create = ->
      if $scope.expense.id?
        $scope.expense.update().then (response) ->
          $scope.alert = true
          $scope.expense = response
      else
        $scope.expense.create().then (response) ->
          $scope.expenses.push(new Expense(response))

          $scope.alert = true
          $scope.expense = {}
          $scope.expense = response
]
