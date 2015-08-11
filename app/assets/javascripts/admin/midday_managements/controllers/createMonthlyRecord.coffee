@midday_managements.controller 'CreateMonthlyRecordsController', [
  '$scope', 'MonthlyRecord', '$http', '$timeout'
  ($scope, MonthlyRecord, $http, $timeout) ->
    $scope.alert = false

    $scope.foods = []
    $scope.months = {}
    $scope.monthly_record = {}

    class Month
      constructor: (response) ->
        response = response.data || {}

        @no_of_student1 = 0
        @no_of_student2 = 0
        @no_of_student3 = 0
        @no_of_student4 = 0
        @no_of_student5 = 0

        d_meals = {}

        for d in response.daily_meals
          @no_of_student1 += _.sum(d.daily_meal_meals, 'no_of_student1')
          @no_of_student2 += _.sum(d.daily_meal_meals, 'no_of_student2')
          @no_of_student3 += _.sum(d.daily_meal_meals, 'no_of_student3')
          @no_of_student4 += _.sum(d.daily_meal_meals, 'no_of_student4')
          @no_of_student5 += _.sum(d.daily_meal_meals, 'no_of_student5')

          for m in d.daily_meal_meals
            d_meals[m.meal_id] ?= []
            d_meals[m.meal_id].push(m)

        @meals = {}
        for meal in response.monthly_record?.monthly_meal_meals || []
          m = _.clone(meal)
          @meals[m.meal_id.toString()] = m
          m.last_received = meal.received
          m.used = _.sum(d_meals[m.meal_id], (m1) -> m1.qty)
          m.left = m.last_received - m.used
        @foods = response.monthly_record_month?.monthly_meal_meals || []

    $scope.$watch 'monthly_record.month', (month) ->
      return unless month?

      $http.get("/admin/monthly_records/month?month=#{parseInt(month, 10) + 1}").then (response) ->
        $timeout ->
          m = new Month(response)
          $scope.months[month] = m
          $scope.foods = m.foods

    $scope.add = ->
      meal = _($scope.meals).chain().find((m)-> parseInt(m.id, 10) is parseInt($scope.meal.meal_id, 10)).value()
      $scope.meal.title = meal.title
      $scope.foods.push(_.clone($scope.meal))

    $scope.create = ->
      $scope.monthly_record.month = parseInt($scope.monthly_record.month, 10) + 1
      $scope.monthly_record.monthlyMealMealsAttributes = $scope.foods

      new MonthlyRecord($scope.monthly_record).create().then (response) ->
        $scope.alert = true
        $scope.reset()

    $scope.reset = ->
      $scope.monthly_record = {}
      $scope.meal = {}
      $scope.foods = []
]
