@invoice_managements.controller 'CreateOutstandingPaymentsController', [
  '$scope', 'OutstandingPayment', '$timeout'
  ($scope, OutstandingPayment, $timeout) ->
    $scope.alert = false

    build = ->
      new OutstandingPayment(date: $.datepicker.formatDate("dd/mm/yy", new Date()))

    $scope.outstanding_payment = build()

    makeTableSelectable = ->
      $timeout ->
        table = $('table')
        table.tableselect
          multiple: true
          activeClass: 'warning'
          onSelectionChanged: (element) ->
            return unless element?
            item = $scope.outstanding_payments[element.data('index')]
            $scope.$apply ->
              select(item)

    $scope.$watch 'currentPage', makeTableSelectable

    select = (item) ->
      $scope.outstanding_payment = item

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
