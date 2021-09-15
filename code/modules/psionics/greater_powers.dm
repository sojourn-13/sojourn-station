// Greater powers - These powers should have a cost of 2-5 and have very powerful effects.
/obj/item/organ/internal/psionic_tumor/proc/psionic_weapon()
	set category = "Psionic powers"
	set name = "Psionic Weapon Construction (3)"
	set desc = "Expend three psi points to shape an oddity into a range weapon. What weapon your mind creates is entirely random, but the properties of the oddity heavily influence what it may become."
	psi_point_cost = 3

	var/obj/item/oddity/active = null
	if(usr.get_active_hand())
		if(istype(usr.get_active_hand(), /obj/item/oddity))
			active = usr.get_active_hand()
			if(!active.oddity_stats)
				to_chat(usr, "This oddity has no aspects to build a weapon from!")
				return
			var/list/LStats = active.oddity_stats
			var/obj/item/cultweaponchoice = pickweight(list(
				/obj/item/gun/energy/plasma/auretian/cult = (1 + LStats[STAT_ROB]),
				/obj/item/gun/projectile/automatic/sts/rifle/cult = (1 + LStats[STAT_VIG]),
				/obj/item/gun/energy/laser/cult = (1 + LStats[STAT_COG]),
				/obj/item/gun/projectile/automatic/greasegun/cult= (1 + LStats[STAT_TGH]),
				/obj/item/gun/energy/plasma/cassad/cult = (1 + LStats[STAT_BIO]),
				/obj/item/gun/energy/gun/martin/cult = (1 + LStats[STAT_MEC])))
			
			if(pay_power_cost(psi_point_cost))
				playsound(usr.loc, pick('sound/mecha/lowpower.ogg','sound/effects/magic/Blind.ogg','sound/effects/phasein.ogg'), 50, 1, -3)
				var/turf/T = get_turf(usr)
				do_sparks(8, 0, T)
				cultweaponchoice = new cultweaponchoice(T)
				usr.visible_message(
					SPAN_DANGER("[usr] molds and twists the [active] like clay, transforming it into [cultweaponchoice]!"),
					SPAN_DANGER("You mold and twist the [active] like clay, transforming it into [cultweaponchoice]!")
					)
				usr.drop_item()
				usr.put_in_active_hand(cultweaponchoice)
				qdel(active)
		
		else
			to_chat(usr, "You must hold an oddity in your active hand.")
	else
		to_chat(usr, "You must hold an oddity in your active hand.")

/obj/item/organ/internal/psionic_tumor/proc/psionic_melee()
	set category = "Psionic powers"
	set name = "Psionic Melee Construction (3)"
	set desc = "Expend three psi points to shape an oddity into a melee weapon. What weapon your mind creates is entirely random, but the properties of the oddity heavily influence what it may become."
	psi_point_cost = 3

	var/obj/item/oddity/active = null
	if(usr.get_active_hand())
		if(istype(usr.get_active_hand(), /obj/item/oddity))
			active = usr.get_active_hand()
			if(!active.oddity_stats)
				to_chat(usr, "This oddity has no aspects to build a weapon from!")
				return
			var/list/LStats = active.oddity_stats
			var/obj/item/cultweaponchoice = pickweight(list(
				/obj/item/tool/sword/cult = (1 + LStats[STAT_ROB]),
				/obj/item/tool/sword/machete/cult = (1 + LStats[STAT_VIG]),
				/obj/item/tool/saw/chain/cult = (1 + LStats[STAT_COG]),
				/obj/item/tool/hammer/homewrecker/cult= (1 + LStats[STAT_TGH]),
				/obj/item/tool/sword/cleaver/cult = (1 + LStats[STAT_BIO]),
				/obj/item/tool/power_fist/cult = (1 + LStats[STAT_MEC])))
				
			if(pay_power_cost(psi_point_cost))
				playsound(usr.loc, pick('sound/mecha/lowpower.ogg','sound/effects/magic/Blind.ogg','sound/effects/phasein.ogg'), 50, 1, -3)
				var/turf/T = get_turf(usr)
				do_sparks(8, 0, T)
				cultweaponchoice = new cultweaponchoice(T)
				usr.visible_message(
					SPAN_DANGER("[usr] molds and twists the [active] like clay, transforming it into [cultweaponchoice]!"),
					SPAN_DANGER("You mold and twist the [active] like clay, transforming it into [cultweaponchoice]!")
					)
				usr.drop_item()
				usr.put_in_active_hand(cultweaponchoice)
				qdel(active)
		else
			to_chat(usr, "You must hold an oddity in your active hand.")
	else
		to_chat(usr, "You must hold an oddity in your active hand.")

