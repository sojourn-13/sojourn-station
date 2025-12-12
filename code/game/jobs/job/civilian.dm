/datum/job/hop
	title = "Hospitality Manager"
	flag = HOP
	department = DEPARTMENT_SERVICE
	head_position = TRUE
	department_flag = SERVICE | COMMAND
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Governor and the Iskhod Council"
	difficulty = "Medium."
	selection_color = "#dddddd"
	req_admin_notify = 1
	playtimerequired = 1200
	wage = WAGE_COMMAND

	access = list(
		access_hydroponics, access_bar, access_kitchen, access_janitor, access_theatre, access_library,
		access_RC_announce, access_keycard_auth, access_heads, access_sec_doors, access_heads_vault
	)

	outfit_type = /decl/hierarchy/outfit/job/service/hop

	description = "The Hospitality Manager is the head of Ivaris Hospitality Services, ensuring the comfort and entertainment of the colony.<br>\
	You oversee the bar, kitchen, hydroponics, and all entertainment services.<br>\
	Ensure your staff are profitable and keeping the crew happy.<br>\
	You also serve as a member of the Iskhod Council, representing the civilian and service sectors."

	duties = "Manage the Ivaris Hospitality staff.<br>\
	Ensure the colony is fed and entertained.<br>\
	Advise the Council on civilian matters."

/obj/landmark/join/start/hop
	name = "Hospitality Manager"
	icon_state = "player-grey-officer"
	join_tag = /datum/job/hop

/datum/job/clubmanager
	title = "Bartender"
	flag = CLUBMANAGER
	department = DEPARTMENT_SERVICE
	department_flag = FL
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Hospitality Manager"
	difficulty = "Easy."
	alt_titles = list("Barkeep","Barista","Mixologist")
	selection_color = "#dddddd"
	access = list(access_hydroponics, access_bar, access_kitchen)
	initial_balance = 3000
	wage = WAGE_LABOUR_DUMB // Makes his own money via tips and selling drinks
	health_modifier = -10
	stat_modifiers = list(
		STAT_ROB = 15,
		STAT_TGH = 15,
		STAT_VIG = 15,
	)

	perks = list(PERK_MARKET_PROF, /datum/perk/bartender)

	outfit_type = /decl/hierarchy/outfit/job/service/bartender //Re-using this.
	description = "The Bartender runs the colony bar, providing colonists with drinks and entertainment under Ivaris Hospitality Services.<br>\
	Working with the Chef and Gardener, you make the big decisions. Run your business well - perhaps seek to maximise profits.<br>\
	Although tips are a good source of income, your wider business acumen will truly decide your prosperity here."

	duties = "Run the bar - provide a safe haven for food, drinks and entertainment.<br>\
		Seek extra sources of income for the venue - perhaps run deals or trade secrets.<br>\
		Potentially take over cooking duties if a Chef is not present."

/obj/landmark/join/start/clubmanager
	name = "Bartender"
	icon_state = "player-grey"
	join_tag = /datum/job/clubmanager

/datum/job/clubworker
	title = "Chef"
	flag = CLUBWORKER
	department = DEPARTMENT_SERVICE
	department_flag = FL
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Hospitality Manager"
	difficulty = "Easy."
	alt_titles = list("Culinary Artist","Cook", "Line Chef")
	selection_color = "#dddddd"
	health_modifier = -10
	access = list(access_hydroponics, access_bar, access_kitchen)
	initial_balance = 750
	wage = WAGE_LABOUR_DUMB //They should get paid by making food.
	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_TGH = 10,
		STAT_BIO = 10, // They need it to butcher animals without hurting themselves.
	)

	perks = list(PERK_MARKET_PROF, /datum/perk/bartender, /datum/perk/foodappraise)

	outfit_type = /decl/hierarchy/outfit/job/service/waiter
	description = "The Chef works in the kitchen, ensuring that the colony remains well-fed and energetic.<br>\
	You will typically work closely with a Bartender while cooking, cleaning, serving and perhaps entertaining.<br>\
	You are paid mainly through fulfilling requests for food. The successful Chef takes initiative by asking for customer orders."

	duties = "Provide enough meals to feed the colony. Aim for a variety of interesting and tasty dishes.<br>\
		Ensure your customers are well-fed and looked after.<br>\
		Potentially take over bartending duties if a Bartender is not present."


