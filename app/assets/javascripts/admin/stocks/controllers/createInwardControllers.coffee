@stocks.controller 'CreateInwardsController', [
  '$scope', '$http', '$timeout', 'StockInward', '$location', '$window'
  ($scope, $http, $timeout, StockInward, $location, $window) ->

    $scope.stock_inward_date = $.datepicker.formatDate("dd/mm/yy", new Date())

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
      debugger

      item = _($scope.items).chain().find((i)-> parseInt(i.id, 10) is parseInt($scope.stock_inward_item.item_id, 10)).value()
      $scope.stock_inward_item.itemName = item.name
      $scope.stock_inward_item.itemId = item.id
      $scope.stock_inward_item.tax = item.tax

      company = _($scope.companies).chain().find((c) -> parseInt(c.id, 10) is parseInt($scope.stock_inward_item.company_id, 10)).value()
      $scope.stock_inward_item.companyName = company.name
      $scope.stock_inward_item.companyId = company.id

      warehouse = _($scope.warehouses).chain().find((w) -> parseInt(w.id, 10) is parseInt($scope.stock_inward_item.warehouse_id, 10)).value()
      $scope.stock_inward_item.warehouseName = warehouse.name
      $scope.stock_inward_item.warehouseId = warehouse.id

      $scope.stock_inward_item.amount = $scope.stock_inward_item.qty * $scope.stock_inward_item.purchaseRate

      $scope.stock_inward_item = _($scope.stock_inward_item).pick(['itemName', 'itemId', 'companyName', 'companyId', 'warehouseName', 'warehouseId', 'qty', 'numeral', 'id', 'sQty', 'rate', 'purchaseRate', 'amount', 'tax', 'sumTaxes']).value()
      $scope.getSubTotal()
      $scope.getSumTaxes()

      $scope.stock_inward_item.sumTaxes = ($scope.stock_inward_item.amount * $scope.stock_inward_item.tax)/100

      $scope.stocks.push($scope.stock_inward_item)

      for i in [1..$scope.stocks.length]
        $scope.stock_inward_item.numeral = i

      $scope.stock_inward_item = {}

    $scope.getSubTotal = ->
      _.sum $scope.stocks, (object) ->
        object.amount
    $scope.getSumTaxes = ->
      _.sum $scope.stocks, (object) ->
        object.sumTaxes

    $scope.create = ->
      $scope.stock_inward.stock_inward_itemsAttributes = $scope.stocks
      new StockInward($scope.stock_inward).create().then (response) ->
        protocol = $location.protocol()
        host = $window.location.host
        domain = "#{protocol}://#{host}" # Example: http://example.com
        $window.open("#{domain}/admin/stock_inwards/#{response.id}/print",'_blank')

        $scope.stock_inwards.push(new StockInward(response))

        sum = response.id + 1
        $scope.rev = numeral(sum/10000).format('0.0000').replace(/\./,'')
        $scope.stock_inward.voucherNo = $scope.rev

        $scope.alert = true

      $scope.reset()

]
