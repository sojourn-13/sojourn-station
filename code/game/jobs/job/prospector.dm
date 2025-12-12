/datum/job/foreman
	title = "Foreman"
	flag = FOREMAN
	head_position = 1
	department = DEPARTMENT_PROSPECTOR
	department_flag = PROSPECTORS | COMMAND
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Governor and the Iskhod Council"
	difficulty = "Hard."
	selection_color = "#97b0be"
	req_admin_notify = 1
	wage = WAGE_COMMAND
	department_account_access = TRUE
	health_modifier = 15

	disallow_species = list(FORM_SOTSYNTH, FORM_AGSYNTH, FORM_BSSYNTH, FORM_CHURCHSYNTH, FORM_NASHEF)


	outfit_type = /decl/hierarchy/outfit/job/foreman
	playtimerequired = 1200
	access = list(
		access_prospector, access_foreman, access_external_airlocks, access_eva, access_heads, access_sec_doors,
		access_RC_announce, access_keycard_auth, access_maint_tunnels, access_fence, access_medical_suits, access_heads_vault //for locating scav team dead bodies
	)

	stat_modifiers = list(
		STAT_ROB = 30,
		STAT_TGH = 30,
		STAT_VIG = 30,
		STAT_MEC = 20,
		STAT_BIO = 15
	)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

	perks = list(PERK_STALKER, PERK_PROSPECTOR_CONDITIONING)

	description = "The foreman leads the prospectors, a group of independent scavengers seeking fortune from ruins and scrap.<br>\
	Your goal is to lead your team into hostile locations and take everything of value that isn't nailed down - and the nails too!<br>\
	As potentially the youngest head of staff and the one expected to be in the most danger at all times you should be independent and cunning.<br>\
	Your work is perhaps the most dangerous within the entire colony, so good combat and survival skills are essential."

	duties = "Assemble your team of prospectors and salvagers by equipping them with whatever you can find in your prep area and elsewhere.<br>\
		Lead your team through dangerous areas and ensure they recover everything of value.<br>\
		Keep everyone alive and ensure nobody is left behind.<br>\
		Fill in any missing role on your team be it as muscle, medical, or technical support."

/obj/landmark/join/start/foreman
	name = "Foreman"
	icon_state = "player-blue-officer"
	join_tag = /datum/job/foreman

/datum/job/fence
	title = "Fence"
	flag = FENCE
	department = DEPARTMENT_PROSPECTOR
	department_flag = PROSPECTORS
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Foreman"
	difficulty = "Hard."
	selection_color = "#97b0be"
	req_admin_notify = 1
	wage = WAGE_LABOUR_HAZARD
	department_account_access = TRUE
	health_modifier = 5

	disallow_species = list(FORM_SOTSYNTH, FORM_AGSYNTH, FORM_BSSYNTH, FORM_CHURCHSYNTH, FORM_NASHEF)


	outfit_type = /decl/hierarchy/outfit/job/fence
	playtimerequired = 600
	access = list(
		access_prospector, access_fence, access_external_airlocks, access_eva, access_maint_tunnels
	)

	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_TGH = 10,
		STAT_VIG = 10,
		STAT_MEC = 20,
		STAT_BIO = 15
	)

	perks = list(PERK_STALKER, PERK_MARKET_PROF)

	description = "The Fence is a master of the prospector arsenal and second-in-command to the Foreman.<br>\
	Somewhere between gunsmith and trader, your job is to mete out the finds to buyers, and to make the rusted piles of junk presentable enough for sale.<br>\
	You are a veteran prospector, one of Hogg's long timers, and you know your stuff. You're expected to help wrangle the newbies and back up the Foreman's word.<br>\
	Alongside this, you've got final say over the store from which you vend your (ill-)gotten gains.<br>\
	You should be a reasonable voice amongst the hot headed field workers - Hogg wants a profit, not a dispute with the pigs."

	duties = "Help your fellows prepare and procure everything they need for runs. \
			Keep the funds flowing. Everything is for sale if the price is right, more funds means better equipment, better equipment means safer runs. \
			Mind the shop. You're in charge of keeping prep safe from prying eyes and greedy hands.\
			Remember, you can't do your job from the inside of a cell. Rules are made to be bent, broken if you're clever - but if you get caught, it's your ass. \
			Help to keep the rowdy rookies in line. Foreman is a part time gig with fulltime stress, back the boss and help him keep the peace - You've got full authority to slap around thugs acting foolish, do what must be done."

