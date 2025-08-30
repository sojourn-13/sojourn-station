#define CRUCIFORM_TYPE obj/item/implant/core_implant/cruciform

//Create a list of what can be created via construction ritual
GLOBAL_LIST_INIT(nt_blueprints, init_nt_blueprints())

/proc/init_nt_blueprints()
	var/list/list = list()
	for(var/blueprint_type in typesof(/datum/nt_blueprint))
		if(blueprint_type == /datum/nt_blueprint)
			continue
		if(blueprint_type == /datum/nt_blueprint/machinery)
			continue
		if(blueprint_type == /datum/nt_blueprint/mob)
			continue
		if(blueprint_type == /datum/nt_blueprint/cruciform_upgrade)
			continue
		/* - Removed do to exploits with uprooting after autolathen printing giving full prices
		if(blueprint_type == /datum/nt_blueprint/weapons)
			continue
		if(blueprint_type == /datum/nt_blueprint/health_care)
			continue*/
		var/datum/nt_blueprint/pb = new blueprint_type()
		list[pb.name] = pb
	. = list

//Create a list of what the blueprints actually make, and the materials required to make them. Blueprints list generation turns them into text format, not datums.
GLOBAL_LIST_INIT(nt_constructs, init_nt_constructs())

/proc/init_nt_constructs()
	var/list/nt_constructs = list()
	for(var/name in GLOB.nt_blueprints)
		var/datum/nt_blueprint/accessed = GLOB.nt_blueprints[name]
		nt_constructs[accessed.build_path] = accessed.materials
	. = nt_constructs

/datum/ritual/cruciform/priest/blueprint_check
	name = "Divine Guidance"
	phrase = "Dirige me in veritate tua, et doce me, quia tu es Deus salvator meus, et te sustinui tota die." //"Guide me in your truth and teach me, for you are God my Savior, and my hope is in you all day long."
	desc = "Building needs not only faith but resources as well. Find out what it takes."
	power = 5
	category = "Construction"

/datum/ritual/cruciform/priest/blueprint_check/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C, list/targets)
	var/construction_key = input("Select construction", "") as null|anything in GLOB.nt_blueprints
	var/datum/nt_blueprint/blueprint = GLOB.nt_blueprints[construction_key]
	var/list/listed_components = list()
	for(var/requirement in blueprint?.materials)
		var/atom/placeholder = requirement
		if(!ispath(placeholder))
			continue
		listed_components += list("[blueprint.materials[placeholder]] [initial(placeholder.name)]")
	to_chat(user, SPAN_NOTICE("[blueprint?.name] requires: [english_list(listed_components)]."))
	return TRUE

/datum/ritual/cruciform/priest/construction
	name = "Manifestation"
	phrase = "Omnia per ipsum facta sunt: et sine ipso factum est nihil, quod factum est." //"Through him all things were made; without him nothing was made that has been made."
	desc = "Build and expand. Shape your faith into something more sensible."
	power = 40
	category = "Construction"


