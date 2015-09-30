@invoice_managements.controller 'CreateInvoicesController', [
  '$scope', 'Invoice', '$timeout'
  ($scope, Invoice, $timeout) ->
    $scope.alert = false

    build = ->
      new Invoice(date: $.datepicker.formatDate("dd/mm/yy", new Date()))

    $scope.invoice = build()

    makeTableSelectable = ->
      $timeout ->
        table = $('table')
        table.tableselect
          multiple: true
          activeClass: 'warning'
          onSelectionChanged: (element) ->
            return unless element?
            property = $scope.stock_outwards[element.data('index')]
            $scope.$apply ->
              select(property)

    $scope.$watch 'stock_outwards', makeTableSelectable

    select = (property)->
      property = property


    $scope.create = ->
      new Invoice($scope.invoice).create().then (response) ->
        $scope.invoices.push(new Invoice(response))

        $scope.invoice = build()
        $scope.alert = true
]
