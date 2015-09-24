@invoice_managements.controller 'CreateOutstandingPaymentsController', [
  '$state', '$scope', 'OutstandingPayment'
  ($state, $scope, OutstandingPayment) ->

    $scope.create = ->
      new OutstandingPayment($scope.outstanding_payment).create().then (response) ->
        debugger
        $scope.outstanding_payments.push(new OutstandingPayment(response))
]
