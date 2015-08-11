@fees_heads.controller 'ChequeBouncedController', [
  '$scope', 'Receipt'
  ($scope, Receipt) ->

    $scope.alert = false

    reset = ->
      $scope.cheque_remark = ''
      $scope.cheque_number = ''

    $scope.cheque = ->
      Receipt.query(cheque_number: $scope.cheque_number).then (response) ->
        $scope.receipt = response[0]

        if $scope.receipt
          $scope.receipt = new Receipt(id:  $scope.receipt.id)
          $scope.receipt.cheque_status = "bounced"
          $scope.receipt.cheque_remark = $scope.cheque_remark
          $scope.receipt.update()
          reset()

        else 
          $scope.alert = true
]
