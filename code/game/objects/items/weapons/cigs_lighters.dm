//cleansed 9/15/2012 17:48

/*
CONTAINS:
MATCHES
CIGARETTES
CIGARS
SMOKING PIPES
CHEAP LIGHTERS
ZIPPO
VAPE

CIGARETTE PACKETS ARE IN FANCY.DM
*/

//For anything that can light stuff on fire
/obj/item/flame
	var/lit = 0
	heat = 1670

/obj/item/flame/is_hot()
	if (lit)
		return heat

/proc/isflamesource(A)
	if(istype(A, /obj/item/flame))
		var/obj/item/flame/F = A
		return (F.lit)
	if(istype(A, /obj/item/device/assembly/igniter))
		return TRUE
	if(istype(A, /obj/item))
		var/obj/item/I = A
		if(QUALITY_WELDING in I.tool_qualities)
			return TRUE
		if(QUALITY_CAUTERIZING in I.tool_qualities)
			return TRUE
		if (I.is_hot())
			return TRUE
	return FALSE

///////////
//MATCHES//
///////////
/obj/item/flame/match
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

/obj/item/flame/match/Process()
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

/obj/item/flame/match/dropped(mob/user as mob)
	//If dropped, put ourselves out
	//not before lighting up the turf we land on, though.
	if(lit)
		spawn(0)
			var/turf/location = src.loc
			if(istype(location))
				location.hotspot_expose(700, 5)
			burn_out()
	return ..()

/obj/item/flame/match/proc/burn_out()
	lit = 0
	burnt = 1
	tool_qualities = list()
	damtype = BURN
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
	var/last_drag = 0
	var/quality_multiplier = 1 // Used for sanity and insight gain
	var/matchmes = "USER lights NAME with FLAME"
	var/lightermes = "USER lights NAME with FLAME"
	var/zippomes = "USER lights NAME with FLAME"
	var/weldermes = "USER lights NAME with FLAME"
	var/ignitermes = "USER lights NAME with FLAME"
//	preloaded_reagents = list("nicotineplus" = 5)

/obj/item/clothing/mask/smokable/Initialize()
	reagent_flags |= NO_REACT // so it doesn't react until you light it
	// Make the cigarrete a chemical holder of given volume before preloaded_reagents are spawned in
	create_reagents(chem_volume)
	. = ..()

/obj/item/clothing/mask/smokable/Process()
	var/turf/location = get_turf(src)
	smoketime--
	if(smoketime < 0)
		if(ishuman(loc))
			var/mob/living/carbon/human/H = loc
			if(!H.stat)
				for(var/obj/item/material/ashtray/A in view(1, loc))
					if(A.contents.len < A.max_butts)
						A.attackby(src, loc)
						return
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
		damtype = BURN
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

/obj/item/clothing/mask/smokable/attackby(obj/item/W as obj, mob/user as mob)
	..()
	if(isflamesource(W))
		var/text = matchmes
		if(istype(W, /obj/item/flame/match))
			playsound(src, 'sound/items/smoking.ogg', 20, 1, 1)
			text = matchmes
		else if(istype(W, /obj/item/flame/lighter/zippo))
			playsound(src, 'sound/items/smoking.ogg', 20, 1, 1)
			text = zippomes
		else if(istype(W, /obj/item/flame/lighter))
			playsound(src, 'sound/items/smoking.ogg', 20, 1, 1)
			text = lightermes
		else if(istype(W, /obj/item/tool/weldingtool))
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
	name = "\improper Roach Eyes cigarette"
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
	name = "\improper Ishimura Special cigarette"
	icon_state = "ishimuraoff"
	icon_on = "ishimuraon"
	icon_off = "ishimuraoff"
	type_butt = /obj/item/trash/cigbutt/ishimura
	preloaded_reagents = list("nicotine" = 5, "ishispec" = 5)

/obj/item/clothing/mask/smokable/cigarette/os
	name = "\improper GP produced cigarette"
	desc = "A inhouse made cigarette by GP."
	icon_state = "cigoff"
	icon_on = "cigon"
	icon_off = "cigoff"
	type_butt = /obj/item/trash/cigbutt/os
	preloaded_reagents = list("nicotine" = 5)

/obj/item/clothing/mask/smokable/cigarette/os/nova
	name = "\improper Greyson Star Traders produced cigarette"
	desc = "A inhouse made cigarette by Greyson Star Traders. It has a very unique aroma, hard to describe but its honestly not awful, you can see that it is actually somehow packed with care? Why robots would mass produce cigars with care?"
	icon_state = "cigoff"
	icon_on = "cigon"
	icon_off = "cigoff"
	type_butt = /obj/item/trash/cigbutt/os
	preloaded_reagents = list("nicotine" = 5)

