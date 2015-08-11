@castes.factory "Caste", [
  "$http", 'RailsResource'
  ($http, RailsResource) ->
    class Caste extends RailsResource
      @configure
        url: '/admin/castes'
        name: 'caste'
]
