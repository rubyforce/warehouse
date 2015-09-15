@stocks.controller 'CreateInwardsController', [
  '$scope', '$http', '$timeout', 'StockInward'
  ($scope, $http, $timeout, StockInward) ->

    $http.get('admin/stock_inwards/inward_id')
      .success (response) ->
        $timeout ->
          debugger
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

    $scope.create = ->
      new StockInward($scope.stock_inward).create().then (response) ->
        $scope.stock_inwards.push(new StockInward(response))

        sum = response.id + 1
        $scope.rev = numeral(sum/10000).format('0.0000').replace(/\./,'')
        $scope.stock_inward.voucherNo = $scope.rev

]
