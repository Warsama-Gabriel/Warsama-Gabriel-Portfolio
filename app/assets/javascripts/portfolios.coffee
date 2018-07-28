# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# call the sortable function and return it.
ready = ->
	$('.sortable').sortable()
	return

#pass in the ready function when the DOM loads.
$(document).ready ready