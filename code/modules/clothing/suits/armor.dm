
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

/*
 * Vests
 */
/obj/item/clothing/suit/armor/vest
	name = "armor"
	desc = "An armored vest that protects against some damage. Not designed for serious operations."
	icon_state = "armor"
	item_state = "armor"
	blood_overlay_type = "armor"
	armor = list(
		melee = 30,
		bullet = 30,
		energy = 30,
		bomb = 10,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/suit/armor/vest/security
	name = "security armor"
	icon_state = "armor_security"

/obj/item/clothing/suit/armor/vest/detective
	name = "armor"
	desc = "An armored vest with a ranger's badge on it."
	icon_state = "armor_detective"

/obj/item/clothing/suit/armor/vest/ironhammer
	name = "security armor"
	desc = "An armored vest that protects against some damage. This one has been done in marshal security colors. Not designed for serious operations."
	icon_state = "armor_ironhammer"

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

/obj/item/clothing/suit/armor/vest/botanist
	name = "botanist attire"
	desc = "Every rose has its thorns."
	icon_state = "botanist"
	item_flags = THICKMATERIAL | COVER_PREVENT_MANIPULATION
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 30, bullet = 20, energy = 15, bomb = 25, bio = 100, rad = 80)
	flags_inv = HIDEJUMPSUIT

/obj/item/clothing/suit/armor/vest/acolyte
	name = "vector armor"
	desc = "Worn, heavy, steadfast in the name of God."
	icon_state = "acolyte"
	item_flags = THICKMATERIAL | COVER_PREVENT_MANIPULATION
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 30, bullet = 30, energy = 25, bomb = 25, bio = 100, rad = 80)
	flags_inv = HIDEJUMPSUIT

/obj/item/clothing/suit/armor/vest/custodian
	name = "custodian armor"
	desc = "Someone's gotta clean this mess. While this armor is technically church property, lonestar custodians often use it on loan to protect themselves from the colonies various dangerous pests."
	icon_state = "custodian"
	item_flags = THICKMATERIAL | COVER_PREVENT_MANIPULATION
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 30, bullet = 30, energy = 25, bomb = 25, bio = 100, rad = 80)
	flags_inv = HIDEJUMPSUIT

/obj/item/clothing/suit/armor/vest/prime
	name = "prime armor"
	desc = "Trust in god but keep your armor on."
	icon_state = "prime"
	item_flags = THICKMATERIAL | COVER_PREVENT_MANIPULATION
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(
		melee = 40,
		bullet = 40,
		energy = 40,
		bomb = 50,
		bio = 100,
		rad = 100
	)
	flags_inv = HIDEJUMPSUIT

/obj/item/clothing/suit/armor/vest/technomancersuit
	name = "'Mark V' enviromental protection suit"
	desc = "For working in hazardous enviroments. While its built for most enviroments, one of those is not space."
	icon_state = "technosuit"
	item_flags = THICKMATERIAL | COVER_PREVENT_MANIPULATION
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 35, bullet = 35, energy = 35, bomb = 50, bio = 100, rad = 100)
	extra_allowed = list(/obj/item/weapon/extinguisher,
						 /obj/item/weapon/tool,
						 /obj/item/weapon/tool_upgrade,
						 /obj/item/stack/cable_coil,
						 /obj/item/device/t_scanner,
						 /obj/item/device/scanner/gas,
						 /obj/item/taperoll/engineering,
						 /obj/item/weapon/storage/toolbox)
	flags_inv = HIDEJUMPSUIT

