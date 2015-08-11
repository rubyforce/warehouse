@religions.controller 'CreateReligionsController', [
  '$scope', 'Religion', '$modal', 'ReligionsSharedObjects'
  ($scope, Religion, $modal, ReligionsSharedObjects) ->

    $scope.openForm = (size) ->
      ReligionsSharedObjects.modalWindow = $modal.open(
        templateUrl: 'admin/religions/views/religions/modal.html'
        size: size
        controller: 'CreateReligionsController')

      ReligionsSharedObjects.modalWindow.result.then (religion) ->
        $scope.religions.push(religion)

    $scope.create = ->
      new Religion($scope.religion).create().then (response) ->
        ReligionsSharedObjects.modalWindow.close(response)

    $scope.close = ->
        ReligionsSharedObjects.modalWindow.dismiss 'cancel'
]
