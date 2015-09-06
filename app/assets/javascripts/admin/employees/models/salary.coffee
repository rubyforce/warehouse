@employees.factory "Salary", [
    "$http", 'RailsResource', 'railsResourceFactory', 'railsSerializer'
    ($http, RailsResource, railsResourceFactory, railsSerializer) ->
        Salary = railsResourceFactory
           url: '/admin/salaries'
           name: 'salary'
           serializer: railsSerializer ->
               @nestedAttribute('employeeSalaries')

        Salary
]
