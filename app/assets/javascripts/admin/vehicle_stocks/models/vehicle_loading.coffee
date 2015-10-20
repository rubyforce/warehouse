@vehicle_stocks.factory "VehicleLoading", [
  "$http", 'RailsResource'
  ($http, RailsResource) ->
    class VehicleLoading extends RailsResource
      @configure
        url: '/admin/vehicle_loadings'
        name: 'vehicle_loading'

    VehicleLoading
]
