@fees_heads.controller 'CreateFeesHeadsController', [
  '$scope', 'FeesHead', '$timeout'
  ($scope, FeesHead, $timeout) ->
    $scope.alert = false

    $scope.fees_head = new FeesHead()
    $scope.fees_head.feesHeadsStandards = []

    $scope.$watch 'standards', (time) ->
      return unless time?
      render()

    render = ->
      $scope.feesHeadsStandards = []

      for s in $scope.standards
        found = _.find $scope.fees_head.feesHeadsStandards, (o) -> o.standardId is s.id

        if found?
          found.isNew = -> false

          found.properties = {}
          found.properties.enabled = true
          found.properties.name = s.name
          found.feesHeadId = $scope.fees_head?.id
        else
          found =  {}
          found.standardId = s.id
          found.feesHeadId = $scope.fees_head?.id

          found.isNew = -> true

          found.properties = {}
          found.properties.enabled = false
          found.properties.name = s.name

        collection = _($scope.feesHeadsStandards)
        unless collection.contains((o) -> o.standardId is found.id)
            $scope.feesHeadsStandards.push(found)

    class NestedAttributes
      constructor: (@collection) ->
      get: ->
        collection = _.clone(@collection)

        for item in collection
          if item.properties.enabled then item._destroy = 0 else item._destroy = 1
          delete item.properties

        _(collection)
          .remove (item) -> item._destroy is 1 && item.isNew()
          .value()

        collection

    $scope.select = (fees_head) ->
      $scope.fees_head = fees_head
      $timeout(render)

    $scope.new = ->
      $scope.fees_head = new FeesHead()
      $timeout(render)

    $scope.remove = (fees_head) ->
        fees_head.delete()
        _.remove($scope.fees_heads, fees_head)

    $scope.create = ->
      feesHeadsStandardsAttributes = new NestedAttributes($scope.feesHeadsStandards)
      feesHeadsStandardsAttributes = feesHeadsStandardsAttributes.get()

      $scope.fees_head.feesHeadsStandards = feesHeadsStandardsAttributes

      if $scope.fees_head.id?
        $scope.fees_head.update().then (response) ->
          $scope.alert = true
          $scope.fees_head.feesHeadsStandards = response.feesHeadsStandards
          $timeout(render)
      else
        $scope.fees_head.create().then (response) ->
          $scope.fees_heads.push(new FeesHead(response))

          $scope.alert = true
          $scope.fees_head.feesHeadsStandards = response.feesHeadsStandards
          $timeout(render)
]
