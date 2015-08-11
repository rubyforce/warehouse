@fees_head_recurrences.controller 'CreateFeesHeadRecurrencesController', [
  '$scope', 'FeesHeadRecurrence', '$modal', 'FeesHeadRecurrencesSharedObjects'
  ($scope, FeesHeadRecurrence, $modal, FeesHeadRecurrencesSharedObjects) ->

    $scope.openForm = (size) ->
      FeesHeadRecurrencesSharedObjects.modalWindow = $modal.open(
        templateUrl: 'admin/fees_head_recurrences/views/fees_head_recurrences/modal.html'
        size: size
        controller: 'CreateFeesHeadRecurrencesController')

      FeesHeadRecurrencesSharedObjects.modalWindow.result.then (fees_head_recurrence) ->
        $scope.fees_head_recurrences.push(fees_head_recurrence)

    $scope.create = ->
      new FeesHeadRecurrence($scope.fees_head_recurrence).create().then (response) ->
        FeesHeadRecurrencesSharedObjects.modalWindow.close(response)

    $scope.close = ->
        FeesHeadRecurrencesSharedObjects.modalWindow.dismiss 'cancel'
]
