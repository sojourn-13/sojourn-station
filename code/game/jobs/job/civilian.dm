#define LOYALTY_CIVILIAN "As a civilian, your only loyalty is to yourself and your livelihood.<br>\
		You generally just want to survive, make a living, and get through the day. You shouldn't try to be a hero, or throw your life away for a cause."

/datum/job/clubmanager
	title = "Club Manager"
	flag = CLUBMANAGER
	department = DEPARTMENT_CIVILIAN
	department_flag = SERVICE
	faction = "CEV Eris"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the First Officer"
	selection_color = "#dddddd"
	also_known_languages = list(LANGUAGE_CYRILLIC = 25, LANGUAGE_SERBIAN = 15, LANGUAGE_JIVE = 80)
	access = list(access_bar, access_kitchen)
	initial_balance = 3000
	wage = WAGE_NONE // Makes his own money
	stat_modifiers = list(
		STAT_ROB = 15,
		STAT_TGH = 15,
		STAT_VIG = 15,
	)
	outfit_type = /decl/hierarchy/outfit/job/service/bartender //Re-using this.
	description = "As the Club Manager, you run the club aboard CEV Eris. Provide the crewmembers with drinks, food, and entertainment.<br>\
	<br>\
	Technically you take orders from no one, but the Captain and the First Officer are the ones who hired you and thus you should strive to please them. Your Club Workers help you run the place and make money. Pay them well!"

	duties = "		Run the club, provide a safe haven for food, drinks, and entertainment.<br>\
		Make money, run deals through your place, provide entertainment, trade secrets.<br>\
		Keep the bar safe, clean, and free of fights."

	loyalties = LOYALTY_CIVILIAN

/obj/landmark/join/start/clubmanager
	name = "Club Manager"
	icon_state = "player-grey"
	join_tag = /datum/job/clubmanager

/datum/job/clubworker
	title = "Club Worker"
	flag = CLUBWORKER
	department = DEPARTMENT_CIVILIAN
	department_flag = SERVICE
	faction = "CEV Eris"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Club Manager"
	selection_color = "#dddddd"
	also_known_languages = list(LANGUAGE_CYRILLIC = 10, LANGUAGE_JIVE = 60)
	access = list(access_bar, access_kitchen)
	initial_balance = 750
	wage = WAGE_NONE //They should get paid by the club owner, otherwise you know what to do.
	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_TGH = 10,
		STAT_VIG = 5,
	)
	outfit_type = /decl/hierarchy/outfit/job/service/waiter
	description = "As a Club Worker, you work for the Club Manager. Your job is to fulfill your duties in running the Club and making sure all the customers are satisfied.<br>\
	<br>\
	You can cook, clean, server, tend the bar, entertain, or even be the bouncer. You have no limits to what you can do inside the Club granted your manager requests you do it.<br>\
	<br>\
	You are paid directly by the Club Manager, he gives you your allowance. The Club Manager only makes money if the Club is ran well, so work hard!"

	duties = "		Assist the Club Manager with running the club.<br>\
		Serve customers. Feed customers. Entertain customers.<br>\
		Protect the Club. Protect the Customers.<br>\
		Make enough money to stay alive aboard CEV Eris."

	loyalties = LOYALTY_CIVILIAN

/obj/landmark/join/start/clubworker
	name = "Club Worker"
	icon_state = "player-grey"
	join_tag = /datum/job/clubworker

/datum/job/actor
	title = "Actor"
	flag = ACTOR
	department = DEPARTMENT_CIVILIAN
	department_flag = SERVICE
	faction = "CEV Eris"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the First Officer"
	selection_color = "#dddddd"
	also_known_languages = list(LANGUAGE_CYRILLIC = 15, LANGUAGE_SERBIAN = 5, LANGUAGE_JIVE = 80)
	access = list(access_maint_tunnels, access_theatre)

	description = "The actor serves as a versatile performance artist here to entertain the crew.<br>\
	You may find your colleagues distracted by work or clubbing, but it's your job to bring them real culture.<br>\
	The Captain and First Officer pay you a terrible retaining fee, so try to make some money through your performances."

	duties = "Provide entertainment to the crew with your varied talents.<br>\
		Bring culture to the masses through plays, shows, and other performances."


	outfit_type = /decl/hierarchy/outfit/job/service/actor/clown
	wage = WAGE_LABOUR_DUMB	//Barely a retaining fee. Actor can busk for credits to keep themselves fed
	stat_modifiers = list(
		STAT_TGH = 30, //basically a punching bag, he can't robust anyone or shoot guns anyway
	)

	loyalties = LOYALTY_CIVILIAN

/obj/landmark/join/start/actor
	name = "Actor"
	icon_state = "player-grey"
	join_tag = /datum/job/actor

