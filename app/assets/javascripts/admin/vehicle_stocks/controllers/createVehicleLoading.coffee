@vehicle_stocks.controller 'CreateVehicleLoadingController', [
  '$scope', '$http', '$timeout', 'VehicleLoading', '$location', '$window'
  ($scope, $http, $timeout, VehicleLoading, $location, $window) ->

    $scope.vehicle_loading_date = $.datepicker.formatDate("dd/mm/yy", new Date())

    $http.get('admin/vehicle_loadings/vehicle_loading_id')
      .success (response) ->
        $timeout ->
          if response == null
            $scope.vehicle_loading.voucherNo = "00001"
          else
            sum = response.id + 1
            $scope.rev = numeral(sum/10000).format('0.0000').replace(/\./,'')
            $scope.vehicle_loading.voucherNo = $scope.rev

    build = ->
      new VehicleLoading({
        date: $.datepicker.formatDate("dd/mm/yy", new Date()),
        voucherNo: $scope.rev
      })

    $scope.vehicle_loading = build()

    $scope.reset = ->
      $scope.vehicle_loading = build()
      $scope.vehicle_loading_item = {}
      $scope.vehicle_stocks = []

    $scope.vehicle_stocks = []
    $scope.vehicle_loading_item = {}
    $scope.alert = false

    $scope.add = ->
      item = _($scope.items).chain().find((i)-> parseInt(i.id, 10) is parseInt($scope.vehicle_loading_item.item_id, 10)).value()
      $scope.vehicle_loading_item.itemName = item.name
      $scope.vehicle_loading_item.itemId = item.id
      $scope.vehicle_loading_item.rate = item.rate

      vehicle = _($scope.vehicles).chain().find((i)-> parseInt(i.id, 10) is parseInt($scope.vehicle_loading.vehicle_id, 10)).value()
      $scope.vehicle_loading_item.vehicleName = vehicle.name
      $scope.vehicle_loading_item.vehicleId = vehicle.id

      $scope.vehicle_loading_item = _($scope.vehicle_loading_item).pick(['itemName', 'itemId', 'qty', 'id', 'sQty', 'rate', 'amount', 'numeral', 'vehicleName', 'vehicleId']).value()

      $scope.vehicle_loading_item.amount = $scope.vehicle_loading_item.rate * $scope.vehicle_loading_item.qty

      $scope.vehicle_stocks.push($scope.vehicle_loading_item)

      for i in [1..$scope.vehicle_stocks.length]
        $scope.vehicle_loading_item.numeral = i

      $scope.vehicle_loading_item = {}

    $scope.create = ->
      $scope.vehicle_loading.vehicle_loading_itemsAttributes = $scope.vehicle_stocks
      new VehicleLoading($scope.vehicle_loading).create().then (response) ->
        protocol = $location.protocol()
        host = $window.location.host
        domain = "#{protocol}://#{host}" # Example: http://example.com
        $window.open("#{domain}/admin/vehicle_loadings/#{response.id}/print",'_blank')

        $scope.vehicle_loadings.push(new VehicleLoading(response))

        sum = response.id + 1
        $scope.rev = numeral(sum/10000).format('0.0000').replace(/\./,'')
        $scope.vehicle_loading.voucherNo = $scope.rev

        $scope.alert = true

      $scope.reset()

]
