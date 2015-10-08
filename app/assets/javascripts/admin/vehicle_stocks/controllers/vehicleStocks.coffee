@vehicle_stocks.controller 'VehicleStocksController', [
  '$scope', '$state', 'Item', 'Warehouse', 'Device', 'Company', 'Vehicle'
  ($scope, $state, Item, Warehouse, Device, Company, Vehicle) ->
    $state.go('vehicle_stocks.vehicle_loading')

    Item.get().then (items) ->
      $scope.items = items

    Warehouse.get().then (warehouses) ->
      $scope.warehouses = warehouses

    Company.get().then (companies) ->
      $scope.companies = companies

    Device.get().then (devices) ->
      $scope.devices = devices

    Vehicle.get().then (vehicles) ->
      $scope.vehicles = vehicles

]
