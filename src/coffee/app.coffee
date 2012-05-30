window.HN = {
	Models:	{}
	Collections: {}
	Views: {}
	Utils:	{}

	init: () ->
		forge.logging.log("Init")

		forge.topbar.show()
		forge.topbar.setTitle("HN")
		forge.topbar.setTint([255,102,0,255])

		forge.tabbar.addButton
			icon: "img/list.png"
			text: "News"
			index: 0
			,
			(button) ->
				button.setActive()
				button.onPressed.addListener () ->
					console.log("button news")
					HN.router.navigate("/" , true);
		forge.tabbar.addButton
			icon: "img/list.png"
			text: "New"
			index: 1
			,
			(button) ->
				button.onPressed.addListener () ->
					HN.router.navigate("newest" , true);
		forge.tabbar.addButton
			icon: "img/list.png"
			text: "Job"
			index: 2
			,
			(button) ->
				button.onPressed.addListener () ->
					HN.router.navigate("jobs" , true);
		forge.tabbar.addButton
			icon: "img/list.png"
			text: "Ask"
			index: 3
			,
			(button) ->
				button.onPressed.addListener () ->
					HN.router.navigate("ask" , true);

		forge.tabbar.show()
		originalSync = Backbone.sync

		# Our new overriding sync with dataType and ContentType
		# that override the default JSON configurations.
		# source: http://agileshrugged.com/blog/?p=165
		Backbone.sync = (method, model, options) ->
			options = _.extend(options,
				dataType: 'html'
				contentType: 'text/html'
				processData: false
			)
			originalSync.apply(Backbone, [ method, model, options ])

		HN.news = new HN.Collections.News()
		HN.news.fetch(
			success: (collection, response) ->
				# Set up Backbone
				HN.router = new HN.Router()
				Backbone.history.start()
		)
		HN.newest = new HN.Collections.Newest()
		HN.newest.fetch()
		HN.jobs = new HN.Collections.Jobs()
		HN.jobs.fetch()
		HN.ask = new HN.Collections.Ask()
		HN.ask.fetch()
}

