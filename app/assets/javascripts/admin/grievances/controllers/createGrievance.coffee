@grievances.controller 'CreateGrievancesController', [
  '$scope', 'Grievance', '$timeout', 'Reason'
  ($scope, Grievance, $timeout, Reason) ->

    $scope.foods = []
    $scope.reason.reason = "Return"

    $scope.alert = false

    build = ->
      new Grievance(date: $.datepicker.formatDate("dd/mm/yy", new Date()))

    $scope.grievance = build()

    $scope.add = ->
      debugger
      reason = _($scope.reasons).chain().find((r)-> parseInt(r.id, 10) is parseInt($scope.reason.item_id, 10)).value()
      reason.qty = $scope.reason.qty

      reason = new Reason(reason)
      reason.update()

      $scope.foods.push(_.clone($scope.reason))

      $scope.reason = _($scope.reason).pick(['reason']).value()

    $scope.create = ->
      new Grievance($scope.grievance).create().then (response) ->
        $scope.grievances.push(new Grievance(response))
        $scope.alert = true
    
]
