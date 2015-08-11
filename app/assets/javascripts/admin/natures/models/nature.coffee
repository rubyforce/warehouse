# https://github.com/FineLinePrototyping/angularjs-rails-resource/issues/105
@natures.factory "Nature", [
    "$http", 'RailsResource'
    ($http, RailsResource) ->
        class Nature extends RailsResource
          @configure
              url: '/admin/natures'
              name: 'nature'
]
