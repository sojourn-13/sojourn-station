//Oddity items are rare rewards from special locations that are usually highly defended by many or very powerful mobs, requiring effort to obtain them. They are often simple equipment with better stats
//or unique effects. These should never be placed enmasse or in easily reached places. -Kaz
//Guns
/obj/item/gun/projectile/handmade_pistol/anti_material/reliable
	name = "\"Finger of God\" handmade pistol"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these weapons are known to vanish and reappear when left alone. \
	Whoever made this particular model did exceptional work. Unlike lesser handmade pistols, this one jams less and has much better shot capability. This one chambers .60-06 anti material ammo."
	icon = 'icons/obj/guns/projectile/hm_bluecross.dmi'
	jam_chance = 5
	damage_multiplier = 1.36
	recoil_buildup = 25
	max_shells = 6
	price_tag = 750
	matter = list(MATERIAL_PLASTEEL = 8, MATERIAL_WOOD = 6) //Its now made of plasteel to show its whatever
	serial_type = "BlueCross"

/obj/item/gun/energy/sniperrifle/saint
	name = "\"Saint\" laser rifle"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these weapons are known to vanish and reappear when left alone. \
	The normal \"Valkyrie\" design meeting the improvements with Lightfall design in a wooden frame with a golden barrel to help conduct the extra little bit of juice to hit as hard as possible."
	charge_cost = 200
	fire_delay = 25
	price_tag = 3750
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_WOOD = 8, MATERIAL_GOLD = 9, MATERIAL_URANIUM = 6) //The normal valk needs silver this is gold plated!
	icon = 'icons/obj/guns/energy/sniper_saint.dmi'
	serial_type = "BlueCross"

/obj/item/gun/projectile/automatic/lmg/saw/unicorn
	name = "\"Unicorn\" light machinegun"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these weapons are known to vanish and reappear when left alone. \
	A small carved inscription of a unicorn has been cut into place near some additional added weights, giving this rifle amazing recoil control."
	recoil_buildup = 1
	price_tag = 3550
	slowdown_hold = 0
	brace_penalty = 2
	serial_type = "BlueCross"

/obj/item/gun/projectile/revolver/mistral/elite
	name = "\"Elite\" magnum revolver"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these weapons are known to vanish and reappear when left alone. \
	Unlike a standard mistral magnum this one has a bluespace crystal in the cylinder and weighted barrel for better recoil control. How many bullets does it hold? Uses .40 Magnum rounds."
	max_shells = 60
	recoil_buildup = 20
	price_tag = 3000
	serial_type = "BlueCross"

/obj/item/gun/projectile/revolver/mistral/elite/New()
	..()
	item_flags |= BLUESPACE
	bluespace_entropy(2, get_turf(src)) //Same as the normal bluespace crystal

/obj/item/gun/projectile/shotgun/doublebarrel/bluecross_shotgun
	name = "\"King's\" shotgun"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these weapons are known to vanish and reappear when left alone. \
	The replication of a prized legendary royal shotgun wielded by a king that was once prophesized to have used it for their own undoing."
	icon_state = "shotgun"
	load_method = SINGLE_CASING|SPEEDLOADER
	handle_casings = CYCLE_CASINGS
	flags = CONDUCT
	slot_flags = SLOT_BACK
	caliber = CAL_SHOTGUN
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_STEEL = 10)
	max_shells = 1
	damage_multiplier = 2
	penetration_multiplier = 2
	recoil_buildup = 50
	one_hand_penalty = 35 //full sized shotgun level
	price_tag = 3250
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG) //Regains its internal mag do to its more annoying way of reloading
	serial_type = "BlueCross"
	icon = 'icons/obj/guns/projectile/sawnoff/bluecross_shotgun.dmi'
	init_firemodes = list(
		list(mode_name="King's Wrath", mode_desc="Echos the will of king that onced used it.", burst=1, icon="semi"), //Snowfalk fire mode for snowflake gun
		list(mode_name="August Presence", mode_desc="Fires two of the king's decrees at the same time.", burst=2, icon="semi")
		)


