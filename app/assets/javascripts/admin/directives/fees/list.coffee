@directives.directive 'feesList', [
    ->
      controller = [
        '$scope', '$timeout'
        ($scope, $timeout) ->
          $scope.bySelectorFees = (receipt_fees_head) ->
            return unless $scope.search?.standardId?
            fees_head = _.find($scope.fees_heads, (s2) -> s2.id is receipt_fees_head.feesHeadId)

            for s in fees_head.feesHeadsStandards
              return true if s.standardId is parseInt($scope.search.standardId, 10)
          false
      ]

      restrict: 'E'
      controller: controller
      replace: true
      templateUrl: "admin/directives/fees/views/template.html"
]
