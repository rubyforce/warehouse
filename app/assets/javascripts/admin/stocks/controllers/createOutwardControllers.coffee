@stocks.controller 'CreateOutwardsController', [
  '$scope', '$http', '$timeout', 'StockOutward'
  ($scope, $http, $timeout, StockOutward) ->
    $scope.stock_outward_date = $.datepicker.formatDate("dd/mm/yy", new Date())

    build = ->
      new StockOutward({
        date: $.datepicker.formatDate("dd/mm/yy", new Date())
      })

    $scope.stock_outward = build()

    $scope.create = ->
      new StockOutward($scope.stock_outward).create().then (response) ->
        debugger
        $scope.stock_outwards.push(new StockOutward(response))

]