/obj/item/gun/projectile/shotgun/doublebarrel/bluecross_shotgun/bolt_act(mob/living/user)
	bolt_open = !bolt_open
	if(bolt_open)
		playsound(src.loc, 'sound/weapons/guns/interact/shotgun_break.ogg', 75, 1)
		to_chat(user, SPAN_NOTICE("You snap the barrel open."))
	else
		playsound(src.loc, 'sound/weapons/guns/interact/shotgun_close.ogg', 75, 1)
		to_chat(user, SPAN_NOTICE("You snap the barrel closed"))
		bolt_open = 0
	add_fingerprint(user)
	update_icon()

/obj/item/gun/energy/ntpistol/mana
	name = "\"Mana from Heaven\" energy pistol"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these weapons are known to vanish and reappear when left alone. \
	A blue and black version of the standard \"Serenity\" energy pistol, somehow despite looking just like a repainted job it conserves power unusually well."
	charge_cost = 2
	price_tag = 2550
	serial_type = "BlueCross"
	icon = 'icons/obj/guns/energy/ntpistol_bluecross.dmi'

/obj/item/gun/projectile/automatic/maxim/replica
	name = "\"Maxim\" light machinegun"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these weapons are known to vanish and reappear when left alone. \
	A common design used by certain nefarious political groups, this model however has been stripped of its fellows evil machinations, making it safe to use by anyone."
	price_tag = 1884
	slowdown_hold = 0
	brace_penalty = 5
	serial_type = "BlueCross"

/obj/item/gun/energy/lasersmg/inferno
	name = "Disco Inferno \"Light Show\""
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these weapons are known to vanish and reappear when left alone. \
	Someone has inscribed 'inferno' in a stylized multi-color crayon on the side while modifying its internal power capacitor to be much more effeciant."
	charge_cost = 5
	price_tag = 1000
	serial_type = "BlueCross"

/obj/item/gun/energy/lasersmg/chaos_engine
	name = "Hell's Teeth \"Chaos Engine\""
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these weapons are known to vanish and reappear when left alone. \
			A styled red laser submachine gun often referred to as a chaos engine due to its unpredictability and penchant for letting its user unleash a blended hell of lasers."
	icon = 'icons/obj/guns/energy/lasersmg_hell.dmi'
	icon_state = "chaossmg"
	item_state = "chaossmg"
	damage_multiplier = 1.1 //makeshift laser
	recoil_buildup = 1
	one_hand_penalty = 2
	init_offset = 10 //makeshift laser
	charge_cost = 5
	price_tag = 1500
	serial_type = "BlueCross"

/obj/item/gun/projectile/silenced/rat
	name = "\"Rat Man\" silenced pistol"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these weapons are known to vanish and reappear when left alone. \
	A spray painted decal of a rat man with a grinning face has been placed on the grip, the deadliest killers are often those ignored or underestimated by others after all. \
	This particular pistol has been oiled, cleaned, and appears to be so well maintenanced that its become 110% of its normal potential."
	damage_multiplier = 1.8
	recoil_buildup = 2
	one_hand_penalty = 3
	penetration_multiplier = 3.1
	price_tag = 2350
	serial_type = "BlueCross"

/obj/item/gun/projectile/boltgun/bluecross
	name = "\"Krag Jørgensen\" boltgun"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these weapons are known to vanish and reappear when left alone. \
			A single shot rifle; perfect for big game hunters! \
			Amazing for a budget - or if you hate yourself. One of the two."
	icon = 'icons/obj/guns/projectile/bluecross.dmi'
	icon_state = "bluecross"
	item_state = "bluecross"
	gun_tags = list(GUN_PROJECTILE, GUN_SCOPE)
	force = WEAPON_FORCE_DANGEROUS
	bolt_training = FALSE
	damage_multiplier = 2.5 //basic shot will 67.6~ damage
	penetration_multiplier  = 2
	max_shells = 1
	price_tag = 2750
	sharp = FALSE
	saw_off = FALSE
	serial_type = "BlueCross"

