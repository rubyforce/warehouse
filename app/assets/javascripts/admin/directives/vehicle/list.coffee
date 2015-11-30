@directives.directive 'vehicleList', [
  ->
    controller = [
      '$scope', '$timeout'
      ($scope, $timeout) ->
        $scope.bySelectorVehicle = (vehicle) ->
          return unless $scope.search?.vehicleId?
          item = _.find($scope.vehicle_loadings, (s2) -> s2.id is vehicle.vehicleId)

          for s in item.vehicleLoadingItems
            return true if s.vehicleId is parseInt($scope.search.vehicleId, 10)
        true
    ]

    restrict: 'E'
    controller: controller
    replace: true
    templateUrl: "admin/directives/vehicle/views/form.html"
]
