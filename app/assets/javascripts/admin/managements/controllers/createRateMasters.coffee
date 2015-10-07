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
              select(property)

    $scope.$watch 'items', makeTableSelectable

    selectedItem = null
    select = (property)->
      selectedItem = property

    $scope.reset = ->
      return unless selectedItem?

      $http
        .post("/admin/items/#{selectedItem.id}/reset")
        .success (response) ->
          $timeout ->
            selectedItem.rate = response.rate

    $scope.create = ->
      item = _($scope.items).chain().find((i)-> parseInt(i.id, 10) is parseInt(selectedItem.id, 10)).value()
      return unless selectedItem?

      item.id = selectedItem.id
      new Item(item).update().then ->
        $scope.alert = true
]
