class HN.Views.News extends  HN.Views.Page
	initialize: () ->
		_.bindAll(@, "render");
		@collection.on("reset", @render);
		@render()

	render: () ->
		console.log(@collection)
		@addAll()
		return @

	addAll: () ->
		@collection.each(@addOne)

	addOne: (post) =>
		view = new  HN.Views.PostRow({model: post})
		@.$el.append(view.render().el)
