@transports.factory "Transport", [
  "$http", 'RailsResource'
  ($http, RailsResource) ->
    class Transport extends RailsResource
      @configure
        url: '/admin/transports',
        name: 'transport'
]
