@invoice_managements.controller 'CreateInvoicesController', [
  '$scope', 'Invoice'
  ($scope, Invoice) ->
    $scope.alert = false

    build = ->
      new Invoice(date: $.datepicker.formatDate("dd/mm/yy", new Date()))

    $scope.invoice = build()

    $scope.create = ->
      new Invoice($scope.invoice).create().then (response) ->
        $scope.invoices.push(new Invoice(response))

        $scope.invoice = build()
        $scope.alert = true
]
