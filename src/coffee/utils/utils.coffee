HN.Utils.click_or_tap = (obj) ->
	# for property in obj, add "click " to property and use original value
	new_obj = {}
	for property in obj
		if obj.hasOwnProperty(property)
			if forge.is.mobile()
				new_obj["tap " + property] = obj[property]
			else 
				new_obj["click " + property] = obj[property]
	return new_obj