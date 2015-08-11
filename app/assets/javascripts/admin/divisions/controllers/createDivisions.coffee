@divisions.controller 'CreateDivisionsController', [
  '$scope', 'Division', '$modal', 'DivisionsSharedObjects'
  ($scope, Division, $modal, DivisionsSharedObjects) ->

    $scope.openForm = (size) ->
      DivisionsSharedObjects.modalWindow = $modal.open(
        templateUrl: 'admin/divisions/views/divisions/modal.html'
        size: size
        controller: 'CreateDivisionsController')

      DivisionsSharedObjects.modalWindow.result.then (division) ->
        $scope.divisions.push(division)

    $scope.create = ->
      new Division($scope.division).create().then (response) ->
        DivisionsSharedObjects.modalWindow.close(response)

    $scope.close = ->
        DivisionsSharedObjects.modalWindow.dismiss 'cancel'
]