/obj/item/clothing/mask/smokable/cigarette/tannhauser
	name = "\improper Tannhauser Gate cigarette"
	icon_state = "tannhauseroff"
	icon_on = "tannhauseron"
	icon_off = "tannhauseroff"
	type_butt = /obj/item/trash/cigbutt/tannhauser
	preloaded_reagents = list("nicotine" = 5, "sodiumchloride" = 5)

/obj/item/clothing/mask/smokable/cigarette/brouzouf
	name = "\improper Brouzouf Message cigarette"
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
	name = "\improper Hippie's Delight cigarette"
	icon_state = "khioff"
	icon_on = "khion"
	icon_off = "khioff"
	type_butt = /obj/item/trash/cigbutt/khi
	preloaded_reagents = list("mindbreaker" = 3, "serotrotium" = 2, "space_drugs" = 5)

/obj/item/clothing/mask/smokable/cigarette/comred
	name = "\improper ComRed light cigarette"
	type_butt = /obj/item/trash/cigbutt/comred
	icon_state = "comredoff"
	icon_on = "comredon"
	icon_off = "comredoff"
	preloaded_reagents = list("nicotineplus" = 5, "vodka" = 10)

/obj/item/clothing/mask/smokable/cigarette/lonestar
	name = "\improper LoneStar light cigarette"
	type_butt = /obj/item/trash/cigbutt/lonestar
	icon_state = "lonestaroff"
	icon_on = "lonestaron"
	icon_off = "lonestaroff"
	preloaded_reagents = list("nicotine" = 5, "cafe_latte" = 5)

/obj/item/clothing/mask/smokable/cigarette/faith
	name = "\improper TempleOS light cigarette"
	icon_state = "faithoff"
	icon_on = "faithon"
	icon_off = "faithoff"
	type_butt = /obj/item/trash/cigbutt/faith
	preloaded_reagents = list("nicotine" = 5, "grapejuice" = 5)

/obj/item/clothing/mask/smokable/cigarette/faith/blue
	name = "\improper TempleOS light cigarette"
	icon_state = "faithblueoff"
	icon_on = "faithblueon"
	icon_off = "faithblueoff"
	type_butt = /obj/item/trash/cigbutt/faith/blue
	preloaded_reagents = list("nicotine" = 5, "mint" = 5)

/obj/item/clothing/mask/smokable/cigarette/faith/red
	name = "\improper TempleOS light cigarette"
	icon_state = "faithredoff"
	icon_on = "faithredon"
	icon_off = "faithredoff"
	type_butt = /obj/item/trash/cigbutt/faith/red
	preloaded_reagents = list("nicotine" = 5, "cherryjelly" = 5)

/obj/item/clothing/mask/smokable/cigarette/faith/green
	name = "\improper TempleOS light cigarette"
	icon_state = "faithgreenoff"
	icon_on = "faithgreenon"
	icon_off = "faithgreenoff"
	type_butt = /obj/item/trash/cigbutt/faith/green
	preloaded_reagents = list("nicotine" = 5, "limejuice" = 5)

/obj/item/clothing/mask/smokable/cigarette/faith/yellow
	name = "\improper TempleOS light cigarette"
	icon_state = "faithyellowoff"
	icon_on = "faithyellowon"
	icon_off = "faithyellowoff"
	type_butt = /obj/item/trash/cigbutt/faith/yellow
	preloaded_reagents = list("nicotine" = 5, "lemonjuice" = 5)

/obj/item/clothing/mask/smokable/cigarette/faith/orange
	name = "\improper TempleOS light cigarette"
	icon_state = "faithorangeoff"
	icon_on = "faithorangeon"
	icon_off = "faithorangeoff"
	type_butt = /obj/item/trash/cigbutt/faith/orange
	preloaded_reagents = list("nicotine" = 5, "orangejuice" = 5)

/obj/item/clothing/mask/smokable/cigarette/attackby(obj/item/W as obj, mob/user as mob)
	..()

	if(istype(W, /obj/item/melee/energy))
		var/obj/item/melee/energy/S = W
		if(S.active)
			light(SPAN_WARNING("[user] swings their [W], barely missing their nose. They light their [name] in the process."))
			playsound(loc, 'sound/weapons/blade1.ogg', 50, 1)

	return

/obj/item/clothing/mask/smokable/cigarette/afterattack(obj/item/reagent_containers/glass/glass, mob/user as mob, proximity)
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

/obj/item/clothing/mask/smokable/cigarette/attack_self(mob/living/user as mob)
	if(lit == 1)
		user.visible_message(SPAN_NOTICE("[user] calmly drops and treads on the lit [src], putting it out instantly."))
		add_fingerprint(user)//Still adding are prints to touch
		die(1)
	return ..()

/obj/item/clothing/mask/smokable/cigarette/on_slotmove(mob/user)
	. = ..()
	if(get_equip_slot() == SLOT_MASK)
		add_fingerprint(user) //We infuse are prints when we smoke

