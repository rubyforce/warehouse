@grievances.controller 'GrievancesController', [
  '$scope', '$state', 'Grievance', 'Item', 'Reason'
  ($scope, $state, Grievance, Item, Reason) ->
    Grievance.get().then (grievances) ->
      $scope.grievances = grievances

    Item.get().then (items) ->
      $scope.items = items

    Reason.get().then (reasons) ->
      $scope.reasons = reasons

]
