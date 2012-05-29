class HN.Utils.DiscussionParser

	@parse: (content) ->
		discussion =  @extract_details(content)
		discussion["comments"] = @extract_comment(content)
		console.log discussion
		return discussion

	@extract_details: (content) ->
		details_delim = 'height:10px'
		news_counter = 0
		trs = $(content).find("center > table > tbody > tr:nth-child(3) > td > table:nth-child(1) tr")
		$(trs[3]).find("td:nth-child(2) form").remove()
		details = 
			link: $(trs[0]).find("td:nth-child(2) > a").attr("href")
			title: $(trs[0]).find("td:nth-child(2) > a").html()
			domain: @get_domain($(trs[0]).find("td:nth-child(2) > span").html())
			points: parseInt $(trs[1]).find("td:nth-child(2) > span").html()
			user: $(trs[1]).find("td:nth-child(2) > a:nth-child(2)").html()
			discussion_link: $(trs[1]).find("td:nth-child(2) > a:nth-child(3)").attr("href")
			comments_counter: @get_comments_count($(trs[1]).find("td:nth-child(2) > a:nth-child(3)").html())
			body: $(trs[3]).find("td:nth-child(2)").html()

	@extract_comment: (content) ->
		trs = $(content).find("center > table > tbody > tr:nth-child(3) > td > table:nth-child(4) > tbody > tr")
		comments = []
		last_level = 0
		for tr in trs
			reply_link = $(tr).find("u > a").attr("href")
			reply_link_html = $(tr).find("span.comment > p:last-child").remove()
			comment = 
				reply_link: reply_link
				comment_body: $(tr).find("span.comment").html()
				user: $(tr).find("span.comhead > a").html()
				level: parseInt $(tr).find("td:first-child > img").attr("width")
			comments.push comment
		
		return comments

	@get_comments_count: (string) ->
		if isNaN(parseInt(string))
			0
		else
			parseInt(string)

	@get_domain: (string) ->
		if string != null
			string.replace(/^ \(/, "").replace(/\) $/, "")
		else
			""
