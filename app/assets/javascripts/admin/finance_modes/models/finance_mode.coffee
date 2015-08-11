@finance_modes.factory "FinanceMode", [
    "$http", 'RailsResource'
    ($http, RailsResource) ->
        class FinanceMode extends RailsResource
          @configure
              url: '/admin/finance_modes'
              name: 'finance_mode'
]
