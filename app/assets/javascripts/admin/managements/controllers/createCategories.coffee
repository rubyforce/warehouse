@managements.controller 'CreateCategoriesController', [
  '$scope', 'Category', '$timeout'
  ($scope, Category, $timeout) ->
    $scope.alert = false

    $scope.category = new Category()

    $scope.select = (category) ->
      $scope.category = category

    $scope.new = ->
      $scope.category = new Category()

    $scope.remove = (category) ->
      category.delete()
      _.remove($scope.categories, category)

    $scope.create = ->
      if $scope.category.id?
        $scope.category.update().then (response) ->
          $scope.alert = true
          $scope.category = response
      else
        $scope.category.create().then (response) ->
          $scope.categories.push(new Category(response))

          $scope.alert = true
          $scope.category = {}
          $scope.category = response
]
