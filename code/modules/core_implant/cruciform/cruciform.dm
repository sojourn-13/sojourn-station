#define OBELISK_UPDATE_TIME 5 SECONDS

var/list/disciples = list()

/obj/item/implant/core_implant/cruciform
	name = "vinculum cruciform"
	icon_state = "cruciform_green"
	desc = "A symbol and power core of every disciple. With the proper rituals, this can be implanted to induct a new believer into the Church of Absolute."
	allowed_organs = list(BP_CHEST)
	implant_type = /obj/item/implant/core_implant/cruciform
	layer = ABOVE_MOB_LAYER
	access = list(access_crematorium)
	power = 0
	max_power = 60
	power_regen = 0.8
	price_tag = 10000
	var/channeling_boost = 0  // used for the power regen boost if the wearer has the channeling perk
	var/obj/item/cruciform_upgrade/upgrade
	var/is_busy = FALSE //Whether or not the person is doing a litany that should preclude others of the same type from being used simultaneously. Currently used only for building.


/obj/item/implant/core_implant/cruciform/install(mob/living/target, organ, mob/user)
	. = ..()
	if(.)
		target.stats.addPerk(PERK_SANITYBOOST)
		target.stats.addPerk(PERK_UNFINISHED_DELIVERY)
		target.stats.addPerk(PERK_COMMUNITY_SAINTS)

/obj/item/implant/core_implant/cruciform/uninstall()
	wearer.stats.removePerk(PERK_SANITYBOOST)
	wearer.stats.removePerk(PERK_COMMUNITY_SAINTS)
	wearer.stats.removePerk(PERK_UNFINISHED_DELIVERY)
	return ..()

/obj/item/implant/core_implant/cruciform/get_mob_overlay(gender, form)
	gender = (gender == MALE) ? "m" : "f"
	return image('icons/mob/human_races/cyberlimbs/neotheology.dmi', "[icon_state]_[gender]")

/obj/item/implant/core_implant/cruciform/hard_eject()
	if(!ishuman(wearer))
		return
	var/mob/living/carbon/human/H = wearer
	name = "[H]'s Cruciform" //This is included here to make it obvious who a cruciform belonged to if it was surgically removed
	if(H.stat == DEAD)
		return
	if(!active)
		return
	H.adjustBrainLoss(60)
	H.adjustOxyLoss(200+rand(50))
	if(part)
		H.apply_damage(100+rand(150), BURN, part)
	H.apply_effect(40+rand(20), IRRADIATE, check_protection = 0)
	var/datum/effect/effect/system/spark_spread/s = new
	s.set_up(3, 1, src)
	s.start()

/obj/item/implant/core_implant/cruciform/activate()
	if(!wearer || active)
		return

	if(is_carrion(wearer))
		playsound(wearer.loc, 'sound/hallucinations/wail.ogg', 55, 1)
		wearer.gib()
		return
	..()
	add_module(new CRUCIFORM_COMMON)
	if(path == "tess")
		add_module(new CRUCIFORM_TESS)
	if(path == "lemn")
		add_module(new CRUCIFORM_LEMN)
	if(path == "mono")
		add_module(new CRUCIFORM_MONO)
	if(path == "divi")
		add_module(new CRUCIFORM_DIVI)
	if(path == "fact")
		add_module(new CRUCIFORM_FACT)
	if(path == "omni")
		add_module(new CRUCIFORM_TESS)
		add_module(new CRUCIFORM_LEMN)
		add_module(new CRUCIFORM_MONO)
		add_module(new CRUCIFORM_DIVI)
		add_module(new CRUCIFORM_FACT)
		add_module(new CRUCIFORM_CLERGY)
		add_module(new CRUCIFORM_INQUISITOR)
		add_module(new CRUCIFORM_CRUSADER)
		add_module(new CRUCIFORM_OMNI)
	update_data()
	disciples |= wearer
	return TRUE


/obj/item/implant/core_implant/cruciform/deactivate()
	if(!active || !wearer)
		return
	disciples.Remove(wearer)
	..()

/obj/item/implant/core_implant/cruciform/Process()
	..()
	if(active && round(world.time) % 5 == 0)
		remove_cyber()
	if(wearer && wearer.stat == DEAD || wearer.is_mannequin) //If were dead or a mannequin we do not actively process are cruciform
		deactivate()
	if(wearer && wearer.stats && wearer.stats.getPerk(PERK_CHANNELING) && round(world.time) % 5 == 0)
		power_regen -= channeling_boost  // Removing the previous channeling boost since the number of disciples may have changed
		//wearer.visible_message(SPAN_DANGER("Old [channeling_boost]"))
		channeling_boost = 0.2 * disciples.len  // Proportional to the number of cruciformed people on board
		power_regen += channeling_boost  // Applying the new power regeneration boost
		//wearer.visible_message(SPAN_DANGER("New [channeling_boost]"))

