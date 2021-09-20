/datum/faction
	var/name = "Generic Faction (Should not be Seen)"
	//var/office = "Generic HQ (Should not be Seen)" //This was an accident, but it'll come in handy later.

	var/admin = TRUE //Whether or not this faction is completely admin controlled.
	var/faxable = FALSE //Whether or not this faction can be sent messages directly.
	var/fax_alert = "GENERIC HQ FAX"
	var/fax_response = "Generic HQ Reply"

	var/color = "#000000" //What color this faction identifies itself with. This should generally color banners and whatnot, if they ever get implemented.
	var/darkcolor = "#000000" //The color this faction's text should be when against white, among other things.
	var/lightcolor = "#ffffff" //The color this faction's text should be when against black, among other things.

	var/stamptext = "This paper has been stamped with the Generic HQ Stamp."
	var/stampshape = "paper_stamp-dots"
	var/stampcolor = null //If set, will recolor the stamp using mode. Bad idea to do so
	var/stampmode = ICON_MULTIPLY

	var/primary_fax = null //Faxes will be directed to this fax machine if present.

	var/list/players = list() //I have no idea how to handle this so don't use it. Later on, players will be able to join or leave factions.
