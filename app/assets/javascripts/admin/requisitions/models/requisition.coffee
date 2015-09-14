@requisitions.factory "Requisition", [
  "$http", 'RailsResource'
  ($http, RailsResource) ->
    class Requisition extends RailsResource
      @configure
        url: '/admin/requisitions'
        name: 'requisition'

    Requisition
]
