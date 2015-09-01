@managements.factory "RateMaster", [
  "$http", 'RailsResource', 'railsResourceFactory', 'railsSerializer'
  ($http, RailsResource, railsResourceFactory, railsSerializer) ->
    RateMaster = railsResourceFactory
      url: '/admin/rate_masters'
      name: 'rate_master'
      serializer: railsSerializer ->
        @nestedAttribute('itemRateMasters')

    RateMaster
]
