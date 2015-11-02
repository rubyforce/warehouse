@directives.directive 'quantityValidator', [
  '$compile'
  ($compile) ->
    {
      restrict: 'A'
      require: 'ngModel'
      link: ($scope, $element, attributes, $formController) ->
        errorTemplate = $compile('<div class="alert bg-danger" role="danger" ng-show=\'isInvalid\'>Quantity could not be high than allowed number. Item quantity is {{ minQuantity }}</div>')($scope)
        angular.element('.messages').append errorTemplate

        isValid = ->
          if !$scope.stock_outward_item.qty
            return
          if !$scope.stock_outward_item.item_id
            return

          $scope.minQuantity = _($scope.items).chain().find((i)-> parseInt(i.id, 10) is parseInt($scope.stock_outward_item.item_id, 10)).value().minQty

          minQty = parseInt($scope.minQuantity, 10)
          qty = parseInt($scope.stock_outward_item.qty, 10)

          $scope.isInvalid = qty > minQty
          $formController.$setValidity 'stock_outward_item.qty ', !$scope.isInvalid
          return

        $scope.$watch 'stock_outward_item.qty ', isValid
        $scope.$watch 'stock_outward_item.item_id', isValid
        return
    }
]
