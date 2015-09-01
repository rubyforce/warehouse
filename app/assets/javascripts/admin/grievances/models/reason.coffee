@grievances.factory "Reason", [
  "$http", 'RailsResource'
  ($http, RailsResource) ->
    class Reason extends RailsResource
      @configure
        url: '/admin/reasons'
        name: 'reason'

    Reason
]
