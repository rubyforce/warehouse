@religions.factory "Religion", [
  "$http", 'RailsResource'
  ($http, RailsResource) ->
    class Religion extends RailsResource
      @configure
        url: '/admin/religions'
        name: 'religion'
]
