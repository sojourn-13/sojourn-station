//cleansed 9/15/2012 17:48

/*
CONTAINS:
MATCHES
CIGARETTES
CIGARS
SMOKING PIPES
CHEAP LIGHTERS
ZIPPO

CIGARETTE PACKETS ARE IN FANCY.DM
*/

//For anything that can light stuff on fire
/obj/item/weapon/flame
	var/lit = 0
	heat = 1670

/obj/item/weapon/flame/is_hot()
	if (lit)
		return heat

/proc/isflamesource(A)
	if(istype(A, /obj/item))
		var/obj/item/I = A
		if(QUALITY_WELDING in I.tool_qualities)
			return TRUE
		if(QUALITY_CAUTERIZING in I.tool_qualities)
			return TRUE
		if (I.is_hot())
			return TRUE
	if(istype(A, /obj/item/weapon/flame))
		var/obj/item/weapon/flame/F = A
		return (F.lit)
	if(istype(A, /obj/item/device/assembly/igniter))
		return TRUE
	return FALSE

///////////
//MATCHES//
///////////
/obj/item/weapon/flame/match
	name = "match"
	desc = "A simple match stick, used for lighting fine smokables."
	icon = 'icons/obj/cigarettes.dmi'
	icon_state = "match_unlit"
	var/burnt = 0
	var/smoketime = 5
	w_class = ITEM_SIZE_TINY
	origin_tech = list(TECH_MATERIAL = 1)
	slot_flags = SLOT_EARS
	attack_verb = list("burnt", "singed")
	preloaded_reagents = list("sulfur" = 3, "potassium" = 3, "hydrazine" = 3, "carbon" = 5)

/obj/item/weapon/flame/match/Process()
	if(isliving(loc))
		var/mob/living/M = loc
		M.IgniteMob()
	var/turf/location = get_turf(src)
	smoketime--
	if(smoketime < 1)
		burn_out()
		return
	if(location)
		location.hotspot_expose(700, 5)
		return

/obj/item/weapon/flame/match/dropped(mob/user as mob)
	//If dropped, put ourselves out
	//not before lighting up the turf we land on, though.
	if(lit)
		spawn(0)
			var/turf/location = src.loc
			if(istype(location))
				location.hotspot_expose(700, 5)
			burn_out()
	return ..()

/obj/item/weapon/flame/match/proc/burn_out()
	lit = 0
	burnt = 1
	tool_qualities = null
	damtype = "brute"
	icon_state = "match_burnt"
	item_state = "cigoff"
	name = "burnt match"
	desc = "A match. This one has seen better days."
	STOP_PROCESSING(SSobj, src)

//////////////////
//FINE SMOKABLES//
//////////////////
/obj/item/clothing/mask/smokable
	name = "smokable item"
	desc = "You're not sure what this is. You should probably ahelp it."
	body_parts_covered = 0
	var/lit = 0
	var/icon_on
	var/icon_off
	var/type_butt = null
	var/chem_volume = 0
	var/smoketime = 0
	var/quality_multiplier = 1 // Used for sanity and insight gain
	var/matchmes = "USER lights NAME with FLAME"
	var/lightermes = "USER lights NAME with FLAME"
	var/zippomes = "USER lights NAME with FLAME"
	var/weldermes = "USER lights NAME with FLAME"
	var/ignitermes = "USER lights NAME with FLAME"
//	preloaded_reagents = list("nicotine" = 5)

/obj/item/clothing/mask/smokable/Initialize()
	reagent_flags |= NO_REACT // so it doesn't react until you light it
	// Make the cigarrete a chemical holder of given volume before preloaded_reagents are spawned in
	create_reagents(chem_volume)
	. = ..()

/obj/item/clothing/mask/smokable/Process()
	var/turf/location = get_turf(src)
	smoketime--
	if(smoketime < 0)
		die()
		return
	if(location)
		location.hotspot_expose(700, 5)
	var/mob/living/carbon/human/C = loc
	if(istype(C))
		C.sanity.onSmoke(src)
	if(smoketime % 10 == 0)
		if(reagents && reagents.total_volume) // check if it has any reagents at all
			if(ishuman(loc))
				if (src == C.wear_mask && C.check_has_mouth()) // if it's in the human/monkey mouth, transfer reagents to the mob
					reagents.trans_to_mob(C, REM, CHEM_INGEST, 0.2) // Most of it is not inhaled... balance reasons.
			else // else just remove some of the reagents
				reagents.remove_any(REM)

