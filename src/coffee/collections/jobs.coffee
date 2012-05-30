class HN.Collections.Jobs extends Backbone.Collection
	model: HN.Models.Post
	url: "http://news.ycombinator.com/jobs"

	parse: (response) ->
		return HN.Utils.JobsParser.parse(response)
