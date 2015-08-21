@grievances.controller 'GrievancesController', [
  '$scope', '$state', 'Grievance'
  ($scope, $state, Grievance) ->
    $state.go('grievances.new')

    Grievance.get().then (grievances) ->
      $scope.grievances = grievances

]
