@meals.controller 'CreateMealsController', [
  '$scope', 'Meal', 'MealsSharedObjects', '$modal'
  ($scope, Meal, MealsSharedObjects, $modal) ->

    $scope.openForm = (size) ->
      MealsSharedObjects.modalWindow = $modal.open(
        templateUrl: 'admin/meals/views/meals/modal.html'
        size: size
        controller: 'CreateMealsController')

      MealsSharedObjects.modalWindow.result.then (meal) ->
        $scope.meals.push(meal)

    $scope.create = ->
      new Meal($scope.meal).create().then (response) ->
        MealsSharedObjects.modalWindow.close(response)

    $scope.close = ->
      MealsSharedObjects.modalWindow.dismiss 'cancel'
]
