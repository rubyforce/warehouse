@stocks.controller 'CreateInwardsController', [
  '$scope', '$http', '$timeout', 'StockInward'
  ($scope, $http, $timeout, StockInward) ->
    debugger
    $scope.create = ->
      new StockInward($scope.stock_inward).create().then (response) ->
        debugger
        $scope.stock_inwards.push(new StockInward(response))

]