/obj/item/gun/projectile/clarissa/devil_eye
	name = "\"Devil Eye\" pistol"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these weapons are known to vanish and reappear when left alone. \
			A small red eye has been painted onto the firing pin of this formerly undepowered pistol, this one has been modified with a better feed mechaism to allow \
			for deadlier shots. Uses .35 rounds and can take standard pistol magazines, high cap magazines, or submachine gun mags."
	price_tag = 2000
	mag_well = MAG_WELL_PISTOL | MAG_WELL_H_PISTOL | MAG_WELL_SMG
	damage_multiplier = 1.5
	serial_type = "BlueCross"

/obj/item/gun/projectile/boltgun/lever/handcock
	name = "\"Handcock\" lever action rifle"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these weapons are known to vanish and reappear when left alone. \
			The weapon's loading port seems skillfully enlarged to allow larger rounds to be loaded into the rifle of .06-06 caliber! \
			Wild-west styled antimaterial rifle.. who would have thought?"
	icon = 'icons/obj/guns/projectile/lever.dmi'
	icon_state = "lever"
	item_state = "lever"
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_SCOPE) //Dosnt take a silencer cuz thats just mean, also 60-06
	bolt_training = FALSE
	caliber = CAL_ANTIM
	max_shells = 4
	recoil_buildup = 60
	one_hand_penalty = 80
	price_tag = 3000
	serial_type = "BlueCross"

/obj/item/gun/projectile/automatic/slaught_o_matic/lockpickomatic
	name = "\"Lockpick-o-Matic\""
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these weapons are known to vanish and reappear when left alone. \
			Someone had a sense of humor when designing this weapon."
	caliber = "10x24"
	ammo_type = "/obj/item/ammo_casing/pistol"
	mag_well = MAG_WELL_PULSE
	magazine_type = /obj/item/ammo_magazine/c10x24
	price_tag = 15
	gun_tags = list(GUN_PROJECTILE)
	possible_colors = list("rainbow")
	recoil_buildup = 3
	one_hand_penalty = 5 //despine it being handgun, it's better to hold in two hands while shooting. SMG level.
	price_tag = 300
	serial_type = "BlueCross"

/obj/item/gun/energy/captain/zapper
	name = "\"Retro-Funk\" Zapper"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these weapons are known to vanish and reappear when left alone. \
			Not really much of an interesting weapon by cross standards, with no unusual properties besides a self charging battery and incredible shot capacity. Often loved for its simplicity and retro style."
	icon = 'icons/obj/guns/energy/zapper.dmi'
	icon_state = "zap"
	charge_cost = 50
	item_charge_meter = FALSE
	charge_meter = FALSE
	price_tag = 1500
	serial_type = "BlueCross"

/obj/item/gun/energy/xray/psychic_cannon
	name = "\"Manta-RAY\" cannon"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these weapons are known to vanish and reappear when left alone. \
			An unusual gun sought after by the Soteria when it appears for both its utility and its research value. It's durasteel interior and unknown technological function allows \
			this weapon to use moderately high damage armor penetrating x-ray laser blasts. While a strict step up from a standard x-ray weapon in all ways, this weapon is more valued for \
			its research points in the deconstrustive analyzer."
	icon = 'icons/obj/guns/energy/psychiccannon.dmi'
	icon_state = "psychic_lasercannon"
	item_state = "psychic_lasercannon"
	fire_sound = 'sound/weapons/laser3.ogg'
	origin_tech = list(TECH_COMBAT = 19, TECH_MATERIAL = 19, TECH_MAGNET = 19, TECH_ILLEGAL = 19)
	price_tag = 4000
	damage_multiplier = 1.2
	charge_cost = 100
	twohanded = FALSE
	gun_tags = list(GUN_LASER, GUN_ENERGY)
	can_dual = TRUE
	slot_flags = SLOT_BACK|SLOT_BELT|SLOT_HOLSTER
	serial_type = "BlueCross"


