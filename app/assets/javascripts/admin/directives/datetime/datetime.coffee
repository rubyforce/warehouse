@directives.directive 'dateTime', [
  ->
    controller = [
      '$scope', '$interval'
      ($scope, $interval) ->
        $scope.date = Date

        $interval (->
        ), 1000
    ]

    restrict: 'E'
    controller: controller
    replace: true
    templateUrl: "admin/directives/datetime/views/template.html"
]
