@payment_vouchers.controller 'PaymentVouchersController', [
  '$scope', '$state', 'PaymentVoucher', 'Ledger', 'Expense', 'Employee', 'Vendor'
  ($scope, $state, PaymentVoucher, Ledger, Expense, Employee, Vendor) ->
    $state.go('payment_vouchers.new')

    PaymentVoucher.get().then (payment_vouchers) ->
      $scope.payment_vouchers = payment_vouchers

    Ledger.get().then (ledgers) ->
      $scope.ledgers = ledgers

    Expense.get().then (expenses) ->
      $scope.expenses = expenses

    Employee.get().then (employees) ->
      $scope.employees = employees

    Vendor.get().then (vendors) ->
      $scope.vendors = vendors

]
