@managements.factory "ItemRateMaster", [
  "$http", 'RailsResource', 'railsResourceFactory', 'railsSerializer'
  ($http, RailsResource, railsResourceFactory, railsSerializer) ->
    ItemRateMaster = railsResourceFactory
      url: '/admin/item_rate_masters'
      name: 'item_rate_master'
]
