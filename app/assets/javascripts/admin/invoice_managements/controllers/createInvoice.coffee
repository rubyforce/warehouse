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
          debugger
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


    $scope.create = ->
      return unless selectedStock?

      $scope.invoice.stock_outward_id = selectedStock.id
      new Invoice($scope.invoice).create().then (response) ->
        $scope.invoices.push(new Invoice(response))

        $scope.invoice = build()
        $scope.alert = true
]
