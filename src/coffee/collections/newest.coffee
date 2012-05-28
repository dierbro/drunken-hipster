class HN.Collections.Newest extends Backbone.Collection
	model: HN.Models.Post
	url: "http://news.ycombinator.com/newest"

	parse: (response) ->
		return HN.Utils.NewsParser.parse(response)
