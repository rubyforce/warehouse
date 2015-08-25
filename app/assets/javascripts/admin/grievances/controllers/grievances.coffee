@grievances.controller 'GrievancesController', [
  '$scope', '$state', 'Grievance', 'Item'
  ($scope, $state, Grievance, Item) ->

    Grievance.get().then (grievances) ->
      $scope.grievances = grievances

    Item.get().then (items) ->
      $scope.items = items

]
