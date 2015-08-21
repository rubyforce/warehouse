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

@managements = angular.module('admin.managements', [])
managements.config [
  '$stateProvider', '$urlRouterProvider'
  ($stateProvider, $urlRouterProvider) ->
    $stateProvider
      .state 'managements',
        url: "/managements"
        templateUrl: "admin/managements/views/index.html"
      .state 'managements.categories',
        url: "/categories/new"
        templateUrl: "admin/managements/views/categories/new.html"
      .state 'managements.ledgers',
        url: "/ledgers/new"
        templateUrl: "admin/managements/views/ledgers/new.html"
      .state 'managements.expenses',
        url: "/expenses/new"
        templateUrl: "admin/managements/views/expenses/new.html"
      .state 'managements.companies',
        url: "/companies/new"
        templateUrl: "admin/managements/views/companies/new.html"
      .state 'managements.warehouses',
        url: "/warehouses/new"
        templateUrl: "admin/managements/views/warehouses/new.html"
      .state 'managements.items',
        url: "/items/new"
        templateUrl: "admin/managements/views/items/new.html"
      .state 'managements.devices',
        url: "/devices/new"
        templateUrl: "admin/managements/views/devices/new.html"
      .state 'managements.vehicles',
        url: "/vehicles/new"
        templateUrl: "admin/managements/views/vehicles/new.html"
      .state 'managements.rate_master',
        url: "/rate_master/new"
        templateUrl: "admin/managements/views/rate_master/new.html"
]

@paid_types = angular.module('admin.paid_types', [])
@package_types = angular.module('admin.package_types', [])
@containers = angular.module('admin.containers', [])
@vehicle_companies = angular.module('admin.vehicle_companies', [])

@grievances = angular.module('admin.grievances', [])
grievances.config [
  '$stateProvider', '$urlRouterProvider'
  ($stateProvider, $urlRouterProvider) ->
    $stateProvider
      .state 'grievances',
        url: "/grievances/new"
        templateUrl: "admin/grievances/views/new.html"
]

@admin = angular.module('admin', [
  'ui.router',
  'rails',
  'templates',
  'ui.date',
  'ui.bootstrap',
  'uuid4',

  'admin.employees',
  'admin.paid_types',
  'admin.managements',
  'admin.package_types',
  'admin.containers',
  'admin.vehicle_companies',
  'admin.grievances',

  'admin.directives',
])