/datum/ritual/cruciform/priest/construction/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C, list/targets)
	var/construction_key = null
	var/datum/nt_blueprint/blueprint = null
	var/construct_time = null
	var/turf/target_turf = null
	if(C.is_busy == TRUE)
		fail("You can only build one thing at a time.", user, C)
		return FALSE
	else
		C.is_busy = TRUE  //Has to happen before the input to avoid cheesing
		construction_key = input("Select construction", "") as null|anything in GLOB.nt_blueprints
		blueprint = GLOB.nt_blueprints[construction_key]
		target_turf = get_step(user,user.dir)

	if(!blueprint || !construction_key)
		fail("You decided not to test your faith.",user,C,targets)
		C.is_busy = FALSE
		return FALSE
	construct_time = blueprint.build_time //Has to be here to prevent runtimes
	if(!items_check(user, target_turf, blueprint))
		fail("Something is missing.",user,C,targets)
		C.is_busy = FALSE
		return FALSE
	if(target_turf.contains_dense_objects() && (blueprint.blueprint_type == "machine" || blueprint.blueprint_type == "golem"))
		fail("You can't build this here, there's something else in the way.", user, C, targets) //No more stacking 5 solidifiers
		C.is_busy = FALSE
		return FALSE

	user.visible_message(SPAN_NOTICE("You see as [user] passes their hands over something."),SPAN_NOTICE("You see your faith take physical form as you concentrate on [blueprint.name] image"))

	if(C.get_module(CRUCIFORM_FACT)) //Factorials get 25% build time reduction. Value can change if things get unbalanced with golems.
		construct_time *= 0.75

	var/obj/effect/overlay/nt_construction/effect = new(target_turf, construct_time)

	if(!do_after(user, blueprint.build_time, target_turf))
		fail("You feel something is judging you upon your impatience",user,C,targets)
		effect.failure()
		C.is_busy = FALSE
		return FALSE
	if(!items_check(user, target_turf, blueprint))
		fail("Something got stolen!",user,C,targets)
		effect.failure()
		C.is_busy = FALSE
		return FALSE

	for(var/item_type in blueprint.materials)
		var/t = locate(item_type) in target_turf.contents
		if(istype(t, /obj/item/stack))
			var/obj/item/stack/S = t
			S.use(blueprint.materials[item_type])
		else
			qdel(t)

	effect.success()
	C.is_busy = FALSE
	user.visible_message(SPAN_NOTICE("You hear a soft humming sound as [user] finishes their ritual."),SPAN_NOTICE("You take a deep breath as the divine manifestation finishes."))
	var/build_path = blueprint.build_path
	new build_path(target_turf)
	return TRUE

/datum/ritual/cruciform/priest/construction/proc/items_check(mob/user,turf/target, datum/nt_blueprint/blueprint)
	var/list/turf_contents = target.contents

	for(var/item_type in blueprint.materials)
		var/located_raw = locate(item_type) in turf_contents
		//single item check is handled there, rest of func is for stacked items or items with containers
		if(!located_raw)
			return FALSE

		var/required_amount = blueprint.materials[item_type]
        // I hope it is fast enough
        // could have initialized it in glob
		if(item_type in typesof(/obj/item/stack/))
			var/obj/item/stack/stacked = located_raw
			if(stacked.amount < required_amount)
				return FALSE
	return TRUE

/datum/ritual/cruciform/priest/acolyte/deconstruction
	name = "Uproot"
	phrase = "Dominus dedit, Dominus abstulit." //"The Lord gives, and the Lord takes away."*
	desc = "Mistakes are to be a lesson, but first we must correct it by deconstructing its form."
	power = 20
	category = "Construction"

/datum/ritual/cruciform/priest/acolyte/deconstruction/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C, list/targets)
	if(!GLOB.nt_constructs) //Makes sure the list we curated earlier actually exists
		fail("You have no idea what constitutes a church construct.",user,C,targets)
		return

	var/obj/reclaimed //Variable to be defined later as the removed construct
	var/loot //Variable to be defined later as materials resulting from deconstruction
	var/turf/target_turf = get_step(user,user.dir) //Gets the turf in front of the user

	//Find the NT Structure in front of the player
	for(reclaimed in target_turf)
		if(reclaimed.type in GLOB.nt_constructs)
			loot = GLOB.nt_constructs[reclaimed.type]
			break

	if(isnull(loot))
		fail("There is no mistake to remove here.",user,C,targets)
		return

	user.visible_message(SPAN_NOTICE("[user] places one hand on their chest, and the other stretched forward."),SPAN_NOTICE("You take back what is, returning it to what was."))

	var/obj/effect/overlay/nt_construction/effect = new(target_turf, 5 SECONDS)

	if(!do_after(user, 5 SECONDS, target_turf)) //"Sit still" timer
		fail("You feel something is judging you upon your impatience",user,C,targets)
		effect.failure()
		return

	if(QDELETED(reclaimed) || reclaimed.loc != target_turf)
		fail("It's no longer there.", user, C, targets)
		effect.failure()
		return

	//Lets spawn and drop the materials resulting from deconstruction
	for(var/obj/scrap as anything in loot)
		if(ispath(scrap, /obj/item/stack))
			var/obj/item/stack/mat = new scrap(target_turf)
			mat.amount = loot[scrap]
		else
			scrap = new scrap(target_turf)

	effect.success()
	user.visible_message(SPAN_NOTICE("Clanking of parts hit the floor as [user] finishes their prayer and the machine falls apart."),SPAN_NOTICE("Collect the evidence, and begin to atone."))

	qdel(reclaimed)
	return TRUE

