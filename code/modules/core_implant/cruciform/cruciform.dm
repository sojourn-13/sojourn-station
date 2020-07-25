#define OBELISK_UPDATE_TIME 5 SECONDS

var/list/disciples = list()

/obj/item/weapon/implant/core_implant/cruciform
	name = "vinculum cruciform"
	icon_state = "cruciform_green"
	desc = "A symbol and power core of every disciple. With the proper rituals, this can be implanted to induct a new believer into the Church of Absolute."
	allowed_organs = list(BP_CHEST)
	implant_type = /obj/item/weapon/implant/core_implant/cruciform
	layer = ABOVE_MOB_LAYER
	access = list(access_morgue, access_crematorium, access_maint_tunnels, access_hydroponics, access_nt_disciple)
	power = 60
	max_power = 60
	power_regen = 0.5
	price_tag = 10000

/obj/item/weapon/implant/core_implant/cruciform/install(mob/living/target, organ, mob/user)
	. = ..()
	if(.)
		target.stats.addPerk(/datum/perk/sanityboost)
		target.stats.addPerk(/datum/perk/unfinished_delivery)

/obj/item/weapon/implant/core_implant/cruciform/uninstall()
	wearer.stats.removePerk(/datum/perk/sanityboost)
	wearer.stats.addPerk(/datum/perk/unfinished_delivery)
	return ..()

/obj/item/weapon/implant/core_implant/cruciform/get_mob_overlay(gender, form)
	gender = (gender == MALE) ? "m" : "f"
	return image('icons/mob/human_races/cyberlimbs/neotheology.dmi', "[icon_state]_[gender]")

/obj/item/weapon/implant/core_implant/cruciform/hard_eject()
	if(!ishuman(wearer))
		return
	var/mob/living/carbon/human/H = wearer
	if(H.stat == DEAD)
		return
	H.adjustBrainLoss(55+rand(5))
	H.adjustOxyLoss(100+rand(50))
	if(part)
		H.apply_damage(100+rand(75), BURN, part)
	H.apply_effect(40+rand(20), IRRADIATE, check_protection = 0)
	var/datum/effect/effect/system/spark_spread/s = new
	s.set_up(3, 1, src)
	s.start()

/obj/item/weapon/implant/core_implant/cruciform/activate()
	if(!wearer || active)
		return

	if(wearer.mind && wearer.mind.changeling)
		playsound(wearer.loc, 'sound/hallucinations/wail.ogg', 55, 1)
		wearer.gib()
		return
	..()
	add_module(new CRUCIFORM_COMMON)
	update_data()
	disciples |= wearer
	return TRUE


/obj/item/weapon/implant/core_implant/cruciform/deactivate()
	if(!active || !wearer)
		return
	disciples.Remove(wearer)
	..()

/obj/item/weapon/implant/core_implant/cruciform/Process()
	..()
	//if(active && round(world.time) % 5 == 0)
	//	remove_cyber()
	if(wearer && wearer.stat == DEAD)
		deactivate()


/obj/item/weapon/implant/core_implant/cruciform/proc/transfer_soul()
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

/*
/obj/item/weapon/implant/core_implant/cruciform/proc/remove_cyber()
	if(!wearer)
		return
	for(var/obj/O in wearer)
		if(istype(O, /obj/item/organ/external))
			var/obj/item/organ/external/R = O
			if(!BP_IS_ROBOTIC(R))
				continue

			if(R.owner != wearer)
				continue
			wearer.visible_message(SPAN_DANGER("[wearer]'s [R.name] tears off."),
			SPAN_DANGER("Your [R.name] tears off."))
			R.droplimb()
		if(istype(O, /obj/item/weapon/implant))
			if(O == src)
				continue
			var/obj/item/weapon/implant/R = O
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
*/

/obj/item/weapon/implant/core_implant/cruciform/proc/update_data()
	if(!wearer)
		return

	add_module(new CRUCIFORM_CLONING)


//////////////////////////
//////////////////////////

/obj/item/weapon/implant/core_implant/cruciform/proc/make_common()
	remove_modules(CRUCIFORM_PRIEST)
	remove_modules(CRUCIFORM_INQUISITOR)
	remove_modules(/datum/core_module/cruciform/red_light)

/obj/item/weapon/implant/core_implant/cruciform/proc/make_priest()
	add_module(new CRUCIFORM_PRIEST)
	add_module(new CRUCIFORM_REDLIGHT)

/obj/item/weapon/implant/core_implant/cruciform/proc/make_inquisitor()
	add_module(new CRUCIFORM_PRIEST)
	add_module(new CRUCIFORM_INQUISITOR)
	//add_module(new /datum/core_module/cruciform/uplink())
	remove_modules(/datum/core_module/cruciform/red_light)

//Path based cruciforms, these grant additional powers based on what path a cultist walks
/obj/item/weapon/implant/core_implant/cruciform/tessellate
	name = "tessellate cruciform"
	icon_state = "cruciform_blue"
	desc = "A symbol and power core of every disciple. With the proper rituals, this can be implanted to induct a new believer into the Church of Absolute."
	implant_type = /obj/item/weapon/implant/core_implant/cruciform/tessellate
	power = 60
	max_power = 60
	power_regen = 0.8
	path = "tess"

/obj/item/weapon/implant/core_implant/cruciform/lemniscate
	name = "lemniscate cruciform"
	icon_state = "cruciform_red"
	desc = "A symbol and power core of every disciple. With the proper rituals, this can be implanted to induct a new believer into the Church of Absolute."
	implant_type = /obj/item/weapon/implant/core_implant/cruciform/lemniscate
	power = 50
	max_power = 50
	power_regen = 1.5
	path = "lemn"

/obj/item/weapon/implant/core_implant/cruciform/monomial
	name = "monomial cruciform"
	icon_state = "cruciform_yellow"
	desc = "A symbol and power core of every disciple. With the proper rituals, this can be implanted to induct a new believer into the Church of Absolute."
	implant_type = /obj/item/weapon/implant/core_implant/cruciform/monomial
	power = 90
	max_power = 90
	power_regen = 0.1
	path = "mono"

/obj/item/weapon/implant/core_implant/cruciform/divisor
	name = "divisor cruciform"
	icon_state = "cruciform_orange"
	desc = "A symbol and power core of every disciple. With the proper rituals, this can be implanted to induct a new believer into the Church of Absolute."
	implant_type = /obj/item/weapon/implant/core_implant/cruciform/divisor
	power = 50
	max_power = 50
	power_regen = 0.4
	path = "divi"