/obj/item/organ/internal/psionic_tumor/proc/psionic_tool()
	set category = "Psionic powers"
	set name = "Psionic Tool Creation (2)"
	set desc = "Expend two psi points to shape an oddity into a tool. What tool your mind creates is entirely random, but the properties of the oddity heavily influence what it may become."
	psi_point_cost = 2

	var/obj/item/oddity/active = null
	if(usr.get_active_hand())
		if(istype(usr.get_active_hand(), /obj/item/oddity))
			active = usr.get_active_hand()
			if(!active.oddity_stats)
				to_chat(usr, "This oddity has no aspects to build a weapon from!")
				return
			var/list/LStats = active.oddity_stats
			var/obj/item/cultweaponchoice = pickweight(list(
				/obj/item/tool/shovel/combat/cult = (1 + LStats[STAT_ROB]),
				/obj/item/tool/wrench/big_wrench/cult = (1 + LStats[STAT_VIG]),
				/obj/item/tool/multitool/advanced/cult = (1 + LStats[STAT_COG]),
				/obj/item/tool/shovel/power/cult = (1 + LStats[STAT_TGH]),
				/obj/item/tool/screwdriver/combi_driver/cult = (1 + LStats[STAT_BIO]),
				/obj/item/tool/weldingtool/advanced/cult = (1 + LStats[STAT_MEC])))
			if(pay_power_cost(psi_point_cost))
				playsound(usr.loc, pick('sound/mecha/lowpower.ogg','sound/effects/magic/Blind.ogg','sound/effects/phasein.ogg'), 50, 1, -3)
				var/turf/T = get_turf(usr)
				do_sparks(8, 0, T)
				cultweaponchoice = new cultweaponchoice(T)
				usr.visible_message(
					SPAN_DANGER("[usr] molds and twists the [active] like clay, transforming it into a [cultweaponchoice]!"),
					SPAN_DANGER("You mold and twist the [active] like clay, transforming it into a [cultweaponchoice]!")
					)
				usr.drop_item()
				usr.put_in_active_hand(cultweaponchoice)
				qdel(active)
		else
			to_chat(usr, "You must hold an oddity in your active hand.")
	else
		to_chat(usr, "You must hold an oddity in your active hand.")

/obj/item/organ/internal/psionic_tumor/proc/psychic_call()
	set category = "Psionic powers"
	set name = "Psychic Call (2)"
	set desc = "Expend two points of your psi essence to call creatures from nearby burrows. They are not inherently friendly to you. Use at your own risks."
	psi_point_cost = 2

	if(pay_power_cost(psi_point_cost))
		playsound(src.loc, 'sound/voice/shriek1.ogg', 75, 1, 8, 8)
		spawn(2)
		playsound(src.loc, 'sound/voice/shriek1.ogg', 75, 1, 8, 8)
		//Playing the sound twice will make it sound really horrible
		visible_message(SPAN_DANGER("[owner] emits a horrifying wail as nearby burrows stir to life!"))
		for (var/obj/structure/burrow/B in find_nearby_burrows())
			B.distress(TRUE)
	else
		to_chat(owner, "You lack enough psi essence to call creatures from burrows.")

/obj/item/organ/internal/psionic_tumor/proc/psychic_banish()
	set category = "Psionic powers"
	set name = "Psychic Banish (4)"
	set desc = "Expend four points of your psi essence to banish nearby creatures capable of burrowing back into the holes from whence they came. Effected creatures must be able to burrow and may \
	resist your psychic influence."
	psi_point_cost = 4

	if(pay_power_cost(psi_point_cost))
		playsound(src.loc, 'sound/voice/hiss6.ogg', 75, 1, 8, 8)
		spawn(2)
		playsound(src.loc, 'sound/voice/hiss6.ogg', 75, 1, 8, 8)
		//Playing the sound twice will make it sound really horrible
		visible_message(SPAN_DANGER("[owner] emits a haunting scream as it turns to flee, taking the nearby horde with it...."))
		for (var/obj/structure/burrow/B in find_nearby_burrows())
			B.evacuate()
	else
		to_chat(owner, "You lack enough psi essence to banish nearby creatures.")

