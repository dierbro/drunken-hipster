class HN.Collections.News extends Backbone.Collection
	model: HN.Models.Post
	url: "http://news.ycombinator.com/news"

	parse: (response) ->
		return HN.Utils.NewsParser.parse(response)