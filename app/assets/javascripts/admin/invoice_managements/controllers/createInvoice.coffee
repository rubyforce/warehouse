@invoice_managements.controller 'CreateInvoicesController', [
  '$scope', 'Invoice', '$timeout'
  ($scope, Invoice, $timeout) ->
    $scope.alert = false
    $scope.items = []

    build = ->
      new Invoice(date: $.datepicker.formatDate("dd/mm/yy", new Date()))

    $scope.invoice = build()

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
            item.date = s.date
            item.paymentMethod = s.paymentMethod
          s.stockOutwardItems
        .flatten()
        .value()


    selectedStock = null
    select = (property)->
      selectedStock = property

    updateOrCreate = (attributes) ->
      invoice = _($scope.invoices).find((s) -> s.stockOutwardId == selectedStock.id) || new Invoice($scope.invoice)
      invoice.stock_outward_id = selectedStock.id

      for key, value of attributes
        invoice[key] = value

      if invoice.isNew()
        invoice.reason = $scope.reason
        invoice.create().then (response) ->
          $scope.invoices.push(new Invoice(response))
          $scope.alert = true
      else
        invoice.reason = $scope.reason
        invoice.update().then ->
          $scope.alert = true

      $scope.invoice = build()

    $scope.cancel = ->
      return unless selectedStock?
      updateOrCreate(cancel_transaction: "Canceled")

    $scope.bounce = ->
      return unless selectedStock?
      debugger
      updateOrCreate(cheque_bounce: "Bounced")
]
