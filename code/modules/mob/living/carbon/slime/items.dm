
////Pet Slime Creation///

/obj/item/slime_potion //need to redo all the slime potions to be a offshoot of this
	name = "used slime potion"
	desc = "A slimy empty bottle."
	icon = 'icons/obj/xenobio.dmi'
	icon_state = "slimejar_empty"

//gets the location of a usedup bottle and replaces it with a empty one.
/obj/item/slime_potion/proc/usedup(obj/item/slime_potion/L as obj)
	var /obj/item/slime_potion/S = new /obj/item/slime_potion
	S.loc = L.loc
	qdel(L)

/obj/item/slime_potion/slime_docile
	name = "docility potion"
	desc = "A potent chemical mix that will nullify a slime's powers, causing it to become docile and tame."
	icon_state = "slimejar"

/obj/item/slime_potion/slime_docile/attack(mob/living/carbon/slime/M as mob, mob/user as mob)
	if(!isslime(M))//If target is not a slime.
		to_chat(user, SPAN_WARNING(" The potion only works on baby slimes!"))
		return ..()
	if(M.is_adult) //Can't tame adults
		to_chat(user, SPAN_WARNING(" Only baby slimes can be tamed!"))
		return..()
	if(M.stat)
		to_chat(user, SPAN_WARNING(" The slime is dead!"))
		return..()
	if(M.mind)
		to_chat(user, SPAN_WARNING(" The slime resists!"))
		return ..()
	var/mob/living/simple_animal/slime/pet = new /mob/living/simple_animal/slime(M.loc)
	pet.icon_state = "[M.colour] baby slime"
	pet.icon_living = "[M.colour] baby slime"
	pet.icon_dead = "[M.colour] baby slime dead"
	pet.colour = "[M.colour]"
	to_chat(user, "You feed the slime the potion, removing it's powers and calming it.")
	qdel(M)
	var/newname = sanitize(input(user, "Would you like to give the slime a name?", "Name your new pet", "pet slime") as null|text, MAX_NAME_LEN)

	if (!newname)
		newname = "pet slime"
	pet.name = newname
	pet.real_name = newname
	pet.colony_friend = TRUE //Hardcode hack to make sure
	usedup(src)

/obj/item/slime_potion/slime_docile_adult
	name = "advanced docility potion"
	desc = "A potent chemical mix that will nullify a slime's powers, causing it to become docile and tame. This one is meant for adult slimes"
	icon_state = "slimejar"

/obj/item/slime_potion/slime_docile_adult/attack(mob/living/carbon/slime/M as mob, mob/user as mob)
	if(!istype(M, /mob/living/carbon/slime/))//If target is not a slime.
		to_chat(user, SPAN_WARNING(" The potion only works on slimes!"))
		return ..()
	if(M.stat)
		to_chat(user, SPAN_WARNING(" The slime is dead!"))
		return..()
	if(M.mind)
		to_chat(user, SPAN_WARNING(" The slime resists!"))
		return ..()
	var/mob/living/simple_animal/slime/adultslime/pet = new /mob/living/simple_animal/slime/adultslime(M.loc)
	pet.icon_state = "[M.colour] adult slime"
	pet.icon_living = "[M.colour] adult slime"
	pet.icon_dead = "[M.colour] baby slime dead"
	pet.colour = "[M.colour]"
	to_chat(user, "You feed the slime the potion, removing it's powers and calming it.")
	qdel(M)
	var/newname = sanitize(input(user, "Would you like to give the slime a name?", "Name your new pet", "pet slime") as null|text, MAX_NAME_LEN)

	if (!newname)
		newname = "pet slime"
	pet.name = newname
	pet.real_name = newname
	pet.colony_friend = TRUE //Hardcode hack to make sure
	usedup(src)


/obj/item/slime_potion/slimesteroid
	name = "slime steroid"
	desc = "A potent chemical mix that will cause a slime to generate more extract."
	icon_state = "slimejar"

/obj/item/slime_potion/slimesteroid/attack(mob/living/carbon/slime/M as mob, mob/user as mob)
	if(!isslime(M))//If target is not a slime.
		to_chat(user, SPAN_WARNING(" The steroid only works on baby slimes!"))
		return ..()
	if(M.is_adult) //Can't tame adults
		to_chat(user, SPAN_WARNING(" Only baby slimes can use the steroid!"))
		return..()
	if(M.stat)
		to_chat(user, SPAN_WARNING(" The slime is dead!"))
		return..()
	if(M.cores == 3)
		to_chat(user, SPAN_WARNING(" The slime already has the maximum amount of extract!"))
		return..()

	to_chat(user, "You feed the slime the steroid. It now has triple the amount of extract.")
	M.cores = 3
	usedup(src)

/obj/item/slime_potion/slimes_speed
	name = "red slime tonic"
	desc = "A potent chemical mix that will cause any clothing item to move slightly faster."
	icon_state = "slimejar"
	color = "#FF4444"

/obj/item/slime_potion/slimes_speed/attackby(var/obj/item/clothing/C, mob/user as mob)
	..()
	if(C.slowdown < 0)//If target isn't already zooming
		to_chat(user, SPAN_WARNING("The tonic cant speed up this cloathing any more!"))
		return ..()

	to_chat(user, "The tonic works it magic making the cloathing slightly faster.")
	C.slowdown -= 0.1
	C.color = "#FF4444"
	usedup(src)