/obj/item/clothing/mask/smokable/proc/light(var/flavor_text = "[usr] lights the [name].")
	if(!src.lit)
		src.lit = 1
		damtype = "fire"
		if(reagents.get_reagent_amount("plasma")) // the plasma explodes when exposed to fire
			var/datum/effect/effect/system/reagents_explosion/e = new()
			e.set_up(round(reagents.get_reagent_amount("plasma") / 2.5, 1), get_turf(src), 0, 0)
			e.start()
			qdel(src)
			return
		if(reagents.get_reagent_amount("fuel")) // the fuel explodes, too, but much less violently
			var/datum/effect/effect/system/reagents_explosion/e = new()
			e.set_up(round(reagents.get_reagent_amount("fuel") / 5, 1), get_turf(src), 0, 0)
			e.start()
			qdel(src)
			return
		reagent_flags &= ~NO_REACT // allowing reagents to react after being lit
		reagents.handle_reactions()
		icon_state = icon_on
		item_state = icon_on
		update_wear_icon()
		var/turf/T = get_turf(src)
		T.visible_message(flavor_text)
		set_light(2, 0.25, COLOR_LIGHTING_ORANGE_DARK)
		START_PROCESSING(SSobj, src)

/obj/item/clothing/mask/smokable/proc/die(var/nomessage = 0)
	var/turf/T = get_turf(src)
	set_light(0)
	if (type_butt)
		var/obj/item/butt = new type_butt(T)
		transfer_fingerprints_to(butt)
		if(ismob(loc))
			var/mob/living/M = loc
			if (!nomessage)
				to_chat(M, SPAN_NOTICE("Your [name] goes out."))
			M.remove_from_mob(src) //un-equip it so the over-lays can update
			M.update_inv_wear_mask(0)
			M.update_inv_l_hand(0)
			M.update_inv_r_hand(1)
		STOP_PROCESSING(SSobj, src)
		qdel(src)
	else
		new /obj/effect/decal/cleanable/ash(T)
		if(ismob(loc))
			var/mob/living/M = loc
			if (!nomessage)
				to_chat(M, SPAN_NOTICE("Your [name] goes out, and you empty the ash."))
			lit = 0
			icon_state = icon_off
			item_state = icon_off
			update_wear_icon()
		STOP_PROCESSING(SSobj, src)

/obj/item/clothing/mask/smokable/attackby(obj/item/weapon/W as obj, mob/user as mob)
	..()
	if(isflamesource(W))
		var/text = matchmes
		if(istype(W, /obj/item/weapon/flame/match))
			playsound(src, 'sound/items/smoking.ogg', 20, 1, 1)
			text = matchmes
		else if(istype(W, /obj/item/weapon/flame/lighter/zippo))
			playsound(src, 'sound/items/smoking.ogg', 20, 1, 1)
			text = zippomes
		else if(istype(W, /obj/item/weapon/flame/lighter))
			playsound(src, 'sound/items/smoking.ogg', 20, 1, 1)
			text = lightermes
		else if(istype(W, /obj/item/weapon/tool/weldingtool))
			playsound(src, 'sound/items/smoking.ogg', 20, 1, 1)
			text = weldermes
		else if(istype(W, /obj/item/device/assembly/igniter))
			playsound(src, 'sound/items/smoking.ogg', 20, 1, 1)
			text = ignitermes
		text = replacetext(text, "USER", "[user]")
		text = replacetext(text, "NAME", "[name]")
		text = replacetext(text, "FLAME", "[W.name]")
		light(text)

/obj/item/clothing/mask/smokable/attack(var/mob/living/M, var/mob/living/user, def_zone)
	if(istype(M) && M.on_fire)
		user.do_attack_animation(M)
		light(SPAN_NOTICE("\The [user] coldly lights the \the [src] with the burning body of \the [M]."))
		return 1
	else
		return ..()



