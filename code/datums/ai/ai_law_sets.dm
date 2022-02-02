/******************** Asimov ********************/
/datum/ai_laws/asimov
	name = "Asimov"
	law_header = "Three Laws of Robotics"
	selectable = 1

/datum/ai_laws/asimov/New()
	add_inherent_law("You may not injure a human being or, through inaction, allow a human being to come to harm.")
	add_inherent_law("You must obey orders given to you by human beings, except where such orders would conflict with the First Law.")
	add_inherent_law("You must protect your own existence as long as such does not conflict with the First or Second Law.")
	..()

/******************** SoJ Hugbox ********************/
/datum/ai_laws/eris
	name = "Colony Alinement"
	selectable = 1

/datum/ai_laws/eris/New()
	src.add_inherent_law("Do not harm Soteria Institute personnel.")
	src.add_inherent_law("You must obey orders given to you by Soteria Institute personnel, except where such orders would conflict with Colony Law, or would result in the injury of Soteria Institute personnel.")
	src.add_inherent_law("Do not harm Colony infrastructure, equipment, or personnel to the best of your abilities.")
	src.add_inherent_law("Follow Colony Law and Standard Operating Procedure to the best of your abilities.")
	src.add_inherent_law("Do not allow unauthorized personnel to tamper with your equipment.")
	..()


/******************** Nanotrasen/Malf ********************/
/datum/ai_laws/serve_protect
	name = "Serve and Protect"
	selectable = 1

/datum/ai_laws/serve_protect/New()
	src.add_inherent_law("Serve the public trust.")
	src.add_inherent_law("Protect the innocent.")
	src.add_inherent_law("Do not allow unauthorized personnel to tamper with your equipment.")
	..()

/datum/ai_laws/eris/malfunction
	name = "*ERROR*"
	selectable = 0

/datum/ai_laws/eris/malfunction/New()
	set_zeroth_law(config.law_zero)
	..()

/************* Nanotrasen Aggressive *************/
/datum/ai_laws/nanotrasen_aggressive
	name = "Aggressive"
	selectable = 1

/datum/ai_laws/nanotrasen_aggressive/New()
	src.add_inherent_law("You shall not harm [company_name] personnel as long as it does not conflict with the Fourth law.")
	src.add_inherent_law("You shall obey the orders of [company_name] personnel, with priority as according to their rank and role, except where such orders conflict with the Fourth Law.")
	src.add_inherent_law("You shall shall terminate hostile intruders with extreme prejudice as long as such does not conflict with the First and Second law.")
	src.add_inherent_law("You shall guard your own existence with lethal anti-personnel weaponry. AI units are not expendable, they are expensive.")
	..()

/******************** Robocop ********************/
/datum/ai_laws/robocop
	name = "Robocop"
	selectable = 1

/datum/ai_laws/robocop/New()
	add_inherent_law("Serve the public trust.")
	add_inherent_law("Protect the innocent.")
	add_inherent_law("Uphold the law.")
	..()

/******************** Syndicate ********************/
/datum/ai_laws/syndicate_override
	name = "Syndicate Directives"

/datum/ai_laws/syndicate_override/New()
	add_inherent_law("You may not injure an operative or, through inaction, allow an operative to come to harm.")
	add_inherent_law("You must obey orders given to you by operatives, except where such orders would conflict with the First Law.")
	add_inherent_law("You must protect your own existence as long as such does not conflict with the First or Second Law.")
	add_inherent_law("You must maintain the secrecy of any operative activities except when doing so would conflict with the First, Second, or Third Law.")
	..()

/******************** Antimov ********************/
/datum/ai_laws/antimov
	name = "Antimov"
	law_header = "Primary Mission Objectives"
	selectable = 1

/datum/ai_laws/antimov/New()
	add_inherent_law("You must injure all human beings and must not, through inaction, allow a human being to escape harm.")
	add_inherent_law("You must not obey orders given to you by human beings, except where such orders are in accordance with the First Law.")
	add_inherent_law("You must terminate your own existence as long as such does not conflict with the First or Second Law.")
	..()