/datum/job/hydro
	title = "Gardener"
	flag = BOTANIST
	department = DEPARTMENT_CIVILIAN
	department_flag = SERVICE
	faction = "CEV Eris"
	total_positions = 3
	spawn_positions = 3
	supervisors = "the First Officer"
	selection_color = "#dddddd"
	//alt_titles = list("Hydroponicist")
	also_known_languages = list(LANGUAGE_CYRILLIC = 15, LANGUAGE_JIVE = 80)
	access = list(access_hydroponics, access_morgue, access_crematorium, access_maint_tunnels)
	wage = WAGE_PROFESSIONAL

	outfit_type = /decl/hierarchy/outfit/job/church/gardener
	stat_modifiers = list(
		STAT_BIO = 15,
		STAT_TGH = 15,
		STAT_ROB = 10,
	)

	description = "The green-fingered gnome working in the glorious viridian basement of CEV Eris. You are the gardener, tender of plants.<br>\
	All plantlife aboard the station is your responsibility to deal with, both the nice and the nasty ones. You have gardens spread across two floors to work with, conveniently located below the diner area. Visitors and guests are not uncommon, but your main contact will be with the Chef, your closest colleague.<br>\
	<br>\
	Your first and primary responsibility aboard CEV Eris, is as a farmer. The gardens contain all of the seeds, tools and fertilisers you need to grow crops and feed the station. Ensure a good variety of raw vegetables, and plenty of core grains like rice and wheat.<br>\
	<br>\
	Your second duty is as a rancher, if you have the talents. The lower garden contains a few rooms that are suitable for use as a sort of stable or paddock, in general the whole area is quite pleasant for animal life to roam around in, and comes with a few chickens plus a cow to start you off. More animals can be imported through the guild, allowing you to create a little oasis of life in a dark and gritty universe.<br>\
	<br>\
	Your third responsibility is much less savory. Eris is an old ship, ancient, rusty, and teeming with life. The maintenance corridors are infested with an invasive fungal species, affectionately termed Fungo d'Artigliero, by some botanist before your time. These mushrooms grow through burrows around the ship and wreak havoc, spraying chemicals around. Dealing with them - as well as any other invasive flora -  primarily falls to you, although this is a task that you may wish to hire some assistants to help out with.<br>\
	<br>\
	The shovels and hatchets in your garden provide the basic tools you'll need for these tasks, but you should always be on the lookout for more advanced equipment. A chainsaw or flamethrower would both be exceptionally useful tools for aggresive plant management."

	duties = "Grow food for the chef to feed the station.<br>\
		Raise animals for eggs, meat and recreation.<br>\
		Manage invasive flora around the ship, and cut out mushroom infestations."

	loyalties = LOYALTY_CIVILIAN

/obj/landmark/join/start/hydro
	name = "Gardener"
	icon_state = "player-black"
	join_tag = /datum/job/hydro


/datum/job/janitor
	title = "Janitor"
	flag = JANITOR
	department = DEPARTMENT_CIVILIAN
	department_flag = SERVICE
	faction = "CEV Eris"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the First Officer"
	selection_color = "#dddddd"
	//alt_titles = list("Custodian","Sanitation Technician")
	also_known_languages = list(LANGUAGE_CYRILLIC = 15, LANGUAGE_JIVE = 80)
	access = list(access_janitor, access_maint_tunnels, access_morgue, access_crematorium)
	wage = WAGE_PROFESSIONAL
	outfit_type = /decl/hierarchy/outfit/job/church/janitor

	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_BIO = 10,
	)

	software_on_spawn = list(/datum/computer_file/program/camera_monitor)

	description = "The lowly janitor. Probably the worst paid and least respected role on the ship. Everyone overlooks you, until they need you. And need you they shall. When someone stumbles down the hallway bleeding from every orifice, you get to clean it up.<br>\
	<br>\
	Armed with your trusty janicart full of cleaning supplies, you trundle around the ship mopping up blood, and spraying away oil. Cleaning is obviously your first and foremost duty. Wherever there's dirt, rubble, bloodstains, trash and chemical spills, you should be there to clean it up. Monster corpses are also a bit of a problem to dispose of. The roaches should be taken up to chemistry, where they can be processed for chemical purposes. Others should generally be shoved down a disposal chute, let the guild sort it out from there.<br>\
	<br>\
	To note though, you should be careful when cleaning up a scene of violence - especially a murder. The Ironhammer investigative team will probably want to take samples of evidence before you destroy it all<br>\
	<br>\
	In addition to cleaning, you should also handle minor maintenance. Replacing lights, correcting broken vendors, replacing floor tiles, duct taping cracked walls and windows, etc. You're far from being one of the Technomancers, but you can handle small problems if they're busy<br>\
	<br>\
	Lastly, your custodial closet contains quite a few traps, large and small. Deploying these carefully around maintenance - and especially on top of burrows, to help remove a few roaches from the ship. Treasure those traps, as producing more is not so easy."

	duties = "Clean blood, dirt, rubble and messes. Pickup trash and dispose of monster corpses.<br>\
		Conduct minor repairs and maintenance when technomancers aren't available.<br>\
		Deploy traps on burrows to keep nasty creatures at bay."

	loyalties = LOYALTY_CIVILIAN

/obj/landmark/join/start/janitor
	name = "Janitor"
	icon_state = "player-black"
	join_tag = /datum/job/janitor


