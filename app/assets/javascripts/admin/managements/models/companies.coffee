@managements.factory "Company", [
  "$http", 'RailsResource', 'railsResourceFactory', 'railsSerializer'
  ($http, RailsResource, railsResourceFactory, railsSerializer) ->
    Company = railsResourceFactory
      url: '/admin/companies'
      name: 'company'
]
