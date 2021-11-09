
/obj/item/clothing/suit/armor
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	item_flags = THICKMATERIAL|DRAG_AND_DROP_UNEQUIP
	cold_protection = UPPER_TORSO|LOWER_TORSO
	min_cold_protection_temperature = ARMOR_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = UPPER_TORSO|LOWER_TORSO
	max_heat_protection_temperature = ARMOR_MAX_HEAT_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.6
	price_tag = 200
	tool_qualities = list(QUALITY_ARMOR = 100)
	max_upgrades = 1

/obj/item/clothing/suit/armor/refresh_upgrades()
	var/obj/item/clothing/suit/armor/referencecarmor = new type()
	armor = referencecarmor.armor
	qdel(referencecarmor)
	..()

/*
 * Vests
 */
/obj/item/clothing/suit/armor/vest
	name = "armor vest"
	desc = "An armored vest that protects against some damage. Not designed for serious operations."
	icon_state = "armor"
	item_state = "armor"
	blood_overlay_type = "armor"
	armor = list(
		melee = 35,
		bullet = 35,
		energy = 35,
		bomb = 10,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/suit/armor/vest/full
	name = "full body armor"
	desc = "A generic armor vest, but with shoulderpads and kneepads included to cover all parts of the body. Not designed for serious operations."
	icon_state = "armor_fullbody"
	item_state = "armor_fullbody"
	blood_overlay_type = "armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS

/obj/item/clothing/suit/armor/vest/security
	name = "security armor"
	icon_state = "armor_security"
	desc = "A tactical armor vest that protects against some damage. Not designed for serious operations."

/obj/item/clothing/suit/armor/vest/security/full
	name = "full body security armor"
	desc = "A tactical armor vest, but with shoulderpads and kneepads included to cover all parts of the body. Not designed for serious operations."
	icon_state = "armor_security_fullbody"
	item_state = "armor_security_fullbody"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS

/obj/item/clothing/suit/armor/vest/detective
	name = "ranger armor vest"
	desc = "An armored vest with a ranger's badge on it."
	icon_state = "armor_detective"

/obj/item/clothing/suit/armor/vest/ironhammer
	name = "security armor vest"
	desc = "An armored vest that protects against some damage. This one has been done in marshal security colors. Not designed for serious operations."
	icon_state = "armor_ironhammer"

/obj/item/clothing/suit/storage/vest/ironhammer
	name = "webbed operator armor"
	desc = "An armored vest that protects against some damage. This one has been done in Ironhammer Security colors and has various pouches and straps attached."
	icon_state = "webvest_ironhammer"

/obj/item/clothing/suit/armor/vest/ironhammer/full
	name = "marshal tactical unit armor"
	desc = "An armored vest painted in Marshals colors. This one has shoulderpads and kneepads included to protect all parts of the body."
	icon_state = "armor_ih_fullbody"
	item_state = "armor_ih_fullbody"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS

/obj/item/clothing/suit/armor/vest/handmade
	name = "handmade armor vest"
	desc = "An armored vest of dubious quality. Provides decent protection against physical damage, for a piece of crap."
	icon_state = "armor_handmade"
	armor = list(
		melee = 30,
		bullet = 20,
		energy = 15,
		bomb = 10,
		bio = 0,
		rad = 0
	)
	price_tag = 150

/obj/item/clothing/suit/armor/vest/handmade/full
	name = "full handmade armor vest"
	desc = "An armored vest of dubious quality. This one has had metal sheets attached to the shoulders and knees to be used as makeshift shoulderpads and kneepads."
	icon_state = "armor_handmade_fullbody"
	item_state = "armor_handmade_fullbody"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	armor = list(
		melee = 30,
		bullet = 20,
		energy = 15,
		bomb = 10,
		bio = 0,
		rad = 0
	) // No gaining stats, just coverage!

/obj/item/clothing/suit/armor/vest/handmade_black
	name = "handmade black armor vest"
	desc = "An armored vest of dubious quality. Provides decent protection against physical damage, for a piece of crap. This one is black."
	icon_state = "hm_armorvest_black"
	armor = list(
		melee = 30,
		bullet = 20,
		energy = 15,
		bomb = 10,
		bio = 0,
		rad = 0
	)
	price_tag = 150

/obj/item/clothing/suit/armor/vest/handmade_black/full
	name = "full handmade black armor vest"
	desc = "An armored vest of dubious quality. This one has had metal sheets attached to the shoulders and knees to be used as makeshift shoulderpads and kneepads. It also comes in black."
	icon_state = "hm_armorvest_black_full"
	item_state = "hm_armorvest_black_full"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	armor = list(
		melee = 30,
		bullet = 20,
		energy = 15,
		bomb = 10,
		bio = 0,
		rad = 0
	) // No gaining stats, just coverage!

/obj/item/clothing/suit/armor/vest/iron_lock_security
	name = "outdated ablative vest"
	desc = "An \"Iron Lock Security\" ablative vest with plates designed to absorb rather than reflect energy projectiles. Produced by Greyson Positronic."
	icon_state = "northtech"
	matter = list(MATERIAL_STEEL = 10, MATERIAL_PLASTIC = 20, MATERIAL_PLATINUM = 5)
	armor = list(
		melee = 15,
		bullet = 15,
		energy = 50,
		bomb = 0,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/suit/armor/vest/ablative
	name = "ablative vest"
	desc = "An ablative vest with plates designed to absorb rather than reflect energy projectiles."
	icon_state = "northtech"
	matter = list(MATERIAL_STEEL = 10, MATERIAL_PLASTIC = 20, MATERIAL_PLATINUM = 10)
	armor = list(
		melee = 15,
		bullet = 15,
		energy = 60,
		bomb = 0,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/suit/armor/vest/botanist
	name = "botanist attire"
	desc = "Every rose has its thorns."
	icon_state = "botanist"
	item_flags = THICKMATERIAL | COVER_PREVENT_MANIPULATION
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 30, bullet = 30, energy = 25, bomb = 20, bio = 100, rad = 80)
	flags_inv = HIDEJUMPSUIT

/obj/item/clothing/suit/armor/vest/botanist/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["botanist default"] = "botanist"
	options["cosine brigantine armor"] = "cosine_brigantine_armor"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/suit/armor/vest/acolyte
	name = "vector armor"
	desc = "Worn, heavy, steadfast in the name of God."
	icon_state = "acolyte"
	item_flags = THICKMATERIAL | COVER_PREVENT_MANIPULATION
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 30, bullet = 30, energy = 25, bomb = 25, bio = 100, rad = 80)
	flags_inv = HIDEJUMPSUIT

/obj/item/clothing/suit/armor/vest/acolyte/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["vector default"] = "acolyte"
	options["tangent plate armor"] = "tangent_plate_armor"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/suit/armor/vest/rosaria
	name = "rosaria armor"
	desc = "The Rosaria protects."
	icon_state = "rosaria_armor"
	item_flags = THICKMATERIAL | COVER_PREVENT_MANIPULATION
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 40, bullet = 40, energy = 40, bomb = 50, bio = 100, rad = 100)
	flags_inv = HIDEJUMPSUIT
	matter = list(MATERIAL_PLASTEEL = 60, MATERIAL_PLASTIC = 8, MATERIAL_SILVER = 5, MATERIAL_GOLD = 5)

