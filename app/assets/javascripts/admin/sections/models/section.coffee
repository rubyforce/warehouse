# https://github.com/FineLinePrototyping/angularjs-rails-resource/issues/105
@sections.factory "Section", [
    "$http", 'RailsResource'
    ($http, RailsResource) ->
        class Section extends RailsResource
          @configure
              url: '/admin/sections'
              name: 'section'
]
