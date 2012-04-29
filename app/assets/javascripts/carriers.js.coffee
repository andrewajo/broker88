jQuery ->
	$('#scrollcontent').tinyscrollbar()
	$('a.pjax').pjax('[data-pjax-container]', timeout: 2000)
		 

	$('tr').click ->
		$.pjax
			container: '[data-pjax-container]'
			timeout: 2000
			url: $(this).data('url')

		$('tr.active-row').removeClass('active-row')
		$(this).addClass('active-row')