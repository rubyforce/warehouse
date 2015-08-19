@managements.factory "Expense", [
  "$http", 'RailsResource', 'railsResourceFactory', 'railsSerializer'
  ($http, RailsResource, railsResourceFactory, railsSerializer) ->
    Expense = railsResourceFactory
      url: '/admin/expenses'
      name: 'expense'
]
