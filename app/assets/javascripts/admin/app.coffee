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
        templateUrl: "admin/employees/views/salary/new.html"
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

@requisitions = angular.module('admin.requisitions', [])
requisitions.config [
  '$stateProvider', '$urlRouterProvider'
  ($stateProvider, $urlRouterProvider) ->
    $stateProvider
      .state 'requisitions',
        url: "/requisitions/new"
        templateUrl: "admin/requisitions/views/new.html"
]

@stocks = angular.module('admin.stocks', [])
stocks.config [
  '$stateProvider', '$urlRouterProvider'
  ($stateProvider, $urlRoterProvider) ->
    $stateProvider
      .state 'stocks',
        url: "/stocks"
        templateUrl: "admin/stocks/views/index.html"
      .state 'stocks.stock_inward',
        url: "/stocks/stock_inward"
        templateUrl: "admin/stocks/views/inward.html"
      .state 'stocks.stock_outward',
        url: "/stocks/stock_outward"
        templateUrl: "admin/stocks/views/outward.html"
]

@payment_vouchers = angular.module('admin.payment_vouchers', [])
payment_vouchers.config [
  '$stateProvider', '$urlRouterProvider'
  ($stateProvider, $urlRouterProvider) ->
    $stateProvider
      .state 'payment_vouchers',
        url: "/payment_vouchers"
        templateUrl: "admin/payment_vouchers/views/index.html"
      .state 'payment_vouchers.new',
        url: "/payment_vouchers/new"
        templateUrl: "admin/payment_vouchers/views/new.html"
      .state 'payment_vouchers.search',
        url: "/payment_vouchers"
        templateUrl: "admin/payment_vouchers/views/cancel.html"
]

@invoice_managements = angular.module('admin.invoice_managements', [])
invoice_managements.config [
  '$stateProvider', '$urlRouterProvider'
  ($stateProvider, $urlRouterProvider) ->
    $stateProvider
      .state 'invoice_managements',
        url: "/invoice_managements"
        templateUrl: "admin/invoice_managements/views/index.html"
      .state 'invoice_managements.outstanding_payment',
        url: "/invoice_managements/outstanding_payment"
        templateUrl: "admin/invoice_managements/views/outstanding_payment.html"
      .state 'invoice_managements.invoice',
        url: "/invoice_managements/invoice"
        templateUrl: "admin/invoice_managements/views/invoice.html"
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
  'admin.payment_vouchers',
  'admin.requisitions',
  'admin.stocks',
  'admin.invoice_managements',

  'admin.directives',
])
