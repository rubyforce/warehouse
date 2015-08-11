@cash_managements.controller 'CreateExpenseController', [
  '$scope', 'ExpenseReceipt', '$location', '$window', '$timeout'
  ($scope, ExpenseReceipt, $location, $window, $timeout) ->
    $scope.alert = false

    $scope.create = ->
      new ExpenseReceipt($scope.expense_receipt).create().then (response) ->
        $scope.alert = true

        protocol = $location.protocol()
        host = $window.location.host
        domain = "#{protocol}://#{host}" # Example: http://example.com
        $window.open("#{domain}/admin/expense_receipts/#{response.id}/print",'_blank')

        $timeout
]
