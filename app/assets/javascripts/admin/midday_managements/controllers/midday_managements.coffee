@midday_managements.controller 'MiddayManagementsController', [
    '$scope', '$state', 'Meal'
    ($scope, $state, Meal) ->
        $state.go('midday_managements.daily_meal')

        Meal.get().then (meals) ->
            $scope.meals = meals
]