/obj/item/implant/core_implant/cruciform/examine(mob/user)
	..()
	var/datum/core_module/cruciform/cloning/data = get_module(CRUCIFORM_CLONING)
	if(data?.mind) // if there is cloning data and it has a mind
		to_chat(user, SPAN_NOTICE("This cruciform has been activated."))
		if(isghost(user) || (user in disciples))
			var/datum/mind/MN = data.mind
			if(MN.name) // if there is a mind and it also has a name
				to_chat(user, SPAN_NOTICE("This cruciform belongs to <b>[MN.name]</b>."))
			else
				to_chat(user, SPAN_DANGER("Something terrible has happened with this soul. Please notify somebody in charge."))
	else // no cloning data
		to_chat(user, "This cruciform has not yet been activated.")

/obj/item/implant/core_implant/cruciform/proc/transfer_soul()
	if(!wearer || !activated)
		return FALSE
	var/datum/core_module/cruciform/cloning/data = get_module(CRUCIFORM_CLONING)
	if(wearer.dna.unique_enzymes == data.dna.unique_enzymes)
		for(var/mob/M in GLOB.player_list)
			if(M.ckey == data.ckey)
				if(M.stat != DEAD)
					return FALSE
		var/datum/mind/MN = data.mind
		if(!istype(MN, /datum/mind))
			return
		MN.transfer_to(wearer)
		wearer.ckey = data.ckey
		for(var/datum/language/L in data.languages)
			wearer.add_language(L.name)
		update_data()
		if (activate())
			return TRUE


/obj/item/implant/core_implant/cruciform/proc/remove_cyber()
	if(!wearer)
		return
	for(var/obj/O in wearer)
/* //Our lore allows for church members to have synthetics so this area is commented out. -Kazkin
		if(istype(O, /obj/item/organ/external))
			var/obj/item/organ/external/R = O
			if(!BP_IS_ROBOTIC(R))
				continue

			if(R.owner != wearer)
				continue
			wearer.visible_message(SPAN_DANGER("[wearer]'s [R.name] tears off."),
			SPAN_DANGER("Your [R.name] tears off."))
			R.droplimb()
*/
//This is the function to remove excelsior implants for cruciform bearers. Should only make cruciform bearers react badly to excelsior implants. -Kaz
		if(istype(O, /obj/item/implant/excelsior))
			if(O == src)
				continue
			var/obj/item/implant/excelsior/R = O
			if(R.wearer != wearer)
				continue
			if(R.cruciform_resist)
				continue
			wearer.visible_message(SPAN_DANGER("[R.name] rips through [wearer]'s [R.part]."),\
			SPAN_DANGER("[R.name] rips through your [R.part]."))
			R.part.take_damage(rand(20,40))
			R.uninstall()
			R.malfunction = MALFUNCTION_PERMANENT
			if(ishuman(wearer))
				var/mob/living/carbon/human/H = wearer
				H.update_implants()


/obj/item/implant/core_implant/cruciform/proc/update_data()
	if(!wearer)
		return

	add_module(new CRUCIFORM_CLONING)


//////////////////////////
//////////////////////////

/obj/item/implant/core_implant/cruciform/proc/make_common()
	remove_modules(CRUCIFORM_CLERGY)
	remove_modules(CRUCIFORM_INQUISITOR)
	remove_modules(CRUCIFORM_PRIME)
	update_rituals()

/obj/item/implant/core_implant/cruciform/proc/make_vector()
	add_module(new CRUCIFORM_CLERGY)

/obj/item/implant/core_implant/cruciform/proc/make_prime()
	add_module(new CRUCIFORM_CLERGY)
	add_module(new CRUCIFORM_PRIME)

/obj/item/implant/core_implant/cruciform/proc/make_crusader()
	add_module(new CRUCIFORM_CLERGY)
	add_module(new CRUCIFORM_CRUSADER)
	if(security_clearance < CLEARANCE_COMMON)
		security_clearance = CLEARANCE_COMMON

/obj/item/implant/core_implant/cruciform/proc/remove_crusader()
	remove_modules(CRUCIFORM_CRUSADER)
	if(!wearer.stats.getPerk(PERK_CHANNELING)) //If we weren't a roundstart vector, reset us to Scalar status. If the clergy want to re-ordain or give access, they can
		remove_modules(CRUCIFORM_CLERGY)
		security_clearance = CLEARANCE_NONE //Vectors will still keep their Prime access, but I can't think of an easy way to check it and it's not a huge deal
	update_rituals()