/obj/item/clothing/suit/armor/vest/custodian
	name = "custodian armor"
	desc = "Someone's gotta clean this mess. While this armor is technically church property, Lonestar custodians often use it on loan to protect themselves from the colonies various dangerous pests."
	icon_state = "custodian"
	item_flags = THICKMATERIAL | COVER_PREVENT_MANIPULATION
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 30, bullet = 30, energy = 25, bomb = 25, bio = 100, rad = 80)
	flags_inv = HIDEJUMPSUIT

/obj/item/clothing/suit/armor/vest/custodian/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["custodian default"] = "custodian"
	options["sine armor robes"] = "sine_armor_robes"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/suit/armor/vest/prime
	name = "prime armor"
	desc = "Trust in god, but keep your armor on."
	icon_state = "prime"
	item_flags = THICKMATERIAL | COVER_PREVENT_MANIPULATION
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 40, bullet = 40, energy = 40, bomb = 50, bio = 100, rad = 100)
	flags_inv = HIDEJUMPSUIT
	matter = list(MATERIAL_PLASTEEL = 60, MATERIAL_PLASTIC = 8, MATERIAL_SILVER = 5, MATERIAL_GOLD = 5)

/obj/item/clothing/suit/armor/vest/technomancersuit
	name = "'Mark V' environmental protection suit"
	desc = "For working in hazardous environments. While it is built for most environments, one of those is not space. As a tradeoff, it can be modified more."
	icon_state = "technosuit"
	item_flags = THICKMATERIAL | COVER_PREVENT_MANIPULATION
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 40, bullet = 40, energy = 35, bomb = 50, bio = 100, rad = 100)
	max_upgrades = 2
	extra_allowed = list(/obj/item/extinguisher,
						 /obj/item/tool,
						 /obj/item/tool_upgrade,
						 /obj/item/stack/cable_coil,
						 /obj/item/device/t_scanner,
						 /obj/item/device/scanner/gas,
						 /obj/item/taperoll/engineering,
						 /obj/item/storage/toolbox)
	flags_inv = HIDEJUMPSUIT

