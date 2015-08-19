@managements.controller 'CreateLedgersController', [
  '$scope', 'Ledger', '$timeout'
  ($scope, Ledger, $timeout) ->
    $scope.alert = false

    $scope.select = (ledger) ->
      $scope.ledger = ledger

    $scope.new = ->
      $scope.ledger = new Ledger()

    $scope.remove = (ledger) ->
      ledger.delete()
      _.remove($scope.ledgers, ledger)

    $scope.create = ->
      if $scope.ledger.id?
        $scope.ledger.update()

      else
        new Ledger($scope.ledger).create().then (response) ->
          $scope.ledgers.push(new Ledger(response))

          $scope.ledger = {}
          $scope.alert = true
]
