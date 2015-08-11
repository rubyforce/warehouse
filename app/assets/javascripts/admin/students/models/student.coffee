@students.factory "Student", [
    "$http", 'RailsResource', 'railsResourceFactory', 'railsSerializer'
    ($http, RailsResource, railsResourceFactory, railsSerializer) ->
        Student = railsResourceFactory
           url: '/admin/students'
           name: 'student'
           serializer: railsSerializer ->
               @nestedAttribute('studentsFeesHeads')

        Student.prototype.fullName = ->
            _([@firstName, @lastName]).compact().value().join(" ")

        Student.prototype.className = (collection) ->
            item = _.find(collection, (item) => item.id is @standardId)
            return unless item?
            item.name

        Student.prototype.divisionName = (collection) ->
            item = _.find(collection, (item) => item.id is @divisionId)
            return unless item?
            item.name

        Student.prototype.financeName = (collection) ->
            item = _.find(collection, (item) => item.id is @financeModeId)
            return unless item?
            item.name

        Student
]
