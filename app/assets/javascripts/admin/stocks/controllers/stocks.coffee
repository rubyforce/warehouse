@stocks.controller 'StocksController', [
  '$scope', '$state', 'StockInward', 'Outward', 'Item'
  ($scope, $state, StockInward, Outward, Item) ->
    $state.go('stocks.stock_inward')

    Item.get().then (items) ->
      $scope.items = items

    StockInward.get().then (stock_inwards) ->
      $scope.stock_inwards = stock_inwards

]