/obj/item/gun/projectile/that_gun
	name = "\"That Gun\" revolver pistol"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these weapons are known to vanish and reappear when left alone. \
			What the fuck?"
	icon = 'icons/obj/guns/projectile/that_gun.dmi'
	icon_state = "thatgun"
	item_state = "thatgun"
	caliber = CAL_PISTOL
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_PLASTIC = 6)
	price_tag = 1420
	fire_sound = 'sound/weapons/guns/fire/pistol_fire.ogg'
	can_dual = TRUE
	load_method = MAGAZINE
	mag_well = MAG_WELL_H_PISTOL|MAG_WELL_PISTOL
	damage_multiplier = 1.25
	penetration_multiplier = 1
	recoil_buildup = 0.1
	gun_tags = list(GUN_PROJECTILE, GUN_CALIBRE_35, GUN_MAGWELL)
	one_hand_penalty = 2

	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_3_ROUND,
		)
	serial_type = "BlueCross"

/obj/item/gun/projectile/that_gun/update_icon()
	..()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "[ammo_magazine? "_mag[ammo_magazine.max_ammo]": ""]"
		itemstring += "_full"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/colt/cult
	name = "Brass \"Cult\" pistol"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these weapons are known to vanish and reappear when left alone. \
			A normal looking Colt 35 but made completely out of brass with a small light in its chamber that glows an weary red, listening closely theirs a small ticking sound from inside \
			as well as warm to the touch."
	icon = 'icons/obj/guns/projectile/colt.dmi'
	icon_state = "brass"
	item_state = "brass"
	caliber = CAL_PISTOL
	origin_tech = list(TECH_MAGNET = 10) //3500 points for rnd, eh its meant to stay in player hands not be deconned
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_GOLD = 10, MATERIAL_SILVER = 10, MATERIAL_GLASS = 10, MATERIAL_PLATINUM = 8)
	price_tag = 2450
	fire_sound = 'sound/weapons/guns/fire/pistol_fire.ogg'
	can_dual = TRUE
	load_method = MAGAZINE
	mag_well = MAG_WELL_PISTOL | MAG_WELL_H_PISTOL
	damage_multiplier = 1.5
	recoil_buildup = 2
	one_hand_penalty = 3
	gun_tags = list(GUN_PROJECTILE, GUN_CALIBRE_35, GUN_SILENCABLE, GUN_MAGWELL)
	serial_type = "BlueCross"

/obj/item/gun/energy/lasersmg/p9evil
	name = "P9 \"Evil\" smg"
	desc = "An anomalous weapon created by rivals of the unknown person(or group?) of the bluecross, their work marked by a crimson cross, these weapons are known to vanish and reappear when left alone. \
			An odd looking tool-made smg of sorts, made completely out of stamped metal and hatred. You wonder by looking at this how many people have used this worn weapon of war. \
			Looking at it long enough appears to make you see red.. feeling as if its draining your life force just to fire it! Let the hatred RISE!"
	icon = 'icons/obj/guns/energy/p9evil.dmi'
	icon_state = "evil"
	item_state = "evil"
	origin_tech = list(TECH_ILLEGAL = 5)
	matter = list(MATERIAL_PLASTEEL = 6, MATERIAL_STEEL = 25)
	price_tag = 2500
	projectile_type = /obj/item/projectile/beam/weak/pistol_35
	charge_cost = 1000000000000000000000000000000000000
	suitable_cell = null
	fire_sound = 'sound/weapons/guns/fire/pistol_fire.ogg'
	can_dual = TRUE
	damage_multiplier = 1.2
	penetration_multiplier = 1.2
	recoil_buildup = 2
	one_hand_penalty = 10
	gun_tags = list(GUN_ENERGY, GUN_LASER, GUN_SILENCABLE)
	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_3_ROUND,
		FULL_AUTO_400
		)
	serial_type = "Crimson Cross"

