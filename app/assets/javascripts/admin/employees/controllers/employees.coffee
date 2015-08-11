@employees.controller 'EmployeesController', [
    '$scope', '$state', 'Employee', 'PaidType', 'Section', 'PayBand'
    ($scope, $state, Employee, PaidType, Section, PayBand) ->
        $state.go('employees.new')

        PaidType.get().then (paid_types) ->
            $scope.paid_types = paid_types

        Section.get().then (sections) ->
            $scope.sections = sections

        PayBand.get().then (pay_bands) ->
            $scope.pay_bands = pay_bands

        Employee.get().then (employees) ->
            $scope.employees = employees
]
