# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$(document).ready ->
	$("#alltime").hide()
	$("#daily").hide()
	$("#weekly").hide()
	$("#monthly").hide()
	$("#type_limit_id").change ->
		if $(this).val() == "4"
			$("#alltime").show()
		else
		    $("#alltime").hide()
		if $(this).val() == "1" 
			$("#daily").show()
		else
			$("#daily").hide()	
		if $(this).val() == "2" 
			$("#weekly").show()
		else
			$("#weekly").hide()		
		if $(this).val() == "3" 
			$("#monthly").show()
		else
			$("#monthly").hide()	