/datum/nt_blueprint/
	var/name = "Report me"
	var/build_path
	var/list/materials
	var/build_time = 3 SECONDS
	var/blueprint_type = ""

/datum/nt_blueprint/canister
	name = "Biomatter Canister"
	build_path = /obj/structure/reagent_dispensers/biomatter
	materials = list(
		/obj/item/stack/material/steel = 8,
		/obj/item/stack/material/plastic = 2
	)
	blueprint_type = "canister"

/datum/nt_blueprint/canister/large
	name = "Large Biomatter Canister"
	build_path = /obj/structure/reagent_dispensers/biomatter/large
	materials = list(
		/obj/item/stack/material/steel = 16,
		/obj/item/stack/material/plastic = 4,
		/obj/item/stack/material/plasteel = 2
	)
	build_time = 5 SECONDS


//For making mobs
/datum/nt_blueprint/mob
	blueprint_type = "golem"

/datum/nt_blueprint/mob/rook
	name = "Rook Golem"
	build_path = /mob/living/carbon/superior/robot/church/rook
	materials = list(
		/obj/item/stack/material/steel = 15,
		/obj/item/stack/material/plastic = 10,
		/obj/item/stack/material/gold = 16,
		/obj/item/stack/cable_coil = 15,
		/obj/item/stack/material/plasteel = 5,
		/obj/item/stack/material/biomatter = 30,
		/obj/item/stack/material/diamond = 1,
		/obj/item/book/ritual/cruciform = 1 //Limiting factor
	)
	build_time = 20 SECONDS //We dont want to make these in combat

/datum/nt_blueprint/mob/knight
	name = "Knight Golem"
	build_path = /mob/living/carbon/superior/robot/church/knight
	materials = list(
		/obj/item/stack/material/steel = 15,
		/obj/item/stack/material/plastic = 10,
		/obj/item/stack/material/gold = 10,
		/obj/item/stack/cable_coil = 15,
		/obj/item/stack/material/plasteel = 5,
		/obj/item/stack/material/biomatter = 20,
		/obj/item/tool/sword/nt/longsword = 1,
		/obj/item/book/ritual/cruciform = 1 //Limiting factor
	)
	build_time = 20 SECONDS //We dont want to make these in combat

/datum/nt_blueprint/mob/pawn
	name = "Pawn Golem"
	build_path = /mob/living/carbon/superior/robot/church/pawm
	materials = list(
		/obj/item/stack/material/steel = 10,
		/obj/item/stack/material/plastic = 5,
		/obj/item/stack/material/silver = 8,
		/obj/item/stack/cable_coil = 15,
		/obj/item/stack/material/plasteel = 3,
		/obj/item/stack/material/biomatter = 15,
		/obj/item/tool/sword/nt/longsword = 1,
		/obj/item/tool/sword/nt/shortsword = 1,
		/obj/item/paper = 1 //Limiting factor
	)
	build_time = 1 SECONDS //We do want to mid-comat summan these

/datum/nt_blueprint/mob/bishop
	name = "Bishop Golem"
	build_path = /mob/living/carbon/superior/robot/church/bishop
	materials = list(
		/obj/item/stack/material/steel = 15,
		/obj/item/stack/material/plastic = 15,
		/obj/item/stack/material/gold = 8,
		/obj/item/stack/cable_coil = 15,
		/obj/item/stack/material/plasteel = 10,
		/obj/item/stack/material/biomatter = 60,
		/obj/item/book/ritual/cruciform/priest = 1 //Limiting factor
	)
	build_time = 60 SECONDS //These need a lot of prep


//For making machinery
/datum/nt_blueprint/machinery
	blueprint_type = "machine"

/datum/nt_blueprint/machinery/obelisk
	name = "Obelisk"
	build_path = /obj/machinery/power/nt_obelisk
	materials = list(
		/obj/item/stack/material/plasteel = 10,
		/obj/item/stack/material/gold = 5,
		/CRUCIFORM_TYPE = 1
	)
	build_time = 8 SECONDS

