@vehicle_stocks.controller 'VehicleStocksController', [
  '$scope', '$state', 'Item', 'Warehouse', 'Device', 'Company', 'Vehicle', 'VehicleLoading', 'VehicleUnloading'
  ($scope, $state, Item, Warehouse, Device, Company, Vehicle, VehicleLoading, VehicleUnloading) ->
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

    VehicleLoading.get().then (vehicle_loadings) ->
      $scope.vehicle_loadings = vehicle_loadings

    VehicleLoading.get().then (vehicle_unloadings) ->
      $scope.vehicle_unloadings = vehicle_unloadings
]
