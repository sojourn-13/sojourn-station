/obj/mecha/medical/odysseus
	desc = "These exosuits are developed and produced by the Soteria. (&copy; All rights reserved)."
	name = "Odysseus"
	icon_state = "odysseus"
	initial_icon = "odysseus"
	step_in = 1
	max_temperature = 15000
	price_tag = 6000
	health = 320
	wreckage = /obj/effect/decal/mecha_wreckage/odysseus
	internal_damage_threshold = 35
	deflect_chance = 15
	normal_step_energy_drain = 1
	step_energy_drain = 1
	max_equip = 5
	cargo_capacity = 1

/obj/mecha/medical/odysseus/Initialize()
	. = ..()
	hud = new /obj/item/clothing/glasses/hud/health/mech(src)
	RegisterSignal(hud, COMSIG_HUD_DELETED, PROC_REF(hud_deleted))

/obj/mecha/medical/odysseus/Destroy()
	if(hud)
		QDEL_NULL(hud)
	return ..()

/obj/mecha/medical/odysseus/moved_inside(mob/living/carbon/human/H)
	if(..())
		if(istype(H))
			if(!isnull(hud))
				if(H.glasses)
					occupant_message(SPAN_WARNING("[H.glasses] prevent you from using [src] [hud]."))
				else
					H.glasses = hud
		return 1
	else
		return 0

/obj/mecha/medical/odysseus/go_out()
	if(ishuman(occupant))
		var/mob/living/carbon/human/H = occupant
		if((H.glasses == hud) && (!isnull(hud)))
			H.glasses = null
	. = ..()

//TODO - Check documentation for client.eye and client.perspective...
/obj/item/clothing/glasses/hud/health/mech
	name = "integrated medical HUD"

/obj/item/clothing/glasses/hud/health/mech/Destroy()
	LEGACY_SEND_SIGNAL(src, COMSIG_HUD_DELETED, src)
	. = ..()

/obj/item/clothing/glasses/hud/health/mech/process_hud(var/mob/M)
	if(isnull(src))
		return
	if(!M || M.stat || !(M in view(M)))
		return
	if(!M.client)
		return
	var/client/C = M.client
	var/image/holder
	for(var/mob/living/carbon/human/patient in view(M.loc))
		if(M.see_invisible < patient.invisibility)
			continue

		holder = patient.hud_list[HEALTH_HUD]
		if(patient.stat == 2)
			holder.icon_state = "hudhealth-100"
			C.images += holder
		else
			holder.icon_state = "hud[RoundHealth((patient.health-HEALTH_THRESHOLD_CRIT)/(patient.maxHealth-HEALTH_THRESHOLD_CRIT)*100)]"
			C.images += holder

		holder = patient.hud_list[STATUS_HUD]
		if(patient.stat == 2)
			holder.icon_state = "huddead"
		else if(patient.status_flags & XENO_HOST)
			holder.icon_state = "hudxeno"
		else if(patient.has_brain_worms())
			var/mob/living/simple_animal/borer/B = patient.has_brain_worms()
			if(B.controlling)
				holder.icon_state = "hudbrainworm"
			else
				holder.icon_state = "hudhealthy"
		else
			holder.icon_state = "hudhealthy"

		C.images += holder

/obj/mecha/medical/odysseus/loaded/Initialize()
	. = ..()
	var/obj/item/mecha_parts/mecha_equipment/ME = new /obj/item/mecha_parts/mecha_equipment/tool/sleeper
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/tool/sleeper
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/tool/syringe_gun
	ME.attach(src)
