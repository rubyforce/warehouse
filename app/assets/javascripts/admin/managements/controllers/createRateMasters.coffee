@managements.controller 'CreateRateMastersController', [
  '$scope', 'Item', '$timeout', '$http'
  ($scope, Item, $timeout, $http) ->
    $scope.alert = false

    makeTableSelectable = ->
      $timeout ->
        table = $('table')
        table.tableselect
          multiple: true
          activeClass: 'warning'
          onSelectionChanged: (element) ->
            return unless element?
            property = $scope.items[element.data('index')]
            $scope.$apply ->
              $scope.selectedItem = property
    $scope.$watch 'items', makeTableSelectable

    getItems = ->
      if $scope.selectedItem?
        [$scope.selectedItem]
      else if $scope.companyId? # in case if we did not select item in the table lets apply new rates for all rows.
        _($scope.items).chain().find((i)-> parseInt(i.id, 10) is parseInt($scope.companyId, 10)).value()
      else
        $scope.items

    $scope.reset = ->
      for item in getItems()
        $http
        .post("/admin/items/#{item.id}/reset")
        .success (response) ->
          $timeout ->
            item.rate = response.rate

    $scope.create = ->
      for item in getItems()
        new Item(item).update()
      $scope.alert = true
]
