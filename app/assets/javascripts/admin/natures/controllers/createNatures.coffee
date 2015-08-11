@natures.controller 'CreateNaturesController', [
  '$scope', 'Nature', '$modal', 'NaturesSharedObjects'
  ($scope, Nature, $modal, NaturesSharedObjects) ->

    $scope.openForm = (size) ->
      NaturesSharedObjects.modalWindow = $modal.open(
        templateUrl: 'admin/natures/views/natures/modal.html'
        size: size
        controller: 'CreateNaturesController')

      NaturesSharedObjects.modalWindow.result.then (nature) ->
        $scope.natures.push(nature)

    $scope.create = ->
      new Nature($scope.nature).create().then (response) ->
        NaturesSharedObjects.modalWindow.close(response)

    $scope.close = ->
        NaturesSharedObjects.modalWindow.dismiss 'cancel'
]
