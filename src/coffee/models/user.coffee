class HN.Models.User extends Backbone.Model
	initialize: (attributes) ->
		@url = "http://news.ycombinator.com/user?id="+attributes.user

	parse: (response) ->
		return HN.Utils.UserParser.parse(response)
  