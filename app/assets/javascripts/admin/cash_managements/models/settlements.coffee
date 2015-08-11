# https://github.com/FineLinePrototyping/angularjs-rails-resource/issues/105
@cash_managements.factory "CashManagement", [
    "$http", 'RailsResource'
    ($http, RailsResource) ->
        class CashManagement extends RailsResource
          @configure
              url: '/admin/cash_managements'
              name: 'cash_management'
]