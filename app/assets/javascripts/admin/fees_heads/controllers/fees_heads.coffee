@fees_heads.controller 'FeesHeadsController', [
  '$scope', '$state', 'FeesHead', 'Student', 'Division', 'Standard', 'Receipt', 'FinanceMode', 'FeesHeadType', 'FeesHeadRecurrence'
  ($scope, $state, FeesHead, Student, Division, Standard, Receipt, FinanceMode, FeesHeadType, FeesHeadRecurrence) ->
    $state.go('fees_heads.head')

    Student.get().then (students) ->
      $scope.students = students

    Division.get().then (divisions) ->
      $scope.divisions = divisions

    Standard.get().then (standards) ->
      $scope.standards = standards

    FeesHead.get().then (fees_heads) ->
      $scope.fees_heads = fees_heads

    FinanceMode.get().then (finance_modes) ->
      $scope.finance_modes = finance_modes

    FeesHeadType.get().then (fees_head_types) ->
      $scope.fees_head_types = fees_head_types

    FeesHeadRecurrence.get().then (fees_head_recurrences) ->
      $scope.fees_head_recurrences = fees_head_recurrences
]
