@managements.controller 'CreateRateMasterController', [
  '$scope', 'RateMaster', '$timeout'
  ($scope, RateMaster, $timeout) ->
    debugger

    $scope.alert = false



    render = ->
      # Before making merges between student.studentsFeesHeads and fees_heads
      # we should clean up the previous populated collection.
      $scope.itemRateMasters = []

      for f in $scope.items
        found = _.find $scope.rate_master.itemRateMasters, (o) -> o.itemId is f.id
        # We extend our resource by properties hash for storing skipped on requests
        # data. Lets say we want to use extra `enabled` flag. We added as
        # object.properties.enabled = true / false and then on getting attributes
        # we will skip `properties` for passing only required data.
        if found?
          # to make checkbox as checked
          found.isNew = -> false

          found.properties = {}
          found.properties.name = f.name
          found.properties.companies = f.companies

        else
          found =  {}
          found.itemId = f.id
          found.rate = ""
          found.companies = f.companies

          # to make checkbox as unchecked because of new record.
          found.isNew = -> true

          found.properties = {}
          found.properties.name = f.name

        collection = _($scope.itemRateMasters)
        unless collection.contains((o) -> o.itemId is found.id)
          $scope.itemRateMasters.push(found)

    class NestedAttributes
      constructor: (@collection) ->
      get: ->
        # We are using @collection on rendering by ng-repeat on the form, we should
        # clone array because of possible removes later in code.
        collection = _.clone(@collection)

    $scope.$watchCollection 'items', (collection) ->
      render()

    $scope.create = ->
      itemRateMastersAttributes = new NestedAttributes($scope.itemRateMasters)
      itemRateMastersAttributes = itemRateMastersAttributes.get()

      $scope.rate_master.itemRateMasters = itemRateMastersAttributes
      new RateMaster($scope.rate_master).create().then (response) ->
        debugger
        $scope.rate_masters.push(new RateMaster(response))
        $scope.alert = true
]
