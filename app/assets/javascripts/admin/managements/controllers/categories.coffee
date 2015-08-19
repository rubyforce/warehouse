@managements.controller 'CategoriesController', [
  '$scope', '$state', 'Category', 'Ledger', 'Expense', 'Company', 'Warehouse', 'Item', 'PackageType', 'Container', 'Device', 'Vehicle', 'VehicleCompany'
  ($scope, $state, Category, Ledger, Expense, Company, Warehouse, Item, PackageType, Container, Device, Vehicle, VehicleCompany) ->
    $state.go('managements.categories')

    Category.get().then (categories) ->
      $scope.categories = categories

    Ledger.get().then (ledgers) ->
      $scope.ledgers = ledgers

    Expense.get().then (expenses) ->
      $scope.expenses = expenses

    Company.get().then (companies) ->
      $scope.companies = companies

    Warehouse.get().then (warehouses) ->
      $scope.warehouses = warehouses

    Item.get().then (items) ->
      $scope.items = items

    PackageType.get().then (package_types) ->
      $scope.package_types = package_types

    Container.get().then (containers) ->
      $scope.containers = containers

    Device.get().then (devices) ->
      $scope.devices = devices

    Vehicle.get().then (vehicles) ->
      $scope.vehicles = vehicles

    VehicleCompany.get().then (vehicle_companies) ->
      $scope.vehicle_companies = vehicle_companies
]
