@midday_managements.factory "DailyMeal", [
  "$http", 'RailsResource', 'railsResourceFactory'
  ($http, RailsResource, railsResourceFactory) ->
    DailyMeal = railsResourceFactory
      url: '/admin/daily_meals'
      name: 'daily_meal'

    DailyMeal
]
