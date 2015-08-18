@managements.controller 'CreateItemsController', [
  '$scope', 'Item', '$timeout'
  ($scope, Item, $timeout) ->
    $scope.alert = false

    $scope.item = new Item()

    $scope.select = (item) ->
      $scope.item = item
      $scope.item.company = company_id

    $scope.new = ->
      $scope.item = new Item()

    $scope.remove = (item) ->
      item.delete()
      _.remove($scope.items, item)

    $scope.create = ->
      new Item($scope.item).create().then (response) ->
        $scope.items.push(new Item(response))
        $scope.item = {}
        $scope.alert = true
]
