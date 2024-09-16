/obj/item/gun/projectile/revolver/rev10
	name = "\"Frontier\" magnum revolver"
	desc = "A well made police revolver used by many departments around the universal frontier. While the design appears to predate its production by H&S it has become iconic to their company for stopping power. \
	It appears to take 10mm magnum rounds loaded via its break-action."
	icon = 'icons/obj/guns/projectile/rev10.dmi'
	icon_state = "rev10"
	item_state = "rev10"
	drawChargeMeter = FALSE
	caliber = CAL_MAGNUM
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	max_shells = 6
	matter = list(MATERIAL_PLASTEEL = 14, MATERIAL_WOOD = 6)
	price_tag = 700
	gun_parts = list(/obj/item/part/gun/frame/rev10 = 1, /obj/item/part/gun/grip/serb = 1, /obj/item/part/gun/mechanism/revolver = 1, /obj/item/part/gun/barrel/magnum = 1)
	damage_multiplier = 1.4
	penetration_multiplier = 1.3
	init_recoil = HANDGUN_RECOIL(1.2)
	zoom_factors = list(0.2)
	fire_sound = 'sound/weapons/guns/fire/revolver_fire.ogg'
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_REVOLVER)
	can_dual = TRUE
	serial_type = "H&S"

	wield_delay = 0.4 SECOND
	wield_delay_factor = 0.4 // 40 vig

/obj/item/gun/projectile/revolver/rev10/update_icon()
	..()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (loaded.len == 0)
		iconstring += "_slide"
	else
		iconstring = initial(icon_state) + "_full"


	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/revolver/rev10/Initialize()
	. = ..()
	update_icon()

/obj/item/part/gun/frame/rev10
	name = "Break-action frame"
	desc = "An old school frame for outdated but cheap to make revolvers. Can be used to construct Cowboy and Frontier."
	icon_state = "frame_revolver_hm"
	result = /obj/item/gun/projectile/revolver/rev10
	gripvars = list(/obj/item/part/gun/grip/serb, /obj/item/part/gun/grip/wood)
	mechanismvar = /obj/item/part/gun/mechanism/revolver
	barrelvars = list(/obj/item/part/gun/barrel/magnum, /obj/item/part/gun/barrel/pistol)
	resultvars = list(/obj/item/gun/projectile/revolver/rev10, /obj/item/gun/projectile/revolver/rev10/rex10)

/obj/item/gun/projectile/revolver/rev10/rex10
	name = "\"Cowboy\" double-action revolver"
	desc = "A relatively common gun around the frontier of the galaxy. This gun can be found worn by outlaws, criminals and small-time sheriffs or law enforcement. \
	It lacks any serial markings; it's hard to tell who even produces these guns they're so common. But hey, easy reloading via its break-action!"
	icon = 'icons/obj/guns/projectile/rex10.dmi'
	icon_state = "rex10"
	item_state = "rex10"
	caliber = CAL_PISTOL
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	fire_sound = 'sound/weapons/guns/fire/9mm_revolver.ogg'
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_WOOD = 6)
	price_tag = 300
	gun_parts = list(/obj/item/part/gun/frame/rev10 = 1, /obj/item/part/gun/grip/wood = 1, /obj/item/part/gun/mechanism/revolver = 1, /obj/item/part/gun/barrel/pistol = 1)
	damage_multiplier = 1.2
	penetration_multiplier = 1.3
	init_recoil = HANDGUN_RECOIL(1.1)
	zoom_factors = list()
	gun_tags = list(GUN_PROJECTILE, GUN_CALIBRE_9MM, GUN_INTERNAL_MAG, GUN_REVOLVER)
	serial_type = "H&S"

/obj/item/gun/projectile/revolver/rev10/mateba
	name = "\"Mateba\" autorevolver"
	desc = "The \"Mateba\" autorevolver is a unique semiautomatic revolver chambered in 12mm whose patents were acquired by Seinemetall Defense GmbH for production. \
			Its two-part frame is divided between cylinder and barrel, mounted atop rails on the lower grip, effectively reducing muzzle flip \
			by aligning its bore with the operator's holding point, and sliding the whole mechanism back upon shooting thanks to its potent recoil compensator. \
			Such a mechanism, sadly, limits the caliber of this gun to the highest bore despite having sported interchangeable barrels at some point."
	icon = 'icons/obj/guns/projectile/mateba.dmi'
	icon_state = "mateba"
	item_state = "mateba"
	caliber = CAL_50
	max_shells = 5
	origin_tech = list(TECH_COMBAT = 10, TECH_MATERIAL = 5)
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_WOOD = 6, MATERIAL_PLATINUM = 2)
	fire_sound = 'sound/weapons/guns/fire/12mm_revolver.ogg'
	price_tag = 1500 // Very rare, very well made
	damage_multiplier = 1.3 // Not as good as the Deckard in penetration for balance purposes, still quite good.
	init_recoil = HANDGUN_RECOIL(0.5) // Takes no mods that assist with recoil.
	wield_delay = 0.6 SECOND
	wield_delay_factor = 0.3 // 30 vig, heavy gun - but still a handgun.
	can_dual = FALSE
	max_upgrades = 4 // Deckard on steroids, let's not get out of hand
	blacklist_upgrades = list( // Gun already has amazing recoil control, barrels that reduce recoil interfere with the sliding recoil control mechanism.
							  /obj/item/tool_upgrade/refinement/vibcompensator = TRUE,
							  /obj/item/tool_upgrade/reinforcement/guard = TRUE,
							  /obj/item/tool_upgrade/productivity/ergonomic_grip = TRUE,
							  /obj/item/tool_upgrade/refinement/ported_barrel = TRUE,)
	zoom_factors = list()
	gun_parts = list(/obj/item/part/gun/frame/mateba = 1, /obj/item/part/gun/grip/wood = 1, /obj/item/part/gun/mechanism/revolver = 1, /obj/item/part/gun/barrel/kurtz = 1)
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_REVOLVER, GUN_CALIBRE_12MM)
	serial_type = "SD GmbH"

/obj/item/part/gun/frame/mateba
	name = "Mateba frame"
	desc = "A \"Mateba\" autorevolver frame. A specialized, recoil-absorbing revolver frame for a potent firearm chambered in 12mm."
	icon_state = "frame_mateba"
	result = /obj/item/gun/projectile/revolver/rev10/mateba
	gripvars = list(/obj/item/part/gun/grip/wood)
	mechanismvar = /obj/item/part/gun/mechanism/revolver
	barrelvars = list(/obj/item/part/gun/barrel/kurtz)
	resultvars = list(/obj/item/gun/projectile/revolver/rev10/mateba)

