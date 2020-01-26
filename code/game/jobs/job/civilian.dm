/datum/job/clubmanager
	title = "Bartender"
	flag = CLUBMANAGER
	department = DEPARTMENT_LSS
	department_flag = LSS
	faction = MAP_FACTION
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Chief Executive Officer"
	selection_color = "#dddddd"
	also_known_languages = list(LANGUAGE_CYRILLIC = 25, LANGUAGE_SERBIAN = 15, LANGUAGE_JIVE = 80)
	access = list(access_bar, access_kitchen)
	initial_balance = 3000
	wage = WAGE_LABOUR_DUMB // Makes his own money via tips and selling drinks
	stat_modifiers = list(
		STAT_ROB = 15,
		STAT_TGH = 15,
		STAT_VIG = 15,
	)
	outfit_type = /decl/hierarchy/outfit/job/service/bartender //Re-using this.
	description = "As the bartender, you run the colony bar. Provide the colonists with drinks and entertainment.<br>\
	You only take orders from the chief executive officers and you should work closely with chef and gardener to maximize profits."

	duties = "	Run the bar, provide a safe haven for food, drinks, and entertainment.<br>\
		Make money, run deals through your place, provide entertainment, trade secrets.<br>\
		Keep the bar safe, clean, and free of fights."


/obj/landmark/join/start/clubmanager
	name = "Bartender"
	icon_state = "player-grey"
	join_tag = /datum/job/clubmanager

/datum/job/clubworker
	title = "Chef"
	flag = CLUBWORKER
	department = DEPARTMENT_LSS
	department_flag = LSS
	faction = MAP_FACTION
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Chief Executive Officer"
	selection_color = "#dddddd"
	also_known_languages = list(LANGUAGE_CYRILLIC = 10, LANGUAGE_JIVE = 60)
	access = list(access_bar, access_kitchen)
	initial_balance = 750
	wage = WAGE_LABOUR_DUMB //They should get paid by making food.
	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_TGH = 10,
		STAT_VIG = 5,
	)
	outfit_type = /decl/hierarchy/outfit/job/service/waiter
	description = "As a chef, you work in the kitchen. Your job is to fulfill your duties by cooking food for people and making sure all the customers are satisfied.<br>\
	<br>\
	You can cook, clean, serve, and entertain in the kitchen or even bar.<br>\
	<br>\
	You are paid mainly through fulfilling requests for food. You should take initiative and ask people for food orders."

	duties = "Assist the bartender by providing food with the drinks he serves.<br>\
		Serve customers. Feed customers. Entertain customers.<br>\
		Make enough money to live comfortably."


/obj/landmark/join/start/clubworker
	name = "Chef"
	icon_state = "player-grey"
	join_tag = /datum/job/clubworker

/datum/job/actor
	title = "Actor"
	flag = ACTOR
	department = DEPARTMENT_LSS
	department_flag = LSS
	faction = MAP_FACTION
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Chief Executive Officer"
	selection_color = "#dddddd"
	also_known_languages = list(LANGUAGE_CYRILLIC = 15, LANGUAGE_SERBIAN = 5, LANGUAGE_JIVE = 80)
	access = list(access_maint_tunnels, access_theatre)

	outfit_type = /decl/hierarchy/outfit/job/service/actor/clown
	wage = WAGE_LABOUR_DUMB	//Barely a retaining fee. Actor can busk for credits to keep themselves fed
	stat_modifiers = list(
		STAT_TGH = 30, //basically a punching bag, he can't robust anyone or shoot guns anyway
	)

	description = "The actor serves as a versatile performance artist here to entertain the colony.<br>\
	You may find your colleagues distracted by boring work or senseless drinking, but it's your job to bring them real culture.<b\
	The CEO pays you a terrible retaining fee, so try to make some money from audience donations to live well."

	duties = "Provide entertainment to the crew with your varied talents.<br>\
		Bring culture to the masses through plays, shows, and other performances by assuming a role such as a mime, clown, or other role."


/obj/landmark/join/start/actor
	name = "Actor"
	icon_state = "player-grey"
	join_tag = /datum/job/actor

