@cash_managements.controller 'CreateSalaryController', [
  '$scope', 'SalaryReceipt', '$location', '$window', '$timeout'
  ($scope, SalaryReceipt, $location, $window, $timeout) ->
    $scope.alert = false

    render = ->
        # Before making merges between student.studentsFeesHeads and fees_heads
        # we should clean up the previous populated collection.
        $scope.employeeSalaryReceipts = []

        for f in $scope.employees
            found = _.find $scope.salary_receipt.employeeSalaryReceipts, (o) -> o.employeeId is f.id

            # We extend our resource by properties hash for storing skipped on requests
            # data. Lets say we want to use extra `enabled` flag. We added as
            # object.properties.enabled = true / false and then on getting attributes
            # we will skip `properties` for passing only required data.
            if found?
                # to make checkbox as checked
                found.isNew = -> false

                found.salary = f.salary

                found.properties = {}
                found.properties.enabled = true
                found.properties.name = f.fullName()
        
            else
                found =  {}
                found.employeeId = f.id
                found.remark = ""
                found.salary = f.salary

                # to make checkbox as unchecked because of new record.
                found.isNew = -> true

                found.properties = {}
                found.properties.enabled = false
                found.properties.name = f.fullName()

            collection = _($scope.employeeSalaryReceipts)
            unless collection.contains((o) -> o.employeeId is found.id)
                $scope.employeeSalaryReceipts.push(found)

    class NestedAttributes
        constructor: (@collection) ->
        get: ->
            # We are using @collection on rendering by ng-repeat on the form, we should
            # clone array because of possible removes later in code.
            collection = _.clone(@collection)

            for item in collection
                if item.properties.enabled then item._destroy = 0 else item._destroy = 1
                delete item.properties

            _(collection).remove (item) ->
                # in case of we have new item and we want to destroy it, lets skip it
                # on passing to the server request.
                item._destroy is 1 && item.isNew()

            collection

    build = ->
        new SalaryReceipt()

    $scope.salary_receipt = build()
    $scope.salary_receipt.employeeSalaryReceipts = []

    $scope.$watchCollection 'employees', (collection) ->
        render()

    $scope.isSomethingChecked = ->
        _($scope.employeeSalaryReceipts).any (c) -> c.properties.enabled

    $scope.create = ->
      employeeSalaryReceiptsAttributes = new NestedAttributes($scope.employeeSalaryReceipts)
      employeeSalaryReceiptsAttributes = employeeSalaryReceiptsAttributes.get()

      $scope.salary_receipt.employeeSalaryReceipts = employeeSalaryReceiptsAttributes

      new SalaryReceipt($scope.salary_receipt).create().then (response) ->
        $scope.alert = true

        $scope.salary_receipt = new SalaryReceipt()

        protocol = $location.protocol()
        host = $window.location.host
        domain = "#{protocol}://#{host}" # Example: http://example.com
        $window.open("#{domain}/admin/salary_receipts/#{response.id}/print",'_blank')

        $timeout(render)
]
