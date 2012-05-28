class HN.Collections.Ask extends Backbone.Collection
	model: HN.Models.Post
	url: "http://news.ycombinator.com/ask"

	parse: (response) ->
		return HN.Utils.NewsParser.parse(response)
