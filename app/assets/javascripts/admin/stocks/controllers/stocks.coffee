@stocks.controller 'StocksController', [
  '$scope', '$state', 'StockInward', 'StockOutward', 'Item', 'Ledger', 'Warehouse', 'Device'
  ($scope, $state, StockInward, StockOutward, Item, Ledger, Warehouse, Device) ->
    $state.go('stocks.stock_inward')

    Item.get().then (items) ->
      $scope.items = items
    Ledger.get().then (ledgers) ->
      $scope.ledgers = ledgers
    Warehouse.get().then (warehouses) ->
      $scope.warehouses = warehouses

    StockInward.get().then (stock_inwards) ->
      $scope.stock_inwards = stock_inwards

    StockOutward.get().then (stock_outwards) ->
      $scope.stock_outwards = stock_outwards

    Device.get().then (devices) ->
      $scope.devices = devices

]
