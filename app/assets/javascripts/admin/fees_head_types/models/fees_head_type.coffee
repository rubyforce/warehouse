@fees_head_types.factory "FeesHeadType", [
  "$http", 'RailsResource'
  ($http, RailsResource) ->
    class FeesHeadType extends RailsResource
      @configure
        url: '/admin/fees_head_types'
        name: 'fees_head_type'
]
