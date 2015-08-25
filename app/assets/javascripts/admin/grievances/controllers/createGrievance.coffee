@grievances.controller 'CreateGrievancesController', [
  '$scope', 'Grievance', '$timeout'
  ($scope, Grievance, $timeout) ->

    $scope.create = ->
      debugger
      new Grievance($scope.grievance).create().then (response) ->
        $scope.grievances.push(response)
    
]
