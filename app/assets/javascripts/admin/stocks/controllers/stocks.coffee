@stocks.controller 'StocksController', [
  '$scope', '$state', 'StockInward', 'StockOutward', 'Item', 'Ledger', 'Warehouse', 'Device', 'Company'
  ($scope, $state, StockInward, StockOutward, Item, Ledger, Warehouse, Device, Company) ->
    $state.go('stocks.stock_inward')

    Item.get().then (items) ->
      $scope.items = items

    Ledger.get().then (ledgers) ->
      $scope.ledgers = ledgers

    Warehouse.get().then (warehouses) ->
      $scope.warehouses = warehouses

    Company.get().then (companies) ->
      $scope.companies = companies

    Device.get().then (devices) ->
      $scope.devices = devices

    StockInward.get().then (stock_inwards) ->
      $scope.stock_inwards = stock_inwards

    StockOutward.get().then (stock_outwards) ->
      $scope.stock_outwards = stock_outwards

]
