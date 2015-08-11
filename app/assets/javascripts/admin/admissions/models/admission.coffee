@admissions.factory "Admission", [
  "$http", 'RailsResource'
  ($http, RailsResource) ->
    class Admission extends RailsResource
      @configure
        url: '/admin/admissions',
        name: 'admission'
]
