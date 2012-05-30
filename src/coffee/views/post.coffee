class HN.Views.Post extends  HN.Views.Page
	template: _.template($('#post-row').html())
	template_commands: _.template($('#discussion-commands').html())

	events: 
		"click p.title": "open"
	initialize: () ->
		_.bindAll(@, "render");
		@model.on("change", @render);
		@model.fetch()

	render: () ->
		@.$el.html(@.template(@model.toJSON()))
		@.$el.append(@model.get("body"))
		@.$el.append(@.template_commands(@model.toJSON()))
		for comment in @model.comments()
			view = new  HN.Views.Comment({model: comment})
			@.$el.append(view.render().el)
		$("font").removeAttr("color")
		return @

	open: () ->
		forge.tabs.open(@model.get("link"))
