# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/




$(document).ready ->
  $("#badge_badge_value").hide()	
  $("#type_limit_id").change ->
		  if $(this).val() == "4"
		  	$("#badge_badge_value").show()
		  else
		    $("#badge_badge_value").hide()
  

   