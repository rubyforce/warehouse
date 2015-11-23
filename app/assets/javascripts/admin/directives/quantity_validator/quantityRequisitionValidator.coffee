@directives.directive 'quantityRequisitionValidator', [
  '$compile'
  ($compile) ->
    {
      restrict: 'A'
      require: 'ngModel'
      link: ($scope, $element, attributes, $formController) ->
        errorTemplate = $compile('<div class="alert bg-danger" role="danger" ng-show=\'isInvalid\'>Not enough stock. Only {{ minQuantity }} available.</div>')($scope)
        angular.element('.messages').append errorTemplate

        isValid = ->
          if !$scope.requisition_item.qty
            return
          if !$scope.requisition_item.item_id
            return

          $scope.minQuantity = _($scope.items).chain().find((i)-> parseInt(i.id, 10) is parseInt($scope.requisition_item.item_id, 10)).value().minQty

          minQty = parseInt($scope.minQuantity, 10)
          qty = parseInt($scope.requisition_item.qty, 10)

          $scope.isInvalid = qty > minQty
          $formController.$setValidity 'requisition_item.qty ', !$scope.isInvalid
          return

        $scope.$watch 'requisition_item.qty', isValid
        $scope.$watch 'requisition_item.item_id', isValid
        return
    }
]