/datum/nt_blueprint/machinery/eotp
	name = "Will of the Protector"
	build_path = /obj/machinery/power/eotp
	materials = list(
		/obj/item/stack/material/plasteel = 15,
		/obj/item/stack/material/biomatter = 10,
		/obj/item/stack/material/gold = 5,
		/obj/item/stack/material/diamond = 3,
		/CRUCIFORM_TYPE = 1
	)
	build_time = 15 SECONDS

/datum/nt_blueprint/machinery/bioprinter
	name = "Biomatter Printer"
	build_path = /obj/machinery/autolathe/bioprinter
	materials = list(
		/obj/item/stack/material/steel = 10,
		/obj/item/stack/material/glass = 2,
		/obj/item/stack/material/silver = 6,
		/obj/item/storage/toolbox = 1
	)
	build_time = 5 SECONDS

/datum/nt_blueprint/machinery/solidifier
	name = "Biomatter Solidifier"
	build_path = /obj/machinery/biomatter_solidifier
	materials = list(
		/obj/item/stack/material/steel = 20,
		/obj/item/stack/material/silver = 5,
		/obj/structure/reagent_dispensers/biomatter = 1
	)
	build_time = 9 SECONDS

//Notice: Cloner blueprints got moved to cloning.dm

//generator
/datum/nt_blueprint/machinery/biogen
	name = "Biomatter Power Generator"
	build_path = /obj/machinery/multistructure/biogenerator_part/generator
	materials = list(
		/obj/item/stack/material/plasteel = 5,
		/obj/item/stack/material/gold = 5,
		/obj/item/stack/material/steel = 20,
		/obj/item/stack/material/biomatter = 5,
		/obj/structure/reagent_dispensers/biomatter = 1
	)
	build_time = 15 SECONDS

/datum/nt_blueprint/machinery/biogen_console
	name = "Biomatter Power Generator: Console"
	build_path = /obj/machinery/multistructure/biogenerator_part/console
	materials = list(
		/obj/item/stack/material/glass = 5,
		/obj/item/stack/material/plastic = 15,
		/obj/item/stack/cable_coil = 30 //! TODO: proper recipe
	)
	build_time = 6 SECONDS

/datum/nt_blueprint/machinery/biogen_port
	name = "Biomatter Power Generator: Port"
	build_path = /obj/machinery/multistructure/biogenerator_part/port
	materials = list(
		/obj/item/stack/material/steel = 10,
		/obj/item/reagent_containers/glass/bucket = 1
	)
	build_time = 5 SECONDS

//bioreactor
/datum/nt_blueprint/machinery/bioreactor_loader
	name = "Biomatter Reactor: Loader"
	build_path = /obj/machinery/multistructure/bioreactor_part/loader
	materials = list(
		/obj/item/stack/material/steel = 10,
		/obj/item/stack/material/silver = 3,
		/obj/item/stack/material/glass = 2,
		/obj/structure/reagent_dispensers/biomatter = 1
	)
	build_time = 8 SECONDS

/datum/nt_blueprint/machinery/bioreactor_unloader
	name = "Biomatter Reactor: Unloader" //Basically a hopper
	build_path = /obj/machinery/multistructure/bioreactor_part/unloader
	materials = list(
		/obj/item/stack/material/steel = 10
	)
	build_time = 2 SECONDS

/datum/nt_blueprint/machinery/bioreactor_metrics
	name = "Biomatter Reactor: Metrics"
	build_path = /obj/machinery/multistructure/bioreactor_part/console
	materials = list(
		/obj/item/stack/material/steel = 2,
		/obj/item/stack/material/silver = 5,
		/obj/item/stack/material/glass = 4,
		/obj/item/stack/cable_coil = 30 //! TODO: proper recipe
	)
	build_time = 7 SECONDS

/datum/nt_blueprint/machinery/bioreactor_port
	name = "Biomatter Reactor: Port"
	build_path = /obj/machinery/multistructure/bioreactor_part/bioport
	materials = list(
		/obj/item/stack/material/silver = 5,
		/obj/item/reagent_containers/glass/bucket = 1
	)
	build_time = 6 SECONDS


