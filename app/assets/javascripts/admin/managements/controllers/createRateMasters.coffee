@managements.controller 'CreateRateMastersController', [
  '$scope', 'Item', '$timeout', '$http'
  ($scope, Item, $timeout, $http) ->
    $scope.alert = false

    makeTableSelectable = ->
      $timeout ->
        table = $('table')
        table.tableselect
          multiple: true
          activeClass: 'warning'
          onSelectionChanged: (element) ->
            return unless element?

            # rerender using angular digest loop
            $scope.$apply ->
              $scope.selectedItem = $scope.filteredItems[element.data('index')]

    $scope.$watch 'search.companyId', ->
      $timeout ->
        $scope.filteredItems = if $scope.search?.companyId?
          # we should reset selected item because of new collection in the table
          $scope.selectedItem = null

          # now we should filter items by companyId to show it in the table
          _($scope.items).chain()
            .filter((i)-> parseInt(i.companyId, 10) is parseInt($scope.search.companyId, 10))
            .value()
        else
          # in case of no filter we should show all the items
          $scope.items

    $scope.$watch 'filteredItems', makeTableSelectable

    getItems = ->
      # in case if something was selected in the table lets use it to update or reset
      if $scope.selectedItem?
        [$scope.selectedItem]
      else
        # otherwise we should use all filtered by companyId or all items to update or reset
        $scope.filteredItems

    $scope.reset = ->
      for item in getItems()
        # we should use do (item) -> because of asyncrhonize callback in .success
        # when it finished closure function could have different item variable inside success
        # function as result we should store in the context of the new funtion.
        # JavaScript Example:
        #
        # Bad:
        # for(var i = 0 ; i < 5 ; i++) {
        #   var item = items[i];
        #   doAsync().success(function() {
        #     item.value = 'new value'; // <=== wrong usage and could cause an issue.
        #   })
        # }
        #
        # Good:
        # for(var i = 0 ; i < 5 ; i++) {
        #   var item = items[i];
        #   (function(i) { // stored item as i variable in context of anomyous function.
        #      doAsync().success(function() {
        #        i.value = 'new value'; // <=== wrong usage and could cause an issue.
        #      })
        #   })(item);
        # }
        do (item) ->
          $http
          .post("/admin/items/#{item.id}/reset")
          .success (response) ->
            $timeout ->
              item.rate = response.rate

    $scope.create = ->
      for item in getItems()
        new Item(item).update()
      $scope.alert = true
]
