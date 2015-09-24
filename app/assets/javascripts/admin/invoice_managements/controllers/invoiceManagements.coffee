@invoice_managements.controller 'InvoiceManagementsController', [
  '$state', '$scope', 'OutstandingPayment'
  ($state, $scope) ->
    $state.go('invoice_managements.outstanding_payment')

    OutstandingPayment.get().then (outstanding_payments) ->
      $scope.outstanding_payments = outstanding_payments
]
