class HN.Views.Page extends Backbone.View
	className: "page"

	initialize: () ->
		#@render()
	
	show: () ->
		$('.page').css({"position": "absolute"})
		forge.topbar.removeButtons()
		forge.topbar.addButton(
				text: "Refresh"
				position: "right"
				, () =>
					if @collection?
						@collection.fetch()
					else
						@model.fetch()
				)
		
		console.log @options.back
		if @options.back
			forge.topbar.addButton(
				text: "Back"
				type: "back"
				position: "left"
				, () ->
					HN.router.navigate("/" , true);
				)
			forge.tabbar.hide()
		else
			
			forge.tabbar.show()


		if $('.page').length
			$old = $('.page').not(@.el)

			$old.get(0).style["margin-left"] = ""
			$old.get(0).style["-webkit-transform"] = ""

			@.$el.appendTo('body').hide()
			@.$el.show()
			$old.remove()
			$('.page').css({"position": "static"})
		else
			@.$el.appendTo('body').hide()
			@.$el.show()


		window.scrollTo(0, 0)
	