/obj/item/clothing/suit/armor/vest/soteriasuit
	name = "'Mark II' environmental protection suit"
	desc = "For working in hazardous environments. While its built for most environments, one of those is not space. This suit is a cheap and badly made copy of the Artificer Guilds original design. \
	Unlike its superior variant, it offers significantly less armor but it is made out of basic steel, making it a cheaper, easier alternative to build while also being easier to modify."
	icon_state = "armor_engineering"
	item_flags = THICKMATERIAL | COVER_PREVENT_MANIPULATION
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	max_upgrades = 2
	armor = list(melee = 35, bullet = 25, energy = 25, bomb = 30, bio = 50, rad = 50)
	extra_allowed = list(/obj/item/extinguisher,
						 /obj/item/tool,
						 /obj/item/tool_upgrade,
						 /obj/item/stack/cable_coil,
						 /obj/item/device/t_scanner,
						 /obj/item/device/scanner/gas,
						 /obj/item/taperoll/engineering,
						 /obj/item/storage/toolbox)
	flags_inv = HIDEJUMPSUIT
	matter = list(MATERIAL_STEEL = 40)

/obj/item/clothing/suit/armor/bulletproof
	name = "bulletproof vest"
	desc = "A vest that excels in protecting the wearer against high-velocity solid projectiles."
	icon_state = "bulletproof"
	item_state = "armor"
	blood_overlay_type = "armor"
	slowdown = 0.5
	armor = list(
		melee = 25,
		bullet = 60,
		energy = 25,
		bomb = 10,
		bio = 0,
		rad = 0
	)
	price_tag = 250

/obj/item/clothing/suit/armor/bulletproof/full
	name = "bulletproof suit"
	desc = "A vest that excels in protecting the wearer against high-velocity solid projectiles with added shoulderpads and kneepads for extra coverage."
	icon_state = "bulletproof_fullbody"
	item_state = "bulletproof_fullbody"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	slowdown = 0.6 // Heavier since it now covers more of the body

/obj/item/clothing/suit/armor/bulletproof/ironhammer
	icon_state = "bulletproof_ironhammer"

/obj/item/clothing/suit/armor/laserproof
	name = "ablative armor vest"
	desc = "A vest that excels in protecting the wearer against energy projectiles."
	icon_state = "ablative"
	item_state = "ablative"
	blood_overlay_type = "armor"
	slowdown = 0.5
	armor = list(
		melee = 25,
		bullet = 25,
		energy = 60,
		bomb = 0,
		bio = 0,
		rad = 0
	)
	siemens_coefficient = 0
	price_tag = 325

/obj/item/clothing/suit/armor/laserproof/handle_shield(mob/user, damage, atom/damage_source = null, mob/attacker = null, def_zone = null, attack_text = "the attack") //TODO: Refactor this all into humandefense
	if(istype(damage_source, /obj/item/projectile/energy) || istype(damage_source, /obj/item/projectile/beam))
		var/obj/item/projectile/P = damage_source

		var/reflectchance = 40 - round(damage/3)
		if(!(def_zone in list(BP_CHEST, BP_GROIN)))
			reflectchance /= 2
		if(P.starting && prob(reflectchance))
			visible_message(SPAN_DANGER("\The [user]'s [src.name] reflects [attack_text]!"))

			// Find a turf near or on the original location to bounce to
			var/new_x = P.starting.x + pick(0, 0, 0, 0, 0, -1, 1, -2, 2)
			var/new_y = P.starting.y + pick(0, 0, 0, 0, 0, -1, 1, -2, 2)
			var/turf/curloc = get_turf(user)

			// redirect the projectile
			P.redirect(new_x, new_y, curloc, user)

			return PROJECTILE_CONTINUE // complete projectile permutation

/obj/item/clothing/suit/armor/laserproof/ironhammer
	icon_state = "ablative_ironhammer"

