class HN.Router extends Backbone.Router
	routes:
		"" : "news"
		"newest" : "newest"
		"jobs" : "jobs"
		"ask" : "ask"
		"post/:id": "post"
		"user/:id": "user"

	news: ->
		HN.TabBarButtons.news.setActive()
		console.log("News")
		news = new HN.Views.News(
			collection: HN.news
			back: false
		)

		news.show()

	newest: ->
		HN.TabBarButtons.newest.setActive()
		console.log("Newest")
		newest = new HN.Views.News(
			collection: HN.newest
			back: false
		)

		newest.show()
	jobs: ->
		HN.TabBarButtons.jobs.setActive()
		console.log("Jobs")
		jobs = new HN.Views.News(
			collection: HN.jobs
			back: false
		)

		jobs.show()
	ask: ->
		HN.TabBarButtons.ask.setActive()
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

	user: (id) ->
		console.log("User -"+id)
		model = new HN.Models.User({user: id})
		user = new HN.Views.User(
				model: model
				back: true
			)
		user.show()
		
