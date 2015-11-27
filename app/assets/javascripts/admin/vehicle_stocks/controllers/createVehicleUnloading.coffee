@vehicle_stocks.controller 'CreateVehicleUnloadingController', [
  '$scope', '$http', '$timeout', 'VehicleUnloading', '$location', '$window'
  ($scope, $http, $timeout, VehicleUnloading, $location, $window) ->

    $scope.vehicle_unloading_date = $.datepicker.formatDate("dd/mm/yy", new Date())

    $http.get('admin/vehicle_unloadings/vehicle_unloading_id')
      .success (response) ->
        $timeout ->
          if response == null
            $scope.vehicle_unloading.voucherNo = "00001"
          else
            sum = response.id + 1
            $scope.rev = numeral(sum/10000).format('0.0000').replace(/\./,'')
            $scope.vehicle_unloading.voucherNo = $scope.rev

    build = ->
      new VehicleUnloading({
        date: $.datepicker.formatDate("dd/mm/yy", new Date()),
        voucherNo: $scope.rev
      })

    $scope.vehicle_unloading = build()

    $scope.vehicle_stocks = []
    $scope.alert = false

    $scope.create = ->
      new VehicleUnloading($scope.vehicle_unloading).create().then (response) ->
        protocol = $location.protocol()
        host = $window.location.host
        domain = "#{protocol}://#{host}" # Example: http://example.com
        $window.open("#{domain}/admin/vehicle_unloadings/#{response.id}/print",'_blank')

        $scope.vehicle_unloadings.push(new VehicleUnloading(response))

        sum = response.id + 1
        $scope.rev = numeral(sum/10000).format('0.0000').replace(/\./,'')
        $scope.vehicle_unloading.voucherNo = $scope.rev

        $scope.alert = true

      $scope.reset()
]