/obj/item/clothing/suit/armor/laserproof/rnd
	name = "soteria ablative armor vest"
	desc = "A Soteria branded vest that excels in protecting the wearer against energy projectiles. While it is much better at defending against lasers compared to standard ablative armor it lacks as much protection against melee and bullets but can be modified more."
	icon_state = "ablative_ironhammer"
	matter = list(MATERIAL_STEEL = 20, MATERIAL_PLASTIC = 20, MATERIAL_PLATINUM = 15)
	armor = list(
		melee = 20,
		bullet = 20,
		energy = 65,
		bomb = 0,
		bio = 0,
		rad = 0
	)
	max_upgrades = 2
	siemens_coefficient = 0
	price_tag = 650
/*
 * Heavy Armor Types
 */
/obj/item/clothing/suit/armor/heavy
	name = "heavy armor"
	desc = "A heavily armored suit that protects against moderate damage."
	icon_state = "heavy"
	item_state = "swat_suit"
	w_class = ITEM_SIZE_BULKY
	gas_transfer_coefficient = 0.9
	permeability_coefficient = 0.9
	siemens_coefficient = 0.5
	item_flags = THICKMATERIAL|DRAG_AND_DROP_UNEQUIP|COVER_PREVENT_MANIPULATION|EQUIP_SOUNDS
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	slowdown = 0.9
	max_upgrades = 2
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	armor = list(
		melee = 40,
		bullet = 35,
		energy = 40,
		bomb = 30,
		bio = 0,
		rad = 0
	)
	equip_delay = 2 SECONDS
	price_tag = 125

/obj/item/clothing/suit/armor/heavy/red
	name = "Thunderdome suit (red)"
	desc = "Reddish armor."
	icon_state = "tdred"
	item_state = "tdred"
	siemens_coefficient = 1

/obj/item/clothing/suit/armor/heavy/green
	name = "Thunderdome suit (green)"
	desc = "Pukish armor."
	icon_state = "tdgreen"
	item_state = "tdgreen"
	siemens_coefficient = 1

// Riot suit
/obj/item/clothing/suit/armor/heavy/riot
	name = "riot suit"
	desc = "A suit of armor with heavy padding to protect against melee attacks. Looks like it might impair movement."
	icon_state = "riot"
	item_state = "swat_suit"
	flags_inv = HIDEJUMPSUIT
	armor = list(
		melee = 60,
		bullet = 25,
		energy = 25,
		bomb = 25,
		bio = 0,
		rad = 0
	)
	price_tag = 250

/obj/item/clothing/suit/armor/heavy/riot/ironhammer
	icon_state = "riot_ironhammer"
	item_state = "swat_suit"

/*
 * Storage Types
 */
/obj/item/clothing/suit/storage/vest
	name = "webbed armor"
	desc = "An armored vest used for day-to-day operations. This one has various pouches and straps attached."
	icon_state = "webvest"
	price_tag = 250 //Normal vest is worth 200, this one is worth 250 because it also has storage space
	armor = list(
		melee = 20,
		bullet = 30,
		energy = 20,
		bomb = 25,
		bio = 0,
		rad = 0
	)

	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	item_flags = DRAG_AND_DROP_UNEQUIP|EQUIP_SOUNDS|THICKMATERIAL

	cold_protection = UPPER_TORSO|LOWER_TORSO
	min_cold_protection_temperature = ARMOR_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = UPPER_TORSO|LOWER_TORSO
	max_heat_protection_temperature = ARMOR_MAX_HEAT_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.6

/obj/item/clothing/suit/storage/vest/ironhammer
	name = "webbed operator armor"
	desc = "An armored vest that protects against some damage. This one has been done in Nadezhda Marshal colors and has various pouches and straps attached."
	icon_state = "webvest_ironhammer"

//Provides the protection of a merc voidsuit, but only covers the chest/groin, and also takes up a suit slot. In exchange it has no slowdown and provides storage.
/obj/item/clothing/suit/storage/vest/merc
	name = "heavy armor vest"
	desc = "A high-quality armor vest in a fetching tan. It is surprisingly flexible and light, even with the added webbing and armor plating."
	icon_state = "mercwebvest"
	item_state = "mercwebvest"
	max_upgrades = 0 //No upgrading this one
	tool_qualities = list()
	price_tag = 300
	armor = list(
		melee = 55,
		bullet = 55,
		energy = 55,
		bomb = 45,
		bio = 0,
		rad = 0
	)

