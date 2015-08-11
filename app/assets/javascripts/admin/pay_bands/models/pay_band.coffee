# https://github.com/FineLinePrototyping/angularjs-rails-resource/issues/105
@pay_bands.factory "PayBand", [
    "$http", 'RailsResource'
    ($http, RailsResource) ->
        class PayBand extends RailsResource
          @configure
              url: '/admin/pay_bands'
              name: 'pay_band'
]