/datum/nt_blueprint/machinery/platform
	name = "Biomatter Reactor: Bioreactor Platform"
	build_path = /obj/machinery/multistructure/bioreactor_part/platform
	materials = list(
		/obj/item/stack/material/steel = 10,
		/obj/item/stack/rods = 2
	)
	build_time = 8 SECONDS

/datum/nt_blueprint/machinery/bioreactor_platform
	name = "Biomatter Reactor: Biomatter Canister Platform"
	build_path = /obj/machinery/multistructure/bioreactor_part/biotank_platform
	materials = list(
		/obj/item/stack/material/steel = 10,
		/obj/item/stack/material/plastic = 4,
		/obj/item/stack/tile/floor = 1
	)
	build_time = 8 SECONDS

/datum/nt_blueprint/machinery/door_silver
	name = "Common Door"
	build_path = /obj/machinery/door/holy
	materials = list(
		/obj/item/stack/material/steel = 5,
		/obj/item/stack/material/biomatter = 20,
		/obj/item/stack/material/silver = 2,
		/obj/item/stack/material/gold = 1
	)
	build_time = 8 SECONDS

/datum/nt_blueprint/machinery/door_gold
	name = "Clergy Door"
	build_path = /obj/machinery/door/holy/preacher
	materials = list(
		/obj/item/stack/material/steel = 5,
		/obj/item/stack/material/biomatter = 20,
		/obj/item/stack/material/gold = 3
	)
	build_time = 8 SECONDS

/datum/nt_blueprint/machinery/door_public
	name = "Public Door"
	build_path = /obj/machinery/door/holy/public
	materials = list(
		/obj/item/stack/material/steel = 5,
		/obj/item/stack/material/biomatter = 20,
		/obj/item/stack/material/silver = 3
	)
	build_time = 8 SECONDS

//Requires a lot but heals bluespace, for free, like really good
/datum/nt_blueprint/machinery/entropy_repairer
	name = "Absolute Nullifier"
	build_path = /obj/machinery/telesci_inhibitor/nt_bluespace_seer
	materials = list(
		/obj/item/stack/material/steel = 35,
		/obj/item/stack/material/plastic = 30,
		/obj/item/stack/material/biomatter = 120,
		/obj/item/stack/material/silver = 10,
		/obj/item/stack/material/gold = 5
	)
	build_time = 8 SECONDS


//Church implant upgrade, basiclly biomatter dumps?
/datum/nt_blueprint/cruciform_upgrade
	blueprint_type = "upgrade"

/datum/nt_blueprint/cruciform_upgrade/natures_blessing
	name = "Cruciform Natures blessing Upgrade"
	build_path = /obj/item/cruciform_upgrade/natures_blessing
	materials = list(
		/obj/item/stack/material/plasteel = 5,
		/obj/item/stack/material/biomatter = 120,
		/obj/item/stack/material/gold = 5
	)
	build_time = 8 SECONDS

/datum/nt_blueprint/cruciform_upgrade/faiths_shield
	name = "Cruciform Faiths shield Upgrade"
	build_path = /obj/item/cruciform_upgrade/faiths_shield
	materials = list(
		/obj/item/stack/material/plasteel = 15,
		/obj/item/stack/material/biomatter = 120,
		/obj/item/stack/material/gold = 5
	)
	build_time = 8 SECONDS

/datum/nt_blueprint/cruciform_upgrade/cleansing_presence
	name = "Cruciform Cleansing Presence Upgrade"
	build_path = /obj/item/cruciform_upgrade/cleansing_presence
	materials = list(
		/obj/item/stack/material/plasteel = 10,
		/obj/item/stack/material/biomatter = 70,
		/obj/item/stack/material/silver = 5
	)
	build_time = 8 SECONDS

/datum/nt_blueprint/cruciform_upgrade/martyr_gift
	name = "Cruciform Martyr Gift Upgrade"
	build_path = /obj/item/cruciform_upgrade/martyr_gift
	materials = list(
		/obj/item/stack/material/plasteel = 15,
		/obj/item/stack/material/biomatter = 120,
		/obj/item/stack/material/gold = 5,
		/obj/item/stack/material/plasma = 10
	)
	build_time = 8 SECONDS