//Has some armor and but is a mix of the scav suit and a webbing
/obj/item/clothing/suit/storage/vest/scav
	name = "armored rig"
	desc = "A simple plate carrier modified for personal use, additional pouches have been attached to it's front, \
	with matching knee and arm pads to protect limbs without hindering movement. \
	Opening the plate pouch would reveal a sheet of some Greyson alloy, welded and forced into a shape for the vest, \
	far lighter and offering more protection then it's more common ceramic counterparts."
	icon_state = "forehead_armor"
	item_state = "forehead_armor"
	max_upgrades = 0 //No upgrading this one
	tool_qualities = list()
	matter = list(MATERIAL_PLASTEEL = 24, MATERIAL_PLASTIC = 35, MATERIAL_PLATINUM  = 4, MATERIAL_STEEL = 40) //worth stealing
	price_tag = 1200
	body_parts_covered = UPPER_TORSO|LEGS|ARMS|LOWER_TORSO
	cold_protection = UPPER_TORSO|LEGS|ARMS|LOWER_TORSO
	armor = list(
		melee = 40,
		bullet = 35,
		energy = 40,
		bomb = 35,
		bio = 0,
		rad = 0
	)
/obj/item/clothing/suit/storage/vest/scav/New()
	..()
	pockets = new/obj/item/storage/internal(src)
	pockets.storage_slots = 2	//two slots
	pockets.max_w_class = ITEM_SIZE_NORMAL		//fits two normal size items as its big pockets
	pockets.max_storage_space = 8

//Blackshield armor
/obj/item/clothing/suit/armor/platecarrier
	name = "plate carrier"
	desc = "An armored vest carrying trauma plates and light ballistic meshes."
	icon_state = "platecarrier"
	item_state = "platecarrier"
	blood_overlay_type = "armor"
	armor = list(melee = 35, bullet = 45, energy = 20, bomb = 10, bio = 0, rad = 0)

/obj/item/clothing/suit/armor/platecarrier/full
	name = "full body plate carrier"
	desc = "An armored vest carrying trauma plates and light ballistic meshes, in Blackshield colors. It has been improved by adding shoulderpads and kneepads for additional coverage."
	icon_state = "platecarrier_fullbody"
	item_state = "platecarrier_fullbody"
	blood_overlay_type = "armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS

/obj/item/clothing/suit/armor/platecarrier/ih
	name = "plate carrier"
	desc = "An armored vest carrying trauma plates and light ballistic meshes, in Marshals colors."
	icon_state = "platecarrier_ih"
	item_state = "platecarrier_ih"

/obj/item/clothing/suit/armor/platecarrier/ih/full
	name = "full body plate carrier"
	desc = "An armored vest carrying trauma plates and light ballistic meshes, in Marshals colors. It has been improved by adding shoulderpads and kneepads for additional coverage."
	icon_state = "platecarrier_ih_fullbody"
	item_state = "platecarrier_ih_fullbody"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS

/obj/item/clothing/suit/armor/platecarrier/militia
	name = "blackshield plate carrier"
	desc = "An armored vest carrying trauma plates and light ballistic meshes, this one bears the distinct IFF stripes of the Blackshield."
	icon_state = "platecarrier_mil"
	item_state = "platecarrier_mil"

/obj/item/clothing/suit/armor/platecarrier/militia/full
	name = "blackshield full body plate carrier"
	desc = "An armored vest carrying trauma plates and light ballistic meshes, as well as additional shoulderpads and kneepads, decorated with the IFF stripes of Blackshield."
	icon_state = "platecarrier_mil_fullbody"
	item_state = "platecarrier_mil_fullbody"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS

/obj/item/clothing/suit/armor/platecarrier/corpsman
	name = "Corpsman plate carrier"
	desc = "An armored vest carrying trauma plates and light ballistic meshes, this one is marked with Corpsman liverly and has a stain resistant coating."
	icon_state = "platecarrier_corpsman"
	item_state = "platecarrier_corpsman"
	armor = list(melee = 35, bullet = 45, energy = 20, bomb = 10, bio = 20, rad = 0)

/obj/item/clothing/suit/armor/platecarrier/corpsman/full
	name = "Corpsman full body plate carrier"
	desc = "An armored vest carrying trauma plates and light ballistic meshes, this one is marked with corpsman liverly and has a stain resistant coating as well as additional shoulderpads and kneepads for added protection."
	icon_state = "platecarrier_corpsman_fullbody"
	item_state = "platecarrier_corpsman_fullbody"
	armor = list(melee = 35, bullet = 45, energy = 20, bomb = 10, bio = 20, rad = 0) // Just in case it doesn't inherit armor qualities
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS

