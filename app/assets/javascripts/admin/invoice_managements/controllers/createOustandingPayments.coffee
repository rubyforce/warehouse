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
        .each (stock) ->
            if stock.amount is stock.total
              stock.status = "Paid"
            else if stock.paymentMethod is "Credit"
              stock.status = "Full Credit"
            else
              stock.status = "Partially Paid"
        .value()

    selectedStock = null
    select = (property) ->
      selectedStock = property
      selectedStock.receiptNo = $scope.outstandingNo

      $scope.outstanding_payment.amount = selectedStock.amount
      $scope.outstanding_payment.cash = selectedStock.total
      $scope.outstanding_payment.payment_method = selectedStock.paymentMethod
      $scope.outstanding_payment.bank_date = selectedStock.bankDate
      $scope.outstanding_payment.bank_name = selectedStock.bankName
      $scope.outstanding_payment.cheque_no = selectedStock.chequeNo

      $scope.markUp = "- Invoice No." + " " + selectedStock.invoiceNo

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
