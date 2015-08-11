@midday_managements.factory "MonthlyRecord", [
  "$http", 'RailsResource', 'railsResourceFactory'
  ($http, RailsResource, railsResourceFactory) ->
    MonthlyRecord = railsResourceFactory
      url: '/admin/monthly_records'
      name: 'monthly_record'

    MonthlyRecord
]