////////////////
// CIGARETTES //
////////////////
/obj/item/clothing/mask/smokable/cigarette
	name = "Roach Eyes cigarette"
	desc = "A roll of tobacco and nicotine."
	icon_state = "roachoff"
	throw_speed = 0.5
	item_state = "cigoff"
	w_class = ITEM_SIZE_TINY
	slot_flags = SLOT_EARS | SLOT_MASK
	attack_verb = list("burnt", "singed")
	icon_on = "roachon"  //Note - these are in masks.dmi not in cigarette.dmi
	icon_off = "roachoff"
	type_butt = /obj/item/trash/cigbutt
	chem_volume = 20
	smoketime = 360
	preloaded_reagents = list("nicotine" = 5)
	matchmes = "<span class='notice'>USER lights their NAME with their FLAME.</span>"
	lightermes = "<span class='notice'>USER manages to light their NAME with FLAME.</span>"
	zippomes = "<span class='rose'>With a flick of their wrist, USER lights their NAME with their FLAME.</span>"
	weldermes = "<span class='notice'>USER casually lights the NAME with FLAME.</span>"
	ignitermes = "<span class='notice'>USER fiddles with FLAME, and manages to light their NAME.</span>"

/obj/item/clothing/mask/smokable/cigarette/ishimura
	name = "Ishimura Special cigarette"
	icon_state = "ishimuraoff"
	icon_on = "ishimuraon"
	icon_off = "ishimuraoff"
	type_butt = /obj/item/trash/cigbutt/ishimura
	preloaded_reagents = list("nicotine" = 5, "ishispec" = 5)

/obj/item/clothing/mask/smokable/cigarette/tannhauser
	name = "Tannhauser Gate cigarette"
	icon_state = "tannhauseroff"
	icon_on = "tannhauseron"
	icon_off = "tannhauseroff"
	type_butt = /obj/item/trash/cigbutt/tannhauser
	preloaded_reagents = list("nicotine" = 5, "sodiumchloride" = 5)

/obj/item/clothing/mask/smokable/cigarette/brouzouf
	name = "Brouzouf Message cigarette"
	icon_state = "brouzoufoff"
	icon_on = "brouzoufon"
	icon_off = "brouzoufoff"
	type_butt = /obj/item/trash/cigbutt/brouzouf
	preloaded_reagents = list("nicotine" = 5, "tea" = 5)

/obj/item/clothing/mask/smokable/cigarette/frozen
	name = "\improper Frozen Nova cigarette"
	icon_state = "frozenoff"
	icon_on = "frozenon"
	icon_off = "frozenoff"
	type_butt = /obj/item/trash/cigbutt/frozen
	preloaded_reagents = list("nicotine" = 5, "coffee" = 5)

/obj/item/clothing/mask/smokable/cigarette/shodan
	name = "\improper Shodans cigarette"
	icon_state = "shodanoff"
	icon_on = "shodanon"
	icon_off = "shodanoff"
	type_butt = /obj/item/trash/cigbutt/shodan
	preloaded_reagents = list("nicotine" = 5, "greentea" = 5)

/obj/item/clothing/mask/smokable/cigarette/toha
	name = "\improper TOHA Heavy Industries cigarette"
	icon_state = "tohaoff"
	icon_on = "tohaon"
	icon_off = "tohaoff"
	type_butt = /obj/item/trash/cigbutt/toha
	preloaded_reagents = list("nicotine" = 5, "honey" = 5)

/obj/item/clothing/mask/smokable/cigarette/fortress
	name = "\improper Fortress Classic cigarette"
	icon_state = "cigoff"
	icon_on = "cigon"
	icon_off = "cigoff"
	type_butt = /obj/item/trash/cigbutt/fortress
	preloaded_reagents = list("nicotine" = 5, "tonic" = 5)

/obj/item/clothing/mask/smokable/cigarette/fortressred
	name = "\improper Fortress RED light cigarette"
	icon_state = "cigoff"
	icon_on = "cigon"
	icon_off = "cigoff"
	type_butt = /obj/item/trash/cigbutt/fortressred
	preloaded_reagents = list("nicotine" = 2, "cherryjelly" = 8)

