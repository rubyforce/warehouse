@paid_types.controller 'CreatePaidTypesController', [
  '$scope', 'PaidType', '$modal', 'PaidTypesSharedObjects'
  ($scope, PaidType, $modal, PaidTypesSharedObjects) ->

    $scope.openForm = (size) ->
      PaidTypesSharedObjects.modalWindow = $modal.open(
        templateUrl: 'admin/paid_types/views/paid_types/modal.html'
        size: size
        controller: 'CreatePaidTypesController')

      PaidTypesSharedObjects.modalWindow.result.then (paidType) ->
        $scope.paid_types.push(paidType)

    $scope.create = ->
      new PaidType($scope.paid_type).create().then (response) ->
        PaidTypesSharedObjects.modalWindow.close(response)

    $scope.close = ->
        PaidTypesSharedObjects.modalWindow.dismiss 'cancel'
]
