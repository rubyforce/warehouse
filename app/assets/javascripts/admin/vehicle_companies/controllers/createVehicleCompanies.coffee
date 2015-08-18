@vehicle_companies.controller 'CreateVehicleCompaniesController', [
  '$scope', 'VehicleCompany', '$modal', 'VehicleCompaniesSharedObjects'
  ($scope, VehicleCompany, $modal, VehicleCompaniesSharedObjects) ->

    $scope.openForm = (size) ->
      VehicleCompaniesSharedObjects.modalWindow = $modal.open(
        templateUrl: 'admin/vehicle_companies/views/vehicle_companies/modal.html'
        size: size
        controller: 'CreateVehicleCompaniesController')

      VehicleCompaniesSharedObjects.modalWindow.result.then (vehicleCompany) ->
        $scope.vehicle_companies.push(vehicleCompany)

    $scope.create = ->
      new VehicleCompany($scope.vehicle_company).create().then (response) ->
        VehicleCompaniesSharedObjects.modalWindow.close(response)

    $scope.close = ->
        VehicleCompaniesSharedObjects.modalWindow.dismiss 'cancel'
]
