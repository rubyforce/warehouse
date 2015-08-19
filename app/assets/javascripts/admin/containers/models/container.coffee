@containers.factory "Container", [
  "$http", 'RailsResource'
  ($http, RailsResource) ->
    class Container extends RailsResource
      @configure
        url: '/admin/containers'
        name: 'container'
]
