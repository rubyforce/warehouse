@invoice_managements.controller 'CreateInvoicesController', [
  '$scope', '$timeout', 'StockOutward'
  ($scope, $timeout, StockOutward) ->
    $scope.alert = false
    $scope.items = []

    selectedStock = null
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
              selectedStock = property
              $scope.markUp = "- Invoice No." + " " + selectedStock.invoiceNo
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

    update = (attributes) ->
      attributes = _.extend(
        {
          id: selectedStock.id,
          reason: $scope.reason
        },
        attributes)
      stock_outward = new StockOutward(attributes)
      stock_outward.update().then ->
        selectedStock.reason = $scope.reason
        for key, value of attributes
          selectedStock[key] = value

        $scope.alert = true

    $scope.cancel = ->
      return unless selectedStock?
      update(cancelTransaction: "Canceled")

    $scope.bounce = ->
      return unless selectedStock?
      update(chequeBounce: "Bounced")
]
