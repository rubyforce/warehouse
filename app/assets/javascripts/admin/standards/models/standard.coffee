@standards.factory "Standard", [
  "$http", 'RailsResource'
  ($http, RailsResource) ->
    class Standard extends RailsResource
      @configure
        url: '/admin/standards',
        name: 'standard'
]
