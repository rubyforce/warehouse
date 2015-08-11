@admissions.controller 'CreateAdmissionsController', [
  '$scope', 'Admission', '$modal', 'AdmissionsSharedObjects'
  ($scope, Admission, $modal, AdmissionsSharedObjects) ->

    $scope.openForm = (size) ->
      AdmissionsSharedObjects.modalWindow = $modal.open(
        templateUrl: 'admin/admissions/views/admissions/modal.html'
        size: size
        controller: 'CreateAdmissionsController')

      AdmissionsSharedObjects.modalWindow.result.then (admission) ->
        $scope.admissions.push(admission)

    $scope.create = ->
      new Admission($scope.admission).create().then (response) ->
        AdmissionsSharedObjects.modalWindow.close(response)

    $scope.close = ->
        AdmissionsSharedObjects.modalWindow.dismiss 'cancel'
]