/obj/item/implant/core_implant/cruciform/proc/make_inquisitor()
	add_module(new CRUCIFORM_CLERGY)
	add_module(new CRUCIFORM_INQUISITOR)
	security_clearance = CLEARANCE_CLERGY

/obj/item/implant/core_implant/cruciform/proc/make_apostle()
	add_module(new CRUCIFORM_TESS)
	add_module(new CRUCIFORM_LEMN)
	add_module(new CRUCIFORM_MONO)
	add_module(new CRUCIFORM_DIVI)
	add_module(new CRUCIFORM_FACT)
	add_module(new CRUCIFORM_CLERGY)
	add_module(new CRUCIFORM_INQUISITOR)
	add_module(new CRUCIFORM_CRUSADER)
	add_module(new CRUCIFORM_OMNI)
	//add_module(new /datum/core_module/cruciform/uplink())
	remove_modules(/datum/core_module/cruciform/red_light)
	security_clearance = CLEARANCE_CLERGY

	name = "omni cruciform"
	icon_state = "cruciform_omni"
	max_power += 200
	power_regen += 1

	wearer.update_implants()

/obj/item/implant/core_implant/cruciform/proc/print_glob_rituals()
	for (var/rn in GLOB.all_rituals)
		var/datum/ritual/R = GLOB.all_rituals[rn]
		to_chat(wearer, R.name)

//Path based cruciforms, these grant additional powers based on what path a cultist walks
/obj/item/implant/core_implant/cruciform/tessellate
	name = "tessellate cruciform"
	icon_state = "cruciform_blue"
	desc = "A symbol and power core of every disciple. With the proper rituals, this can be implanted to induct a new believer into the Church of Absolute."
	implant_type = /obj/item/implant/core_implant/cruciform/tessellate
	power = 0
	max_power = 60
	power_regen = 0.5
	path = "tess"

/obj/item/implant/core_implant/cruciform/lemniscate
	name = "lemniscate cruciform"
	icon_state = "cruciform_red"
	desc = "A symbol and power core of every disciple. With the proper rituals, this can be implanted to induct a new believer into the Church of Absolute."
	implant_type = /obj/item/implant/core_implant/cruciform/lemniscate
	power = 0
	max_power = 50
	power_regen = 1
	path = "lemn"

/obj/item/implant/core_implant/cruciform/monomial
	name = "monomial cruciform"
	icon_state = "cruciform_yellow"
	desc = "A symbol and power core of every disciple. With the proper rituals, this can be implanted to induct a new believer into the Church of Absolute."
	implant_type = /obj/item/implant/core_implant/cruciform/monomial
	power = 0
	max_power = 90
	power_regen = 0.2
	path = "mono"

/obj/item/implant/core_implant/cruciform/divisor
	name = "divisor cruciform"
	icon_state = "cruciform_orange"
	desc = "A symbol and power core of every disciple. With the proper rituals, this can be implanted to induct a new believer into the Church of Absolute."
	implant_type = /obj/item/implant/core_implant/cruciform/divisor
	power = 0
	max_power = 50
	power_regen = 0.4
	path = "divi"

/obj/item/implant/core_implant/cruciform/factorial
	name = "factorial cruciform"
	icon_state = "cruciform_cyan"
	desc = "A symbol and power core of every disciple. With the proper rituals, this can be implanted to induct a new believer into the Church of Absolute."
	implant_type = /obj/item/implant/core_implant/cruciform/factorial
	power = 0
	max_power = 50
	power_regen = 0.4
	path = "fact"

/obj/item/implant/core_implant/cruciform/omni
	name = "Omni-Cruciform"
	icon_state = "cruciform_omni"
	desc = "A symbol and power core of every disciple. With the proper rituals, this can be implanted to induct a new believer into the Church of Absolute."
	implant_type = /obj/item/implant/core_implant/cruciform/omni
	power = 0
	max_power = 200
	power_regen = 1
	path = "omni"
	security_clearance = CLEARANCE_CLERGY

// This is used either by Augustine or an agent sent by her that has her authority (an apostle) and should be reserved for events. -Kaz
/mob/proc/make_church_apostle()
	var/mob/living/carbon/human/user = src
	if(user.is_mannequin) //Quick return to stop them adding mages to mannequins
		return
	if(istype(user))
		var/obj/item/organ/external/chest = user.get_organ(BP_CHEST)

		if(chest)
			var/obj/item/implant/core_implant/C = new /obj/item/implant/core_implant/cruciform/omni
			C.install(src)
			C.activate()
			if(mind)
				C.install_default_modules_by_job(mind.assigned_job)
				C.access.Add(mind.assigned_job.cruciform_access)
				C.install_default_modules_by_path(mind.assigned_job)
				C.security_clearance = C.security_clearance
