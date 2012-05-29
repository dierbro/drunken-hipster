class HN.Views.Comment extends Backbone.View
	template: _.template($('#discussion-comment').html())
	template_menu: _.template($('#discussion-comment-menu').html())
	events:
		'longTap': "toggle_menu"

	render: () ->
		@.$el.append(@.template_menu(@.model.toJSON()))
		@.$el.append(@.template(@.model.toJSON()))
		@.$el.find("ul.menu").hide()
		return @

	open: () ->
		HN.router.navigate("post/" + @model.id, true);

	toggle_menu: ->
		@.$el.find("ul.menu").toggle()	    