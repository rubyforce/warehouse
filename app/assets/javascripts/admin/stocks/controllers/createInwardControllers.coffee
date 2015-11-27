@stocks.controller 'CreateInwardsController', [
  '$scope', '$http', '$timeout', 'StockInward', '$location', '$window'
  ($scope, $http, $timeout, StockInward, $location, $window) ->

    $http.get('admin/stock_inwards/inward_id')
      .success (response) ->
        $timeout ->
          if response == null
            $scope.stock_inward.voucherNo = "00001"
          else
            sum = response.id + 1
            $scope.rev = numeral(sum/10000).format('0.0000').replace(/\./,'')
            $scope.stock_inward.voucherNo = $scope.rev

    build = ->
      new StockInward({
        date: $.datepicker.formatDate("dd/mm/yy", new Date()),
        voucherNo: $scope.rev,
        paymentMethod: "Cash"
      })

    $scope.stock_inward = build()

    $scope.reset = ->
      $scope.stock_inward = build()
      $scope.stock_inward_item = {}
      $scope.stocks = []

    $scope.stocks = []
    $scope.stock_inward_item = {}
    $scope.totals = []
    $scope.sumTaxes = []
    $scope.alert = false

    $scope.add = ->
      item = _($scope.items).chain().find((i)-> parseInt(i.id, 10) is parseInt($scope.stock_inward_item.item_id, 10)).value()
      $scope.stock_inward_item.itemName = item.name
      $scope.stock_inward_item.itemId = item.id
      $scope.stock_inward_item.tax = item.tax

      warehouse = _($scope.warehouses).chain().find((w) -> parseInt(w.id, 10) is parseInt($scope.stock_inward.warehouse_id, 10)).value()
      $scope.stock_inward.warehouseName = warehouse.name
      $scope.stock_inward.warehouseId = warehouse.id

      $scope.stock_inward_item.amount = $scope.stock_inward_item.qty * $scope.stock_inward_item.purchaseRate

      $scope.stock_inward_item = _($scope.stock_inward_item).pick(['itemName', 'itemId', 'companyName', 'companyId', 'warehouseName', 'warehouseId', 'qty', 'numeral', 'id', 'sQty', 'rate', 'purchaseRate', 'amount', 'tax']).value()

      $scope.tax = ($scope.stock_inward_item.amount * $scope.stock_inward_item.tax)/100
      $scope.sumTaxes.push($scope.tax)

      $scope.total = $scope.stock_inward_item.amount + $scope.tax

      total = $scope.total
      if $scope.stock_inward_item.discount?
        totalWithDiscount = total * (1 - $scope.stock_inward_item.discount / 100)
        $scope.totals.push(totalWithDiscount)
      else
        $scope.totals.push(total)

      $scope.stocks.push($scope.stock_inward_item)

      for i in [1..$scope.stocks.length]
        $scope.stock_inward_item.numeral = i

      last_stock_inward_item = _.last($scope.stocks)
      $scope.stock_inward_item = {}
      $scope.stock_inward_item.company_id = last_stock_inward_item.companyId
      $scope.stock_inward_item.warehouse_id = last_stock_inward_item.warehouseId

      $timeout ->
        angular.element('[ng-model="stock_inward_item.company_id"]').val($scope.stock_inward_item.company_id)
        angular.element('[ng-model="stock_inward_item.warehouse_id"]').val($scope.stock_inward_item.warehouse_id)

    $scope.getSubTotal = -> _.sum $scope.stocks, 'amount'
    $scope.getSumTaxes = -> _.sum $scope.sumTaxes

    $scope.getTotal = ->
      total =  _.sum $scope.totals
      if $scope.stock_inward.discount?
        total * (1- $scope.stock_inward.discount/100)
      else
        total

    $scope.showFinalTotal = ->
      return false unless $scope.stock_inward?

      total = $scope.getTotal()
      s = $scope.stock_inward

      return s.cash < total if s.cash?
      return s.credit < total if s.credit?
      return s.amount < total if s.amount?

      false

    $scope.create = ->
      $scope.stock_inward.stockInwardItemsAttributes = $scope.stocks
      $scope.stock_inward.total = $scope.getTotal()

      new StockInward($scope.stock_inward).create().then (response) ->
        protocol = $location.protocol()
        host = $window.location.host
        domain = "#{protocol}://#{host}" # Example: http://example.com
        $window.open("#{domain}/admin/stock_inwards/#{response.id}/print",'_blank')
        $scope.stock_inwards.push(new StockInward(response))

        sum = response.id + 1
        $scope.rev = numeral(sum/10000).format('0.0000').replace(/\./,'')
        $scope.stock_inward.voucherNo = $scope.rev

        $scope.totals = []
        $scope.sumTaxes = []

        $scope.alert = true

      $scope.reset()
]
