class HN.Router extends Backbone.Router
	routes:
		"" : "news"
		"newest" : "newest"
		"jobs" : "jobs"
		"ask" : "ask"
		"post/:id": "post"

	news: ->
		console.log("News")
		news = new HN.Views.News(
			collection: HN.news
			back: false
		)

		news.show()

	newest: ->
		console.log("Newest")
		newest = new HN.Views.News(
			collection: HN.newest
			back: false
		)

		newest.show()
	jobs: ->
		console.log("Jobs")
		jobs = new HN.Views.News(
			collection: HN.jobs
			back: false
		)

		jobs.show()
	ask: ->
		console.log("ask")
		ask = new HN.Views.News(
			collection: HN.ask
			back: false
		)

		ask.show()


	post: (id) ->
		console.log("Post - "+id)
		model = new HN.Models.Discussion(id: id)
		post = new HN.Views.Post(
			model: model
			back: true
		)
		post.show()
		