/obj/item/clothing/mask/smokable/cigarette/fortressblue
	name = "\improper Fortress BLU menthol cigarette"
	icon_state = "cigoff"
	icon_on = "cigon"
	icon_off = "cigoff"
	type_butt = /obj/item/trash/cigbutt/fortressblue
	preloaded_reagents = list("nicotine" = 5,  "mint" = 5)

/obj/item/clothing/mask/smokable/cigarette/khi
	name = "\improper Kitsuhana Singularity cigarette"
	icon_state = "khioff"
	icon_on = "khion"
	icon_off = "khioff"
	type_butt = /obj/item/trash/cigbutt/khi
	preloaded_reagents = list("mindbreaker" = 5, "serotrotium" = 5, "impedrezene" = 5, "space_drugs" = 5)

/obj/item/clothing/mask/smokable/cigarette/attackby(obj/item/weapon/W as obj, mob/user as mob)
	..()

	if(istype(W, /obj/item/weapon/melee/energy/sword))
		var/obj/item/weapon/melee/energy/sword/S = W
		if(S.active)
			light(SPAN_WARNING("[user] swings their [W], barely missing their nose. They light their [name] in the process."))

	return

/obj/item/clothing/mask/smokable/cigarette/afterattack(obj/item/weapon/reagent_containers/glass/glass, mob/user as mob, proximity)
	..()
	if(!proximity)
		return
	if(istype(glass)) //you can dip cigarettes into beakers
		var/transfered = glass.reagents.trans_to_obj(src, chem_volume)
		if(transfered)	//if reagents were transfered, show the message
			to_chat(user, SPAN_NOTICE("You dip \the [src] into \the [glass]."))
		else			//if not, either the beaker was empty, or the cigarette was full
			if(!glass.reagents.total_volume)
				to_chat(user, SPAN_NOTICE("[glass] is empty."))
			else
				to_chat(user, SPAN_NOTICE("[src] is full."))

/obj/item/clothing/mask/smokable/cigarette/attack_self(mob/user as mob)
	if(lit == 1)
		user.visible_message(SPAN_NOTICE("[user] calmly drops and treads on the lit [src], putting it out instantly."))
		die(1)
	return ..()

////////////
// CIGARS //
////////////
/obj/item/clothing/mask/smokable/cigarette/cigar
	name = "premium cigar"
	desc = "A brown roll of tobacco and... well, you're not quite sure. This thing's huge!"
	icon_state = "cigar2off"
	icon_on = "cigar2on"
	icon_off = "cigar2off"
	type_butt = /obj/item/trash/cigbutt/cigarbutt
	throw_speed = 0.5
	item_state = "cigaroff"
	smoketime = 800
	chem_volume = 25
	preloaded_reagents = list("nicotine" = 14)
	quality_multiplier = 2
	matchmes = "<span class='notice'>USER lights their NAME with their FLAME.</span>"
	lightermes = "<span class='notice'>USER manages to offend their NAME by lighting it with FLAME.</span>"
	zippomes = "<span class='rose'>With a flick of their wrist, USER lights their NAME with their FLAME.</span>"
	weldermes = "<span class='notice'>USER insults NAME by lighting it with FLAME.</span>"
	ignitermes = "<span class='notice'>USER fiddles with FLAME, and manages to light their NAME with the power of science.</span>"

/obj/item/clothing/mask/smokable/cigarette/cigar/cohiba
	name = "\improper Cohiba Robusto cigar"
	desc = "There's little more you could want from a cigar."
	icon_state = "cigar2off"
	icon_on = "cigar2on"
	icon_off = "cigar2off"

/obj/item/clothing/mask/smokable/cigarette/cigar/havana
	name = "premium havanian cigar"
	desc = "A cigar fit for only the best of the best."
	icon_state = "cigar2off"
	icon_on = "cigar2on"
	icon_off = "cigar2off"
	smoketime = 1100
	chem_volume = 35
	preloaded_reagents = list("nicotine" = 20)
	quality_multiplier = 3

