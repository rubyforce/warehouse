@grievances.factory "Grievance", [
  "$http", 'RailsResource'
  ($http, RailsResource) ->
    class Grievance extends RailsResource
      @configure
        url: '/admin/grievances'
        name: 'grievance'

    Grievance
]
