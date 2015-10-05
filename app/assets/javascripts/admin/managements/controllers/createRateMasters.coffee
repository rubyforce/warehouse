@managements.controller 'CreateRateMastersController', [
  '$scope', 'Item', '$timeout'
  ($scope, Item, $timeout) ->
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


    $scope.create = ->
      item = _($scope.items).chain().find((i)-> parseInt(i.id, 10) is parseInt(selectedItem.id, 10)).value()
      return unless selectedItem?

      item.id = selectedItem.id
      new Item(item).update().then ->
        $scope.alert = true
]
