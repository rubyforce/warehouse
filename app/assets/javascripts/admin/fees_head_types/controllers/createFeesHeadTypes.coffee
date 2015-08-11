@fees_head_types.controller 'CreateFeesHeadTypesController', [
  '$scope', 'FeesHeadType', '$modal', 'FeesHeadTypesSharedObjects'
  ($scope, FeesHeadType, $modal, FeesHeadTypesSharedObjects) ->

    $scope.openForm = (size) ->
      FeesHeadTypesSharedObjects.modalWindow = $modal.open(
        templateUrl: 'admin/fees_head_types/views/fees_head_types/modal.html'
        size: size
        controller: 'CreateFeesHeadTypesController')

      FeesHeadTypesSharedObjects.modalWindow.result.then (fees_head_type) ->
        $scope.fees_head_types.push(fees_head_type)

    $scope.create = ->
      new FeesHeadType($scope.fees_head_type).create().then (response) ->
        FeesHeadTypesSharedObjects.modalWindow.close(response)

    $scope.close = ->
        FeesHeadTypesSharedObjects.modalWindow.dismiss 'cancel'
]
