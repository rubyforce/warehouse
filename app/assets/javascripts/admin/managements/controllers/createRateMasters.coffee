@managements.controller 'CreateRateMastersController', [
  '$scope', 'RateMaster', '$timeout'
  ($scope, RateMaster, $timeout) ->

    $scope.alert = false

    $scope.rateMaster = new RateMaster()

    render = ->
      debugger
      $scope.itemRateMasters = []

      for f in $scope.items
        found = _.find $scope.rateMaster.itemRateMasters, (o) -> o.itemId is f.id

        if found?
          # to make checkbox as checked
          found.isNew = -> false

          found.name = f.name


        else
          found =  {}
          found.itemId = f.id
          found.rate = ""
          found.name = f.name

        collection = _($scope.itemRateMasters)
        unless collection.contains((o) -> o.itemId is found.id)
          $scope.itemRateMasters.push(found)

    $scope.$watchCollection 'items', (collection) ->
      render()

    $scope.create = ->
      $scope.rateMaster.itemRateMastersAttributes= $scope.itemRateMasters
      $scope.rateMaster.create().then (response) ->
        debugger
        render()
        item = _($scope.items).chain().find((i)-> parseInt(i.id, 10)).value()
        $scope.rateMaster.itemName = item.name
        $scope.rateMaster.itemId = item.id

        $scope.rate_masters.push(new RateMaster(response))
        $scope.alert = true
]