/obj/item/clothing/mask/smokable/cigarette/attack(mob/living/carbon/human/H, mob/user, def_zone)
	if(lit && H == user && istype(H))
		var/obj/item/blocked = H.check_mouth_coverage()
		if(blocked)
			to_chat(H, SPAN_WARNING("\The [blocked] is in the way!"))
			return 1
		if(last_drag <= world.time - 30) //No chainsmoking.
			last_drag = world.time
			H.visible_message("<span class='notice'>[H.name] takes a drag of [H.identifying_gender == "male" ? "his" : H.identifying_gender == "female" ? "her" : "their"] [name].</span>")
			playsound(H, 'sound/items/cigs_lighters/inhale.ogg', 50, 0, -1)
			reagents.trans_to_mob(H, (rand(10,20)/10), CHEM_INGEST)
			return 1
	return ..()

////////////
// CIGARS //
////////////
/obj/item/clothing/mask/smokable/cigarette/cigar
	name = "premium cigar"
	desc = "A brown roll of tobacco and... well, you're not quite sure. This thing's huge!"
	icon_state = "cigaroff"
	icon_on = "cigaron"
	icon_off = "cigaroff"
	type_butt = /obj/item/trash/cigbutt/cigarbutt
	throw_speed = 0.5
	item_state = "cigaroff"
	smoketime = 800
	chem_volume = 25
	preloaded_reagents = list("nicotineplus" = 15)
	quality_multiplier = 2
	matchmes = "<span class='notice'>USER lights their NAME with their FLAME.</span>"
	lightermes = "<span class='notice'>USER manages to offend their NAME by lighting it with FLAME.</span>"
	zippomes = "<span class='rose'>With a flick of their wrist, USER lights their NAME with their FLAME.</span>"
	weldermes = "<span class='notice'>USER insults NAME by lighting it with FLAME.</span>"
	ignitermes = "<span class='notice'>USER fiddles with FLAME, and manages to light their NAME with the power of science.</span>"

/obj/item/clothing/mask/smokable/cigarette/cigar/cohiba
	name = "\improper Cohiba Robusto cigar"
	desc = "There's little more you could want from a cigar."
	icon_state = "cigaroff"
	icon_on = "cigaron"
	icon_off = "cigaroff"
	smoketime = 1000
	chem_volume = 45
	preloaded_reagents = list("nicotineplus" = 20, "coffee" = 10)

/obj/item/clothing/mask/smokable/cigarette/cigar/havana
	name = "premium havanian cigar"
	desc = "A cigar fit for only the best of the best."
	icon_state = "cigaroff"
	icon_on = "cigaron"
	icon_off = "cigaroff"
	smoketime = 1100
	chem_volume = 35
	preloaded_reagents = list("nicotineplus" = 20)
	quality_multiplier = 3

/obj/item/trash/cigbutt
	name = "\improper Roach Eyes cigarette butt"
	desc = "A decayed cigarette butt."
	icon = 'icons/inventory/face/icon.dmi'
	icon_state = "roachbutt"
	w_class = ITEM_SIZE_TINY
	slot_flags = SLOT_EARS
	matter = list(MATERIAL_BIOMATTER = 1)
	throwforce = 1

/obj/item/trash/cigbutt/os
	name = "\improper GP cigarette butt"
	icon_state = "cigbutt"

/obj/item/trash/cigbutt/ishimura
	name = "\improper Ishimura Special cigarette butt"
	icon_state = "ishimurabutt"

/obj/item/trash/cigbutt/tannhauser
	name = "\improper Tannhauser Gate cigarette butt"
	icon_state = "tannhauserbutt"

/obj/item/trash/cigbutt/brouzouf
	name = "\improper Brouzouf Message cigarette butt"
	icon_state = "brouzoufbutt"

/obj/item/trash/cigbutt/shodan
	name = "\improper Shodans cigarette butt"
	icon_state = "shodanbutt"

/obj/item/trash/cigbutt/toha
	name = "\improper TOHA Heavy Industries cigarette butt"
	icon_state = "tohabutt"

/obj/item/trash/cigbutt/frozen
	name = "\improper Frozen Nova cigarette butt"
	icon_state = "frozenbutt"

/obj/item/trash/cigbutt/fortress
	name = "\improper Fortress Classic cigarette butt"
	icon_state = "cigbutt"

/obj/item/trash/cigbutt/fortressred
	name = "\improper Fortress RED menthols cigarette butt"
	icon_state = "cigbutt"

/obj/item/trash/cigbutt/fortressblue
	name = "\improper Fortress BLU light cigarette butt"
	icon_state = "cigbutt"

/obj/item/trash/cigbutt/khi
	name = "\improper KHI cigarette butt"
	icon_state = "khibutt"

/obj/item/trash/cigbutt/comred
	name = "\improper ComRed cigarette butt"
	icon_state = "comredbutt"

