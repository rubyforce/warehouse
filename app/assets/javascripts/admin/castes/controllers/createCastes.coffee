@castes.controller 'CreateCastesController', [
  '$scope', 'Caste', '$modal', 'CastesSharedObjects'
  ($scope, Caste, $modal, CastesSharedObjects) ->

    $scope.openForm = (size) ->
      CastesSharedObjects.modalWindow = $modal.open(
        templateUrl: 'admin/castes/views/castes/modal.html'
        size: size
        controller: 'CreateCastesController')

      CastesSharedObjects.modalWindow.result.then (caste) ->
        $scope.castes.push(caste)

    $scope.create = ->
      new Caste($scope.caste).create().then (response) ->
        CastesSharedObjects.modalWindow.close(response)

    $scope.close = ->
        CastesSharedObjects.modalWindow.dismiss 'cancel'
]
