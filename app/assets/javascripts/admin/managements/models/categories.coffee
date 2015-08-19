@managements.factory "Category", [
  "$http", 'RailsResource', 'railsResourceFactory', 'railsSerializer'
  ($http, RailsResource, railsResourceFactory, railsSerializer) ->
    Category = railsResourceFactory
      url: '/admin/categories'
      name: 'category'
]
