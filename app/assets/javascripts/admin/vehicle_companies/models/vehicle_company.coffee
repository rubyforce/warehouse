@vehicle_companies.factory "VehicleCompany", [
  "$http", 'RailsResource'
  ($http, RailsResource) ->
    class VehicleCompany extends RailsResource
      @configure
        url: '/admin/vehicle_companies'
        name: 'vehicle_company'
]
