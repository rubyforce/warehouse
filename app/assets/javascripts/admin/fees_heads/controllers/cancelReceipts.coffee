@fees_heads.controller 'CancelReceiptsController', [
  '$scope', 'Receipt'
  ($scope, Receipt) ->

    $scope.alert = false

    $scope.clicked = false

    reset = ->
      $scope.remark = ''
      $scope.number = ''


    $scope.find = ->
      Receipt.query(number: $scope.number).then (response) ->
        $scope.receipt = response[0]

        if $scope.receipt
          $scope.clicked = true
        else
          $scope.alert = true

    $scope.cancel = ->
      if $scope.receipt
        $scope.receipt = new Receipt(id:  $scope.receipt.id)
        $scope.receipt.status = "canceled"
        $scope.receipt.remark = $scope.remark
        $scope.receipt.update()
        reset()
]
