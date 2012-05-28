class HN.Views.PostRow extends Backbone.View
	className: "post-row"
	template: _.template($('#post-row').html())
	events: 
		"click": "open"

	render: () ->
		@.$el.append(@.template(@.model.toJSON()))
		return @

	open: () ->
		HN.router.navigate("post/" + @model.id, true);