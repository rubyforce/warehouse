@managements.factory "Ledger", [
  "$http", 'RailsResource', 'railsResourceFactory', 'railsSerializer'
  ($http, RailsResource, railsResourceFactory, railsSerializer) ->
    Ledger = railsResourceFactory
      url: '/admin/ledgers'
      name: 'ledger'
]