/obj/item/clothing/suit/armor/platecarrier/green
	name = "green plate carrier"
	desc = "An armored vest carrying trauma plates and light ballistic meshes, this one suits wooded areas well."
	icon_state = "platecarrier_green"
	item_state = "platecarrier_green"

/obj/item/clothing/suit/armor/platecarrier/green/full
	name = "full body green plate carrier"
	desc = "An armored vest carrying trauma plates and light ballistic meshes, this one suits wooded areas well. Has increased coverage due to the prescence of shoulderpads and kneepads."
	icon_state = "platecarrier_green_fullbody"
	item_state = "platecarrier_green_fullbody"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS

/obj/item/clothing/suit/armor/platecarrier/tan
	name = "tan plate carrier"
	desc = "An armored vest carrying trauma plates and light ballistic meshes, this one suits endless desert warfare well."
	icon_state = "platecarrier_tan"
	item_state = "platecarrier_tan"

/obj/item/clothing/suit/armor/platecarrier/tan/full
	name = "full body tan plate carrier"
	desc = "An armored vest carrying trauma plates and light ballistic meshes, this one suits endless desert warfare well. Has increased coverage due to the prescence of shoulderpads and kneepads."
	icon_state = "platecarrier_tan_fullbody"
	item_state = "platecarrier_tan_fullbody"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS

/obj/item/clothing/suit/armor/platecarrier/hos
	name = "advanced plate carrier"
	desc = "An armored vest carrying military grade trauma plates and advanced ballistic meshes."
	icon_state = "platecarrier_ih"
	item_state = "platecarrier_ih"
	blood_overlay_type = "armor"
	slowdown = 0.15
	armor = list(melee = 50, bullet = 50, energy = 30, bomb = 10, bio = 0, rad = 0)

/obj/item/clothing/suit/armor/flackvest
	name = "flak vest"
	desc = "An armored, padded vest meant for heavy-duty operations. Heavy and bulky, it protects well against explosives and shrapnel."
	icon_state = "flakvest"
	item_state = "flakvest"
	blood_overlay_type = "armor"
	price_tag = 250
	slowdown = 0.5
	armor = list(melee = 40, bullet = 40, energy = 20, bomb = 50, bio = 0, rad = 0)

/obj/item/clothing/suit/armor/flackvest/full // Sic.
	name = "full body flak vest"
	desc = "An armored, padded vest meant for heavy-duty operations, it protects well against explosives and shrapnel. This set has had kneepads and shoulderpads attached for more protection."
	icon_state = "flakvest_fullbody"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	slowdown = 0.6 // Bulkier due to protecting more
	armor = list(melee = 40, bullet = 40, energy = 20, bomb = 50, bio = 0, rad = 0) // Again, in case it doesn't inherit

/obj/item/clothing/suit/armor/flackvest/tan
	name = "flak tan vest"
	icon_state = "flakvest_tan"

/obj/item/clothing/suit/armor/flackvest/tan/full
	name = "full body tan flak vest"
	icon_state = "flakvest_tan_fullbody"

/obj/item/clothing/suit/armor/flackvest/militia
	name = "blackshield flak vest"
	desc = "An armored, padded vest meant for heavy-duty operations. Heavy and bulky, it protects well against explosives and shrapnel. \
			This one is marked with the distinct IFF stripes of the Blackshield."
	icon_state = "flakvest_mil"
	item_state = "flakvest_mil"

/obj/item/clothing/suit/armor/flackvest/militia/full
	name = "blackshield full flak vest"
	desc = "An armored, padded vest meant for heavy-duty operations. Heavy and bulky, it protects well against explosives and shrapnel. \
			This one is marked with the distinct IFF stripes of the Blackshield, and offers additional coverage through shoulderpads and kneepads."
	icon_state = "flakvest_mil_fullbody"
	item_state = "flakvest_mil_fullbody"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	slowdown = 0.6 // Bulkier due to protecting more

/obj/item/clothing/suit/armor/flackvest/green
	name = "flak vest"
	desc = "An armored, padded vest meant for heavy-duty operations.\
			Some folks are born made to wave the flag."
	icon_state = "flakvest_green"
	item_state = "flakvest_green"