/obj/item/trash/cigbutt/lonestar
	name = "\improper LoneStar cigarette butt"
	icon_state = "comredbutt"

/obj/item/trash/cigbutt/faith
	name = "\improper TempleOS cigarette butt"
	icon_state = "faithbutt"

/obj/item/trash/cigbutt/faith/blue
	icon_state = "faithbluebutt"

/obj/item/trash/cigbutt/faith/red
	icon_state = "faithredbutt"

/obj/item/trash/cigbutt/faith/yellow
	icon_state = "faithyellowbutt"

/obj/item/trash/cigbutt/faith/orange
	icon_state = "faithorangebutt"

/obj/item/trash/cigbutt/faith/green
	icon_state = "faithgreenbutt"

/obj/item/trash/cigbutt/New()
	..()
	pixel_x = rand(-10,10)
	pixel_y = rand(-10,10)

/obj/item/trash/cigbutt/add_initial_transforms()
	. = ..()

	add_new_transformation(/datum/transform_type/random_rotation)

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
	w_class = ITEM_SIZE_SMALL
	preloaded_reagents = list("nicotine" = 1)
	matchmes = "<span class='notice'>USER lights their NAME with their FLAME in a very classy move.</span>"
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
		damtype = BURN
		icon_state = icon_on
		item_state = icon_on
		var/turf/T = get_turf(src)
		T.visible_message(flavor_text)
		START_PROCESSING(SSobj, src)
		update_wear_icon()

/obj/item/clothing/mask/smokable/pipe/attack_self(mob/user)
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

/obj/item/clothing/mask/smokable/pipe/attackby(obj/item/W, mob/user)
	if(istype(W, /obj/item/melee/energy/sword))
		return

	..()

	if (istype(W, /obj/item/reagent_containers/food/snacks))
		var/obj/item/reagent_containers/food/snacks/grown/G = W
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

	else if(istype(W, /obj/item/flame/lighter))
		var/obj/item/flame/lighter/L = W
		if(L.lit)
			light(SPAN_NOTICE("[user] manages to light their [name] with [W]."))

	else if(istype(W, /obj/item/flame/match))
		var/obj/item/flame/match/M = W
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

/obj/item/clothing/mask/smokable/pipe/glass
	name = "glass pipe"
	desc = "A glass pipe, a more technologically advanced version of the standard pipe using similar tech to the vape mask. Expensive, but one of the cleanest ways to get a smoke, just a shame it \
	looks like a crack pipe. A small device on it lets it always emit smoke, even when empty."
	icon_state = "glass_pipe"
	item_state = "glass_pipe"
	icon_on = "glass_pipe"  //Note - these are in masks.dmi
	icon_off = "glass_pipe"
	quality_multiplier = 3 //Advanced tech offering a cleaner smoke.

////////
//VAPE//
////////
/obj/item/clothing/mask/vape
	name = "\improper Vapour mask"
	desc = "A classy and highly sophisticated electronic cigarette, for classy and dignified gentlemen. A warning label reads \"Warning: Do not fill with flammable materials.\""
	icon_state = "vape_mask"
	item_state = "vape_mask"
	w_class = ITEM_SIZE_TINY
	var/chem_volume = 50
	var/vapetime = 0
	var/screw = 0
	var/emagged = 0
	var/waste = 0.8
	var/transfer_amount = 0.2
	var/voltage = 0
	var/quality_multiplier = 1

	var/charge_per_use = 0.2
	cell = null
	suitable_cell = /obj/item/cell/small

/obj/item/clothing/mask/vape/Initialize(mapload)
	. = ..()
	create_reagents(chem_volume, NO_REACT)
	reagents.add_reagent("nicotine", 20)
	reagents.add_reagent(pick(list("banana","berryjuice","grapejuice","lemonjuice","limejuice","orangejuice","watermelonjuice")), 10)
	if(!cell && suitable_cell)
		cell = new suitable_cell(src)

/obj/item/clothing/mask/vape/get_cell()
	return cell

/obj/item/clothing/mask/vape/handle_atom_del(atom/A)
	..()
	if(A == cell)
		cell = null
		update_icon()

/obj/item/clothing/mask/vape/MouseDrop(over_object)
	if(screw)
		if((loc == usr) && istype(over_object, /obj/screen/inventory/hand) && eject_item(cell, usr))
			cell = null

