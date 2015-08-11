@directives.directive 'studentsList', [
    ->
        controller = [
            '$scope', '$timeout'
            ($scope, $timeout) ->
                makeTableSelectable = ->
                  $timeout ->
                    table = $('table')
                    table.tableselect
                      multiple: false
                      activeClass: 'warning'
                      onSelectionChanged: (element) ->
                        return unless element?
                        user = _($scope.students).find (student) -> student.id is element.data('id')
                        $scope.$apply ->
                          $scope.formAction(user)

                $scope.$watch 'currentPage', makeTableSelectable

                $scope.$watch 'search.divisionId', (id) ->
                    return unless id?
                    makeTableSelectable()

                $scope.$watch 'search.standardId', (id) ->
                    return unless id?
                    makeTableSelectable()

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
        templateUrl: "admin/directives/students/views/form.html"
]
