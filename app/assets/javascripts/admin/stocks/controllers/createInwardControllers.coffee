@stocks.controller 'CreateInwardsController', [
  '$scope', '$http', '$timeout', 'StockInward'
  ($scope, $http, $timeout, StockInward) ->

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
        voucherNo: $scope.rev
      })

    $scope.stock_inward = build()

    $scope.reset = ->
      $scope.stock_inward = build()
      $scope.stock_inward_item = {}
      $scope.stocks = []

    $scope.stocks = []
    $scope.stock_inward_item = {}
    $scope.alert = false

    $scope.add = ->
      item = _($scope.items).chain().find((i)-> parseInt(i.id, 10)).value()
      $scope.stock_inward_item.itemName = item.name
      $scope.stock_inward_itemitemId = item.id
      company = _($scope.companies).chain().find((c) -> parseInt(c.id, 10)).value()
      $scope.stock_inward_item.companyName = company.name
      $scope.stock_inward_item.companyId = company.id
      warehouse = _($scope.warehouses).chain().find((c) -> parseInt(c.id, 10)).value()
      $scope.stock_inward_item.warehouseName = warehouse.name
      $scope.stock_inward_item.warehouseId = warehouse.id

      $scope.stock_inward_item = _($scope.stock_inward_item).pick(['itemName', 'itemId', 'companyName', 'companyId', 'warehouseName', 'warehouseId', 'qty', 'numeral', 'id', 'sQty', 'rate', 'purchaseRate']).value()

      $scope.stocks.push($scope.stock_inward_item)

      for i in [1..$scope.stocks.length]
        $scope.stock_inward_item.numeral = i

      $scope.stock_inward_item = {}

    $scope.create = ->
      $scope.stock_inward.stock_inward_itemsAttributes = $scope.stocks
      new StockInward($scope.stock_inward).create().then (response) ->
        $scope.stock_inwards.push(new StockInward(response))

        sum = response.id + 1
        $scope.rev = numeral(sum/10000).format('0.0000').replace(/\./,'')
        $scope.stock_inward.voucherNo = $scope.rev

        $scope.alert = true

      $scope.reset()

]
