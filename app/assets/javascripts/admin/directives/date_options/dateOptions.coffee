@directives.directive 'dateOptions', [
  '$compile'
  ($compile) ->
    restrict: 'A'
    require: 'ngModel'
    link: (scope, element, attributes, ngModel) ->
      element.attr('ui-date', 'dateOptions')
      element.attr('ui-date-format', "dd/mm/yy")
      element.removeAttr('date-options')

      scope.dateOptions =
        changeMonth: true
        changeYear: true
        yearRange: "1950:-0"
        dateFormat: "dd/mm/yy"

      $compile(element)(scope);
]
