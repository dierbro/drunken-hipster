class HN.Views.PostRow extends Backbone.View
	className: "post-row"
	template: _.template($('#post-row').html())
	template_commands: _.template($('#post-row-commands').html())
	events: 
		"click div.post": "open"
		'longTap': "toggle_menu"
		'click li.user': 'show_user'

	render: () ->
		@.$el.append(@.template(@.model.toJSON()))
		@.$el.append(@.template_commands(@.model.toJSON()))
		@.$el.find("ul.menu").hide()		
		return @

	open: () ->
		if @model.id
			HN.router.navigate("post/" + @model.id, true)
		else
			forge.tabs.open(@model.get("link"))
	
	toggle_menu: ->
		@.$el.find("ul.menu").toggle()			

	show_user: ->
		HN.router.navigate("user/" + @model.get("user"), true);		