/obj/item/organ/internal/psionic_tumor/proc/journey_to_nowhere()
	set category = "Psionic powers"
	set name = "Journey to Nowhere (5)"
	set desc = "Expend five psi points to transport yourself, whatever you are carrying, and anyone you are grabbing to the nightmare realm known as deep maintenance. You will land somewhere in the \
	tunnels, but you are not assured safety or that you will be alone once on the other side. Using this power strains the body and will weaken you for a short time."
	psi_point_cost = 5

	if(pay_power_cost(psi_point_cost))
		var/mob/living/L = get_grabbed_mob(owner)			//Grab anyone we have grabbed
		var/turf/simulated/floor/target					//this is where we are teleporting
		var/list/validtargets = list()					//list of valid tiles to teleport to

		for(var/area/A in world)						//Clumbsy, but less intensive than iterating every tile
			if(istype(A, /area/deepmaint))				//First find our deepmaint areas
				for(var/turf/simulated/floor/T in A)	//Pull a list of valid floor tiles from deepmaint
					validtargets += T					//Add them to the list
		target = pick(validtargets)						//Now we pick a target

		do_sparks(1, 0, owner.loc)							//Visual feedback before the teleport
		owner.forceMove(target)							//Moves the caster
		if(L)											//If we have a grabbed target
			do_sparks(1, 0, target.loc)						//Visual feeback before the teleport
			L.forceMove(target)							//Moves the target
			do_sparks(1, 0, target.loc)						//Visual feedback after the teleport
		do_sparks(1, 0, owner.loc)							//Visual feedback after the teleport
		owner.weakened += 10								//Moving like this is stressful and stuns you for a time.

/obj/item/organ/internal/psionic_tumor/proc/psionic_omnitool()
	set category = "Psionic powers"
	set name = "Telekinetic Omnitool (2)"
	set desc = "Expend two points of your psi essence to create an omnitool. It disappears when dropped or if it leaves your hand."
	psi_point_cost = 2
	var/stat_mec = 25
	var/stat_bio = 25
	var/stat_rob = 25

	if(pay_power_cost(psi_point_cost))
		var/obj/item/tool/psionic_omnitool/tool = new /obj/item/tool/psionic_omnitool(src, owner)
		if (owner.stats.getStat(STAT_MEC) > 32)
			stat_mec = owner.stats.getStat(STAT_MEC) * 0.8
			if (owner.stats.getStat(STAT_MEC) > 62)
				stat_mec = 50
		if (owner.stats.getStat(STAT_BIO) > 32)
			stat_bio = owner.stats.getStat(STAT_BIO) * 0.8
			if (owner.stats.getStat(STAT_BIO) > 62)
				stat_bio = 50
		if (owner.stats.getStat(STAT_ROB) > 32)
			stat_rob = owner.stats.getStat(STAT_ROB) * 0.8
			if (owner.stats.getStat(STAT_ROB) > 62)
				stat_rob = 50
		tool.tool_qualities = list(QUALITY_SCREW_DRIVING = stat_mec, QUALITY_BOLT_TURNING = stat_mec, QUALITY_DRILLING = stat_mec, QUALITY_WELDING = stat_mec, QUALITY_CAUTERIZING = stat_bio, QUALITY_PRYING = stat_mec, QUALITY_DIGGING = stat_rob, QUALITY_PULSING = stat_mec, QUALITY_WIRE_CUTTING = stat_mec, QUALITY_HAMMERING = stat_rob, QUALITY_SHOVELING = stat_rob, QUALITY_EXCAVATION = stat_rob, QUALITY_CLAMPING = stat_bio, QUALITY_RETRACTING = stat_bio, QUALITY_SAWING = stat_mec, QUALITY_BONE_SETTING = stat_bio, QUALITY_CUTTING = stat_bio, QUALITY_BONE_GRAFTING = stat_bio)
		owner.visible_message(
			"[owner] clenches their fist, electricity crackling before a telekinetic omnitool is shaped in their hand!",
			"You feel the rush of electric essence shocking your hand lightly before a telekinetic omnitool forms!"
			)
		playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
		usr.put_in_active_hand(tool)

/obj/item/organ/internal/psionic_tumor/proc/psionic_armor()
	set category = "Psionic powers"
	set name = "Psionic armor (4)"
	set desc = "Creates a set of armor from somewhere that does not exist. Anything taken off disappears and whatever clothing you are wearing when this power is used is destroyed."
	psi_point_cost = 4

	if(pay_power_cost(psi_point_cost))
		playsound(usr.loc, pick('sound/mecha/lowpower.ogg','sound/effects/magic/Blind.ogg','sound/effects/phasein.ogg'), 50, 1, -3)
		owner.visible_message(
			SPAN_DANGER("[src]'s flesh and clothing contort and shimmer, reforming into flowing, black and bronze robes!"),
			SPAN_DANGER("Your flesh and clothing meld painfully, shimmering out of this reality as they are replaced with a set of armored robes!")
			)
		owner.replace_in_slot(new /obj/item/clothing/shoes/occultgreaves, slot_shoes, skip_covering_check = TRUE)
		owner.replace_in_slot(new /obj/item/clothing/suit/space/occultist, slot_wear_suit, skip_covering_check = TRUE)
		owner.replace_in_slot(new /obj/item/clothing/gloves/occultgloves, slot_gloves, skip_covering_check = TRUE)
		owner.replace_in_slot(new /obj/item/clothing/head/space/occulthood, slot_head, skip_covering_check = TRUE)
