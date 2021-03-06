@managements.controller 'CreateExpensesController', [
  '$scope', 'Expense', '$timeout'
  ($scope, Expense, $timeout) ->
    $scope.alert = false

    $scope.select = (expense) ->
      $scope.expense = expense

    $scope.new = ->
      $scope.expense = new Expense()

    $scope.remove = (expense) ->
      expense.delete()
      _.remove($scope.expenses, expense)

    $scope.create = ->
      if $scope.expense.id?
        $scope.expense.update()
 
      else
        new Expense($scope.expense).create().then (response) ->
          $scope.expenses.push(new Expense(response))

          $scope.expense = {}
          $scope.alert = true
]
