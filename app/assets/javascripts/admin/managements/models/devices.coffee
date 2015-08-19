@managements.factory "Device", [
  "$http", 'RailsResource', 'railsResourceFactory', 'railsSerializer'
  ($http, RailsResource, railsResourceFactory, railsSerializer) ->
    Device = railsResourceFactory
      url: '/admin/devices'
      name: 'device'
]