/datum/job/hydro
	title = "Gardener"
	flag = BOTANIST
	department = DEPARTMENT_LSS
	department_flag = LSS
	faction = MAP_FACTION
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Chief Executive Officer"
	selection_color = "#dddddd"
	//alt_titles = list("Hydroponicist")
	also_known_languages = list(LANGUAGE_CYRILLIC = 15, LANGUAGE_JIVE = 80)
	access = list(access_hydroponics, access_morgue, access_crematorium, access_maint_tunnels)
	wage = WAGE_LABOUR_DUMB //The gardener can make money selling his fruits to the church or to the chef and bartender.

	outfit_type = /decl/hierarchy/outfit/job/service/gardener
	stat_modifiers = list(
		STAT_BIO = 15,
		STAT_TGH = 15,
		STAT_ROB = 10,
	)

	description = "The green-fingered gnome working in the glorious botany department. You are the gardener, tender of plants.<br>\
	All plantlife aboard the colony is your responsibility to deal with, both the nice and the nasty ones. You have garden to work with, conveniently located near the diner area. Visitors and guests are not uncommon, but your main contact will be with the Chef, your closest colleague.<br>\
	<br>\
	Your first and primary responsibility aboard the colony is as a farmer. The gardens contain all of the seeds, tools and fertilisers you need to grow crops and feed the colony. Ensure a good variety of raw vegetables and plenty of core grains like rice and wheat.<br>\
	<br>\
	Your second duty is as a rancher, if you have the talents. The garden contains a few rooms that are suitable for use as a sort of stable or paddock, in general the whole area is quite pleasant for animal life to roam around in, and comes with a few chickens plus a cow to start you off. More animals can be imported through cargo, allowing you to create a little oasis of life in a dark and gritty universe.<br>\
	<br>\
	Your third responsibility is much less savory. The colony is on an alien planet and teeming with life. The maintenance corridors are infested with an invasive fungal species, affectionately termed Fungo d'Artigliero, by some botanist before your time. These mushrooms grow through burrows around the ship and wreak havoc, spraying chemicals around. Dealing with them - as well as any other invasive flora -  primarily falls to you, although this is a task that you may wish to hire some assistants to help out with.<br>\
	<br>\
	The shovels and hatchets in your garden provide the basic tools you'll need for these tasks, but you should always be on the lookout for more advanced equipment. A chainsaw or flamethrower would both be exceptionally useful tools for aggresive plant management."

	duties = "Grow food for the chef to feed the station.<br>\
		Raise animals for eggs, meat and recreation.<br>\
		Manage invasive flora around the colony and cut out mushroom infestations."


/obj/landmark/join/start/hydro
	name = "Gardener"
	icon_state = "player-black"
	join_tag = /datum/job/hydro

/datum/job/janitor
	title = "Janitor"
	flag = JANITOR
	department = DEPARTMENT_LSS
	department_flag = LSS
	faction = MAP_FACTION
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Chief Executive Officer"
	selection_color = "#dddddd"
	//alt_titles = list("Custodian","Sanitation Technician")
	also_known_languages = list(LANGUAGE_CYRILLIC = 15, LANGUAGE_JIVE = 80)
	access = list(access_janitor, access_maint_tunnels, access_morgue, access_crematorium)
	wage = WAGE_PROFESSIONAL
	outfit_type = /decl/hierarchy/outfit/job/service/janitor

	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_BIO = 10,
	)

	software_on_spawn = list(/datum/computer_file/program/camera_monitor)

	description = "The lowly janitor. Probably the worst paid and least respected role on the colony. Everyone overlooks you, until they need you. And need you they shall. When someone stumbles down the hallway bleeding from every orifice, you get to clean it up.<br>\
	<br>\
	Armed with your trusty janicart full of cleaning supplies, you trundle around the colony mopping up blood and spraying away oil. Cleaning is obviously your first and foremost duty. Wherever there's dirt, rubble, bloodstains, trash, and chemical spills, you should be there to clean it up. Monster corpses are also a bit of a problem to dispose of. The roaches should be taken up to chemistry, where they can be processed for chemical purposes. Others should generally be shoved down a disposal chute, let the machines sort it out from there.<br>\
	<br>\
	To note though, you should be careful when cleaning up a scene of violence - especially a murder. The marshal investigative team will probably want to take samples of evidence before you destroy it all<br>\
	<br>\
	In addition to cleaning, you should also handle minor maintenance. Replacing lights, correcting broken vendors, replacing floor tiles, duct taping cracked walls and windows, etc. You're far from being one of the guild adepts, but you can handle small problems if they're busy.<br>\
	<br>\
	Lastly, your custodial closet contains quite a few traps, large and small. Deploying these carefully around maintenance - and especially ontop of burrows, may help remove a few roaches from the ship. Treasure those traps, as producing more is not so easy."

	duties = "Clean blood, dirt, rubble and messes. Pick up trash and dispose of monster corpses.<br>\
		Conduct minor repairs and maintenance when guild adepts aren't available.<br>\
		Deploy traps on burrows to keep nasty creatures at bay."


/obj/landmark/join/start/janitor
	name = "Janitor"
	icon_state = "player-black"
	join_tag = /datum/job/janitor

