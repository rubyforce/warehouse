@paid_types.factory "PaidType", [
  "$http", 'RailsResource'
  ($http, RailsResource) ->
    class PaidType extends RailsResource
      @configure
        url: '/admin/paid_types'
        name: 'paid_type'
]
