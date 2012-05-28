class HN.Router extends Backbone.Router
	routes:
		"" : "news"
		"post/:id": "post"

	news: ->
		console.log("News")
		news = new HN.Views.News(
			collection: HN.news
			back: false
		)

		news.show()

	post: (id) ->
		console.log("Post - "+id)
		model = new HN.Models.Discussion(id: id)
		post = new HN.Views.Post(
			model: model
			back: true
		)
		post.show()
		
