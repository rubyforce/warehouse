@stocks.controller 'CreateOutwardsController', [
  '$scope', '$http', '$timeout', 'StockOutward'
  ($scope, $http, $timeout, StockOutward) ->
    $scope.stock_outward_date = $.datepicker.formatDate("dd/mm/yy", new Date())
    $scope.alert = false
    $scope.stock_items = []
    $scope.totals = []
    $scope.sumTaxes = []
    $scope.stock_outward_item = {}

    $http.get("admin/stock_outwards/outward_id").success (response) ->
      $timeout ->
        if response == null
          $scope.stock_outward.voucherNo = "00001"
          $scope.stock_outward.invoiceNo = "00001"
        else
          sum = response.id + 1
          $scope.num = numeral(sum/10000).format('0.0000').replace(/\./,'')
          $scope.stock_outward.voucherNo = $scope.num
          $scope.stock_outward.invoiceNo = $scope.num

    build = ->
      new StockOutward({
        date: $.datepicker.formatDate("dd/mm/yy", new Date()),
        invoiceNo: $scope.num,
        voucherNo: $scope.num,
        paymentMethod: "Cash"
      })

    $scope.stock_outward = build()

    $scope.reset = ->
      $scope.stock_outward = build()
      $scope.stock_outward_item = {}
      $scope.stock_items = []

    $scope.add = ->
      item = _($scope.items).chain().find((i)-> parseInt(i.id, 10) is parseInt($scope.stock_outward_item.item_id, 10)).value()
      $scope.stock_outward_item.itemName = item.name
      $scope.stock_outward_item.rate = item.rate
      $scope.stock_outward_item.tax = item.tax
      $scope.stock_outward_itemitemId = item.id

      ledger = _($scope.ledgers).chain().find((l) -> parseInt(l.id, 10) is parseInt($scope.stock_outward_item.ledger_id, 10)).value()
      $scope.stock_outward_item.ledgerName = ledger.name
      $scope.stock_outward_item.ledgerId = ledger.id

      warehouse = _($scope.warehouses).chain().find((w) -> parseInt(w.id, 10) is parseInt($scope.stock_outward_item.warehouse_id, 10)).value()
      $scope.stock_outward_item.warehouseName = warehouse.name
      $scope.stock_outward_item.warehouseId = warehouse.id

      device = _($scope.devices).chain().find((d) -> parseInt(d.id, 10) is parseInt($scope.stock_outward_item.device_id, 10)).value()
      $scope.stock_outward_item.deviceIdName = device.deviceId
      $scope.stock_outward_item.deviceId = device.id

      $scope.stock_outward_item.amount = $scope.stock_outward_item.qty * $scope.stock_outward_item.rate
      $scope.tax = ($scope.stock_outward_item.amount * $scope.stock_outward_item.tax)/100
      $scope.sumTaxes.push($scope.tax)

      $scope.stock_outward_item = _($scope.stock_outward_item).pick(['itemName', 'itemId', 'ledgerName', 'ledgerId', 'warehouseName', 'warehouseId', 'deviceId', 'deviceIdName', 'qty', 'numeral', 'id', 'sQty', 'discount', 'rate', 'amount']).value()

      $scope.stock_items.push($scope.stock_outward_item)

      for i in [1..$scope.stock_items.length]
        $scope.stock_outward_item.numeral = i

      $scope.stock_outward_item = {}

      $scope.getSubTotal()

    $scope.getSubTotal = ->
      _.sum $scope.stock_items, (object) ->
        object.amount
    $scope.getSumTaxes = ->
      _.sum $scope.sumTaxes

    $scope.create = ->
      $scope.stock_outward.stock_outward_itemsAttributes = $scope.stock_items
      new StockOutward($scope.stock_outward).create().then (response) ->
        $scope.stock_outwards.push(new StockOutward(response))

        sum = response.id + 1
        $scope.num = numeral(sum/10000).format('0.0000').replace(/\./,'')
        $scope.stock_outward.voucherNo = $scope.num
        $scope.stock_outward.invoiceNo = $scope.num

        $scope.reset()

        $scope.alert = true

]
