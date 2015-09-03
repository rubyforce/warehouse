@grievances.controller 'CreateGrievancesController', [
  '$scope', 'Grievance', '$timeout', 'Reason', 'Item'
  ($scope, Grievance, $timeout, Reason, Item) ->

    $scope.things = []
    $scope.reason = {}

    $scope.reason =
      reason: "Return"

    $scope.alert = false

    build = ->
      new Grievance(date: $.datepicker.formatDate("dd/mm/yy", new Date()))

    $scope.grievance = build()

    $scope.add = ->
      debugger
      item = _($scope.items).chain().find((i)-> parseInt(i.id, 10) is parseInt($scope.reason.item_id, 10)).value()
      $scope.reason.itemName = item.name
      $scope.reason.itemId = item.id

      $scope.reason = _($scope.reason).pick(['itemName', 'qty', 'numeral', 'reason', 'itemId']).value()

      $scope.things.push(_.clone($scope.reason))

      # Reset reason on the page to make sure we have the old selected
      # value

      $scope.reason =
        reason: "Return"

    $scope.create = ->
      # TODO: place here nested attributes usage like in school daily meals.
      #
      $scope.grievance.reasonsAttributes = $scope.things
      $scope.grievance.create().then (response) ->
        debugger
        $scope.alert = true

]
