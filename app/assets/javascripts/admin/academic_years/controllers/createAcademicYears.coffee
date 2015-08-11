@academic_years.controller 'CreateAcademicYearsController', [
  '$scope', 'AcademicYear', '$modal', 'AcademicYearsSharedObjects'
  ($scope, AcademicYear, $modal, AcademicYearsSharedObjects) ->

    $scope.openForm = (size) ->
      AcademicYearsSharedObjects.modalWindow = $modal.open(
        templateUrl: 'admin/academic_years/views/academic_years/modal.html'
        size: size
        controller: 'CreateAcademicYearsController')
      AcademicYearsSharedObjects.modalWindow.result.then (academic_year) ->
        $scope.academic_years.push(academic_year)

    $scope.create = ->
      new AcademicYear($scope.academic_year).create().then (response) ->
        AcademicYearsSharedObjects.modalWindow.close(response)

    $scope.close = ->
        AcademicYearsSharedObjects.modalWindow.dismiss 'cancel'
]