/obj/item/clothing/mask/vape/attackby(obj/item/O, mob/user, params)
	if(istype(O, suitable_cell) && !cell && insert_item(O, user))
		if(screw)
			cell = O
		else
			to_chat(user, SPAN_WARNING("You need to close the cap of [src]."))
	if(QUALITY_SCREW_DRIVING in O.tool_qualities)
		if(!screw)
			if(O.use_tool(user, src, WORKTIME_INSTANT, QUALITY_SCREW_DRIVING, FAILCHANCE_EASY, required_stat = STAT_MEC))
				screw = TRUE
				to_chat(user, SPAN_NOTICE("You open the cap on [src]."))
				reagent_flags |= OPENCONTAINER
				icon_state = "vape_mask_open"
				item_state = "vape_mask_open"
				update_icon()
		else
			if(O.use_tool(user, src, WORKTIME_INSTANT, QUALITY_SCREW_DRIVING, FAILCHANCE_EASY, required_stat = STAT_MEC))
				screw = FALSE
				to_chat(user, SPAN_NOTICE("You close the cap on [src]."))
				reagent_flags &= ~(OPENCONTAINER)
				icon_state = "vape_mask"
				item_state = "vape_mask"
				update_icon()

	if(istype(O, /obj/item/tool/multitool))
		if(screw && (!emagged))
			if(!voltage)
				transfer_amount = transfer_amount*2
				voltage = 1
				to_chat(user, SPAN_NOTICE("You increase the voltage of [src]."))
			else
				transfer_amount = transfer_amount/2
				voltage = 0
				to_chat(user, SPAN_NOTICE("You decrease the voltage of [src]."))

		if(screw && (emagged))
			to_chat(user, SPAN_WARNING("[src] can't be modified!"))
		else
			..()

/obj/item/clothing/mask/vape/emag_act(var/remaining_charges, mob/user)
	if(screw)
		if(!emagged)
			emagged = 1
			to_chat(user, SPAN_WARNING("You maximize the voltage of [src]."))
			var/datum/effect/effect/system/spark_spread/sp = new /datum/effect/effect/system/spark_spread //for effect
			sp.set_up(5, 1, src)
			sp.start()
		else
			to_chat(user, SPAN_WARNING("[src] is already emagged!"))
	else
		to_chat(user, SPAN_WARNING("You need to open the cap to do that!"))

/obj/item/clothing/mask/vape/attack_self(mob/user)
	if(screw)
		if(reagents.total_volume > 0)
			to_chat(user, SPAN_NOTICE("You empty [src] of all reagents."))
			reagents.clear_reagents()

/obj/item/clothing/mask/vape/equipped(mob/user, slot)
	. = ..()
	switch(slot)
		if(slot_wear_mask)
			if(!screw)
				to_chat(user, SPAN_NOTICE("You start puffing on the vape."))
				reagent_flags &= ~(NO_REACT)
				update_icon()
				START_PROCESSING(SSobj, src)
			else
				to_chat(user, SPAN_WARNING("You need to close the cap first!"))
		if(slot_l_hand, slot_r_hand)
			reagent_flags |= NO_REACT
			update_icon()
			STOP_PROCESSING(SSobj, src)

/obj/item/clothing/mask/vape/proc/hand_reagents()
	var/mob/living/carbon/human/C = loc
	vapetime = 0
	if(reagents && reagents.total_volume)
		if(ishuman(C))
			if(reagents.get_reagent_amount("plasma"))
				var/datum/effect/effect/system/reagents_explosion/e = new()
				playsound(get_turf(src), 'sound/effects/Explosion1.ogg', 50, FALSE)
				C.apply_damage(20, BURN, BP_HEAD)
				C.Stun(5)
				e.set_up(round(reagents.get_reagent_amount("plasma") / 2.5, 1), get_turf(src), 0, 0)
				e.start()
				qdel(src)
			if(reagents.get_reagent_amount("fuel"))
				var/datum/effect/effect/system/reagents_explosion/e = new()
				playsound(get_turf(src), 'sound/effects/Explosion1.ogg', 50, FALSE)
				C.apply_damage(20, BURN, BP_HEAD)
				C.Stun(5)
				e.set_up(round(reagents.get_reagent_amount("fuel") / 5, 1), get_turf(src), 0, 0)
				e.start()
				qdel(src)
			else
				reagents.trans_to_mob(C, REM, CHEM_INGEST, transfer_amount)
				C.sanity.onSmoke(src)
		else
			reagents.remove_any(waste)
			cell.use(charge_per_use)

/obj/item/clothing/mask/vape/Process()
	var/mob/living/M = loc

	if(isliving(loc))
		M.IgniteMob()

	vapetime++

	if(!reagents.total_volume)
		if(ismob(loc))
			to_chat(M, SPAN_WARNING("[src] is empty!"))
			STOP_PROCESSING(SSobj, src)
			//it's reusable so it won't unequip when empty
		return

	if(emagged && vapetime > 3)
		var/datum/effect/effect/system/smoke_spread/chem/s = new /datum/effect/effect/system/smoke_spread/chem
		s.set_up(reagents, 4, 24, loc)
		s.start()
		if(prob(5))//small chance for the vape to break and deal damage if it's emagged
			playsound(get_turf(src), 'sound/effects/Explosion1.ogg', 50, FALSE)
			M.apply_damage(20, BURN, BP_HEAD)
			M.Stun(5)
			var/datum/effect/effect/system/spark_spread/sp = new /datum/effect/effect/system/spark_spread //for effect
			sp.set_up(5, 1, src)
			sp.start()
			to_chat(M, SPAN_WARNING("[src] suddenly explodes in your mouth!"))
			qdel(src)
			return

	if(!cell || !cell.checked_use(charge_per_use))
		to_chat(M, SPAN_WARNING("[src] battery is dead or missing."))
		STOP_PROCESSING(SSobj, src)
		return

	if(cell || cell.checked_use(charge_per_use))
		if(reagents && reagents.total_volume)
			if(vapetime > 4)
				hand_reagents()