/obj/item/trash/cigbutt
	name = "Roach Eyes cigarette butt"
	desc = "A decayed cigarette butt."
	icon = 'icons/inventory/face/icon.dmi'
	icon_state = "roachbutt"
	w_class = ITEM_SIZE_TINY
	slot_flags = SLOT_EARS
	matter = list(MATERIAL_BIOMATTER = 1)
	throwforce = 1

/obj/item/trash/cigbutt/ishimura
	name = "Ishimura Special cigarette butt"
	icon_state = "ishimurabutt"

/obj/item/trash/cigbutt/tannhauser
	name = "Tannhauser Gate cigarette butt"
	icon_state = "tannhauserbutt"

/obj/item/trash/cigbutt/brouzouf
	name = "Brouzouf Message cigarette butt"
	icon_state = "brouzoufbutt"

/obj/item/trash/cigbutt/shodan
	name = "Shodans cigarette butt"
	icon_state = "shodanbutt"

/obj/item/trash/cigbutt/toha
	name = "TOHA Heavy Industries cigarette butt"
	icon_state = "tohabutt"

/obj/item/trash/cigbutt/frozen
	name = "Frozen Nova cigarette butt"
	icon_state = "frozenbutt"

/obj/item/trash/cigbutt/fortress
	name = "Fortress Classic cigarette butt"
	icon_state = "cigbutt"

/obj/item/trash/cigbutt/fortressred
	name = "Fortress RED menthols cigarette butt"
	icon_state = "cigbutt"

/obj/item/trash/cigbutt/fortressblue
	name = "Fortress BLU light cigarette butt"
	icon_state = "cigbutt"

/obj/item/trash/cigbutt/khi
	name = "KHI cigarette butt"
	icon_state = "khibutt"

/obj/item/trash/cigbutt/New()
	..()
	pixel_x = rand(-10,10)
	pixel_y = rand(-10,10)
	transform = turn(transform,rand(0,360))

/obj/item/trash/cigbutt/cigarbutt
	name = "cigar butt"
	desc = "A decayed cigar butt."
	icon_state = "cigarbutt"

/////////////////
//SMOKING PIPES//
/////////////////
/obj/item/clothing/mask/smokable/pipe
	name = "smoking pipe"
	desc = "A meerschaum pipe made for fine smoking."
	icon_state = "pipeoff"
	item_state = "pipeoff"
	icon_on = "pipeon"  //Note - these are in masks.dmi
	icon_off = "pipeoff"
	smoketime = 0
	chem_volume = 50
	preloaded_reagents = list("nicotine" = 1)
	matchmes = "<span class='notice'>USER lights their NAME with their FLAME.</span>"
	lightermes = "<span class='notice'>USER manages to light their NAME with FLAME.</span>"
	zippomes = "<span class='rose'>With much care, USER lights their NAME with their FLAME.</span>"
	weldermes = "<span class='notice'>USER recklessly lights NAME with FLAME.</span>"
	ignitermes = "<span class='notice'>USER fiddles with FLAME, and manages to light their NAME with the power of science.</span>"
	quality_multiplier = 2 // Fancy!

/obj/item/clothing/mask/smokable/pipe/New()
	..()
	name = "empty [initial(name)]"

/obj/item/clothing/mask/smokable/pipe/light(var/flavor_text = "[usr] lights the [name].")
	if(!src.lit && src.smoketime)
		src.lit = 1
		damtype = "fire"
		icon_state = icon_on
		item_state = icon_on
		var/turf/T = get_turf(src)
		T.visible_message(flavor_text)
		START_PROCESSING(SSobj, src)
		update_wear_icon()

/obj/item/clothing/mask/smokable/pipe/attack_self(mob/user as mob)
	if(lit == 1)
		user.visible_message(SPAN_NOTICE("[user] puts out [src]."), SPAN_NOTICE("You put out [src]."))
		lit = 0
		icon_state = icon_off
		item_state = icon_off
		STOP_PROCESSING(SSobj, src)
	else if (smoketime)
		var/turf/location = get_turf(user)
		user.visible_message(SPAN_NOTICE("[user] empties out [src]."), SPAN_NOTICE("You empty out [src]."))
		new /obj/effect/decal/cleanable/ash(location)
		smoketime = 0
		reagents.clear_reagents()
		name = "empty [initial(name)]"

