class HN.Views.Post extends  HN.Views.Page
	template: _.template($('#post-row').html())
	template_comment: _.template($('#discussion-comment').html())
	events: 
		"click p.title": "open"
	initialize: () ->
		_.bindAll(@, "render");
		@model.on("change", @render);
		@model.fetch()

	render: () ->
		@.$el.append(@.template(@model.toJSON()))
		for comment in @model.get("comments")
			@.$el.append(@.template_comment(comment))
		return @

	open: () ->
		console.log("open external link: "+@model.get("link")) 
		forge.tabs.open(@model.get("link"))
