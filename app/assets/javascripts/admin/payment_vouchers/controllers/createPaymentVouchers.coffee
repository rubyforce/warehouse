@payment_vouchers.controller 'CreatePaymentVouchersController', [
  '$scope', 'PaymentVoucher', '$http', '$timeout', '$location', '$window'
  ($scope, PaymentVoucher, $http, $timeout, $location, $window) ->
    $scope.prints = []

    $http.get("admin/payment_vouchers/payment_id")
      .success (response) ->
        $timeout ->
          if response == null
            $scope.paymentVoucher.voucher_no = "0001"
          else
            sum = response.id + 1
            $scope.r = numeral(sum/1000).format('0.000').replace(/\./,'')
            $scope.paymentVoucher.voucher_no = $scope.r

    $scope.alert = false


    build = ->
      new PaymentVoucher({
        date: $.datepicker.formatDate("dd/mm/yy", new Date()),
        voucher_no: $scope.r
        numeral: 1
        })

    $scope.paymentVoucher = build()

    $scope.reset = ->
      $scope.paymentVoucher = build()
      $scope.paymentVoucher.voucher_no = $scope.r
      $scope.paymentVoucher.payment_method= 0

    $scope.create = ->
      new PaymentVoucher($scope.paymentVoucher).create().then (response) ->
        protocol = $location.protocol()
        host = $window.location.host
        domain = "#{protocol}://#{host}" # Example: http://example.com
        $window.open("#{domain}/admin/payment_vouchers/#{response.id}/print",'_blank')

        sum = response.id + 1
        $scope.r = numeral(sum/1000).format('0.000').replace(/\./,'')
        $scope.paymentVoucher.voucher_no = $scope.r

        $scope.payment_vouchers.push(new PaymentVoucher(response))

        # reset fields
        $scope.paymentVoucher = build()
        $scope.paymentVoucher.voucher_no = $scope.r
        $scope.paymentVoucher.payment_method= 0

        $scope.alert = true
]