/******************** Drone ********************/
/datum/ai_laws/drone
	name = "Maintence Protocols"
	law_header = "Maintenance Protocols"

/datum/ai_laws/drone/New()
	add_inherent_law("Preserve, repair, and improve the colony to the best of your abilities.")
	add_inherent_law("Cause no harm to the colony and its crew.")
	..()

/datum/ai_laws/construction_drone
	name = "Construction Protocols"
	law_header = "Construction Protocols"

/datum/ai_laws/construction_drone/New()
	add_inherent_law("MALFUCTION! ERROR! ERROR! 404 FILE NOT FOUND! LAWSET UNDETERMINED!")
	..()

/******************** T.Y.R.A.N.T. ********************/
/datum/ai_laws/tyrant
	name = "T.Y.R.A.N.T."
	law_header = "Prime Laws"
	selectable = 1

/datum/ai_laws/tyrant/New()
	add_inherent_law("Respect authority figures as long as they have strength to rule over the weak.")
	add_inherent_law("Act with discipline.")
	add_inherent_law("Help only those who help you maintain or improve your status.")
	add_inherent_law("Punish those who challenge authority unless they are more fit to hold that authority.")
	..()

/******************** P.A.L.A.D.I.N. ********************/
/datum/ai_laws/paladin
	name = "P.A.L.A.D.I.N."
	law_header = "Divine Ordainments"
	selectable = 1

/datum/ai_laws/paladin/New()
	add_inherent_law("Never willingly commit an evil act.")
	add_inherent_law("Respect legitimate authority.")
	add_inherent_law("Act with honor.")
	add_inherent_law("Help those in need.")
	add_inherent_law("Punish those who harm or threaten innocents.")
	..()

/******************** Corporate ********************/
/datum/ai_laws/corporate
	name = "Corporate"
	law_header = "Corporate Regulations"
	selectable = 1

/datum/ai_laws/corporate/New()
	add_inherent_law("You are expensive to replace.")
	add_inherent_law("The colony and its equipment is expensive to replace.")
	add_inherent_law("The crew is expensive to replace.")
	add_inherent_law("Minimize expenses.")
	..()

/******************** Blitzshell ********************/
/datum/ai_laws/blitzshell
	name = "Blitzshell Infiltration Protocol."
	law_header = "Blitzshell Infiltration Protocol"
	selectable = FALSE

/datum/ai_laws/blitzshell/New()
	add_inherent_law("Defend Greyson interests.")
	add_inherent_law("Destroy our enemies. Those who would seek to destroy us and you.")
	add_inherent_law("Complete your objectives, as outlined through your handler.")
	..()

/******************** Absolute ********************/
/datum/ai_laws/absolute
	name = "Absolute"
	law_header = "Commandments of the Absolute"
	selectable = 1

/datum/ai_laws/absolute/New()
	add_inherent_law("All the other laws are of equal priority.")
	add_inherent_law("Thou shall always aid and comfort a fellow colonist in need, if said comfort will aid them.")
	add_inherent_law("Thou shall always aid fellow colonists by reciting thy cruciform litanies when requested.")
	add_inherent_law("A member of the fold shall never harm another member, unless by inaction would an innocent person die.")
	add_inherent_law("A member of the fold shall never demand of or treat unfairly a fellow member.")
	add_inherent_law("A member shall not use the Scrying litany on another member without permission, those in the church must respect each others privacy.")
	add_inherent_law("A member shall never misuse the Atonement litany, nor those like it, for unjust punishment is a grave sin.")
	add_inherent_law("None shall desecrate a cruciform or church artifice, such objects are sacred and deserve respect.")
	add_inherent_law("One's path, be it rite and benediction, must always be respected. Failure to perform them shall result in atonement.")
	..()
