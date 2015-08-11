@directives.directive 'feesFilter', [
    ->
      controller = [
        '$scope', '$timeout'
        ($scope, $timeout) ->
          $scope.bySelectorFees = (students_fees_heads) ->
            return unless $scope.search?.standardId?
            fees_head = _.find($scope.fees_heads, (s2) -> s2.id is students_fees_heads.feesHeadId)

            for s in fees_head.feesHeadsStandards
              return true if s.standardId is parseInt($scope.search.standardId, 10)
          false
      ]

      restrict: 'E'
      controller: controller
      replace: true
      templateUrl: "admin/directives/fees/views/form.html"
]
