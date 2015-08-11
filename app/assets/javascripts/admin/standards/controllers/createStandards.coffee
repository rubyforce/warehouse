@standards.controller 'CreateStandardsController', [
  '$scope', 'Standard', '$modal', 'StandardsSharedObjects'
  ($scope, Standard, $modal, StandardsSharedObjects) ->

    $scope.openForm = (size) ->
      StandardsSharedObjects.modalWindow = $modal.open(
        templateUrl: 'admin/standards/views/standards/modal.html'
        size: size
        controller: 'CreateStandardsController')

      StandardsSharedObjects.modalWindow.result.then (standard) ->
        $scope.standards.push(standard)

    $scope.create = ->
      new Standard($scope.standard).create().then (response) ->
        StandardsSharedObjects.modalWindow.close(response)

    $scope.close = ->
        StandardsSharedObjects.modalWindow.dismiss 'cancel'
]
