@directives.factory "PlaceOfBirth", [
    "$http", 'RailsResource', 'railsResourceFactory'
    ($http, RailsResource, railsResourceFactory) ->
        PlaceOfBirth = railsResourceFactory
           url: '/admin/place_of_births'
           name: 'place_of_birth'
        PlaceOfBirth
]

@directives.controller 'CreatePlaceOfBirthModalController', [
    '$scope', 'PlaceOfBirth', '$modalInstance'
    ($scope, PlaceOfBirth, $modalInstance) ->
        $scope.create = ->
            new PlaceOfBirth($scope.place_of_birth).create().then (response) ->
                $modalInstance.close(response)

        $scope.close = ->
            $modalInstance.dismiss('cancel')
]

@directives.controller 'CreatePlaceOfBirthController', [
    '$scope', '$modal'
    ($scope, $modal) ->
        $scope.openForm = (size) ->
            instance = $modal.open
                template: """
                  <div class="modal-header">
                    <a type="button" class="close" ng-click="close()" aria-label="Close"><span aria-hidden="true">&times;</span></a>
                    <h4 class="modal-title">New Place Of Birth</h4>
                  </div>
                  <div class="modal-body">
                    <div class="form-horizontal">
                      <div class="form-group">
                        <label for="title" class="col-sm-2 control-label">Title</label>
                        <div class="col-sm-10">
                          <input type="text" name="title" id="title" ng-model="place_of_birth.title" class="form-control" required>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <a class="btn btn-default btn-sm" ng-click="create()" ng-disabled="!place_of_birth.title">OK</a>
                    <a class="btn btn-default" ng-click="close()">Cancel</a>
                  </div>
                """
                size: size
                controller: 'CreatePlaceOfBirthModalController'

            instance.result.then (object) ->
                $scope.place_of_births.push(object)
]

@directives.directive 'placeOfBirth', [
    ->
        controller = [
            '$scope', 'PlaceOfBirth'
            ($scope, PlaceOfBirth) ->
                PlaceOfBirth.get().then (response) ->
                    $scope.place_of_births = response
        ]

        compile = (element) ->

        controller: controller
        compile: compile
        restrict: 'E'
        replace: true
        scope:
            title: '@'
            ngModel: '='
        template: """
          <div class="form-group">
            <div class="col-sm-4">
              <label class="control-label">Place of Birth</label>
            </div>
            <div class="col-sm-6">
              <select ng-model='ngModel' class="form-control">
                <option ng-repeat="place in place_of_births" value="{{place.id}}">{{place.title}}</option>
              </select>
            </div>

            <div class="col-sm-2" ng-controller="CreatePlaceOfBirthController">
              <a ng-click="openForm('sm')" class="btn btn-default">
                <i class="fa fa-folder-plus"></i>
              </a>
            </div>
          </div>
        """
]
