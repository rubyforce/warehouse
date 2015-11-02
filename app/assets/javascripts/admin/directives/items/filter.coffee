@directives.directive 'itemsFilter', [
  ->
    controller = [
      '$scope', '$http', '$timeout'
      ($scope, $http, $timeout) ->
        $scope.bySelectors = (item) ->
          if $scope.search?.companyId?
            return item.companyId is parseInt($scope.search.companyId, 10)
          true
    ]

    restrict: 'E'
    controller: controller
    replace: true
    templateUrl: "admin/directives/items/views/template.html"
]
