@managements.factory "Vendor", [
  "$http", 'RailsResource', 'railsResourceFactory', 'railsSerializer'
  ($http, RailsResource, railsResourceFactory, railsSerializer) ->
    Vendor = railsResourceFactory
      url: '/admin/vendors'
      name: 'vendor'
]
