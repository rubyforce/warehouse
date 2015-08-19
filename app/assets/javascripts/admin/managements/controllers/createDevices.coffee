@managements.controller 'CreateDevicesController', [
  '$scope', 'Device', '$timeout'
  ($scope, Device, $timeout) ->
    $scope.alert = false

    $scope.device = new Device()

    $scope.select = (device) ->
      $scope.device = device

    $scope.new = ->
      $scope.device = new Device()

    $scope.remove = (device) ->
      device.delete()
      _.remove($scope.devices, device)

    $scope.create = ->
      new Device($scope.device).create().then (response) ->
        $scope.devices.push(new Device(response))
        $scope.device = {}
        $scope.alert = true
]