/datum/job/off_colony_hunt_master
	title = "Lodge Hunt Master"
	total_positions = 1
	spawn_positions = 1
	flag = HUNTMASTER
	faction = MAP_FACTION
	department = DEPARTMENT_LODGE
	department_flag = LODGE
	supervisors = "the lodge matriarch"
	difficulty = "Hard."
	selection_color = "#9b633e"
	account_allowed = 0
	create_record = 1
	wage = WAGE_NONE
	outfit_type = /decl/hierarchy/outfit/job/off_colony/hunt_master
	health_modifier = 15

	perks = list(PERK_BUTCHER, PERK_MASTER_HERBALIST, PERK_GREENTHUMB)
	access = list(access_huntmaster, access_hunter)

	stat_modifiers = list(
		STAT_BIO = 30,
		STAT_TGH = 20,
		STAT_ROB = 15,
		STAT_VIG = 15,
		STAT_MEC = 5,
		STAT_COG = 0
	)
	playtimerequired = 1200
	description = "You are not part of the colony, at least currently, having decided to take a shift with the local Lodge Hunters either temporarily or permanently. As the Hunt \
	Master your job is to lead your fledgling hunters on expeditions and generally work towards keeping them alive while thriving in your lodge. You are not nearly as well \
	equipped as the colony is, but special training by the Lodge has given you the ability to live off the land."

	duties = "Keep your hunters alive, ensuring they don't get killed by the various dangerous fauna.<br>\
		Ensure all of your hunters are equipped and working properly in teams.<br>\
		Make sure that relations between the lodge and the colony remain good, in particular with the prospectors."

/obj/landmark/join/start/hunt_master
	name = "Lodge Hunt Master"
	icon_state = "player-black"
	join_tag = /datum/job/off_colony_hunt_master

/datum/job/off_colony_hunter
	title = "Lodge Hunter"
	total_positions = 4
	spawn_positions = 4
	flag = LODGEHUNTER
	faction = MAP_FACTION
	department = DEPARTMENT_LODGE
	department_flag = LODGE
	difficulty = "Hard."
	supervisors = "the hunt master"
	selection_color = "#9b633e"
	account_allowed = 0
	create_record = 1
	wage = WAGE_NONE
	outfit_type = /decl/hierarchy/outfit/job/off_colony/hunter
	health_modifier = 10

	perks = list(PERK_BUTCHER)
	access = list(access_hunter)

	stat_modifiers = list(
		STAT_BIO = 20,
		STAT_TGH = 20,
		STAT_ROB = 10,
		STAT_VIG = 10,
		STAT_MEC = 5,
		STAT_COG = 0
	)

	description = "You are not part of the colony, at least currently, having decided to take a shift with the local lodge hunters either temporarily or permanently. As a Lodge Hunter \
	your primary work is both as an animal rancher and big game hunter. Expeditions should be prepared for using whatever you can craft and make with your fellow hunters. Good Lodge members \
	work as a team under the direction of the Hunt Master or if present the Lodge Matriarch. An expert Lodge Hunter reads the Lodge codex for the do's and dont's."

	duties = "Care for, feed, and raise your various animals to harvest supplies and food.<br>\
		Work with your fellow hunters to ensure you can take down dangerous fauna.<br>\
		Build and maintain a thriving lodge in the wilderness."

/obj/landmark/join/start/lodge_hunter
	name = "Lodge Hunter"
	icon_state = "player-black"
	join_tag = /datum/job/off_colony_hunter

/datum/job/off_colony_herbalist
	title = "Lodge Herbalist"
	total_positions = 2
	spawn_positions = 2
	flag = LODGEHERBALIST
	faction = MAP_FACTION
	department = DEPARTMENT_LODGE
	department_flag = LODGE
	difficulty = "Hard."
	supervisors = "the hunt master"
	selection_color = "#9b633e"
	account_allowed = 0
	create_record = 1
	wage = WAGE_NONE
	outfit_type = /decl/hierarchy/outfit/job/off_colony/herbalist
	health_modifier = 5

	perks = list(PERK_BUTCHER, PERK_MASTER_HERBALIST, PERK_GREENTHUMB)
	access = list(access_hunter)

	stat_modifiers = list(
		STAT_BIO = 40,
		STAT_MEC = 10,
		STAT_COG = 10
	)

	description = "You are not part of the colony, at least currently, having decided to take a shift with the local Lodge Hunters either temporarily or permanently. As a Lodge Herbalist \
	your primary work is both as gardener and field medic for the lodge. Expeditions should be prepared for using whatever you can craft and make with your fellow hunters. Good Lodge members \
	work as a team under the direction of the Hunt Master or if present the Lodge Matriarch. While hunters are more combat focused, your purpose as an herbalist is to attend to the medical needs of your lodge, \
	but additional skills as a crafter, gardener, and chemist are quite handy!"

	duties = "Grow plants and harvest them for their medical reagents using your primitive chem lab.<br>\
		Work as a medic for your lodge, keeping people alive and patching them up.<br>\
		Build and maintain a thriving lodge in the wilderness."

/obj/landmark/join/start/lodge_herbalist
	name = "Lodge Herbalist"
	icon_state = "player-black"
	join_tag = /datum/job/off_colony_herbalist

/datum/job/outsider
	title = "Outsider"
	total_positions = 10
	spawn_positions = 10
	flag = OUTSIDER
	faction = MAP_FACTION
	department = DEPARTMENT_INDEPENDENT
	department_flag = INDEPENDENT
	supervisors = "nobody! You're an outsider"
	selection_color = "#191919"
	account_allowed = 0
	create_record = 0
	wage = WAGE_NONE
//	minimal_access = list(access_maint_tunnels)
	outfit_type = /decl/hierarchy/outfit/job/outsider
	difficulty = "Impossible!"
	has_id = FALSE

	stat_modifiers = list(
		STAT_BIO = 5,
		STAT_TGH = 6,
		STAT_ROB = 6,
		STAT_VIG = 4,
		STAT_MEC = 8,
		STAT_COG = 2
	)

	description = "You're an outsider, disconnected from the lodge and the colony as a whole. Whether you're an exile, stranded pirate, hermit, or just the right man in the wrong place you're \
	entirely alone out here. What friends you can make and rely on should be cherished, for there are other looters and outsiders there who might be less than friendly short of giving out lead \
	and ionized laser shots. You better stake your claim, fortify a safe spot, then venture out for supplies and whatever loot you can use, sell, or stockpile. Remember, you are not protected by \
	colony law, few people with care or even raise an eyebrow if you're shot to death for whatever you're carrying."

	duties = "Choose between building a home or becoming nomadic.<br>\
		Make friends and avoid making enemies, as you're not protected like a colonist or hunter.<br>\
		Avoid dying in the dangerous wilderness alone."

/obj/landmark/join/start/outsider
	name = "Outsider"
	icon_state = "player-black"
	join_tag = /datum/job/outsider
