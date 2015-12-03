@stocks.controller 'CreateOutwardsController', [
  '$scope', '$http', '$timeout', 'StockOutward', 'Item'
  ($scope, $http, $timeout, StockOutward, Item) ->
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
      $scope.stock_outward_item.itemId = item.id

      # update item minqty
      calcQty = new Item(id: item.id)
      final_qty = parseInt(item.minQty, 10) - parseInt($scope.stock_outward_item.qty, 10)
      calcQty.minQty = final_qty
      calcQty.update()

      ledger = _($scope.ledgers).chain().find((l) -> parseInt(l.id, 10) is parseInt($scope.stock_outward.ledger_id, 10)).value()
      $scope.stock_outward.ledgerName = ledger.name
      $scope.stock_outward.contactNo = ledger.contactNo
      $scope.stock_outward.ledgerId = ledger.id

      warehouse = _($scope.warehouses).chain().find((w) -> parseInt(w.id, 10) is parseInt($scope.stock_outward.warehouse_id, 10)).value()
      $scope.stock_outward.warehouseName = warehouse.name
      $scope.stock_outward.warehouseId = warehouse.id

      $scope.stock_outward_item.subAmount = $scope.stock_outward_item.qty * $scope.stock_outward_item.rate
      tax = ($scope.stock_outward_item.subAmount * $scope.stock_outward_item.tax)/100
      $scope.sumTaxes.push(tax)
      total = $scope.stock_outward_item.subAmount + tax

      if $scope.stock_outward_item.discount?
        totalWithDiscount = total * (1 - $scope.stock_outward_item.discount / 100)
        $scope.totals.push(totalWithDiscount)
        $scope.stock_outward_item.amount = totalWithDiscount
      else
        $scope.totals.push(total)
        $scope.stock_outward_item.amount = total

      to_i = parseInt(_.sum($scope.totals), 10)
      to_s = to_i.toString()
      $scope.toWords = toWords(to_s).toUpperCase()

      $scope.stock_outward_item = _($scope.stock_outward_item).pick(['itemName', 'itemId', 'ledgerName', 'ledgerId', 'warehouseName', 'warehouseId', 'qty', 'numeral', 'id', 'sQty', 'discount', 'rate', 'amount', 'contactNo', 'subAmount']).value()

      $scope.stock_items.push($scope.stock_outward_item)

      for i in [1..$scope.stock_items.length]
        $scope.stock_outward_item.numeral = i

      $scope.stock_outward_item = {}

      $scope.$watch 'stock_outward.paymentMethod', showTotal

    $scope.getSubTotal = -> _.sum $scope.stock_items, 'subAmount'

    $scope.getSumTaxes = -> _.sum $scope.sumTaxes

    $scope.getTotal = ->
      total = _.sum $scope.totals

      if $scope.stock_outward.discount?
        total * (1 - $scope.stock_outward.discount / 100)
      else
        total

    showTotal = ->
      if $scope.stock_outward.paymentMethod == 'Cash'
        $scope.stock_outward.cash = $scope.getTotal()
        $scope.stock_outward.amount = null
      else if $scope.stock_outward.paymentMethod == 'Cheque'
        $scope.stock_outward.amount = $scope.getTotal()
        $scope.stock_outward.cash = null
      else
        $scope.stock_outward.amount = null
        $scope.stock_outward.cash = null

    $scope.$watch 'stock_outward.paymentMethod', showTotal

    $scope.showFinalTotal = ->
      return false unless $scope.stock_outward?

      total = $scope.getTotal()
      s = $scope.stock_outward

      return s.cash < total if s.cash?
      return s.credit < total if s.credit?
      return s.amount < total if s.amount?

      false

    preview = ->
      if $scope.stock_outward.paymentMethod == 'Cash'
        if $scope.stock_outward.cash? && parseInt($scope.stock_outward.cash, 10) < $scope.stock_outward.total
          $scope.stock_outward.final_summary = $scope.stock_outward.total - parseInt($scope.stock_outward.cash, 10)
      else if $scope.stock_outward.paymentMethod == 'Cheque'
        if $scope.stock_outward.amount? && parseInt($scope.stock_outward.amount, 10) < $scope.stock_outward.total
          $scope.stock_outward.final_summary = $scope.stock_outward.total - parseInt($scope.stock_outward.amount, 10)

    $scope.create = ->
      $scope.stock_outward.stockOutwardItemsAttributes = $scope.stock_items

      if $scope.stock_outward.final_total?
        $scope.stock_outward.total = $scope.stock_outward.final_total
      else
        $scope.stock_outward.total = $scope.getTotal()

      if $scope.stock_outward.paymentMethod == "Credit"
        $scope.stock_outward.voucherNo = null
      preview()

      new StockOutward($scope.stock_outward).create().then (response) ->
        $scope.stock_outwards.push(new StockOutward(response))

        sum = response.id + 1
        $scope.num = numeral(sum/10000).format('0.0000').replace(/\./,'')
        $scope.stock_outward.voucherNo = $scope.num
        $scope.stock_outward.invoiceNo = $scope.num

        $scope.reset()

        $scope.alert = true
]
