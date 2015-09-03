@grievances.controller 'CreateGrievancesController', [
  '$scope', 'Grievance', '$timeout', '$http', 'Reason'
  ($scope, Grievance, $timeout, $http, Reason) ->

    $http.get("admin/grievances/grievance_id")
      .success (response) ->
        debugger
        $timeout ->
          if response == null
            $scope.grievance.voucherNo = "00001"
          else
            sum = response.id + 1
            $scope.number = numeral(sum/10000).format('0.0000').replace(/\./,'')
            $scope.grievance.voucherNo = $scope.number


    $scope.things = []
    $scope.reason = {}

    $scope.reason =
      reason: "Return"

    $scope.alert = false

    build = ->
      new Grievance({
        date: $.datepicker.formatDate("dd/mm/yy", new Date()),
        voucherNo: $scope.number
      })

    $scope.grievance = build()

    $scope.add = ->
      item = _($scope.items).chain().find((i)-> parseInt(i.id, 10) is parseInt($scope.reason.item_id, 10)).value()
      $scope.reason.itemName = item.name
      $scope.reason.itemId = item.id

      $scope.reason = _($scope.reason).pick(['itemName', 'qty', 'numeral', 'reason', 'itemId', 'id']).value()

      $scope.things.push($scope.reason)

      for i in [1..$scope.things.length]
        $scope.reason.numeral = i

      # Reset reason on the page to make sure we have the old selected
      # value

      $scope.reason =
        reason: "Return"

    $scope.reset = ->
      $scope.things = []
      $scope.grievance = build()
      $scope.reason =
        reason: "Return" 

    $scope.create = ->
      # TODO: place here nested attributes usage like in school daily meals.
      #
      $scope.grievance.reasonsAttributes = $scope.things
      $scope.grievance.create().then (response) ->
        sum = response.id + 1
        $scope.number = numeral(sum/10000).format('0.0000').replace(/\./,'')
        $scope.grievance.voucherNo = $scope.number
        $scope.alert = true
        $scope.reset()


]
