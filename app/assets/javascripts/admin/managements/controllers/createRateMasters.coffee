@managements.controller 'CreateRateMastersController', [
  '$scope', 'RateMaster', '$timeout'
  ($scope, RateMaster, $timeout) ->
    $scope.itemAttributes = []

    $scope.alert = false

    $scope.rateMaster = new RateMaster()

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
      $scope.rateMaster.create().then (response) ->
        debugger
        item = _($scope.items).chain().find((i)-> parseInt(i.id, 10)).value()
        $scope.rateMaster.itemName = item.name
        $scope.rateMaster.itemId = item.id
        $scope.rateMaster.itemRate = item.rate

        $scope.rate_masters.push(new RateMaster(response))
        $scope.alert = true
]