/obj/landmark/join/start/clubworker
	name = "Chef"
	icon_state = "player-grey"
	join_tag = /datum/job/clubworker

/datum/job/hydro
	title = "Gardener"
	flag = BOTANIST
	department = DEPARTMENT_SERVICE
	department_flag = FL
	faction = MAP_FACTION
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Hospitality Manager"
	difficulty = "Easy."
	selection_color = "#dddddd"
	alt_titles = list("Hydroponicist")
	health_modifier = -10
	also_known_languages = list(LANGUAGE_CYRILLIC = 15, LANGUAGE_JIVE = 80)
	access = list(access_hydroponics, access_bar, access_kitchen)
	wage = WAGE_LABOUR_DUMB //The gardener can make money selling his fruits to the church or to the chef and bartender.

	outfit_type = /decl/hierarchy/outfit/job/service/gardener
	stat_modifiers = list(
		STAT_BIO = 15,
		STAT_TGH = 15,
		STAT_ROB = 10,
	)

	perks = list(PERK_MARKET_PROF, /datum/perk/greenthumb, /datum/perk/bartender)

	description = "The Gardener toils in Ivaris Hospitality hydroponics - utilising seeds, tools and fertilisers to grow bountiful crops.<br>\
	More talented gardeners may dip into ranching. Your paddocks contain a few chickens and a cow. More exotic animals can be acquired as cargo imports.<br>\
	You are the go-to expert for flora destruction - use shovels and hatchets, or seek more advanced equipment like flamethrowers and chainsaws.<br>\
	Remember that your goods come with a cost and more exotic crops can command a higher price."

	duties = "Grow food. Ensure a good supply of raw vegetables and core grains - rice and wheat.<br>\
		Raise animals for eggs, meat and recreation.<br>\
		Maintain the potted plants around the colony.<br>\
		Manage invasive flora around the colony and control fungal infestations."

/obj/landmark/join/start/hydro
	name = "Gardener"
	icon_state = "player-black"
	join_tag = /datum/job/hydro

/datum/job/artist
	title = "Artist"
	flag = ARTIST
	department = DEPARTMENT_SERVICE
	department_flag = FL
	faction = MAP_FACTION
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Hospitality Manager"
	difficulty = "Easy."
	selection_color = "#dddddd"
	access = list(access_theatre)
	outfit_type = /decl/hierarchy/outfit/job/cargo/artist
	wage = WAGE_LABOUR_DUMB	//Barely a retaining fee. Actor can busk for credits to keep themselves fed
	alt_titles = list("Clown","Entertainer","Mime")
	stat_modifiers = list(
		STAT_TGH = 20, //basically a punching bag, he can't robust anyone or shoot guns anyway
		STAT_MEC = 10  //They often deal with tool mods guns and other things that need these
	)

	perks = list(PERK_MARKET_PROF, PERK_ARTIST)
	software_on_spawn = list(///datum/computer_file/program/supply,
							 ///datum/computer_file/program/deck_management,
							 /datum/computer_file/program/scanner,
							 /datum/computer_file/program/wordprocessor,
							 /datum/computer_file/program/reports)

	description = "The Artist serves as a versatile performance artist here to entertain the colony.<br>\
	You may find your colleagues distracted by boring duties or senseless bickering, so work hard to bring them some real culture.<br>\
	You are paid a terrible retaining fee, so use your wits to sustain yourself - perhaps ask your audience for donations.<br>\
	In addition you do not gain desires like other members of the colony, instead you spend your insight at your workbench to create expensive works of art worth selling."

	duties = "Provide (family-friendly) entertainment to the crew with your varied talents.<br>\
		Create and sell valuable works of art in your artist bench.<br>\
		Try to be a successful rather than starving artist. The costume vendor and equipment in your cramped studio may prove useful."

