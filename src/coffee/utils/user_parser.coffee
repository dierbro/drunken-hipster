class HN.Utils.UserParser

	@parse: (content) ->
		user = {}
		for item in @extract_attributes(content)
			key = $(item).find("td:nth-child(1)").text().replace(":","")
			value = $(item).find("td:nth-child(2)").html()
			if key
				console.log key, value
				user[key] = value
			
		return user

	@extract_attributes: (content) ->
		$(content).find("center > table > tbody > tr:nth-child(3) > td > form > table > tbody > tr")