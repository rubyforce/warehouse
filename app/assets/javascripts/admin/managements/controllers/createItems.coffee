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
      if $scope.item.id?
        $scope.item.update().then (response) ->
          $scope.alert = true
          $scope.item = response
      else
        $scope.item.create().then (response) ->
          $scope.items.push(new Item(response))

          $scope.alert = true
          $scope.item = {}
          $scope.item = response
]
