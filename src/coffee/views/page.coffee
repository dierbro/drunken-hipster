class HN.Views.Page extends Backbone.View
	className: "page"

	initialize: () ->
		@render()
	
	show: () ->
		$('.page').css({"position": "absolute"})
		direction_coefficient = @.options.back? 1 : -1
		if @.options.back?
			forge.topbar.addButton(
				text: "News"
				position: "left"
				, () ->
					HN.router.navigate("/" , true);
				)
		if $('.page').length
			$old = $('.page').not(@.el)

			$old.get(0).style["margin-left"] = ""
			$old.get(0).style["-webkit-transform"] = ""

			@.$el.appendTo('body').hide()
			@.$el.show() #.css({"margin-left": 320 * direction_coefficient})
			#@.$el.anim({translate3d: -320 * direction_coefficient +'px,0,0'}, 0.3, 'linear')
			#$old.anim({translate3d: -320 * direction_coefficient + 'px,0,0'}, 0.3, 'linear', () ->
			$old.remove()
			$('.page').css({"position": "static"})
			#)
		else
			@.$el.appendTo('body').hide()
			@.$el.show()
		
		
		window.scrollTo(0, 0)
	
