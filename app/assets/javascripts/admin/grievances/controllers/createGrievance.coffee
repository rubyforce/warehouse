@grievances.controller 'CreateGrievancesController', [
  '$scope', 'Grievance', '$timeout', 'Reason'
  ($scope, Grievance, $timeout, Reason) ->

    $scope.foods = []

    $scope.reason =
      reason: "Return"

    $scope.alert = false

    build = ->
      new Grievance(date: $.datepicker.formatDate("dd/mm/yy", new Date()))

    $scope.grievance = build()

    $scope.add = ->
      debugger
      new Reason($scope.reason).create().then (response) ->
        $scope.reasons.push(new Reason(response))

      $scope.foods.push(_.clone($scope.reason))

      # Reset reason on the page to make sure we have the old selected
      # value

      $scope.reason =
        reason: "Return"

    $scope.create = ->
      # TODO: place here nested attributes usage like in school daily meals.
      #
      new Grievance($scope.grievance).create().then (response) ->
        $scope.grievances.push(new Grievance(response))
        $scope.alert = true

]
