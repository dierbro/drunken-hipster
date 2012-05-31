class HN.Views.Comment extends Backbone.View
	template: _.template($('#discussion-comment').html())
	template_menu: _.template($('#discussion-comment-menu').html())
	events:
		'longTap': "toggle_menu"
		'click li.user': 'show_user'

	render: () ->
		@.$el.append(@.template_menu(@.model.toJSON()))
		@.$el.append(@.template(@.model.toJSON()))
		@.$el.find("ul.menu").hide()
		return @

	toggle_menu: ->
		@.$el.find("ul.menu").toggle()	    

	show_user: ->
		console.log("user ->"+ @model.get("user"))
		HN.router.navigate("user/" + @model.get("user"), true);		