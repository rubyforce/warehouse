@fees_head_recurrences.factory "FeesHeadRecurrence", [
  "$http", 'RailsResource'
  ($http, RailsResource) ->
    class FeesHeadRecurrence extends RailsResource
      @configure
        url: '/admin/fees_head_recurrences'
        name: 'fees_head_recurrence'
]
