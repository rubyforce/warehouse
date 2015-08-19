@managements.factory "Item", [
  "$http", 'RailsResource', 'railsResourceFactory', 'railsSerializer'
  ($http, RailsResource, railsResourceFactory, railsSerializer) ->
    Item = railsResourceFactory
      url: '/admin/items'
      name: 'item'
]
