# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/




$(document).ready ->
  $("#challenge_trigger_timeframe_value").hide()
  $("#challenge_goal_timeframe_value").hide()
  $("#type_limit_id").change ->
	  if $(this).val() == "14"
	  	$("#challenge_trigger_timeframe_value").show()
	  else
	    $("#challenge_trigger_timeframe_value").hide()
  $("#type_limit_goal_id").change ->
	  if $(this).val() == "14"
	  	$("#challenge_goal_timeframe_value").show()
	  else
	    $("#challenge_goal_timeframe_value").hide()
  