/obj/item/clothing/suit/armor/vest/soteriasuit
	name = "'Mark II' enviromental protection suit"
	desc = "For working in hazardous enviroments. While its built for most enviroments, one of those is not space. This suit is a cheap and badly made copy of the Artificer Guilds original design. \
	Unlike its superior, it offers alot less armor but it is made out of basic steel, making it a cheaper, easier alternative to build."
	icon_state = "armor_engineering"
	item_flags = THICKMATERIAL | COVER_PREVENT_MANIPULATION
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 30, bullet = 20, energy = 20, bomb = 30, bio = 50, rad = 50)
	extra_allowed = list(/obj/item/weapon/extinguisher,
						 /obj/item/weapon/tool,
						 /obj/item/weapon/tool_upgrade,
						 /obj/item/stack/cable_coil,
						 /obj/item/device/t_scanner,
						 /obj/item/device/scanner/gas,
						 /obj/item/taperoll/engineering,
						 /obj/item/weapon/storage/toolbox)
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

/obj/item/clothing/suit/armor/laserproof/handle_shield(mob/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")
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
	desc = "A soteria branded vest that excels in protecting the wearer against energy projectiles. While it is much better at defending against lasers compared to standard ablative armor it lacks as much protection against melee and bullets."
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
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	armor = list(
		melee = 35,
		bullet = 35,
		energy = 35,
		bomb = 25,
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
	name = "webbed armor vest"
	desc = "A synthetic armor vest. This one has added webbing and ballistic plates."
	icon_state = "webvest"
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

//Blackshield armor
/obj/item/clothing/suit/armor/platecarrier
	name = "plate carrier"
	desc = "An armored vest carrying trauma plates and light ballistic meshes."
	icon_state = "platecarrier"
	item_state = "platecarrier"
	blood_overlay_type = "armor"
	armor = list(melee = 35, bullet = 45, energy = 15, bomb = 10, bio = 0, rad = 0)

/obj/item/clothing/suit/armor/platecarrier/ih
	name = "plate carrier"
	desc = "An armored vest carrying trauma plates and light ballistic meshes, in security colors."
	icon_state = "platecarrier_ih"
	item_state = "platecarrier_ih"

/obj/item/clothing/suit/armor/platecarrier/militia
	name = "blackshield plate carrier"
	desc = "An armored vest carrying trauma plates and light ballistic meshes, this one ears the distinct IFF stripes of the Blackshield."
	icon_state = "platecarrier_mil"
	item_state = "platecarrier_mil"

/obj/item/clothing/suit/armor/platecarrier/corpsman
	name = "Corpsman plate carrier"
	desc = "An armored vest carrying trauma plates and light ballistic meshes, this one is marked with corpsman liverly and has a stain resistant coating."
	icon_state = "platecarrier_corpsman"
	item_state = "platecarrier_corpsman"
	armor = list(melee = 35, bullet = 35, energy = 15, bomb = 10, bio = 20, rad = 0)

obj/item/clothing/suit/armor/platecarrier/green
	name = "green plate carrier"
	desc = "An armored vest carrying trauma plates and light ballistic meshes, this one suits wooded areas well."
	icon_state = "platecarrier_green"
	item_state = "platecarrier_green"

obj/item/clothing/suit/armor/platecarrier/tan
	name = "tan plate carrier"
	desc = "An armored vest carrying trauma plates and light ballistic meshes, this one suits endless desert warfare well."
	icon_state = "platecarrier_tan"
	item_state = "platecarrier_tan"

/obj/item/clothing/suit/armor/platecarrier/hos
	name = "advanced plate carrier"
	desc = "An armored vest carrying military grade trauma plates and advanced ballistic meshes."
	icon_state = "platecarrier_ih"
	item_state = "platecarrier_ih"
	blood_overlay_type = "armor"
	slowdown = 0.15
	armor = list(melee = 40, bullet = 50, energy = 20, bomb = 10, bio = 0, rad = 0)


obj/item/clothing/suit/armor/flackvest
	name = "flak vest"
	desc = "An armored, padded vest meant for heavy-duty operations. Heavy and bulky, it protects well against explosives and shrapnel."
	icon_state = "flakvest"
	item_state = "flakvest"
	blood_overlay_type = "armor"
	slowdown = 0.5
	armor = list(melee = 40, bullet = 40, energy = 20, bomb = 50, bio = 0, rad = 0)

obj/item/clothing/suit/armor/flackvest/militia
	name = "blackshield flak vest"
	desc = "An armored, padded vest meant for heavy-duty operations. Heavy and bulky, it protects well against explosives and shrapnel. \
			This one is marked with the distinct IFF stripes of the Blackshield."
	icon_state = "flakvest_mil"
	item_state = "flakvest_mil"

obj/item/clothing/suit/armor/flackvest/green
	name = "flak vest"
	desc = "An armored, padded vest meant for heavy-duty operations.\
			Some folks are born made to wave the flag."
	icon_state = "flakvest_green"
	item_state = "flakvest_green"

obj/item/clothing/suit/armor/flackvest/commander
	name = "commander's flak vest"
	desc = "An armored, padded vest that's seen many long tours and is suited for heavy-duty operations. Heavy and bulky, it protects well against explosives and shrapnel. Smells of napalm and the sea."
	icon_state = "flakvest_green"
	item_state = "flakvest_green"
	blood_overlay_type = "armor"
	slowdown = 0.2
	armor = list(melee = 45, bullet = 50, energy = 30, bomb = 50, bio = 0, rad = 0)

obj/item/clothing/suit/armor/commander
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

obj/item/clothing/suit/armor/commander/militia
	name = "blackshield commander's armored coat"
	desc = "A heavily armored combination of menacing style and cutting-edge body armor wearing the insignia and stripes of the Blackshield Commander.."
	icon_state = "commander_mil"
	item_state = "commander_mil"

obj/item/clothing/suit/armor/commander/militia_overcoat
	name = "blackshield armored overcoat"
	desc = "Blackshield greatcoat with kevlar weave and rank epaulettes. Worn in cold environments, guard duty or formal events."
	icon_state = "overcoat_bm"
	item_state = "overcoat_bm"

obj/item/clothing/suit/armor/commander/marshal_coat
	name= "marshal officers greatcoat"
	desc= "marshal officer greatcoat with armor weave. Part of the formal uniform of the security marshals."
	icon_state = "marshal_coat"
	item_state = "marshal_coat"

obj/item/clothing/suit/armor/commander/marshal_coat_ss
	name= "supply specialist's greatcoat"
	desc= "supply specialist's greatcoat with armor weave. Part of the formal uniform of the security marshals."
	icon_state = "marshal_coat_ss"
	item_state = "marshal_coat_ss"

//Reactive armor

//Provides the protection of a merc voidsuit, but only covers the chest/groin, and also takes up a suit slot. In exchange it has no slowdown and provides storage.
/obj/item/clothing/suit/storage/vest/merc
	name = "heavy armor vest"
	desc = "A high-quality armor vest in a fetching tan. It is surprisingly flexible and light, even with the added webbing and armor plating."
	icon_state = "mercwebvest"
	item_state = "mercwebvest"
	armor = list(
		melee = 35,
		bullet = 35,
		energy = 35,
		bomb = 25,
		bio = 0,
		rad = 0
	)

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

/obj/item/clothing/suit/armor/reactive/handle_shield(mob/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")
	if(prob(50))
		user.visible_message(SPAN_DANGER("The reactive teleport system flings [user] clear of the attack!"))
		var/list/turfs = new/list()
		var/turf/TLoc = get_turf(user)
		for(var/turf/T in trange(6, TLoc))
			if(istype(T,/turf/space)) continue
			if(T.density) continue
			if(T.x>world.maxx-6 || T.x<6)	continue
			if(T.y>world.maxy-6 || T.y<6)	continue
			turfs += T
		if(!turfs.len) turfs += pick(/turf in orange(6))
		var/turf/picked = pick(turfs)
		if(!isturf(picked)) return

		var/datum/effect/effect/system/spark_spread/spark_system = new /datum/effect/effect/system/spark_spread()
		spark_system.set_up(5, 0, user.loc)
		spark_system.start()
		playsound(user.loc, "sparks", 50, 1)

		user.loc = picked
		return PROJECTILE_FORCE_MISS
	return 0

/obj/item/clothing/suit/armor/reactive/attack_self(mob/user as mob)
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
