@invoice_managements.controller 'InvoiceManagementsController', [
  '$state', '$scope'
  ($state, $scope) ->
    $state.go('invoice_managements.outstanding_payment')
]
