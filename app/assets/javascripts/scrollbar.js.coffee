$ ->
	nearBottomOfPage = ->
		$('.thumb:first').position().top + $('.thumb:first').height() > 10

	nearBottomOfPage = ->
		console.log('bottom')
		$('.thumb:first').position().top < 10

	updateRecords = ->
		oEvent = window.event
		console.log('scrolling')
		return if loading

		if nearBottomOfPage and oEvent.wheelDelta < 0
			console.log('Bottom')
			console.log $(".thumb:first").position().top + $(".thumb:first").height()
			loading = true
			page++
			$.ajax
				url: "/" + urlname + "?remote=true&page" + page
				type: "get"
				dataType: "script"
				success: ->
					$("scrollcontent").sausage "draw"

		else if nearTopOfPage
			console.log('Top')


	$('#scrollcontent')[0].addEventListener 'DOMMouseScroll', updateRecords, false
	$('#scrollcontent')[0].addEventListener 'mousewheel', updateRecords, false
	$('#scrollcontent')[0].addEventListener 'DOMContentLoaded', updateRecords, false

	$('#scrollcontent').sausage()