/datum/nt_blueprint/cruciform_upgrade/wrath_of_god
	name = "Cruciform Wrath of god Upgrade"
	build_path = /obj/item/cruciform_upgrade/wrath_of_god
	materials = list(
		/obj/item/stack/material/plasteel = 10,
		/obj/item/stack/material/biomatter = 70,
		/obj/item/stack/material/silver = 5
	)
	build_time = 8 SECONDS

/datum/nt_blueprint/cruciform_upgrade/speed_of_the_chosen
	name = "Cruciform Speed of the chosen Upgrade"
	build_path = /obj/item/cruciform_upgrade/speed_of_the_chosen
	//Speed is king, so we requires a kings randsom to make!
	materials = list(
		/obj/item/stack/material/plasteel = 10,
		/obj/item/stack/material/biomatter = 70,
		/obj/item/stack/material/silver = 10,
		/obj/item/stack/material/gold = 3,
		/obj/item/stack/material/plasma = 1
	)
	build_time = 8 SECONDS

/* Removed do to exploits
//Church weapons, faster but more exspensive way for vectors to get their armorments without a disk
/datum/nt_blueprint/weapons
	blueprint_type = "item"

/datum/nt_blueprint/weapons/antebellum
	name = "\"Antebellum\" laser blunderbuss"
	build_path = /obj/item/gun/energy/plasma/antebellum
	materials = list(
		/obj/item/stack/material/plasteel = 10,
		/obj/item/stack/material/wood = 15,
		/obj/item/stack/material/biomatter = 20,
		/obj/item/stack/material/gold = 1,
		/obj/item/stack/material/silver = 2
	)
	build_time = 3 SECONDS

/datum/nt_blueprint/weapons/carpediem
	name = "\"Carpediem\" laser musket"
	build_path = /obj/item/gun/energy/carpediem
	materials = list(
		/obj/item/stack/material/plasteel = 5,
		/obj/item/stack/material/wood = 10,
		/obj/item/stack/material/glass = 3,
		/obj/item/stack/material/gold = 1,
		/obj/item/stack/material/silver = 2
	)
	build_time = 6 SECONDS

/datum/nt_blueprint/weapons/concillium
	name = "\"Concillium\" las-machinegun"
	build_path = /obj/item/gun/energy/concillium
	materials = list(
		/obj/item/stack/material/plasteel = 40,
		/obj/item/stack/material/wood = 25,
		/obj/item/stack/material/glass = 15,
		/obj/item/stack/material/gold = 5,
		/obj/item/stack/material/silver = 5
	)
	build_time = 8 SECONDS

//For making medical stuff

/datum/nt_blueprint/health_care
	blueprint_type = "item"

/datum/nt_blueprint/health_care/nt_firstaid
	name = "Absolutism Medkit"
	build_path = /obj/item/storage/firstaid/nt
	materials = list(
		/obj/item/stack/material/biomatter = 45,
		/obj/item/stack/material/plastic = 4,
		/obj/item/stack/material/glass = 2,
		/obj/item/stack/material/gold = 2,
		/obj/item/stack/material/silver = 2
	)
	build_time = 8 SECONDS

/datum/nt_blueprint/health_care/nt_ointment
	name = "Absolutism Burnpack"
	build_path = /obj/item/stack/medical/ointment/advanced/nt
	materials = list(
		/obj/item/stack/material/biomatter = 25,
		/obj/item/stack/material/plastic = 2,
		/obj/item/stack/material/glass = 1,
		/obj/item/stack/material/gold = 1,
		/obj/item/stack/material/silver = 1
	)
	build_time = 5 SECONDS

/datum/nt_blueprint/health_care/nt_bruise_pack
	name = "Absolutism Bruisepack"
	build_path = /obj/item/stack/medical/bruise_pack/advanced/nt
	materials = list(
		/obj/item/stack/material/biomatter = 25,
		/obj/item/stack/material/plastic = 2,
		/obj/item/stack/material/glass = 1,
		/obj/item/stack/material/gold = 1,
		/obj/item/stack/material/silver = 1
	)
	build_time = 5 SECONDS
*/
