@invoice_managements.controller 'CreateOutstandingPaymentsController', [
  '$scope', 'OutstandingPayment', '$timeout', '$location', '$window', '$http'
  ($scope, OutstandingPayment, $timeout, $location, $window, $http) ->
    $scope.alert = false

    $scope.items = []

    $http.get("admin/outstanding_payments/outstanding_id")
      .success (response) ->
        $timeout ->
          if response == null
            $scope.outstandingNo = "00001"
          else
            sum = response.id + 1
            number = numeral(sum/10000).format('0.0000').replace(/\./,'')
            $scope.outstandingNo = number

    build = ->
      new OutstandingPayment({
        date: $.datepicker.formatDate("dd/mm/yy", new Date()),
      })

    $scope.outstanding_payment = build()
    $scope.outstanding_payment.payment_method = "Cash"

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
          for item in s.stockOutwardItems
            item.invoiceNo = s.invoiceNo
            item.createdAt = s.createdAt
            item.date = s.date
            item.daySinceDue = s.daysSinceDue
            item.finalTotal = s.finalTotal
          s.stockOutwardItems
        .flatten() # [1,2,3,4,5]
        .value()

    selectedStock = null
    select = (property) ->
      debugger
      selectedStock = property
      selectedStock.receiptNo = $scope.outstandingNo

      $scope.markUp = "- Invoice No." + " " + selectedStock.invoiceNo
      if $scope.outstanding_payment.payment_method == 'Cash'
        $scope.outstanding_payment.amount = null
      else
        $scope.outstanding_payment.amount = selectedStock.stockOutwardItems[0].amount

    $scope.reset = ->
      $scope.outstanding_payment = build()
      $scope.outstanding_payment.payment_method = "Cash"
      selectedStock = null

    $scope.create = ->
      return unless selectedStock?

      $scope.outstanding_payment.stock_outward_id = selectedStock.id
      $scope.outstanding_payment.create().then (response) ->
        protocol = $location.protocol()
        host = $window.location.host
        domain = "#{protocol}://#{host}" # Example: http://example.com
        $window.open("#{domain}/admin/outstanding_payments/#{response.id}/print",'_blank')

        $scope.outstanding_payments.push(new OutstandingPayment(response))
        $scope.alert = true
        $scope.reset()
]