/obj/landmark/join/start/fence
	name = "Fence"
	icon_state = "player-blue"
	join_tag = /datum/job/fence

/datum/job/salvager
	title = "Prospector"
	flag = PROSPECTOR
	department = DEPARTMENT_PROSPECTOR
	department_flag = PROSPECTORS
	faction = MAP_FACTION
	total_positions = 3
	spawn_positions = 2
	supervisors = "the Foreman"
	difficulty = "Medium."
	noob_name = "Rookie Salvager"
	alt_titles = list("Sawbones", "Junk Technician")
	//alt_perks = list("Sawbones"=list(PERK_MEDICAL_EXPERT, PERK_STALKER), "Junk Technician"=list(PERK_JUNKBORN, PERK_ROBOTICS_EXPERT))
	selection_color = "#a7bbc6"
	initial_balance = 500	//Should be enough to get by with basic meds, tools, and food round-start.
	wage = WAGE_LABOUR_HAZARD

	disallow_species = list(FORM_BSSYNTH, FORM_NASHEF)
	outfit_type = /decl/hierarchy/outfit/job/salv

	health_modifier = 5

	access = list(
		access_prospector, access_external_airlocks, access_eva, access_maint_tunnels
	)

	stat_modifiers = list(
		STAT_BIO = 15,
		STAT_MEC = 20,
		STAT_COG = 10,
		STAT_TGH = 10,
		STAT_VIG = 10,
		STAT_ROB = 10
	)
	perks = list(PERK_JUNKBORN, PERK_STALKER)

	description = "The Prospector is a seasoned scavenger and survivalist, serving as a senior member of the crew under the Fence.<br>\
	Your primary role is to venture deep into the unknown to recover valuable scrap, technology, and resources.<br>\
	You are expected to be self-sufficient and capable of handling yourself in the field, while also mentoring the Rookies.<br>\
	While you answer to the Fence and Foreman, your experience gives you a degree of autonomy in how you approach your work."

	duties = "Extract resources for your employer. Use equipment to access new areas and gain a foothold in the wilderness.<br>\
	Perform medical services on injured colleagues, from patching wounds to full field surgery.<br>\
	Leave security duties to the hired muscle unless faced with no other option."

/obj/landmark/join/start/salvager
	name = "Prospector"
	icon_state = "player-blue"
	join_tag = /datum/job/salvager

/datum/job/pro
	title = "Rookie"
	flag = ROOKIE
	department = DEPARTMENT_PROSPECTOR
	department_flag = PROSPECTORS
	faction = MAP_FACTION
	total_positions = 3
	spawn_positions = 2
	supervisors = "the Foreman"
	difficulty = "Medium."
	noob_name = "Rookie"
	alt_titles = list("Hired Muscle")
	selection_color = "#a7bbc6"
	initial_balance = 500	//Should be enough to get by with basic meds, tools, and food round start.
	wage = WAGE_LABOUR

	disallow_species = list(FORM_SOTSYNTH, FORM_AGSYNTH, FORM_CHURCHSYNTH, FORM_NASHEF)
	outfit_type = /decl/hierarchy/outfit/job/pro
	health_modifier = 10

	access = list(
		access_prospector, access_external_airlocks, access_eva, access_maint_tunnels
	)

	stat_modifiers = list(
		STAT_TGH = 20,
		STAT_VIG = 20,
		STAT_ROB = 20,
		STAT_COG = 10
	)

	perks = list(PERK_MEDICAL_EXPERT, PERK_STALKER, PERK_PROSPECTOR_CONDITIONING)

	description = "The Rookie is the newest addition to the prospector team, serving as hired muscle and general labor.<br>\
	Your job is to learn the ropes from the Prospectors and Fence while keeping the team safe from threats.<br>\
	You are effectively a meat shield and pack mule until you prove your worth.<br>\
	Listen to your superiors, watch your back, and maybe you'll survive long enough to get promoted."

	duties = "Guard your peers from hostile creatures and other dangers that cross your path.<br>\
	Use whatever measures necessary to ensure survival, but try not to soil the standing of your team.<br>\
	Help with the more general salvaging and heavy lifting."

/obj/landmark/join/start/pro
	name = "Rookie"
	icon_state = "player-blue"
	join_tag = /datum/job/pro

