@invoice_managements.controller 'CreateOutstandingPaymentsController', [
  '$scope', 'OutstandingPayment'
  ($state, $scope, OutstandingPayment) ->
    $scope.alert = false

    build = ->
      new OutstandingPayment(date: $.datepicker.formatDate("dd/mm/yy", new Date()))

    $scope.outstanding_payment = build()

    $scope.reset = ->
      $scope.outstanding_payment = build()
      $scope.outstanding_payment =
        payment_method: 'Cash'

    $scope.create = ->
      new OutstandingPayment($scope.outstanding_payment).create().then (response) ->
        $scope.outstanding_payments.push(new OutstandingPayment(response))
        $scope.alert = true

        $scope.reset()
]
