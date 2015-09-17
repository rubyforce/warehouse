@grievances.controller 'GrievancesController', [
  '$scope', 'Grievance', 'Item', 'Reason'
  ($scope, Grievance, Item, Reason) ->
    Grievance.get().then (grievances) ->
      $scope.grievances = grievances

    Item.get().then (items) ->
      $scope.items = items

    Reason.get().then (reasons) ->
      $scope.reasons = reasons

]
