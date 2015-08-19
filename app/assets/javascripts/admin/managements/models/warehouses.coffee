@managements.factory "Warehouse", [
  "$http", 'RailsResource', 'railsResourceFactory', 'railsSerializer'
  ($http, RailsResource, railsResourceFactory, railsSerializer) ->
    Warehouse = railsResourceFactory
      url: '/admin/warehouses'
      name: 'warehouse'
]
