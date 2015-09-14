@requisitions.controller 'RequisitionsController', [
  '$scope', '$state', 'Requisition'
  ($scope, $state, Requisition) ->
    Requisition.get().then (requisitions) ->
      $scope.requisitions = requisitions

]
