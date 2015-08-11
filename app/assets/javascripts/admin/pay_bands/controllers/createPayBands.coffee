@pay_bands.controller 'CreatePayBandsController', [
  '$scope', 'PayBand', '$modal', 'PayBandsSharedObjects'
  ($scope, PayBand, $modal, PayBandsSharedObjects) ->

    $scope.openForm = (size) ->
      PayBandsSharedObjects.modalWindow = $modal.open(
        templateUrl: 'admin/pay_bands/views/pay_bands/modal.html'
        size: size
        controller: 'CreatePayBandsController')

      PayBandsSharedObjects.modalWindow.result.then (payBand) ->
        $scope.pay_bands.push(payBand)

    $scope.create = ->
      new PayBand($scope.pay_band).create().then (response) ->
        PayBandsSharedObjects.modalWindow.close(response)

    $scope.close = ->
        PayBandsSharedObjects.modalWindow.dismiss 'cancel'
]
