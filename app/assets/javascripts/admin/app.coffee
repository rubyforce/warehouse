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

@students = angular.module('admin.students', [])

students.config [
    '$stateProvider', '$urlRouterProvider'
    ($stateProvider, $urlRouterProvider) ->
        $stateProvider
            .state 'students',
                url: "/students"
                templateUrl: "admin/students/views/index.html"
            .state 'students.new',
                url: "/new"
                templateUrl: "admin/students/views/new.html"
            .state 'students.edit',
                url: "/edit"
                templateUrl: "admin/students/views/edit.html"
            .state 'students.delete',
                url: "/delete"
                templateUrl: "admin/students/views/delete.html"
]

@admissions = angular.module('admin.admissions', [])

@cash_managements = angular.module('admin.cash_managements', [])

cash_managements.config [
    '$stateProvider', '$urlRouterProvider'
    ($stateProvider, $urlRouterProvider) ->
        $stateProvider
            .state 'cash_managements',
                url: "/cash_managements"
                templateUrl: "admin/cash_managements/views/index.html"
            .state 'cash_managements.settlements',
                url: "/settlements/new"
                templateUrl: "admin/cash_managements/views/settlements/new.html"
            .state 'cash_managements.expense',
                url: "/expense/new"
                templateUrl: "admin/cash_managements/views/expense/new.html"
]

@paid_types = angular.module('admin.paid_types', [])
@sections = angular.module('admin.sections', [])
@pay_bands = angular.module('admin.pay_bands', [])
@religions = angular.module('admin.religions', [])
@castes = angular.module('admin.castes', [])
@standards = angular.module('admin.standards', [])
@divisions = angular.module('admin.divisions', [])
@transports = angular.module('admin.transports', [])
@finance_modes = angular.module('admin.finance_modes', [])
@meals = angular.module('admin.meals', [])
@natures = angular.module('admin.natures', [])
@academic_years = angular.module('admin.academic_years', [])
@fees_head_types = angular.module('admin.fees_head_types', [])
@fees_head_recurrences = angular.module('admin.fees_head_recurrences', [])

@midday_managements = angular.module('admin.midday_managements', [])

midday_managements.config [
    '$stateProvider', '$urlRouterProvider'
    ($stateProvider, $urlRouterProvider) ->
        $stateProvider
            .state 'midday_managements',
                url: "/midday_managements"
                templateUrl: "admin/midday_managements/views/index.html"
            .state 'midday_managements.daily_meal',
                url: "/daily_meal/new"
                templateUrl: "admin/midday_managements/views/daily_meal/new.html"
            .state 'midday_managements.monthly_record',
                url: "/monthly_record/new"
                templateUrl: "admin/midday_managements/views/monthly_record/new.html"
]

@fees_heads = angular.module('admin.fees_heads', [])

fees_heads.config [
    '$stateProvider', '$urlRouterProvider'
    ($stateProvider, $urlRouterProvider) ->
        $stateProvider
            .state 'fees_heads',
                url: "/fees_heads"
                templateUrl: "admin/fees_heads/views/index.html"
            .state 'fees_heads.head',
                url: "/head/new"
                templateUrl: "admin/fees_heads/views/head/new.html"
            .state 'fees_heads.student_fees',
                url: "/student_fees/new"
                templateUrl: "admin/fees_heads/views/student_fees/new.html"
            .state 'fees_heads.fees_collection',
                url: "/fees_collection/new"
                templateUrl: "admin/fees_heads/views/fees_collection/new.html"
            .state 'fees_heads.cancel_receipt',
                url: "/cancel_receipt/cancel"
                templateUrl: "admin/fees_heads/views/cancel_receipt/cancel.html"
            .state 'fees_heads.cheque_no',
                url: "/cheque_no/cheque"
                templateUrl: "admin/fees_heads/views/cheque_no/cheque.html"
]

@admin = angular.module('admin', [
    'ui.router',
    'rails',
    'templates',
    'ui.date',
    'ui.bootstrap',
    'uuid4',

    'admin.employees',
    'admin.students',
    'admin.cash_managements',
    'admin.admissions',
    'admin.paid_types',
    'admin.sections',
    'admin.pay_bands',
    'admin.midday_managements',
    'admin.religions',
    'admin.castes',
    'admin.standards',
    'admin.divisions',
    'admin.transports',
    'admin.finance_modes',
    'admin.natures',
    'admin.meals',
    'admin.fees_heads',
    'admin.academic_years',
    'admin.fees_head_types',
    'admin.fees_head_recurrences',

    'admin.directives',
])

admin.config [
    '$stateProvider', '$urlRouterProvider'
    ($stateProvider, $urlRouterProvider) ->
        $urlRouterProvider.otherwise("/home");

        $stateProvider
            .state 'home',
                url: "/home"
                templateUrl: "admin/views/home/index.html"
]
