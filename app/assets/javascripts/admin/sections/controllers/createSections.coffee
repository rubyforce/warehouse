@sections.controller 'CreateSectionsController', [
  '$scope', 'Section', '$modal', 'SectionsSharedObjects'
  ($scope, Section, $modal, SectionsSharedObjects) ->

    $scope.openForm = (size) ->
      SectionsSharedObjects.modalWindow = $modal.open(
        templateUrl: 'admin/sections/views/sections/modal.html'
        size: size
        controller: 'CreateSectionsController')

      SectionsSharedObjects.modalWindow.result.then (section) ->
        $scope.sections.push(section)

    $scope.create = ->
      new Section($scope.section).create().then (response) ->
        SectionsSharedObjects.modalWindow.close(response)

    $scope.close = ->
      SectionsSharedObjects.modalWindow.dismiss 'cancel'
]
