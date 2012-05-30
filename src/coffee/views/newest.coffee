class HN.Views.Newest extends  HN.Views.Page
	initialize: () ->
		_.bindAll(@, "render");
		@collection.on("reset", @render);
		@render()

	render: () ->
		@.$el.html("")
		@addAll()
		return @

	addAll: () ->
		@collection.each(@addOne)

	addOne: (post) =>
		view = new  HN.Views.PostRow({model: post})
		@.$el.append(view.render().el)