/obj/item/clothing/suit/armor/flackvest/green/full
	name = "full body green flak vest"
	desc = "An armored, padded vest meant for heavy-duty operations.\
			Some folks are born made to wave the flag. And wear stylish kneepads and shoulderpads."
	icon_state = "flakvest_green"
	item_state = "flakvest_green"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	slowdown = 0.6 // Bulkier due to protecting more

/obj/item/clothing/suit/armor/flackvest/commander
	name = "commander's flak vest"
	desc = "An armored, padded vest that's seen many long tours and is suited for heavy-duty operations. Heavy and bulky, it protects well against explosives and shrapnel. Smells of napalm and the sea."
	icon_state = "flakvest_mil"
	item_state = "flakvest_mil"
	blood_overlay_type = "armor"
	slowdown = 0.2
	armor = list(melee = 45, bullet = 50, energy = 30, bomb = 50, bio = 0, rad = 0)

/obj/item/clothing/suit/armor/flackvest/commander/full
	name = "commander's full body flak vest"
	desc = "An armored, padded vest that's seen many long tours and is suited for heavy-duty operations. \
			Heavy and bulky, it protects well against explosive and shrapnel. Smells of napalm and the sea. \
			This model adds shoulder and thighs protection through additional layers of protective armor." // Thighington simps rejoice. - Seb
	icon_state = "commander_mil_fullbody"
	item_state = "commander_mil_fullbody"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	slowdown = 0.3 // Bulkier due to protecting more
	armor = list(
		melee = 45,
		bullet = 50,
		energy = 30,
		bomb = 50,
		bio = 0,
		rad = 0
		)

/obj/item/clothing/suit/armor/commander
	name = "commander's armored coat"
	desc = "A heavily armored combination of menacing style and cutting-edge body armor."
	icon_state = "commander"
	item_state = "commander"
	blood_overlay_type = "coat"
	permeability_coefficient = 0.50
	armor = list(melee = 45, bullet = 50, energy = 25, bomb = 30, bio = 0, rad = 0)
	body_parts_covered = UPPER_TORSO|ARMS
	cold_protection = UPPER_TORSO|ARMS
	min_cold_protection_temperature = T0C - 20
	siemens_coefficient = 0.7

/obj/item/clothing/suit/armor/commander/militia
	name = "blackshield commander's armored coat"
	desc = "A heavily armored combination of menacing style and cutting-edge body armor wearing the insignia and stripes of the Blackshield Commander. The armor plates even can be recoloured on the go to act as camo."
	icon_state = "commander_mil"
	item_state = "commander_mil"

/obj/item/clothing/suit/armor/commander/militia/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Blackshield Colours"] = "commander_mil"
	options["Deseret Combat"] = "commander_tan"
	options["Woodlands Combat"] = "commander_green"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

obj/item/clothing/suit/armor/commander/militia_overcoat
	name = "blackshield armored overcoat"
	desc = "Blackshield greatcoat with kevlar weave and rank epaulettes. Worn in cold environments, guard duty or formal events."
	icon_state = "overcoat_bm"
	item_state = "overcoat_bm"

obj/item/clothing/suit/armor/commander/marshal_coat
	name = "marshal officers greatcoat"
	desc = "Marshal Officer greatcoat with armor weave. Part of the formal uniform of the security marshals."
	icon_state = "marshal_coat"
	item_state = "marshal_coat"

obj/item/clothing/suit/armor/commander/marshal_coat_ss
	name = "supply specialist's jacket"
	desc = "Supply Specialist's jacket with an armored weave. For formality, protection and style."
	icon_state = "marshal_coat_ss"
	item_state = "marshal_coat_ss"

/*
 * Reactive Armor
 */
//When the wearer gets hit, this armor will teleport the user a short distance away (to safety or to more danger, no one knows. That's the fun of it!)
/obj/item/clothing/suit/armor/reactive
	name = "reactive teleport armor"
	desc = "Someone separated our Research Director's head from their body!"
	var/active = FALSE
	icon_state = "reactiveoff"
	item_state = "reactiveoff"
	blood_overlay_type = "armor"
	armor = list(
		melee = 20,
		bullet = 20,
		energy = 20,
		bomb = 0,
		bio = 0,
		rad = 0
		)
	var/entropy_value = 2

