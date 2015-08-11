@academic_years.factory "AcademicYear", [
  "$http", 'RailsResource'
  ($http, RailsResource) ->
    class AcademicYear extends RailsResource
      @configure
        url: '/admin/academic_years'
        name: 'academic_year'
]
