@managements.factory "Vehicle", [
  "$http", 'RailsResource', 'railsResourceFactory', 'railsSerializer'
  ($http, RailsResource, railsResourceFactory, railsSerializer) ->
    Vehicle = railsResourceFactory
      url: '/admin/vehicles'
      name: 'vehicle'
]
