@stocks.controller 'StocksController', [
  '$scope', '$state', 'Inward', 'Outward'
  ($scope, $state, Inward, Outward) ->
    $state.go('stocks.stock_inward')

]
