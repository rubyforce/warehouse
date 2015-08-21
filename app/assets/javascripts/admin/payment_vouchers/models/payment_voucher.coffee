@payment_vouchers.factory "PaymentVoucher", [
  "$http", 'RailsResource', 'railsResourceFactory', 'railsSerializer'
  ($http, RailsResource, railsResourceFactory, railsSerializer) ->
    PaymentVoucher = railsResourceFactory
      url: '/admin/payment_vouchers'
      name: 'payment_voucher'
]