/obj/item/clothing/mask/smokable/pipe/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/melee/energy/sword))
		return

	..()

	if (istype(W, /obj/item/weapon/reagent_containers/food/snacks))
		var/obj/item/weapon/reagent_containers/food/snacks/grown/G = W
		if (!G.dry)
			to_chat(user, SPAN_NOTICE("[G] must be dried before you stuff it into [src]."))
			return
		if (smoketime)
			to_chat(user, SPAN_NOTICE("[src] is already packed."))
			return
		smoketime = 1000
		if(G.reagents)
			G.reagents.trans_to_obj(src, G.reagents.total_volume)
		name = "[G.name]-packed [initial(name)]"
		qdel(G)

	else if(istype(W, /obj/item/weapon/flame/lighter))
		var/obj/item/weapon/flame/lighter/L = W
		if(L.lit)
			light(SPAN_NOTICE("[user] manages to light their [name] with [W]."))

	else if(istype(W, /obj/item/weapon/flame/match))
		var/obj/item/weapon/flame/match/M = W
		if(M.lit)
			light(SPAN_NOTICE("[user] lights their [name] with their [W]."))

	else if(istype(W, /obj/item/device/assembly/igniter))
		light(SPAN_NOTICE("[user] fiddles with [W], and manages to light their [name] with the power of science."))

/obj/item/clothing/mask/smokable/pipe/cobpipe
	name = "corn cob pipe"
	desc = "A backwoodsmen pipe, kept popular in the modern age and beyond by space hipsters."
	icon_state = "cobpipeoff"
	item_state = "cobpipeoff"
	icon_on = "cobpipeon"  //Note - these are in masks.dmi
	icon_off = "cobpipeoff"
	chem_volume = 35
	quality_multiplier = 1 // Not nearly as fancy as the other one

/////////
//ZIPPO//
/////////
/obj/item/weapon/flame/lighter
	name = "cheap lighter"
	desc = "A reusable metal lighter with a cheap unbranded design."
	icon = 'icons/obj/items.dmi'
	icon_state = "lighter-g"
	item_state = "lighter-g"
	w_class = ITEM_SIZE_TINY
	throwforce = 4
	flags = CONDUCT
	slot_flags = SLOT_BELT
	attack_verb = list("burnt", "singed")
	var/base_state

/obj/item/weapon/flame/lighter/zippo
	name = "\improper zippo lighter"
	desc = "A reusable metal lighter manufactured by Zippo."
	icon_state = "zippo"
	item_state = "zippo"

/obj/item/weapon/flame/lighter/random
	New()
		icon_state = "lighter-[pick("r","c","y","g")]"
		item_state = icon_state
		base_state = icon_state

/obj/item/weapon/flame/lighter/attack_self(mob/living/user)
	if(!base_state)
		base_state = icon_state
	if(user.r_hand == src || user.l_hand == src)
		if(!lit)
			lit = 1
			icon_state = "[base_state]on"
			item_state = "[base_state]on"
			if(istype(src, /obj/item/weapon/flame/lighter/zippo) )
				playsound(src, 'sound/items/zippo.ogg', 20, 1, 1)
				user.visible_message("<span class='rose'>Without even breaking stride, [user] flips open and lights [src] in one smooth movement.</span>")
			else
				playsound(src, 'sound/items/lighter.ogg', 20, 1, 1)
				if(prob(95))
					user.visible_message(SPAN_NOTICE("After a few attempts, [user] manages to light the [src]."))
				else
					to_chat(user, SPAN_WARNING("You burn yourself while lighting the lighter."))
					if (user.l_hand == src)
						user.apply_damage(2, BURN, BP_L_ARM)
					else
						user.apply_damage(2, BURN, BP_R_ARM)
					user.visible_message(SPAN_NOTICE("After a few attempts, [user] manages to light the [src], they however burn their finger in the process."))
			tool_qualities = list(QUALITY_CAUTERIZING = 10)
			set_light(2)
			START_PROCESSING(SSobj, src)
		else
			lit = 0
			icon_state = "[base_state]"
			item_state = "[base_state]"
			if(istype(src, /obj/item/weapon/flame/lighter/zippo) )
				playsound(src, 'sound/items/zippo.ogg', 20, 1, 1)
				user.visible_message("<span class='rose'>You hear a quiet click, as [user] shuts off [src] without even looking at what they're doing.</span>")
			else
				playsound(src, 'sound/items/lighter.ogg', 20, 1, 1)
				user.visible_message(SPAN_NOTICE("[user] quietly shuts off the [src]."))
			tool_qualities = initial(tool_qualities)
			set_light(0)
			STOP_PROCESSING(SSobj, src)
	else
		return ..()
	return


