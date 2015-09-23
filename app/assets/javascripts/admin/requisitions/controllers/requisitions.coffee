@requisitions.controller 'RequisitionsController', [
  '$scope', 'Requisition', 'Warehouse', 'Item', 'Company'
  ($scope, Requisition, Warehouse, Item, Company) ->
    Requisition.get().then (requisitions) ->
      $scope.requisitions = requisitions

    Warehouse.get().then (warehouses) ->
      $scope.warehouses = warehouses

    Item.get().then (items) ->
      $scope.items = items

    Company.get().then (companies) ->
      $scope.companies = companies
]
