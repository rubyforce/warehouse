@fees_heads.factory "FeesHead", [
  "$http", 'RailsResource', 'railsResourceFactory', 'railsSerializer'
  ($http, RailsResource, railsResourceFactory, railsSerializer) ->
    FeesHead = railsResourceFactory
      url: '/admin/fees_heads'
      name: 'fees_head'
      serializer: railsSerializer ->
        @nestedAttribute('feesHeadsStandards')

]
