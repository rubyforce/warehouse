@grievances.controller 'CreatePaymentVouchersController', [
  '$scope', 'PaymentVoucher', '$timeout'
  ($scope, PaymentVoucher, $timeout) ->

    $scope.create = ->
      new PaymentVoucher($scope.paymentVoucher).create().then (response) ->
        $scope.payment_vouchers.push(new PaymentVoucher(response))
]
