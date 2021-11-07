//Prisoner containment sleeper: Ghosts become escaped prisoners and are advised to find a way out of the mess they've gotten themselves into.
/obj/effect/mob_spawn/human/prisoner_transport
	name = "prisoner containment sleeper"
	desc = "A sleeper designed to put its occupant into a deep coma, unbreakable until the sleeper turns off. This one's glass is cracked and you can see a pale, sleeping face staring out."
	mob_name = "an escaped prisoner"
	icon = 'icons/obj/Cryogenic2.dmi'
	icon_state = "sleeper_1"
	outfit = /decl/hierarchy/outfit/escapedprisoner
	short_desc = "You're a prisoner, sentenced to hard work in one of Kriosan's labor camps, but it seems as \
	though fate has other plans for you."
	flavour_text = "Good. It seems as though your ship crashed. You remember that you were convicted of "
	assignedrole = "Escaped Prisoner"
	stat_modifiers = list(
		STAT_ROB = 16,
		STAT_TGH = 16,
		STAT_BIO = 8,
		STAT_MEC = 8,
		STAT_VIG = 8,
		STAT_COG = 8
	)

/obj/effect/mob_spawn/human/prisoner_transport/special(mob/living/L)
	L.fully_replace_character_name(null,"KP #PH-0[rand(111,999)]") //Kriosan Prisoner #Prison Hulk-(numbers)

/obj/effect/mob_spawn/human/prisoner_transport/Initialize(mapload)
	. = ..()
	var/list/crimes = list("murder", "larceny", "embezzlement", "unionization", "dereliction of duty", "kidnapping", "gross incompetence", "grand theft", "mutiny")
	flavour_text += "[pick(crimes)]. but regardless of that, it seems like your crime doesn't matter now. You don't know where you are, but you know that it's out to kill you, and you're not going \
	to lose this opportunity. Find a way to get out of this mess and back to where you rightfully belong - your [pick("house", "apartment", "spaceship", "station")]. There should be a teleporter somewhere, if it's still intact."

/decl/hierarchy/outfit/escapedprisoner
	name = "Escaped Prisoner"
	uniform = /obj/item/clothing/under/orange
	mask = /obj/item/clothing/mask/breath
	shoes = /obj/item/clothing/shoes/orange
	r_pocket = /obj/item/tank/emergency_oxygen
	back = /obj/item/storage/backpack/sport/orange

/decl/hierarchy/outfit/escapedprisoner/hobo
	belt = /obj/item/gun/projectile/revolver/handmade
	l_pocket = /obj/item/ammo_casing/magnum_40/scrap/prespawned

/obj/effect/mob_spawn/human/prisoner_transport/hobo
	outfit = /decl/hierarchy/outfit/escapedprisoner/hobo

/obj/effect/mob_spawn/human/scavenger
	name = "storage sleeper"
	desc = "An sleeper, with an unconscious body inside. The occupant seems to be covered in armor."
	mob_name = "a scavenger"
	icon = 'icons/obj/Cryogenic2.dmi'
	icon_state = "sleeper_1"
	outfit = /decl/hierarchy/outfit/scavenger
	short_desc = "You're a scavenger, who barely even owns the clothes on your back and the rifle in your hands."
	flavour_text = "It seems you've arrived. You're here to get the good stuff and skedaddle with your life intact. \
	There may be others to cooperate with, but don't count on it. There shouldn't be many if any cops this far out, and laws don't carry much truck around here."
	assignedrole = "Comissioned Scavenger"
	title = "Prospector Comission Scavenger"

/decl/hierarchy/outfit/scavenger
	name = "Scavenger"
	uniform = /obj/item/clothing/under/genericb
	head = /obj/item/clothing/head/helmet/steelpot
	shoes = /obj/item/clothing/shoes/color/black
	suit = /obj/item/clothing/suit/armor/flackvest
	suit_store = /obj/item/gun/projectile/boltgun
	back = /obj/item/storage/backpack/satchel
	r_pocket = /obj/item/ammo_magazine/speed_loader_rifle_75
	id_slot = slot_wear_id
	id_type = /obj/item/card/id

/obj/effect/mob_spawn/human/exl_civ
	name = "storage sleeper"
	desc = "An sleeper, with an unconscious body inside. The occupant seems to be covered in excelsior equipment."
	mob_name = "a scavenger"
	icon = 'icons/obj/Cryogenic2.dmi'
	icon_state = "sleeper_1"
	outfit = /decl/hierarchy/outfit/antagonist/mercenary/excelsior
	short_desc = "You are a excelsior, move ever upwards."
	flavour_text = "It seems you've arrived. You're here to get the good stuff and skedaddle with your life intact. \
	There may be others to cooperate with, but don't count on it."
	assignedrole = "Excelsior Slave"
	title = "Excelsior Agent"
	stat_modifiers = list(
		STAT_ROB = 26,
		STAT_TGH = 26,
		STAT_BIO = 18,
		STAT_MEC = 18,
		STAT_VIG = 18,
		STAT_COG = 10
	)

/obj/effect/mob_spawn/human/exl_armored
	outfit = /decl/hierarchy/outfit/antagonist/mercenary/excelsior/equipped

/obj/effect/mob_spawn/human/void_wolf
	name = "storage sleeper"
	desc = "An sleeper, with an unconscious body inside. The occupant seems to be covered in void wolf equipment."
	mob_name = "a scavenger"
	icon = 'icons/obj/Cryogenic2.dmi'
	icon_state = "sleeper_1"
	outfit = /decl/hierarchy/outfit/antagonist/mercenary/void_wolf
	short_desc = "You are a Void wolf."
	flavour_text = "It seems you've arrived. You're here to get the good stuff and skedaddle with your life intact. \
	There may be others to cooperate with, but don't count on it."
	assignedrole = "Void Wolf"
	title = "Void Wolf"
	stat_modifiers = list(
		STAT_ROB = 35,
		STAT_TGH = 35,
		STAT_BIO = 25,
		STAT_MEC = 25,
		STAT_VIG = 18,
		STAT_COG = 10
	)