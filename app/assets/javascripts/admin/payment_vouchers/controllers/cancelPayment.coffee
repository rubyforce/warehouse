@payment_vouchers.controller 'CancelPaymentVouchersController', [
  '$scope', 'PaymentVoucher'
  ($scope, PaymentVoucher) ->

    $scope.clicked = false
    $scope.alert = false

    $scope.cash = true
    $scope.bank_info = false

    reset = ->
      $scope.number = ''

    $scope.find = ->
      PaymentVoucher.query(voucher_no: $scope.number).then (response) ->
        $scope.payment = response[0]
        if $scope.payment
          $scope.clicked = true
        else
          $scope.alert = true

        if $scope.payment.bankName && $scope.payment.voucherNo
          $scope.cash = false
          $scope.bank_info = true
        else
          $scope.cash = true

    $scope.cancel = ->
      if $scope.payment
        $scope.payment = new PaymentVoucher(id:  $scope.payment.id)
        $scope.payment.status = 'canceled'
        $scope.payment.update()
        $scope.reset()


]
