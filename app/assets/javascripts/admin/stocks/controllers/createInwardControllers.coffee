@stocks.controller 'CreateInwardsController', [
  '$scope', '$http', '$timeout', 'StockInward'
  ($scope, $http, $timeout, StockInward) ->

    build = ->
      new StockInward(date: $.datepicker.formatDate("dd/mm/yy", new Date()))

    $scope.stock_inward = build()

    $scope.create = ->
      new StockInward($scope.stock_inward).create().then (response) ->
        debugger
        $scope.stock_inwards.push(new StockInward(response))

]