/obj/item/slimesteroid2
	name = "extract enhancer"
	desc = "A potent chemical mix that will give a slime extract three uses."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle17"

	/*afterattack(obj/target, mob/user , flag)
		if(istype(target, /obj/item/slime_extract))
			if(target.enhanced == 1)
				to_chat(user, SPAN_WARNING(" This extract has already been enhanced!"))
				return ..()
			if(target.Uses == 0)
				to_chat(user, SPAN_WARNING(" You can't enhance a used extract!"))
				return ..()
			to_chat(user, "You apply the enhancer. It now has triple the amount of uses.")
			target.Uses = 3
			target.enahnced = 1
			qdel(src)*/

/obj/item/slime_potion/slimes_fire_resist
	name = "orange slime tonic"
	desc = "A potent chemical mix that will cause any clothing item to resist heat and pressure."
	icon_state = "slimejar"
	color = "#ff9900"

/obj/item/slime_potion/slimes_fire_resist/attackby(var/obj/item/clothing/C, mob/user as mob)
	..()
	if(C.max_heat_protection_temperature == FIRESUIT_MAX_HEAT_PROTECTION_TEMPERATURE && C.item_flags == STOPPRESSUREDAMAGE)
		to_chat(user, SPAN_WARNING("The tonic can't modify this clothing anymore!"))
		return ..()

	to_chat(user, "The tonic works it magic!")
	C.max_heat_protection_temperature = FIRESUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	C.item_flags = STOPPRESSUREDAMAGE
	C.color = "#ff9900"
	usedup(src)

/obj/item/slime_potion/slimes_shock_resist
	name = "yellow slime tonic"
	desc = "A potent chemical mix that will cause any clothing item to resist heat and pressure."
	icon_state = "slimejar"
	color = "#ffff00"

/obj/item/slime_potion/slimes_shock_resist/attackby(var/obj/item/clothing/gloves/C, mob/user as mob)
	..()
	if(C.siemens_coefficient <= 0)
		to_chat(user, SPAN_WARNING("The tonic can't modify this clothing anymore!"))
		return ..()

	to_chat(user, "The tonic improves the clothes!")
	C.siemens_coefficient -= 0.2
	if(C.siemens_coefficient < 0)
		C.siemens_coefficient = 0 // Don't want to risk healing from a super resist
	C.color = "#ffff00"
	usedup(src)

/obj/item/slime_potion/slimes_reviver
	name = "compressed jelly jar"
	desc = "A mass of slime jelly just awaiting to be pressed into a dead slime."
	icon_state = "slimejar"

/obj/item/slime_potion/slimes_reviver/attack(mob/living/carbon/slime/S, mob/user as mob)
	..()
	if(S.cores != 0 && S.stat == 2)
		S.health = 80
		S.stat = 0
		S.update_icon()
		to_chat(user, SPAN_WARNING("The slime is revived!"))
		usedup(src)
	else to_chat(user, SPAN_WARNING("This slime isn't able to be revived."))

/obj/effect/golemrune
	anchored = 1
	desc = "a strange rune used to create golems. It glows when spirits are nearby."
	name = "rune"
	icon = 'icons/obj/rune.dmi'
	icon_state = "golem"
	unacidable = 1
	layer = TURF_LAYER

	New()
		..()
		START_PROCESSING(SSobj, src)

	Process()
		var/mob/observer/ghost/ghost
		for(var/mob/observer/ghost/O in src.loc)
			if(!O.client)	continue
			if(O.mind && O.mind.current && O.mind.current.stat != DEAD)	continue
			ghost = O
			break
		if(ghost)
			icon_state = "golem2"
		else
			icon_state = "golem"

	attack_hand(mob/living/user as mob)
		var/mob/observer/ghost/ghost
		for(var/mob/observer/ghost/O in src.loc)
			if(!O.client)	continue
			if(O.mind && O.mind.current && O.mind.current.stat != DEAD)	continue
			ghost = O
			break
		if(!ghost)
			to_chat(user, "The rune fizzles uselessly. There is no spirit nearby.")
			return
		var/mob/living/carbon/human/G = new(src.loc)
		G.set_species("Golem")
		G.key = ghost.key
		to_chat(G, "You are an adamantine golem. You move slowly, but are highly resistant to heat and cold as well as blunt trauma. You are unable to wear clothes, but can still use most tools. Serve [user], and assist them in completing their goals at any cost.")
		qdel(src)


	proc/announce_to_ghosts()
		for(var/mob/observer/ghost/G in GLOB.player_list)
			if(G.client)
				var/area/A = get_area(src)
				if(A)
					to_chat(G, "Golem rune created in [A.name].")

/mob/living/carbon/slime/has_eyes()
	return 0


//Green slime demutation
/obj/item/genetics/purger/slime
	name = "Slime Mutagenic Purger"
	desc = "An slime verson of gene-fixer specifically purges mutations from the body."

//Oil slime

/obj/item/slime_thermals
	name = "thermal coating"
	desc = "A potent chemical mix that will when added to a guns scope allow themeral slight."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle19"

/obj/item/slime_thermals/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		GUN_UPGRADE_THERMAL = TRUE
		)
	I.gun_loc_tag = GUN_SIGHT
	I.prefix = "slime lens"
