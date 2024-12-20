///////////////////////////////////
////////  Mecha wreckage   ////////
///////////////////////////////////


/obj/effect/decal/mecha_wreckage
	name = "Exosuit wreckage"
	desc = "Remains of some unfortunate mecha. Completely unrepairable."
	icon = 'icons/mecha/mecha.dmi'
	density = 1
	anchored = 0
	opacity = 0
	layer = TURF_LAYER + 0.6
	var/list/welder_salvage = list(/obj/item/stack/material/plasteel,/obj/item/stack/material/steel,/obj/item/stack/rods)
	var/list/wirecutters_salvage = list(/obj/item/stack/cable_coil)
	var/list/crowbar_salvage
	var/salvage_num = 5

/obj/effect/decal/mecha_wreckage/New()
	..()
	crowbar_salvage = list()

/obj/effect/decal/mecha_wreckage/ex_act(severity)
	if(severity < 2)
		spawn()
			qdel(src)

/obj/effect/decal/mecha_wreckage/bullet_act(obj/item/projectile/Proj)
	return

/obj/effect/decal/mecha_wreckage/attackby(obj/item/I, mob/user)
	var/tool_type = I.get_tool_type(user, list(QUALITY_WIRE_CUTTING, QUALITY_WELDING, QUALITY_PRYING, QUALITY_SAWING), src)
	switch(tool_type)
		if(QUALITY_WIRE_CUTTING)
			if(salvage_num <= 0 || isemptylist(wirecutters_salvage))
				to_chat(user, "You don't see anything that can be removed with [I].")
				return

			if(I.use_tool(user, src, WORKTIME_FAST, tool_type, FAILCHANCE_NORMAL, required_stat = STAT_MEC))
				var/loot_type = prob(70) ? pick(wirecutters_salvage) : null
				if(loot_type)
					var/N = new loot_type(get_turf(user))
					user.visible_message("[user] cuts [N] from [src].", "You cut [N] from [src].")
					salvage_num--
					return
				to_chat(user, "You failed to salvage anything valuable from [src].")
			return

		if(QUALITY_WELDING)
			if(salvage_num <= 0 || isemptylist(welder_salvage))
				to_chat(user, "You don't see anything that can be cut with [I].")
				return

			if(I.use_tool(user, src, WORKTIME_FAST, tool_type, FAILCHANCE_NORMAL, required_stat = STAT_MEC))
				if(type)
					var/P = pick_n_take(welder_salvage)
					var/N = new P(get_turf(user))
					user.visible_message("[user] cuts [N] from [src]", "You cut [N] from [src]", "You hear a sound of welder nearby")
					salvage_num--
					return
				to_chat(user, "You failed to salvage anything valuable from [src].")
			return

		if(QUALITY_PRYING)
			if(isemptylist(crowbar_salvage))
				to_chat(user, "You don't see anything that can be pried with [I].")
				return
			if(I.use_tool(user, src, WORKTIME_FAST, tool_type, FAILCHANCE_NORMAL, required_stat = STAT_MEC))
				var/obj/S = pick(crowbar_salvage)
				if(S)
					S.forceMove(get_turf(user))
					crowbar_salvage -= S
					user.visible_message("[user] pries [S] from [src].", "You pry [S] from [src].")
			return

		if(QUALITY_SAWING)
			to_chat(user, SPAN_NOTICE("You started to cut the mech apart..."))
			if(I.use_tool(user, src, WORKTIME_SLOW, tool_type, FAILCHANCE_NORMAL, required_stat = STAT_MEC))
				new /obj/item/stack/material/steel(get_turf(src), 1 ? 60 : 2)
				new /obj/item/stack/material/plastic(get_turf(src), 1 ? 30 : 2)
				new /obj/item/stack/material/plasteel(get_turf(src), 1 ? 20 : 2)
				new /obj/item/stack/material/glass(get_turf(src), 1 ? 10 : 2)
				new /obj/item/stack/material/refined_scrap(get_turf(src), 1 ? 30 : 2)
				to_chat(user, SPAN_NOTICE("You cut up the mech."))
				qdel(src)
			return

		if(ABORT_CHECK)
			return

	. = ..()


/obj/effect/decal/mecha_wreckage/gygax
	name = "Gygax wreckage"
	icon_state = "gygax-broken"

/obj/effect/decal/mecha_wreckage/gygax/New()
	. = ..()
	var/list/parts = list(/obj/item/mecha_parts/part/gygax_torso,
								/obj/item/mecha_parts/part/gygax_head,
								/obj/item/mecha_parts/part/gygax_left_arm,
								/obj/item/mecha_parts/part/gygax_right_arm,
								/obj/item/mecha_parts/part/gygax_left_leg,
								/obj/item/mecha_parts/part/gygax_right_leg)
	for(var/i = 0, i < 2, i++)
		if(!isemptylist(parts) && prob(40))
			var/part = pick(parts)
			welder_salvage += part
			parts -= part

