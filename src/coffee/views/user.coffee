class HN.Views.User extends HN.Views.Page
	template: _.template($('#user').html())
	initialize: () ->
		_.bindAll(@, "render");
		@model.on("change", @render);
		@model.fetch()

	render: ->
		@.$el.html(@.template(@model.toJSON()))
		@