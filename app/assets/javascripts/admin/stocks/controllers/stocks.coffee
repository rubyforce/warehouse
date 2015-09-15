@stocks.controller 'StocksController', [
  '$scope', '$state', 'StockInward', 'Outward', 'Item', 'Company', 'Warehouse'
  ($scope, $state, StockInward, Outward, Item, Company, Warehouse) ->
    $state.go('stocks.stock_inward')

    Item.get().then (items) ->
      $scope.items = items
    Company.get().then (companies) ->
      $scope.companies = companies
    Warehouse.get().then (warehouses) ->
      $scope.warehouses = warehouses

    StockInward.get().then (stock_inwards) ->
      $scope.stock_inwards = stock_inwards

]
