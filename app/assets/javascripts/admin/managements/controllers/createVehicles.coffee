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
      if $scope.vehicle.id?
        $scope.vehicle.update().then (response) ->
          $scope.alert = true
          $scope.vehicle = response
      else
        $scope.vehicle.create().then (response) ->
          $scope.vehicles.push(new Vehicle(response))

          $scope.alert = true
          $scope.vehicle = {}
          $scope.vehicle = response
]
