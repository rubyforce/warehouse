@cash_managements.factory "ExpenseReceipt", [
  "$http", 'RailsResource', 'railsResourceFactory', 'railsSerializer'
  ($http, RailsResource, railsResourceFactory, railsSerializer) ->
    ExpenseReceipt = railsResourceFactory
      url: '/admin/expense_receipts'
      name: 'expense_receipt'

    ExpenseReceipt
]
