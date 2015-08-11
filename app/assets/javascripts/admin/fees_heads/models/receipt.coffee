@fees_heads.factory "Receipt", [
    "$http", 'RailsResource', 'railsResourceFactory', 'railsSerializer'
    ($http, RailsResource, railsResourceFactory, railsSerializer) ->
        Receipt = railsResourceFactory
           url: '/admin/receipts'
           name: 'receipt'
           serializer: railsSerializer ->
               @nestedAttribute('receiptsFeesHeads')
]