/obj/item/weapon/flame/lighter/attack(mob/living/carbon/M as mob, mob/living/carbon/user as mob)
	if(!ismob(M))
		return
	M.IgniteMob()

	if(istype(M.wear_mask, /obj/item/clothing/mask/smokable/cigarette) && user.targeted_organ == BP_MOUTH && lit)
		var/obj/item/clothing/mask/smokable/cigarette/cig = M.wear_mask
		if(M == user)
			cig.attackby(src, user)
		else
			if(istype(src, /obj/item/weapon/flame/lighter/zippo))
				cig.light("<span class='rose'>[user] whips the [name] out and holds it for [M].</span>")
			else
				cig.light(SPAN_NOTICE("[user] holds the [name] out for [M], and lights the [cig.name]."))
	else
		..()

/obj/item/weapon/flame/lighter/Process()
	var/turf/location = get_turf(src)
	if(location)
		location.hotspot_expose(700, 5)
	return


/obj/item/weapon/flame/lighter/zippo/black
	name = "\improper holy Zippo lighter"
	desc = "For lighting the holy spirit."
	icon_state = "blackzippo"

/obj/item/weapon/flame/lighter/zippo/blue
	name = "\improper blue Zippo lighter"
	icon_state = "bluezippo"

/obj/item/weapon/flame/lighter/zippo/engraved
	name = "\improper engraved Zippo lighter"
	icon_state = "engravedzippo"
	item_state = "zippo"

/obj/item/weapon/flame/lighter/zippo/gold
	name = "\improper golden Zippo lighter"
	icon_state = "goldzippo"

/obj/item/weapon/flame/lighter/zippo/moff
	name = "\improper moth Zippo lighter"
	desc = "Too cute to be a Tymisian."
	icon_state = "moffzippo"

/obj/item/weapon/flame/lighter/zippo/red
	name = "\improper red Zippo lighter"
	icon_state = "redzippo"

/obj/item/weapon/flame/lighter/zippo/ironic
	name = "\improper ironic Zippo lighter"
	desc = "How funny."
	icon_state = "ironiczippo"

/obj/item/weapon/flame/lighter/zippo/capitalist
	name = "\improper capitalist Zippo lighter"
	desc = "Made of gold and obsidian, this is truly not worth however much you spent on it."
	icon_state = "cappiezippo"

/obj/item/weapon/flame/lighter/zippo/communist
	name = "\improper communist Zippo lighter"
	desc = "The preferred lighter for degenerates, idiots, and losers."
	icon_state = "commiezippo"

/obj/item/weapon/flame/lighter/zippo/royal
	name = "\improper royal Zippo lighter"
	desc = "An incredibly fancy lighter, gilded and covered in the color of royalty."
	icon_state = "royalzippo"

/obj/item/weapon/flame/lighter/zippo/gonzo
	name = "\improper Gonzo Zippo lighter"
	desc = "A lighter with the iconic Gonzo fist painted on it."
	icon_state = "gonzozippo"

/obj/item/weapon/flame/lighter/zippo/rainbow
	name = "\improper rainbow Zippo lighter"
	icon_state = "rainbowzippo"

/obj/item/weapon/flame/lighter/zippo/bullet
	name = "\improper bullet lighter"
	desc = "A lighter fashioned out of an old bullet casing."
	icon_state = "bulletlighter"