@employees.controller 'CreateSalaryController', [
  '$scope', 'Salary', '$location', '$window', '$timeout', '$http'
  ($scope, Salary, $location, $window, $timeout, $http) ->
    $scope.alert = false

    disabled_salary = (m) ->
      return unless m?

      year = $scope.salary.year || (new Date().getFullYear())
      month = parseInt(m, 10) + 1

      $http
        .get("/admin/salaries/paid_salary?&date=#{month}/#{year}")
        .success (response) ->
          $timeout ->
            for e1 in $scope.employeeSalaries
              e1.properties.disabled = false

              e2 = _.find response, (e) -> e.employee_id is e1.employeeId
              if e2?
                e1.properties.disabled = true

    $scope.$watch 'salary.month', (m) ->
      return unless m?
      disabled_salary(m)

    $scope.$watch 'salary.year', (y) ->
      return unless y?

      year = parseInt(y, 10)
      month = parseInt($scope.salary.month, 10) + 1

      $http
        .get("/admin/salaries/paid_salary?&date=#{month}/#{year}")
        .success (response) ->
          $timeout ->
            for e1 in $scope.employeeSalaries
              e1.properties.disabled = false

              e2 = _.find response, (e) -> e.employee_id is e1.employeeId
              if e2?
                e1.properties.disabled = true

    render = ->
      $scope.employeeSalaries = []

      for f in $scope.employees
        found = _.find $scope.salary.employeeSalaries, (o) -> o.employeeId is f.id

        if found?
          # to make checkbox as checked
          found.isNew = -> false

          found.salaryRate = f.salaryRate

          found.properties = {}
          found.properties.enabled = true
          found.properties.disabled = false
          found.properties.name = f.fullName()

        else
          found =  {}
          found.employeeId = f.id
          found.remark = ""
          found.salaryRate = f.salaryRate

          # to make checkbox as unchecked because of new record.
          found.isNew = -> true

          found.properties = {}
          found.properties.enabled = false
          found.properties.disabled = false
          found.properties.name = f.fullName()

        collection = _($scope.employeeSalaries)
        unless collection.contains((o) -> o.employeeId is found.id)
          $scope.employeeSalaries.push(found)

    class NestedAttributes
      constructor: (@collection) ->
      get: ->
        collection = _.clone(@collection)

        for item in collection
          if item.properties.enabled then item._destroy = 0 else item._destroy = 1
          delete item.properties

        _(collection).remove (item) ->
          item._destroy is 1 && item.isNew()

        collection

    build = ->
        new Salary()

    $scope.salary = build()
    $scope.salary.employeeSalaries = []

    $scope.$watchCollection 'employees', (collection) ->
      render()

    $scope.isSomethingChecked = ->
      _($scope.employeeSalaries).any (c) -> c.properties?.enabled

    $scope.create = ->
      $scope.salary.month = parseInt($scope.salary.month, 10) + 1
      employeeSalariesAttributes = new NestedAttributes($scope.employeeSalaries)
      employeeSalariesAttributes = employeeSalariesAttributes.get()

      $scope.salary.employeeSalaries = employeeSalariesAttributes

      new Salary($scope.salary).create().then (response) ->
        $scope.alert = true

        $scope.salary = new Salary()

        protocol = $location.protocol()
        host = $window.location.host
        domain = "#{protocol}://#{host}" # Example: http://example.com
        $window.open("#{domain}/admin/salaries/#{response.id}/print",'_blank')

        $timeout(render)
]
