class HN.Views.Post extends  HN.Views.Page
	template: _.template($('#post-row').html())
	template_commands: _.template($('#discussion-commands').html())
	template_comment: _.template($('#discussion-comment').html())
	template_comment_menu: _.template($('#discussion-comment-menu').html())
	events: 
		"click p.title": "open"
	initialize: () ->
		_.bindAll(@, "render");
		@model.on("change", @render);
		@model.fetch()

	render: () ->
		@.$el.append(@.template(@model.toJSON()))
		@.$el.append(@.template_commands(@model.toJSON()))
		for comment in @model.get("comments")
			@.$el.append(@.template_comment(comment))
		$("font").removeAttr("color")
		return @

	open: () ->
		console.log("open external link: "+@model.get("link")) 
		forge.tabs.open(@model.get("link"))
