/obj/item/book/ritual/cruciform
	name = "absolutism ritual book"
	desc = "Contains holy litanies and religious prayers."
	icon_state = "bible"
	excluded_categories = list("Episcopal")
	price_tag = 150

/*
/obj/item/book/ritual/cruciform/ritual(var/datum/ritual/R)
	var/data = ""
	data += "<div style='margin-bottom:10px;'>"
	data += "<b>[capitalize(R.name)]</b><br>"
	data += "<a href='[href(R)]'>[R.get_display_phrase()]</a><br>"
	data += "<i>[R.desc]</i></div>"
	return data
*/

/*/obj/item/book/ritual/cruciform/inquisitor
	name = "Inquisitor ritual book"
	desc = "Contains holy litany and prayers only for the Inquisitor."
	icon_state = "biblep"*/

/obj/item/book/ritual/cruciform/priest
	name = "prime ritual book"
	desc = "Contains holy litany and prayers meant only for the prime."
	icon_state = "biblep"
	excluded_categories = null
	price_tag = 250
