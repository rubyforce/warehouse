@requisitions.controller 'CreateRequisitionsController', [
  '$scope', '$http', 'Requisition', '$timeout', '$location', '$window'
  ($scope, $http, Requisition, $timeout, $location, $window) ->

    $http.get("admin/requisitions/requisition_id")
      .success (response) ->
        $timeout ->
          if response == null
            $scope.requisition.requisitionNo = "00001"
          else
            sum = response.id + 1
            $scope.number = numeral(sum/10000).format('0.0000').replace(/\./,'')
            $scope.requisition.requisitionNo = $scope.number

    $scope.things = []
    $scope.requisition_item = {}
    $scope.alert = false

    build = ->
      new Requisition({
        date: $.datepicker.formatDate("dd/mm/yy", new Date()),
        requisitionNo: $scope.number
      })

    $scope.requisition = build()

    $scope.add = ->
      item = _($scope.items).chain().find((i)-> parseInt(i.id, 10) is parseInt($scope.requisition_item.item_id, 10)).value()
      $scope.requisition_item.itemName = item.name
      $scope.requisition_item.itemId = item.id
      company = _($scope.companies).chain().find((c) -> parseInt(c.id, 10) is parseInt($scope.requisition_item.company_id, 10)).value()
      $scope.requisition_item.companyName = company.name
      $scope.requisition_item.companyId = company.id
      warehouse = _($scope.warehouses).chain().find((c) -> parseInt(c.id, 10) is parseInt($scope.requisition_item.company_id, 10)).value()
      $scope.requisition_item.warehouseName = warehouse.name
      $scope.requisition_item.warehouseId = warehouse.id

      $scope.requisition_item = _($scope.requisition_item).pick(['itemName', 'itemId', 'companyName', 'companyId', 'warehouseName', 'warehouseId', 'qty', 'numeral', 'id']).value()

      $scope.things.push($scope.requisition_item)


      for i in [1..$scope.things.length]
        $scope.requisition_item.numeral = i

      last_requisition_item = _.last($scope.things)
      $scope.requisition_item = {}
      $scope.requisition_item.company_id = last_requisition_item.companyId
      $scope.requisition_item.warehouse_id = last_requisition_item.warehouseId

      $timeout ->
        angular.element('[ng-model="requisition_item.company_id"]').val($scope.requisition_item.company_id)
        angular.element('[ng-model="requisition_item.warehouse_id"]').val($scope.requisition_item.warehouse_id)

    $scope.reset = ->
      $scope.things = []
      $scope.requisition = build()
      $scope.requisition_item = {}

    $scope.create = ->
      # TODO: place here nested attributes usage like in school daily meals.
      #
      $scope.requisition.requisition_itemsAttributes = $scope.things
      $scope.requisition.create().then (response) ->
        protocol = $location.protocol()
        host = $window.location.host
        domain = "#{protocol}://#{host}" # Example: http://example.com
        $window.open("#{domain}/admin/requisitions/#{response.id}/print",'_blank')

        sum = response.id + 1
        $scope.number = numeral(sum/10000).format('0.0000').replace(/\./,'')
        $scope.requisition.requisitionNo = $scope.number
        $scope.alert = true
        $scope.reset()

]
