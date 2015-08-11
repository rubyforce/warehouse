@divisions.factory "Division", [
  "$http", 'RailsResource'
  ($http, RailsResource) ->
    class Division extends RailsResource
      @configure
        url: '/admin/divisions',
        name: 'division'
]
