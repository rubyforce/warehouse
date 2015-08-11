@cash_managements.controller 'CashManagementsController', [
    '$scope', '$state', 'CashManagement', 'Employee', 'Nature', 'ExpenseReceipt'
    ($scope, $state, CashManagement, Employee, Nature, ExpenseReceipt) ->
        $state.go('cash_managements.settlements')

        Employee.get().then (employees) ->
          $scope.employees = employees

        Nature.get().then (natures ) ->
            $scope.natures = natures

        CashManagement.get().then (cash_managements) ->
            $scope.cash_managements = cash_managements

        ExpenseReceipt.get().then (expense_receipts) ->
          $scope.expense_receipts = expense_receipts
]
