@stocks.controller 'CreateOutwardsController', [
  '$scope', '$http', '$timeout', 'StockOutward'
  ($scope, $http, $timeout, StockOutward) ->
    $scope.stock_outward_date = $.datepicker.formatDate("dd/mm/yy", new Date())
    $scope.alert = false

    $http.get("admin/stock_outwards/outward_id").success (response) ->
      $timeout ->
        if response == null
          $scope.stock_outward.voucherNo = "00001"
          $scope.stock_outward.invoiceNo = "00001"
        else
          sum = response.id + 1
          $scope.num = numeral(sum/10000).format('0.0000').replace(/\./,'')
          $scope.stock_outward.voucherNo = $scope.num
          $scope.stock_outward.invoiceNo = $scope.num

    build = ->
      new StockOutward({
        date: $.datepicker.formatDate("dd/mm/yy", new Date()),
        invoiceNo: $scope.num,
        voucherNo: $scope.num,
        paymentMethod: "Cash"
      })

    $scope.stock_outward = build()

    $scope.reset = ->
      debugger
      $scope.stock_outward = build()

    $scope.create = ->
      new StockOutward($scope.stock_outward).create().then (response) ->
        $scope.stock_outwards.push(new StockOutward(response))

        sum = response.id + 1
        $scope.num = numeral(sum/10000).format('0.0000').replace(/\./,'')
        $scope.stock_outward.voucherNo = $scope.num
        $scope.stock_outward.invoiceNo = $scope.num

        $scope.alert = true

]
