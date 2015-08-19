@package_types.controller 'CreatePackageTypesController', [
  '$scope', 'PackageType', '$modal', 'PackageTypesSharedObjects'
  ($scope, PackageType, $modal, PackageTypesSharedObjects) ->

    $scope.openForm = (size) ->
      PackageTypesSharedObjects.modalWindow = $modal.open(
        templateUrl: 'admin/package_types/views/package_types/modal.html'
        size: size
        controller: 'CreatePackageTypesController')

      PackageTypesSharedObjects.modalWindow.result.then (packageType) ->
        $scope.package_types.push(packageType)

    $scope.create = ->
      new PackageType($scope.package_type).create().then (response) ->
        PackageTypesSharedObjects.modalWindow.close(response)

    $scope.close = ->
        PackageTypesSharedObjects.modalWindow.dismiss 'cancel'
]
