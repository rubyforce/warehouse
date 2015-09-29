@invoice_managements.controller 'CreateOutstandingPaymentsController', [
  '$scope', 'OutstandingPayment', '$timeout'
  ($scope, OutstandingPayment, $timeout) ->
    $scope.alert = false

    $scope.items = []

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
            property = $scope.stock_outwards[element.data('index')]
            $scope.$apply ->
              select(property)
      render()

    $scope.$watch 'stock_outwards', makeTableSelectable

    render = ->
      $scope.items = _($scope.stock_outwards).chain()
        .map (s) ->
          debugger
          for item in s.stockOutwardItems
            item.invoiceNo = s.invoiceNo
            item.createdAt = s.createdAt
            item.date = s.date
            item.daySinceDue = s.daysSinceDue
          s.stockOutwardItems
        .flatten() # [1,2,3,4,5]
        .value()

    select = (property) ->
      $scope.property = property

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
