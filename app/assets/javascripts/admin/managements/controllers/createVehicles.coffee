@managements.controller 'CreateVehiclesController', [
  '$scope', 'Vehicle', '$timeout'
  ($scope, Vehicle, $timeout) ->
    $scope.alert = false

    $scope.vehicle = new Vehicle()

    $scope.select = (vehicle) ->
      $scope.vehicle = vehicle

    $scope.new = ->
      $scope.vehicle = new Vehicle()

    $scope.remove = (vehicle) ->
      vehicle.delete()
      _.remove($scope.vehicles, vehicle)

    $scope.create = ->
      new Vehicle($scope.vehicle).create().then (response) ->
        $scope.vehicles.push(new Vehicle(response))
        $scope.vehicle = {}
        $scope.alert = true
]
