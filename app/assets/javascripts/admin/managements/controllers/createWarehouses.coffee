@managements.controller 'CreateWarehousesController', [
  '$scope', 'Warehouse', '$timeout'
  ($scope, Warehouse, $timeout) ->
    $scope.alert = false

    $scope.warehouse = new Warehouse()

    $scope.select = (warehouse) ->
      $scope.warehouse = warehouse

    $scope.new = ->
      $scope.warehouse = new Warehouse()

    $scope.remove = (warehouse) ->
      warehouse.delete()
      _.remove($scope.warehouses, warehouse)

    $scope.create = ->
      if $scope.warehouse.id?
        $scope.warehouse.update().then (response) ->
          $scope.alert = true
          $scope.warehouse = response
      else
        $scope.warehouse.create().then (response) ->
          $scope.warehouses.push(new Warehouse(response))

          $scope.alert = true
          $scope.warehouse = {}
          $scope.warehouse = response
]