/obj/effect/decal/mecha_wreckage/gygax/marshals
	name = "M.A.I.D Exosuit wreckage"
	icon_state = "maid-broken"

/obj/effect/decal/mecha_wreckage/gygax/dark
	name = "Dark Gygax wreckage"
	icon_state = "darkgygax-broken"

/obj/effect/decal/mecha_wreckage/marauder
	name = "Marauder wreckage"
	icon_state = "marauder-broken"

/obj/effect/decal/mecha_wreckage/mauler
	name = "Mauler Wreckage"
	icon_state = "mauler-broken"
	desc = "The syndicate won't be very happy about this..."

/obj/effect/decal/mecha_wreckage/seraph
	name = "Seraph wreckage"
	icon_state = "seraph-broken"

/obj/effect/decal/mecha_wreckage/ripley
	name = "Ripley wreckage"
	icon_state = "ripley-broken"

/obj/effect/decal/mecha_wreckage/ripley/New()
	. = ..()
	var/list/parts = list(/obj/item/mecha_parts/part/ripley_torso,
								/obj/item/mecha_parts/part/ripley_left_arm,
								/obj/item/mecha_parts/part/ripley_right_arm,
								/obj/item/mecha_parts/part/ripley_left_leg,
								/obj/item/mecha_parts/part/ripley_right_leg)
	for(var/i = 0, i < 2, i++)
		if(!isemptylist(parts) && prob(40))
			var/part = pick(parts)
			welder_salvage += part
			parts -= part

/obj/effect/decal/mecha_wreckage/ripley/firefighter
	name = "Firefighter wreckage"
	icon_state = "firefighter-broken"

/obj/effect/decal/mecha_wreckage/ripley/firefighter/New()
	. = ..()
	var/list/parts = list(/obj/item/mecha_parts/part/ripley_torso,
								/obj/item/mecha_parts/part/ripley_left_arm,
								/obj/item/mecha_parts/part/ripley_right_arm,
								/obj/item/mecha_parts/part/ripley_left_leg,
								/obj/item/mecha_parts/part/ripley_right_leg,
								/obj/item/clothing/suit/fire)
	for(var/i = 0, i < 2, i++)
		if(!isemptylist(parts) && prob(40))
			var/part = pick(parts)
			welder_salvage += part
			parts -= part

/obj/effect/decal/mecha_wreckage/ripley/deathripley
	name = "Death-Ripley wreckage"
	icon_state = "deathripley-broken"

/obj/effect/decal/mecha_wreckage/durand
	name = "Durand wreckage"
	icon_state = "durand-broken"

/obj/effect/decal/mecha_wreckage/durand/New()
	. = ..()
	var/list/parts = list(
								/obj/item/mecha_parts/part/durand_torso,
								/obj/item/mecha_parts/part/durand_head,
								/obj/item/mecha_parts/part/durand_left_arm,
								/obj/item/mecha_parts/part/durand_right_arm,
								/obj/item/mecha_parts/part/durand_left_leg,
								/obj/item/mecha_parts/part/durand_right_leg)
	for(var/i = 0, i < 2, i++)
		if(!isemptylist(parts) && prob(40))
			var/part = pick(parts)
			welder_salvage += part
			parts -= part

/obj/effect/decal/mecha_wreckage/phazon
	name = "Phazon wreckage"
	icon_state = "phazon-broken"

/obj/effect/decal/mecha_wreckage/greyson
	name = "greyson wreckage"
	icon = 'icons/mob/64x64.dmi'
	icon_state = "greyson_mech-broken"

/obj/effect/decal/mecha_wreckage/odysseus
	name = "Odysseus wreckage"
	icon_state = "odysseus-broken"

/obj/effect/decal/mecha_wreckage/odysseus/New()
	. = ..()
	var/list/parts = list(
								/obj/item/mecha_parts/part/odysseus_torso,
								/obj/item/mecha_parts/part/odysseus_head,
								/obj/item/mecha_parts/part/odysseus_left_arm,
								/obj/item/mecha_parts/part/odysseus_right_arm,
								/obj/item/mecha_parts/part/odysseus_left_leg,
								/obj/item/mecha_parts/part/odysseus_right_leg)
	for(var/i = 0, i < 2, i++)
		if(!isemptylist(parts) && prob(40))
			var/part = pick(parts)
			welder_salvage += part
			parts -= part

/obj/effect/decal/mecha_wreckage/hoverpod
	name = "Hover pod wreckage"
	icon_state = "engineering_pod-broken"


/obj/effect/decal/mecha_wreckage/durand/security
	name = "Old Stomper wreckage"
	icon_state = "old_durand-broken"

/obj/effect/decal/mecha_wreckage/ripley/honker
	name = "Honker wreckage"
	icon_state = "honker-broken"

/obj/effect/decal/mecha_wreckage/odysseus/mime
	name = "Mime wreckage"
	icon_state = "mime-broken"

/obj/effect/decal/mecha_wreckage/dreadnought/hephaestus
	name = "wreckage of a fancy mech"
	icon_state = "hephaestus-broken"
