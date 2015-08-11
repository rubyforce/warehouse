@fees_heads.controller 'CreateStudentFeesController', [
    '$scope', 'Student', '$timeout'
    ($scope, Student, $timeout) ->
        $scope.alert = false

        $scope.student = new Student()
        $scope.student.studentsFeesHeads = []

        # Lets use separate collection to store fees heads, it will help us to control
        # items in ng-repeat.
        $scope.studentsFeesHeads = []

        # Lets watch on change $scope.student to merge fees_heads with existing
        # student.studentsFeesHeads by feesHeadId id because of uniqueness.
        $scope.$watch 'student', (time) ->
            return unless time?
            render()

        render = ->
            # Before making merges between student.studentsFeesHeads and fees_heads
            # we should clean up the previous populated collection.
            $scope.studentsFeesHeads = []

            for f in $scope.fees_heads
                found = _.find $scope.student.studentsFeesHeads, (o) -> o.feesHeadId is f.id

                # We extend our resource by properties hash for storing skipped on requests
                # data. Lets say we want to use extra `enabled` flag. We added as
                # object.properties.enabled = true / false and then on getting attributes
                # we will skip `properties` for passing only required data.
                if found?
                    # to make checkbox as checked
                    found.isNew = -> false

                    found.properties = {}
                    found.properties.enabled = true
                    found.properties.name = f.name
                    found.properties.amount = f.amount
                else
                    found =  {}
                    found.feesHeadId = f.id
                    found.studentId = $scope.student.id

                    # to make checkbox as unchecked because of new record.
                    found.isNew = -> true

                    found.properties = {}
                    found.properties.enabled = false
                    found.properties.name = f.name
                    found.properties.amount = f.amount

                collection = _($scope.studentsFeesHeads)
                unless collection.contains((o) -> o.feesHeadId is found.id)
                    $scope.studentsFeesHeads.push(found)

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

        $scope.create = ->
            return false if _.isUndefined($scope.student.id)

            # Lets rebuild nested attributes before passing it to our endpoint.
            # It should contains only required params like:
            # - fees_head_id: integer
            # - student_id: integer
            # - concession: decimal
            # - id: integer (isNew => false)
            # - _destroy: integer/boolean(1,0) for existing records.
            studentsFeesHeadsAttributes = new NestedAttributes($scope.studentsFeesHeads)
            studentsFeesHeadsAttributes = studentsFeesHeadsAttributes.get()

            # Reassign and pass to server updated or added new items
            $scope.student.studentsFeesHeads = studentsFeesHeadsAttributes
            $scope.student.update().then (response) ->
                $scope.alert = true
                $scope.student.studentsFeesHeads = response.studentsFeesHeads
                $timeout(render)

]
