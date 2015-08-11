@directives.directive 'studentsFilter', [
    ->
        controller = [
            '$scope', '$http', '$timeout'
            ($scope, $http, $timeout) ->
                $scope.bySelectors = (student) ->
                    if $scope.search?.standardId? && $scope.search?.divisionId?
                        return student.divisionId is parseInt($scope.search.divisionId, 10) && student.standardId is parseInt($scope.search.standardId, 10)
                    else if $scope.search?.standardId?
                        return student.standardId is parseInt($scope.search.standardId, 10)
                    else if $scope.search?.divisionId?
                        return student.divisionId is parseInt($scope.search.divisionId, 10)
                    true
        ]

        restrict: 'E'
        controller: controller
        replace: true
        templateUrl: "admin/directives/students/views/template.html"
]