/obj/item/clothing/mask/vape/better
	name = "\improper Vapour mask"
	desc = "A classy and highly sophisticated electronic cigarette, for classy and dignified gentlemen. A warning label reads \"Warning: Do not fill with flammable materials.\" It seems different from the others"

/obj/item/clothing/mask/vape/better/New(mapload)
	. = ..()
	waste = pick(0.4, 0.7)
	transfer_amount = pick(0.3, 1)
	charge_per_use = pick(0.05, 0.2)

/////////
//ZIPPO//
/////////
/obj/item/flame/lighter
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

/obj/item/flame/lighter/zippo
	name = "\improper zippo lighter"
	desc = "A reusable metal lighter manufactured by Zippo."
	icon_state = "zippo"
	item_state = "zippo"

/obj/item/flame/lighter/random/New()
	icon_state = "lighter-[pick("r","c","y","g")]"
	item_state = icon_state
	base_state = icon_state
	..()

/obj/item/flame/lighter/attack_self(mob/living/user)
	if(!base_state)
		base_state = icon_state
	if(user.r_hand == src || user.l_hand == src)
		if(!lit)
			lit = 1
			icon_state = "[base_state]on"
			item_state = "[base_state]on"
			if(istype(src, /obj/item/flame/lighter/zippo) )
				playsound(src, 'sound/items/zippo_open.ogg', 80)
				user.visible_message("<span class='rose'>Without even breaking stride, [user] flips open and lights \the [src] in one smooth movement.</span>")
			else
				playsound(src, 'sound/items/lighter.ogg', 80)
				if(prob(95))
					user.visible_message(SPAN_NOTICE("After a few attempts, [user] manages to light \the [src]."))
				else
					to_chat(user, SPAN_WARNING("You burn yourself while lighting the lighter."))
					if (user.l_hand == src)
						user.apply_damage(2, BURN, BP_L_ARM)
					else
						user.apply_damage(2, BURN, BP_R_ARM)
					user.visible_message(SPAN_NOTICE("After a few attempts, [user] manages to light \the [src], they however burn their finger in the process."))
			tool_qualities = list(QUALITY_CAUTERIZING = 10)
			damtype = BURN
			force++
			set_light(2)
			START_PROCESSING(SSobj, src)
		else
			lit = 0
			icon_state = "[base_state]"
			item_state = "[base_state]"
			if(istype(src, /obj/item/flame/lighter/zippo) )
				playsound(src, 'sound/items/zippo_close.ogg', 20, 1, 1)
				user.visible_message("<span class='rose'>You hear a quiet click, as [user] shuts off \the [src] without even looking at what they're doing.</span>")
			else
				playsound(src, 'sound/items/lighter.ogg', 20, 1, 1)
				user.visible_message(SPAN_NOTICE("[user] quietly shuts off \the [src]."))
			tool_qualities = initial(tool_qualities)
			damtype = initial(damtype)
			force--
			set_light(0)
			STOP_PROCESSING(SSobj, src)
	else
		return ..()
	return


/obj/item/flame/lighter/attack(mob/living/carbon/M as mob, mob/living/carbon/user as mob)
	if(!ismob(M))
		return
	M.IgniteMob()

	if(istype(M.wear_mask, /obj/item/clothing/mask/smokable/cigarette) && user.targeted_organ == BP_MOUTH && lit)
		var/obj/item/clothing/mask/smokable/cigarette/cig = M.wear_mask
		if(M == user)
			cig.attackby(src, user)
		else
			if(istype(src, /obj/item/flame/lighter/zippo))
				cig.light("<span class='rose'>[user] whips \the [name] out and holds it steady for [M], lightning their [cig.name] in a smooth motion.</span>")
			else
				cig.light(SPAN_NOTICE("[user] holds \the [name] out for [M], and lights their \the [cig.name]."))
	else
		..()

/obj/item/flame/lighter/Process()
	var/turf/location = get_turf(src)
	if(location)
		location.hotspot_expose(700, 5)
	return


/obj/item/flame/lighter/zippo/black
	name = "\improper black Zippo lighter"
	desc = "A pitch black Zippo."
	icon_state = "blackzippo"

/obj/item/flame/lighter/zippo/blue
	name = "\improper blue Zippo lighter"
	icon_state = "bluezippo"

