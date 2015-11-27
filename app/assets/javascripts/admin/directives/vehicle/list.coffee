@directives.directive 'vehicleList', [
  ->
    controller = [
      '$scope', '$timeout'
      ($scope, $timeout) ->
        $scope.bySelectorVehicle = (vehicle_loading) ->
          return unless $scope.search?.vehicleId?
          debugger
          item = _.find($scope.vehicle_loading_items, (s2) -> s2.id is vehicle_loading.vehicleId)

          for s in item.vehicleLoadingItems
            return true if s.vehicleId is parseInt($scope.search.vehicleId, 10)
        false
    ]

    restrict: 'E'
    controller: controller
    replace: true
    templateUrl: "admin/directives/vehicle/views/form.html"
]
