# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/




$(document).ready ->
  clicked = false
  $("#badge_value").hide()
  $("#timeframe_section").hide() 	
  $("input[type=checkbox]").each ->
    $(this).bind "click", ->
      if clicked == false
      	$("#timeframe_section").show()
      	clicked = true
      else
      	$("#timeframe_section").hide()
      	clicked = false

	  $("#type_limit_id").change ->
		  if $(this).val() == "14"
		  	$("#badge_value").show()
		  else
		    $("#badge_value").hide()
  

   