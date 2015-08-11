@finance_modes.controller 'CreateFinanceModesController', [
  '$scope', 'FinanceMode', '$modal', 'FinanceModesSharedObjects'
  ($scope, FinanceMode, $modal, FinanceModesSharedObjects) ->

    $scope.openForm = (size) ->
      FinanceModesSharedObjects.modalWindow = $modal.open(
        templateUrl: 'admin/finance_modes/views/finance_modes/modal.html'
        size: size
        controller: 'CreateFinanceModesController')

      FinanceModesSharedObjects.modalWindow.result.then (financeMode) ->
        $scope.finance_modes.push(financeMode)

    $scope.create = ->
      new FinanceMode($scope.finance_mode).create().then (response) ->
        FinanceModesSharedObjects.modalWindow.close(response)

    $scope.close = ->
        FinanceModesSharedObjects.modalWindow.dismiss 'cancel'
]
