# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# call the sortable function and return it.

ready = undefined
set_positions = undefined

# get the position of all the cards from the 'data-pos' attribute in an array.
set_positions = ->
  $('.card').each (i) ->
    $(this).attr 'data-pos', i + 1
    return
  return

# bind the sortupdate function
# push the values in the updated array with id:, and position: 
# make an ajax call to the route and send the array.

ready = ->
  set_positions()
  $('.sortable').sortable()
  $('.sortable').sortable().bind 'sortupdate', (e, ui) ->
    updated_order = []
    set_positions()
    $('.card').each (i) ->
      updated_order.push
        id: $(this).data('id')
        position: i + 1
      return
    $.ajax
      type: 'PUT'
      url: '/portfolios/sort'
      data: order: updated_order
    return
  return

$(document).ready ready