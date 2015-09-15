@stocks.factory "StockInward", [
  "$http", 'RailsResource'
  ($http, RailsResource) ->
    class StockInward extends RailsResource
      @configure
        url: '/admin/stock_inwards'
        name: 'stock_inward'

    StockInward
]
