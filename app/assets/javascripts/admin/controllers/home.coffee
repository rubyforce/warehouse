@admin.controller 'HomeController', [
    '$scope', '$http'
    ($scope, $http) ->

      $http.get('/admin/dashboards').success( (response) ->
        $scope.dashboard = response 
      )
]
