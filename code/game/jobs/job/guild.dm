//Cargo
/datum/job/merchant
	title = "Surface Operations Manager"
	flag = MERCHANT
	department = DEPARTMENT_LSS
	head_position = TRUE
	aster_guild_member = TRUE
	department_flag = LSS | COMMAND
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Nadezhda Council"
	difficulty = "Medium."
	selection_color = "#b3a68c"
	wage = WAGE_COMMAND	//SOM now gets paid the money moola muh [redacted] -Kaz
	access = list(
		access_maint_tunnels, access_mailsorting, access_cargo, access_cargo_bot, access_merchant, access_mining,
		access_heads, access_mining_station, access_RC_announce, access_keycard_auth, access_sec_doors,
		access_eva, access_external_airlocks, access_hydroponics, access_bar, access_kitchen, access_theatre, access_heads_vault
	)
	disallow_species = list(FORM_SOTSYNTH, FORM_AGSYNTH, FORM_BSSYNTH, FORM_CHURCHSYNTH, FORM_NASHEF)

	ideal_character_age = 40
	minimum_character_age = 25
	playtimerequired = 1200
	health_modifier = 5

	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_COG = 20,
		STAT_MEC = 15,
		STAT_VIG = 10
	)
	description = "The Surface Operations Manager coordinates the affairs of the local branch of Lonestar Shipping Solutions.<br>\
Your main objective, naturally, is to make as much money as you can. Purchase and acquire goods and sell them on for a profit.<br>\
Your Cargo Technicians will handle most of the grunt work and your Miners will acquire minerals. They are capable - utilize them well.<br>\
The vendors found throughout the colony are also operated by your organization. They make you money - ensure they are functional and well-stocked.<br>\
There is a market for contraband and more unscrupulous services. Venturing into this area may prove profitable, but not without a risk.<br>\
You do not receive a salary, but can fund yourself from the company account. Strike a balance between the needs of yourself and the wider company."

	duties = "Keep the crew supplied with anything they might need - for a healthy profit.<br>\
Buy up valuable items from scavengers and make a profit reselling them.<br>\
Deploy your mining staff to harvest matter and materials.<br>\
Counsel the council on directing the colony towards profitable opportunities."

	software_on_spawn = list(///datum/computer_file/program/supply,
							 ///datum/computer_file/program/deck_management,
							 /datum/computer_file/program/trade,
							 /datum/computer_file/program/scanner,
							 /datum/computer_file/program/wordprocessor,
							 /datum/computer_file/program/reports)

	outfit_type = /decl/hierarchy/outfit/job/cargo/merchant

	perks = list(PERK_TIMEISMONEY, PERK_MARKET_PROF, PERK_BARTENDER, PERK_CHEM_CONTRABAND)

/obj/landmark/join/start/merchant
	name = "Surface Operations Manager"
	icon_state = "player-beige-officer"
	join_tag = /datum/job/merchant

/datum/job/cargo_tech
	title = "Cargo Technician"
	flag = CARGOTECH
	department = DEPARTMENT_LSS
	department_flag = LSS
	faction = MAP_FACTION
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Surface Operations Manager"
	difficulty = "Easy."
	alt_titles = list("Cargo Specialist", "Lonestar Sales Technician", "Lonestar Retail Assistant")
	selection_color = "#c3b9a6"
	wage = WAGE_LABOUR_DUMB
	department_account_access = TRUE
	outfit_type = /decl/hierarchy/outfit/job/cargo/cargo_tech

	disallow_species = list(FORM_BSSYNTH)


	access = list(
		access_mailsorting, access_cargo, access_cargo_bot, access_mining,
		access_mining_station
	)

	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_TGH = 10,
		STAT_VIG = 10,
	)

	perks = list(PERK_MARKET_PROF)

	software_on_spawn = list(///datum/computer_file/program/supply,
							 ///datum/computer_file/program/deck_management,
							 /datum/computer_file/program/scanner,
							 /datum/computer_file/program/wordprocessor,
							 /datum/computer_file/program/reports)


	description = "The Cargo Technician forms the backbone of Lonestar Shipping Solutions, equal parts scavenger, loader and salesman.<br>\
Your main duty is to keep the local company branch operational and profitable. Deliver goods, take payments and orders and buy from scavengers.<br>\
In quieter times use your initiative. Visit departments to ask if there's anything they need and try to sell them unusual items.<br>\
Busted lights? Broken vendors? Offer your services for a small fee. You may also find profit in the maintenance tunnels.<br>\
Avoid the deeper tunnels unless otherwise instructed, however - this domain is hazardous and for trained mining specialists."

	duties = "Staff the front desk and be ready to process payments and orders.<br>\
	Deliver goods to departments and individuals in good time.<br>\
	Always seek other forms of profit, but do so while keeping the company in a good light."

/obj/landmark/join/start/cargo_tech
	name = "Cargo Technician"
	icon_state = "player-beige"
	join_tag = /datum/job/cargo_tech

/datum/job/mining
	title = "Lonestar Miner"
	flag = MINER
	department = DEPARTMENT_LSS
	department_flag = LSS
	faction = MAP_FACTION
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Surface Operations Manager"
	difficulty = "Easy."
	alt_titles = list("Lonestar Drill Technician", "Junior Lonestar Miner", "Lonestar Excavation Specialist")
	selection_color = "#c3b9a6"
	wage = WAGE_LABOUR_HAZARD //The miners union is stubborn
	health_modifier = 5

	disallow_species = list(FORM_BSSYNTH, FORM_CHURCHSYNTH)
	outfit_type = /decl/hierarchy/outfit/job/cargo/mining

	description = "The Miner is a professional resource procurer, acquiring valuable minerals for Lonestar Shipping Solutions.<br>\
Your primary responsibility is to descend into the deep tunnels and dig up as much ore as you can.<br>\
Accessed by elevator, the area contains an outpost with all the facilities to process said ore and deliver refined materials ready for use.<br>\
Whatever you dig up will go to the cargo department and from there on it is the responsibility of others within Lonestar to sell it.<br>\
The deep tunnels are far less dangerous than the wilderness, but pack well - disappearances are not unheard of."

	duties = "Dig up ores and minerals to be processed into usable material.<br>\
	Locate other valuables within the tunnels that may be turned into profit."

	access = list(
		access_maint_tunnels, access_mailsorting, access_mining,
		access_mining_station
	)

	perks = list(PERK_MARKET_PROF)

	stat_modifiers = list(
		STAT_ROB = 15,
		STAT_TGH = 15,
		STAT_VIG = 15,
		STAT_MEC = 15
	)

	software_on_spawn = list(///datum/computer_file/program/supply,
							 ///datum/computer_file/program/deck_management,
							 /datum/computer_file/program/wordprocessor,
							 /datum/computer_file/program/reports)

/obj/landmark/join/start/mining
	name = "Lonestar Miner"
	icon_state = "player-beige"
	join_tag = /datum/job/mining
