class HN.Models.Discussion extends Backbone.Model
	initialize: (attributes) ->
		@url = "http://news.ycombinator.com/item?id="+attributes.id

	parse: (response) ->
		return HN.Utils.DiscussionParser.parse(response)