/obj/landmark/join/start/artist
	name = "Artist"
	icon_state = "player-grey"
	join_tag = /datum/job/artist


/datum/job/journalist
	title = "Journalist"
	flag = JOURNALIST
	department = DEPARTMENT_SERVICE
	department_flag = FL
	faction = MAP_FACTION
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Hospitality Manager"
	difficulty = "Easy."
	selection_color = "#dddddd"
	access = list(access_theatre, access_library)
	outfit_type = /decl/hierarchy/outfit/job/cargo/journalist
	wage = WAGE_LABOUR_DUMB
	alt_titles = list("Reporter", "Cameraman", "Photographer")
	stat_modifiers = list(
		STAT_TGH = 10,
		STAT_COG = 20,
		STAT_VIG = 10
	)

	perks = list(PERK_MARKET_PROF)
	software_on_spawn = list(/datum/computer_file/program/wordprocessor,
							 /datum/computer_file/program/reports,
							 /datum/computer_file/program/camera_monitor)

	description = "The Journalist is a member of the press for Ivaris Hospitality Services, documenting life in the colony.<br>\
	Your duty is to report the news, good or bad, to the populace. Interviews, investigations, and photography are your tools.<br>\
	Stay out of trouble, but don't be afraid to ask the hard questions. Ideally, you should be ensuring the truth gets out.<br>\
	You report to the Hospitality Manager, but your loyalty is to the truth."

	duties = "Document events and news within the colony.<br>\
	Interview key figures and write reports.<br>\
	Ensure the colony stays informed."

/obj/landmark/join/start/journalist
	name = "Journalist"
	icon_state = "player-grey"
	join_tag = /datum/job/journalist

/datum/job/janitor
	title = "Janitor"
	flag = JANITOR
	department = DEPARTMENT_ENGINEERING
	department_flag = FL
	faction = MAP_FACTION
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Guild Chief Engineer"
	difficulty = "Easy."
	selection_color = "#dddddd"
	alt_titles = list("Custodian","Sanitation Technician")
	access = list(access_janitor, access_maint_tunnels, access_morgue, access_hydroponics, access_bar, access_kitchen)
	wage = WAGE_PROFESSIONAL
	health_modifier = 5
	outfit_type = /decl/hierarchy/outfit/job/service/janitor

	perks = list(PERK_MARKET_PROF, /datum/perk/job/jingle_jangle, /datum/perk/neat) //Union has revoked their chemistry privileges

	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_BIO = 10,
		STAT_VIG = 20,
		STAT_TGH = 20,
	)

	software_on_spawn = list(/datum/computer_file/program/camera_monitor)
	description = "The lowly Janitor, well paid but rarely respected, nevertheless provides a valuable service.<br>\
	You will trundle around the colony, armed with your trusty janicart full of cleaning supplies, disposing of trash and pests.<br>\
	Some minor maintenance also falls within your duties. Fix lights, correct broken vendors, replace floor tiles - ease the guild burden.<br>\
	Although your status is miserable, your knowledge of maintenance may lead you to some valuable salvage for some extra cash."

	duties = "Clean blood, dirt, rubble and messes. Don't clean up crime scenes!<br>\
		Conduct minor repairs and maintenance when guild adepts aren't available.<br>\
		Restock Newscasters to at least 15 prints.<br>\
		Deploy traps on burrows and do your best to handle the ongoing roach and spider problem."

/obj/landmark/join/start/janitor
	name = "Janitor"
	icon_state = "player-black"
	join_tag = /datum/job/janitor