/obj/item/flame/lighter/zippo/engraved
	name = "\improper engraved Zippo lighter"
	desc = "A Zippo with embossed engravings on its surface. They do not give any tactical advantage whatsoever, but look pretty good."
	icon_state = "engravedzippo"
	item_state = "zippo"

/obj/item/flame/lighter/zippo/gold
	name = "\improper golden Zippo lighter"
	desc = "A Shippo fer thoshe that love goooold."
	icon_state = "goldzippo"

/obj/item/flame/lighter/zippo/moff
	name = "\improper moth Zippo lighter"
	desc = "Too cute to be a Tymisian."
	icon_state = "moffzippo"

/obj/item/flame/lighter/zippo/red
	name = "\improper red Zippo lighter"
	icon_state = "redzippo"

/obj/item/flame/lighter/zippo/ironic
	name = "\improper ironic Zippo lighter"
	desc = "How funny."
	icon_state = "ironiczippo"

/obj/item/flame/lighter/zippo/capitalist
	name = "\improper capitalist Zippo lighter"
	desc = "Made of gold and obsidian, this is truly not worth however much you spent on it."
	icon_state = "cappiezippo"

/obj/item/flame/lighter/zippo/communist
	name = "\improper communist Zippo lighter"
	desc = "The preferred lighter for degenerates, idiots, and losers."
	icon_state = "commiezippo"

/obj/item/flame/lighter/zippo/royal
	name = "\improper royal Zippo lighter"
	desc = "An incredibly fancy lighter, gilded and covered in the color of royalty."
	icon_state = "royalzippo"

/obj/item/flame/lighter/zippo/gonzo
	name = "\improper Gonzo Zippo lighter"
	desc = "A lighter with the iconic Gonzo fist painted on it."
	icon_state = "gonzozippo"

/obj/item/flame/lighter/zippo/rainbow
	name = "\improper rainbow Zippo lighter"
	icon_state = "rainbowzippo"

/obj/item/flame/lighter/zippo/bullet
	name = "\improper bullet lighter"
	desc = "A lighter fashioned out of an old bullet casing."
	icon_state = "bulletlighter"

/obj/item/flame/lighter/zippo/absolutism
	name = "\improper Absolutism Zippo lighter"
	desc = "A Zippo with a golden pattern, bearing a red wax seal in the center. Its purified flames burn bright."
	icon_state = "absolutelighter"

/obj/item/flame/lighter/zippo/soyfed
	name = "\improper SolFed Zippo lighter"
	desc = "A Zippo with the old crest of the Sol Federation, either a keepsake from old times or a sign of not knowing to let go." // How to detect soyfed SIMPathizers!
	icon_state = "solfed"

/obj/item/flame/lighter/zippo/excelsior
	name = "\improper Liberation Zippo lighter"
	desc = "A cheap, mass produced Zippo for the working masses, its flame - much like the motto - goes ever upwards."
	icon_state = "excelsior"

/obj/item/flame/lighter/zippo/brass
	name = "\improper Brass Zippo lighter"
	desc = "A shiney brass zippo made to last, for some reason the metal is always cold to the touch and rather then the flint to start the flame makes a ticking sound when used."
	icon_state = "brass_zippo"

/////////////
//CHEWABLES//
/////////////

/obj/item/clothing/mask/chewable
	name = "chewable item master"
	desc = "If you are seeing this, ahelp it."
	icon = 'icons/inventory/face/icon.dmi'
	body_parts_covered = 0

	var/damage_per_crunch // if set to a number, chewing something will cause this amount of damage in brute and half of it in pain.
	var/crunching = FALSE
	var/type_butt = null
	var/chem_volume = 0
	var/chewtime = 0
	var/brand
	var/waste = 0
	var/transfer_amount = 0.1
	var/wrapped = FALSE

/obj/item/clothing/mask/chewable/attack_self(mob/user)
	if(wrapped)
		wrapped = FALSE
		to_chat(user, SPAN_NOTICE("You unwrap \the [name]."))
		playsound(src.loc, 'sound/items/drop/wrapper.ogg', 50, 1)
		slot_flags = SLOT_MASK
		update_icon()

/obj/item/clothing/mask/chewable/Initialize()
	create_reagents(chem_volume) // making the cigarrete a chemical holder with a maximum volume of 15
	. = ..()
	reagent_flags |= NO_REACT // so it doesn't react until you light it
	if(wrapped)
		slot_flags = null
		update_icon()

/obj/item/clothing/mask/chewable/equipped(var/mob/living/user, var/slot)
	. = ..()
	switch(slot)
		if(slot_wear_mask)
			to_chat(user, SPAN_NOTICE("You start chewing."))
			reagent_flags &= ~(NO_REACT)
			update_icon()
			START_PROCESSING(SSobj, src)
		if(slot_l_hand, slot_r_hand)
			reagent_flags |= NO_REACT
			update_icon()
			STOP_PROCESSING(SSobj, src)

