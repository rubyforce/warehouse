@invoice_managements.factory "OutstandingPayment", [
  "$http", 'RailsResource'
  ($http, RailsResource) ->
    class OutstandingPayment extends RailsResource
      @configure
        url: '/admin/outstanding_payments'
        name: 'outstanding_payment'

    OutstandingPayment
]
