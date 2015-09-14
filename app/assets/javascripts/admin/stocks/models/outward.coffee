@stocks.factory "Outward", [
  "$http", 'RailsResource'
  ($http, RailsResource) ->
    class StockOutward extends RailsResource
      @configure
        url: '/admin/stock_outwards'
        name: 'stock_outward'

    StockOutward
]