/obj/item/clothing/suit/armor/reactive/handle_shield(mob/user, damage, atom/damage_source = null, mob/attacker = null, def_zone = null, attack_text = "the attack")
	if(prob(50))
		user.visible_message(SPAN_DANGER("The reactive teleport system flings [user] clear of the attack!"))
		var/turf/TLoc = get_turf(user)
		var/turf/picked = get_random_secure_turf_in_range(src, 7, 1)
		if(!picked) return
		var/datum/effect/effect/system/spark_spread/spark_system = new /datum/effect/effect/system/spark_spread()
		spark_system.set_up(5, 0, user.loc)
		spark_system.start()
		go_to_bluespace(TLoc, entropy_value, TRUE, user, picked)
		return PROJECTILE_FORCE_MISS
	return FALSE

/obj/item/clothing/suit/armor/reactive/attack_self(mob/user)
	src.active = !( src.active )
	if (src.active)
		to_chat(user, "\blue The reactive armor is now active.")
		src.icon_state = "reactive"
		src.item_state = "reactive"
	else
		to_chat(user, "\blue The reactive armor is now inactive.")
		src.icon_state = "reactiveoff"
		src.item_state = "reactiveoff"
		src.add_fingerprint(user)
	return

/obj/item/clothing/suit/armor/reactive/emp_act(severity)
	active = 0
	src.icon_state = "reactiveoff"
	src.item_state = "reactiveoff"
	..()

/// Hunting Lodge Armor

/obj/item/clothing/suit/armor/hunter
	name = "hunter armor"
	desc = "A lightly armored breastplate and knee-guards supplied by the local hunting-lodge. It appears to be rather crudely self made."
	icon_state = "hunter_armor"
	item_state = "hunter_armor"
	blood_overlay_type = "armor"
	armor = list(
		melee = 30,
		bullet = 20,
		energy = 20,
		bomb = 10,
		bio = 0,
		rad = 0 )
	body_parts_covered = UPPER_TORSO|LEGS|ARMS|LOWER_TORSO
	cold_protection = UPPER_TORSO|LEGS|ARMS|LOWER_TORSO

/obj/item/clothing/suit/armor/hunter/bone
	name = "hunter armor"
	desc = "A lightly armored breastplate with bone-reinforcements of animal ribs and skulls accompanied by knee-guards from an unknown animal, \
	supplied by the local hunting-lodge. It appears to be rather crudely self made. \ "
	icon_state = "hunter_armor_bone"
	item_state = "hunter_armor_bone"
	blood_overlay_type = "armor"
	armor = list(
		melee = 45,
		bullet = 25,
		energy = 25,
		bomb = 10,
		bio = 0,
		rad = 0)

/obj/item/clothing/suit/armor/hunter/reinforced
	name = "hunter armor"
	desc = "A heavily armored breastplate and knee-guards supplied by the local hunting-lodge. It appears to be rather crudely self made with steel plating functioning as make-shift kevlar plates."
	icon_state = "hunter_armor_reinforced"
	item_state = "hunter_armor_reinforced"
	blood_overlay_type = "armor"
	armor = list(
		melee = 30,
		bullet = 45,
		energy = 25,
		bomb = 10,
		bio = 0,
		rad = 0)

/obj/item/clothing/suit/armor/hunter/leather
	name = "hunter armor"
	desc = "A lightly armored breastplate, leather sleeves, and knee-guards supplied by the local hunting-lodge. It appears to be rather crudely self made, yet the extra leather reinforcement is not \
	only stylish but aids greatly is dispersing laser and plasma shots."
	icon_state = "hunter_armor_leather"
	item_state = "hunter_armor_leather"
	blood_overlay_type = "armor"
	armor = list(
		melee = 30,
		bullet = 25,
		energy = 45,
		bomb = 10,
		bio = 0,
		rad = 0)

/obj/item/clothing/suit/armor/vest/handmadewooden
	name = "wooden armor"
	desc = "A series of planks held into a relatively torso shaped form by cloth tied around the shoulders and waist. Then further padded with more cloth along the inside."
	icon_state = "hm_woodvest"
	item_state = "hm_woodvest"
	armor = list(
		melee = 25, //It's made of mostly wood and cloth, shittiest armor in the game easily, but does have bio and rad, giving it a rare but still possible boost over handmade. -Kaz
		bullet = 15, // Justifying keeping somewhat decent values on bullet just because I changed the recipe to include steel. - Seb
		energy = 10, // It's mostly made of wood, it will char easily.
		bomb = 10,
		bio = 25,
		rad = 25
	)
	price_tag = 50
