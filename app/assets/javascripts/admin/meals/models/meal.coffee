# https://github.com/FineLinePrototyping/angularjs-rails-resource/issues/105
@meals.factory "Meal", [
    "$http", 'RailsResource'
    ($http, RailsResource) ->
        class Meal extends RailsResource
          @configure
              url: '/admin/meals'
              name: 'meal'
]
