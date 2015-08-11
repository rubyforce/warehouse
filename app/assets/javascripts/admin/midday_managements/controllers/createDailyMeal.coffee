@midday_managements.controller 'CreateDailyMealsController', [
  '$scope', 'DailyMeal', 'Meal'
  ($scope, DailyMeal, Meal) ->
    $scope.dateOptions =
      changeMonth: true
      changeYear: true
      yearRange: "1950:-0"

    $scope.alert = false

    build = -> new DailyMeal(date: new Date())

    $scope.meal = {}
    $scope.foods = []
    $scope.daily_meal = build()

    $scope.$watch 'meal.meal_id', (id) ->
      return unless id?

      meal = _($scope.meals).chain().find((m)-> parseInt(m.id, 10) is parseInt($scope.meal.meal_id, 10)).value()
      $scope.meal.qty = meal.qty

    $scope.add = ->
      meal = _($scope.meals).chain().find((m)-> parseInt(m.id, 10) is parseInt($scope.meal.meal_id, 10)).value()
      meal.qty = $scope.meal.qty

      meal = new Meal(meal)
      meal.update()

      $scope.meal.title = meal.title
      $scope.meal.total_number = parseInt($scope.meal.no_of_student1, 10) +
        parseInt($scope.meal.no_of_student2, 10) +
        parseInt($scope.meal.no_of_student3, 10) +
        parseInt($scope.meal.no_of_student4, 10) +
        parseInt($scope.meal.no_of_student5, 10)
      $scope.meal.qty = $scope.meal.total_number * meal.qty

      $scope.foods.push(_.clone($scope.meal))

      $scope.meal = _($scope.meal).pick(['no_of_student1', 'no_of_student2', 'no_of_student3', 'no_of_student4', 'no_of_student5']).value()

    $scope.reset = ->
      $scope.daily_meal = build()
      $scope.meal = {}
      $scope.foods = []

    $scope.create = ->
      $scope.daily_meal.dailyMealMealsAttributes = $scope.foods
      $scope.daily_meal.create().then (response) ->
        $scope.alert = true
        $scope.reset()
]