/obj/item/gun/energy/lasersmg/p9evil/consume_next_projectile(mob/user)
	visible_message(SPAN_WARNING("\The gun draws the life of the user!"))
	playsound(loc, 'sound/weapons/Egloves.ogg', 50, 1, -1)
	user.maxHealth -=0.1
	user.health -=0.1
	return new projectile_type(src)

//Melee Weapons
/obj/item/tool/nailstick/ogre
	name = "\"Oni\" Greatclub"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these weapons are known to vanish and reappear when left alone. \
			A wooden club inscribed with several symbols of jana, though they make no sense put together. The wood is of unusual qualities and some lunatic hammered durasteel nails into \
			it. Either the maker didn't know or didn't care about the value, it still ended up a supremely deadly weapon ... or hammer."
	icon_state = "oni"
	force_unwielded = WEAPON_FORCE_BRUTAL
	force_wielded = WEAPON_FORCE_LETHAL
	throwforce = WEAPON_FORCE_PAINFUL
	w_class = ITEM_SIZE_NORMAL
	armor_penetration = ARMOR_PEN_HALF
	structure_damage_factor = STRUCTURE_DAMAGE_DESTRUCTIVE
	max_upgrades = 3
	price_tag = 3500 //the materals
	matter = list(MATERIAL_WOOD = 4, MATERIAL_DURASTEEL = 1)

/obj/item/tool/knife/dagger/assassin/ubersaw //Waiting for code to be done to deal blood damage/take % of blood
	name = "\"Uber\" syringe-dagger"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these weapons are known to vanish and reappear when left alone. \
			Whoever made this was very pro-active about collecting samples in the middle of active combat. They probably lost their medical license."
	price_tag = 1900

/obj/item/tool/wrench/big_wrench/freedom
	name = "\"Freedom\" wrench"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these weapons are known to vanish and reappear when left alone. \
			The sign of a man is someone who can build and who can break, with a wrench like this, you'll do both."
	icon_state = "freedom_wrench"
	w_class = ITEM_SIZE_NORMAL
	tool_qualities = list(QUALITY_BOLT_TURNING = 80, QUALITY_HAMMERING = 80)
	matter = list(MATERIAL_PLASTEEL = 5)
	force = WEAPON_FORCE_BRUTAL
	structure_damage_factor = STRUCTURE_DAMAGE_DESTRUCTIVE
	throwforce = WEAPON_FORCE_PAINFUL
	degradation = 0.7
	max_upgrades = 4
	price_tag = 1500

/obj/item/tool/saw/hyper/doombringer
	name = "\"Doombringer\" chainsword"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these weapons are known to vanish and reappear when left alone. \
			The only thing they fear is you."
	icon_state = "rip_and_tear"
	hitsound = WORKSOUND_CHAINSAW
	worksound = WORKSOUND_CHAINSAW
	force = WEAPON_FORCE_GODLIKE
	w_class = ITEM_SIZE_NORMAL
	armor_penetration = ARMOR_PEN_HALF
	matter = list(MATERIAL_SILVER = 2, MATERIAL_PLASTEEL = 10, MATERIAL_PLASTIC = 3)
	tool_qualities = list(QUALITY_SAWING = 70, QUALITY_CUTTING = 60, QUALITY_WIRE_CUTTING = 30)
	max_upgrades = 1//Already over powered.
	degradation = 0.1
	use_power_cost = 1
	suitable_cell = /obj/item/cell/medium
	price_tag = 1850

//Armor


//Tools and tool mods (these are for things not intended for fighting but for actual tools)
