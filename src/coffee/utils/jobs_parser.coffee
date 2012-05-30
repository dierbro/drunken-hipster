class HN.Utils.JobsParser

	@parse: (content) ->
		jobs = []
		for item in @extract_jobs(content)
			unless $(item[1]).find("td:nth-child(2) > a:nth-child(3)").attr("href")?
				id = parseInt($(item[0]).find("td:nth-child(3) > a").attr("href").replace("item?id=", ""))
			else 
				id = parseInt($(item[1]).find("td:nth-child(2) > a:nth-child(3)").attr("href").replace("item?id=", ""))
			jobs.push
				id: id
				link: $(item[0]).find("td:nth-child(3) > a").attr("href")
				title: $(item[0]).find("td:nth-child(3) > a").html()
				domain: @get_domain($(item[0]).find("td:nth-child(3) > span").html())
				points: parseInt $(item[1]).find("td:nth-child(2) > span").html()
				user: $(item[1]).find("td:nth-child(2) > a:nth-child(2)").html()
				discussion_link: $(item[1]).find("td:nth-child(2) > a:nth-child(3)").attr("href")
				comments_counter: @get_comments_count($(item[1]).find("td:nth-child(2) > a:nth-child(3)").html())

		return jobs

	@extract_jobs: (content) ->
		jobs_delim = 'height:5px'
		jobs_page_delim = 'height:45px'
		jobs_counter = 0
		trs = $(content).find("center > table > tbody > tr:nth-child(3) > td > table tr").get()
		trs.splice(0,2)
		jobs = []
		for tr in trs
			if $(tr).attr("style") == jobs_delim
				jobs_counter += 1
			else if ($(tr).attr("style") == jobs_page_delim)
				break
			else
				jobs[jobs_counter] ||= []
				jobs[jobs_counter].push tr
		return jobs

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
