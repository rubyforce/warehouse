@containers.controller 'CreateContainersController', [
  '$scope', 'Container', '$modal', 'ContainersSharedObjects'
  ($scope, Container, $modal, ContainersSharedObjects) ->

    $scope.openForm = (size) ->
      ContainersSharedObjects.modalWindow = $modal.open(
        templateUrl: 'admin/containers/views/containers/modal.html'
        size: size
        controller: 'CreateContainersController')

      ContainersSharedObjects.modalWindow.result.then (container) ->
        $scope.containers.push(container)

    $scope.create = ->
      new Container($scope.container).create().then (response) ->
        ContainersSharedObjects.modalWindow.close(response)

    $scope.close = ->
        ContainersSharedObjects.modalWindow.dismiss 'cancel'
]
