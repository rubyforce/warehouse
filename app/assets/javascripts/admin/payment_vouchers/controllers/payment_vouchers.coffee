@payment_vouchers.controller 'PaymentVouchersController', [
  '$scope', '$state', 'PaymentVoucher', 'Ledger', 'VehicleCompany', 'Employee'
  ($scope, $state, PaymentVoucher, Ledger, VehicleCompany, Employee) ->
    $state.go('payment_vouchers.new')

    PaymentVoucher.get().then (payment_vouchers) ->
      $scope.payment_vouchers = payment_vouchers

    Ledger.get().then (ledgers) ->
      $scope.ledgers = ledgers

    VehicleCompany.get().then (vehicle_companies) ->
      $scope.vehicle_companies = vehicle_companies

    Employee.get().then (employees) ->
      $scope.employees = employees

]
