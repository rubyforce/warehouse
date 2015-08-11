@students.filter 'offset', ->
  (input, start) ->
    start = parseInt(start, 10)
    input.slice start
