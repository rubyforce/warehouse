@managements.controller 'CreateCompaniesController', [
  '$scope', 'Company', '$timeout'
  ($scope, Company, $timeout) ->
    $scope.alert = false

    $scope.company = new Company()

    $scope.select = (company) ->
      $scope.company = company

    $scope.new = ->
      $scope.company = new Company()

    $scope.remove = (company) ->
      company.delete()
      _.remove($scope.companies, company)

    $scope.create = ->
      if $scope.company.id?
        $scope.company.update().then (response) ->
          $scope.alert = true
          $scope.company = response
      else
        $scope.company.create().then (response) ->
          $scope.companies.push(new Company(response))

          $scope.alert = true
          $scope.company = {}
          $scope.company = response
]