/obj/item/clothing/mask/chewable/dropped()
	STOP_PROCESSING(SSprocessing, src)
	..()

/obj/item/clothing/mask/chewable/Destroy()
	. = ..()
	STOP_PROCESSING(SSprocessing, src)

/obj/item/clothing/mask/chewable/proc/hand_reagents()
	var/mob/living/carbon/human/C = loc
	if(reagents && reagents.total_volume)
		if(ishuman(C))
			reagents.trans_to_mob(C, REM, CHEM_INGEST, 0.1)
			C.sanity.onSmoke(src)
		else
			reagents.remove_any(waste)

/obj/item/clothing/mask/chewable/Process()
	var/mob/living/M = loc

	chewtime--


	if(chewtime % 10 == 0)
		hand_reagents()

	if(chewtime < 0)
		to_chat(M, SPAN_WARNING("Your dip has run clear"))
		STOP_PROCESSING(SSobj, src)
		spitout()
	return


/obj/item/clothing/mask/chewable/tobacco
	name = "wad"
	desc = "A chewy wad of tobacco. Cut in long strands and treated with syrup so it doesn't taste like an ashtray when you stuff it into your face."
	throw_speed = 0.5
	icon_state = "chew"
	type_butt = /obj/item/trash/spitwad
	w_class = ITEM_SIZE_TINY
	slot_flags = SLOT_EARS | SLOT_MASK
	chem_volume = 50
	chewtime = 300
	brand = "tobacco"

/obj/item/trash/spitwad
	name = "spit wad"
	desc = "A disgusting spitwad."
	icon = 'icons/inventory/face/icon.dmi'
	icon_state = "spit-chew"
	slot_flags = SLOT_MASK

/obj/item/clothing/mask/chewable/proc/spitout(var/transfer_color = 1, var/no_message = 0)
	if(type_butt)
		var/obj/item/butt = new type_butt(src.loc)
		transfer_fingerprints_to(butt)
		if(transfer_color)
			butt.color = color
		if(brand)
			butt.desc += " This one is \a [brand]."
		if(ismob(loc))
			var/mob/living/M = loc
			if(!no_message)
				to_chat(M, SPAN_NOTICE("The [name] runs out of flavor."))
			if(M.wear_mask)
				M.remove_from_mob(src) //un-equip it so the overlays can update
				M.update_inv_wear_mask(0)
				if(!M.equip_to_slot_if_possible(butt, slot_wear_mask))
					M.update_inv_l_hand(0)
					M.update_inv_r_hand(1)
					M.put_in_hands(butt)
	STOP_PROCESSING(SSprocessing, src)
	qdel(src)

/obj/item/clothing/mask/chewable/tobacco/bad
	name = "chewing tobacco"
	desc = "A chewy wad of cheap tobacco. Cut in long strands and treated with syrup so it tastes less like an ashtray when you stuff it into your face."
	preloaded_reagents = list("nicotine" = 5)

/obj/item/clothing/mask/chewable/tobacco/deli
	name = "chewing tobacco"
	desc = "A chewy wad of tobacco. Cut in long strands and treated with syrup so it doesn't taste like an ashtray when you stuff it into your face."
	preloaded_reagents = list("nicotine" = 5)

/obj/item/clothing/mask/chewable/tobacco/fine
	name = "chewing tobacco"
	desc = "A chewy wad of fine tobacco. Cut in long strands and treated with syrup so it doesn't taste like an ashtray when you stuff it into your face."
	preloaded_reagents = list("nicotine" = 5)

/obj/item/clothing/mask/chewable/tobacco/nico
	name = "nicotine gum"
	desc = "A chewy wad of synthetic rubber, laced with nicotine. Possibly the least disgusting method of nicotine delivery."
	preloaded_reagents = list("nicotine" = 3, "mint" = 2)
	icon_state = "nic_gum"
	type_butt = /obj/item/trash/spitgum

/obj/item/clothing/mask/chewable/tobacco/dyn
	name = "dyn nicotine pouch"
	desc = "A white pouch filled with nicotine salts artificially flavored for the wannabe tobacco enthusiast."
	preloaded_reagents = list("nicotine" = 5)
	icon_state = "nic_pouch"
	type_butt = /obj/item/trash/spitpouch

/obj/item/trash/spitgum
	name = "old gum"
	desc = "A disgusting chewed up wad of gum."
	icon = 'icons/inventory/face/icon.dmi'
	icon_state = "spit-gum"
	slot_flags = SLOT_MASK

/obj/item/trash/spitpouch
	name = "old dyn pouch"
	desc = "A disgusting chewed up dyn pouch."
	icon = 'icons/inventory/face/icon.dmi'
	icon_state = "spit-pouch"
	slot_flags = SLOT_MASK