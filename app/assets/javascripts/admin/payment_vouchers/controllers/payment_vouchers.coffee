@payment_vouchers.controller 'PaymentVouchersController', [
  '$scope', '$state', 'PaymentVoucher'
  ($scope, $state, PaymentVoucher) ->
    $state.go('payment_vouchers.new')

    PaymentVoucher.get().then (payment_vouchers) ->
      $scope.payment_vouchers = payment_vouchers

]
