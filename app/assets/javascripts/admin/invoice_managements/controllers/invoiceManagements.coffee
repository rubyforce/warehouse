@invoice_managements.controller 'InvoiceManagementsController', [
  '$state', '$scope', 'OutstandingPayment', 'Invoice', 'StockOutward'
  ($state, $scope, OutstandingPayment, Invoice, StockOutward) ->
    $state.go('invoice_managements.outstanding_payment')

    OutstandingPayment.get().then (outstanding_payments) ->
      $scope.outstanding_payments = outstanding_payments

    Invoice.get().then (invoices) ->
      $scope.invoices = invoices

    StockOutward.get().then (stock_outwards) ->
      $scope.stock_outwards = stock_outwards
]
