@managements.controller 'CreateVendorsController', [
  '$scope', 'Vendor', '$timeout'
  ($scope, Vendor, $timeout) ->
    $scope.alert = false

    $scope.select = (vendor) ->
      $scope.vendor = vendor

    $scope.new = ->
      $scope.vendor = new Vendor()

    $scope.remove = (vendor) ->
      vendor.delete()
      _.remove($scope.vendors, vendor)

    $scope.create = ->
      if $scope.vendor.id?
        $scope.vendor.update()

      else
        new Vendor($scope.vendor).create().then (response) ->
          $scope.vendors.push(new Vendor(response))

          $scope.vendor = {}
          $scope.alert = true
]
