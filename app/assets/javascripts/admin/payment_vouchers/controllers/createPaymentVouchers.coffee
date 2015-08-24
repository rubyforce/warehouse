@grievances.controller 'CreatePaymentVouchersController', [
  '$scope', 'PaymentVoucher', '$http', '$timeout'
  ($scope, PaymentVoucher, $http, $timeout) ->

    $http.get("admin/payment_vouchers/payment_id")
      .success (response) ->
        $timeout ->
          if response == null
            $scope.paymentVoucher.voucher_no = "0001"
          else
            sum = response.id + 1
            r = numeral(sum/1000).format('0.000').replace(/\./,'')
            $scope.paymentVoucher.voucher_no = r


    $scope.create = ->
      new PaymentVoucher($scope.paymentVoucher).create().then (response) ->
        $scope.payment_vouchers.push(new PaymentVoucher(response))
]
