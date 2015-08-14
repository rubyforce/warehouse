@directives.directive 'years', [
  ->
    link = (scope) ->
      scope.years = (i for i in [1990..2030])

    link: link
    restrict: 'E'
    require: '^ngModel'
    replace: true
    scope:
      title: '@'
      ngModel: '='
    template: """
      <div class="form-group">
        <div class="col-sm-4">
          <label class="control-label">{{ title }}</label>
        </div>
        <div class="col-sm-6">
          <select ng-model='ngModel' class="form-control">
            <option ng-repeat="year in years">{{year}}</option>
          </select>
        </div>
      </div>
    """
]
