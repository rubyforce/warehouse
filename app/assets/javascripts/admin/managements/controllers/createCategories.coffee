@managements.controller 'CreateCategoriesController', [
  '$scope', 'Category', '$timeout'
  ($scope, Category, $timeout) ->
    $scope.alert = false

    $scope.select = (category) ->
      $scope.category = category

    $scope.new = ->
      $scope.category = new Category()

    $scope.remove = (category) ->
      category.delete()
      _.remove($scope.categories, category)

    $scope.create = ->
      if $scope.category.id?
        $scope.category.update()

      else
        new Category($scope.category).create().then (response) ->
          $scope.categories.push(new Category(response))
          $scope.category = {}
          $scope.alert = true
]
