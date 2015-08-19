@managements.controller 'CreateWarehousesController', [
  '$scope', 'Warehouse', '$timeout'
  ($scope, Warehouse, $timeout) ->
    $scope.alert = false

    $scope.select = (warehouse) ->
      $scope.warehouse = warehouse

    $scope.new = ->
      $scope.warehouse = new Warehouse()

    $scope.remove = (warehouse) ->
      warehouse.delete()
      _.remove($scope.warehouses, warehouse)

    $scope.create = ->
      if $scope.warehouse.id?
        $scope.warehouse.update()
        
      else
        new Warehouse($scope.warehouse).create().then (response) ->
          $scope.warehouses.push(new Warehouse(response))

          $scope.warehouse = {}
          $scope.alert = true
]
