@invoice_managements.factory "Invoice", [
  "$http", 'RailsResource'
  ($http, RailsResource) ->
    class Invoice extends RailsResource
      @configure
        url: '/admin/invoices'
        name: 'invoice'

    Invoice
]
