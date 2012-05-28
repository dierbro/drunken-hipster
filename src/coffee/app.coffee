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

		
}

