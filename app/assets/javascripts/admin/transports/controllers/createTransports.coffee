@transports.controller 'CreateTransportsController', [
  '$scope', 'Transport', '$modal', 'TransportsSharedObjects'
  ($scope, Transport, $modal, TransportsSharedObjects) ->

    $scope.openForm = (size) ->
      TransportsSharedObjects.modalWindow = $modal.open(
        templateUrl: 'admin/transports/views/transports/modal.html'
        size: size
        controller: 'CreateTransportsController')

      TransportsSharedObjects.modalWindow.result.then (transport) ->
        $scope.transports.push(transport)

    $scope.create = ->
      new Transport($scope.transport).create().then (response) ->
        TransportsSharedObjects.modalWindow.close(response)

    $scope.close = ->
        TransportsSharedObjects.modalWindow.dismiss 'cancel'
]
