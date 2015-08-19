@directives = angular.module('admin.directives', [])

@employees = angular.module('admin.employees', [])
employees.config [
  '$stateProvider', '$urlRouterProvider'
  ($stateProvider, $urlRouterProvider) ->
    $stateProvider
      .state 'employees',
        url: "/employees"
        templateUrl: "admin/employees/views/index.html"
      .state 'employees.new',
        url: "/new"
        templateUrl: "admin/employees/views/new.html"
      .state 'employees.edit',
        url: "/edit"
        templateUrl: "admin/employees/views/edit.html"
      .state 'employees.delete',
        url: "/delete"
        templateUrl: "admin/employees/views/delete.html"
      .state 'employees.salary',
        url: "/salary/new"
        templateUrl: "admin/cash_managements/views/salary/new.html"
]

@paid_types = angular.module('admin.paid_types', [])

@admin = angular.module('admin', [
  'ui.router',
  'rails',
  'templates',
  'ui.date',
  'ui.bootstrap',
  'uuid4',

  'admin.employees',
  'admin.paid_types',

  'admin.directives',
])
