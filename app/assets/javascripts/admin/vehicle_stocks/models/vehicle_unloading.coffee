@vehicle_stocks.factory "VehicleUnloading", [
  "$http", 'RailsResource'
  ($http, RailsResource) ->
    class VehicleUnloading extends RailsResource
      @configure
        url: '/admin/vehicle_unloadings'
        name: 'vehicle_unloading'

    VehicleUnloading
]
