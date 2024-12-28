//Oddity items are rare rewards from special locations that are usually highly defended by many or very powerful mobs, requiring effort to obtain them. They are often simple equipment with better stats
//or unique effects. These should never be placed enmasse or in easily reached places. -Kaz
//Guns
/obj/item/gun/energy/sniperrifle/saint
	name = "\"Saint\" laser rifle"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these items are known to vanish and reappear when left alone. \
	The normal \"Valkyrie\" design meeting the improvements with Lightfall design in a wooden frame with a golden barrel to help conduct the extra little bit of juice to hit as hard as possible."
	charge_cost = 200
	extra_damage_mult_scoped = 0.2
	fire_delay = 25
	price_tag = 3750
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_WOOD = 8, MATERIAL_GOLD = 9, MATERIAL_URANIUM = 6) //The normal valk needs silver this is gold plated!
	icon = 'icons/obj/guns/energy/sniper_saint.dmi'
	fire_sound = 'sound/weapons/energy/aer9fire.ogg'
	serial_type = "BlueCross"

/obj/item/gun/projectile/revolver/mistral/elite
	name = "\"Elite\" magnum revolver"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these items are known to vanish and reappear when left alone. \
	Unlike a standard Mistral magnum this one has a bluespace crystal in its cylinder and a weighted barrel for better recoil control. How many bullets does it hold? Uses 10mm Magnum rounds."
	max_shells = 60
	init_recoil = RIFLE_RECOIL(1.1)
	price_tag = 3000
	gun_parts = null
	serial_type = "BlueCross"

/obj/item/gun/projectile/revolver/mistral/elite/New()
	..()
	item_flags |= BLUESPACE
	bluespace_entropy(2, get_turf(src)) //Same as the normal bluespace crystal

/obj/item/gun/projectile/shotgun/doublebarrel/bluecross_shotgun
	name = "\"King's\" shotgun"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these items are known to vanish and reappear when left alone. \
	The replication of a prized legendary royal shotgun wielded by a king that was once prophesized to have used it for their own undoing."
	icon_state = "shotgun"
	handle_casings = CYCLE_CASINGS
	slot_flags = SLOT_BACK
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_STEEL = 10)
	max_shells = 1
	damage_multiplier = 2
	penetration_multiplier = 1
	init_recoil = RIFLE_RECOIL(4)
	price_tag = 3250
	gun_parts = null
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG) //Regains its internal mag due to its more annoying way of reloading
	serial_type = "BlueCross"
	icon = 'icons/obj/guns/projectile/sawnoff/bluecross_shotgun.dmi'
	init_firemodes = list(
		list(mode_name="King's Wrath", mode_desc="Echos the will of king that onced used it.", burst=1, icon="semi"), //Snowflake fire mode for snowflake gun
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
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these items are known to vanish and reappear when left alone. \
	A black and blue version of the defunct \"Serenity\" energy pistol, somehow despite looking just like a repainted job it conserves power unusually well."
	icon_state = "ntpistol"
	fire_sound = 'sound/weapons/energy/laser_pistol.ogg'
	charge_cost = 2
	projectile_type = /obj/item/projectile/beam
	can_dual = TRUE
	init_firemodes = list(
		WEAPON_NORMAL,
		WEAPON_CHARGE
	)
	twohanded = FALSE
	suitable_cell = /obj/item/cell/small
	cell_type = /obj/item/cell/small
	price_tag = 2550
	serial_type = "BlueCross"
	icon = 'icons/obj/guns/energy/ntpistol_bluecross.dmi'

/obj/item/gun/projectile/automatic/maxim/replica
	name = "\"Maxim\" light machinegun"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these items are known to vanish and reappear when left alone. \
	A common design used by certain nefarious political groups, this model however has been stripped of its fellows evil machinations, making it safe to use by anyone."
	icon = 'icons/obj/guns/projectile/maxim_colony.dmi'
	icon_state = "maxim_bluecross"
	item_state = "maxim_bluecross"
	price_tag = 1884
	slowdown_hold = 0
	init_recoil = LMG_RECOIL(0.5)
	serial_type = "BlueCross"
	excelsior = FALSE
	gun_parts = list(/obj/item/part/gun/frame/maxim = 1, /obj/item/part/gun/grip/black = 1, /obj/item/part/gun/mechanism/machinegun = 1, /obj/item/part/gun/barrel/lrifle = 1)

/obj/item/gun/energy/lasersmg/inferno
	name = "Disco Inferno \"Light Show\""
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these items are known to vanish and reappear when left alone. \
	Someone has inscribed 'INFERNO' in a stylized multi-color crayon on the side while modifying its internal power capacitor to be much more efficient."
	charge_cost = 10 // Ridiculously cell efficient
	projectile_type = /obj/item/projectile/beam/weak/smg/firestorm // DISCO INFERNO
	fire_sound = 'sound/weapons/guns/fire/sunrise_fire.ogg'
	icon_state = "lightshow" // 7 colors of the rainbow from pre-existing energy weapons! Woo!
	item_state = "lightshow"
	price_tag = 1000
	serial_type = "BlueCross"

/obj/item/gun/energy/lasersmg/chaos_engine
	name = "Hell's Teeth \"Chaos Engine\""
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these items are known to vanish and reappear when left alone. \
			A styled red laser submachine gun often referred to as a chaos engine due to its unpredictability and penchant for letting its user unleash a blended hell of lasers."
	icon = 'icons/obj/guns/energy/lasersmg_hell.dmi'
	icon_state = "chaossmg"
	item_state = "chaossmg"
	projectile_type = /obj/item/projectile/beam/weak // Stronger
	damage_multiplier = 1 //makeshift laser
	init_recoil = HANDGUN_RECOIL(0.3)
	init_offset = 10 //makeshift laser
	charge_cost = 20 // Less cost than a Lasblender, but let's not get out of hand here
	price_tag = 1500
	init_firemodes = list(
		BURST_8_ROUND,
		FULL_AUTO_600 // UNLEASH HELL
		)
	serial_type = "BlueCross"

/obj/item/gun/projectile/silenced/rat
	name = "\"Rat Man\" silenced pistol"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these items are known to vanish and reappear when left alone. \
	A spray painted decal of a rat man with a grinning face has been placed on the grip, the deadliest killers are often those ignored or underestimated by others after all. \
	This particular pistol has been oiled, cleaned, and appears to be so well maintained that its become 110% of its normal potential."
	icon = 'icons/obj/guns/projectile/rafale_bluecross.dmi'
	damage_multiplier = 1.8
	init_recoil = HANDGUN_RECOIL(0.3)
	penetration_multiplier = 1.5
	price_tag = 2350
	serial_type = "BlueCross"

/obj/item/gun/projectile/boltgun/bluecross
	name = "\"Krag Jørgensen\" boltgun"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these items are known to vanish and reappear when left alone. \
			A single shot rifle; perfect for big game hunters! \
			Amazing for a budget - or if you hate yourself. One of the two."
	icon = 'icons/obj/guns/projectile/bluecross.dmi'
	icon_state = "bluecross"
	item_state = "bluecross"
	fire_sound = 'sound/weapons/guns/fire/sniper.ogg'
	gun_tags = list(GUN_PROJECTILE, GUN_SCOPE)
	force = WEAPON_FORCE_DANGEROUS
	bolt_training = FALSE
	penetration_multiplier  = 3
	damage_multiplier  = 2
	max_shells = 1
	price_tag = 2750
	gun_parts = null
	sharp = FALSE
	saw_off = FALSE
	serial_type = "BlueCross"

/obj/item/gun/projectile/clarissa/devil_eye
	name = "\"Devil Eye\" pistol"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these items are known to vanish and reappear when left alone. \
			A small red eye has been painted onto the firing pin of this formerly undepowered pistol, this one has been modified with a better feed mechanism to allow \
			for deadlier shots. Uses 9mm rounds and can take standard pistol magazines, high cap magazines, or submachine gun mags, even drums!"
	price_tag = 2000
	gun_parts = null
	mag_well = MAG_WELL_PISTOL | MAG_WELL_H_PISTOL | MAG_WELL_SMG | MAG_WELL_DRUM
	damage_multiplier = 1.5
	icon = 'icons/obj/guns/projectile/clarissa.dmi'
	icon_state = "clarissa"
	item_state = "clarissa"
	serial_type = "BlueCross"

/obj/item/gun/projectile/boltgun/lever/handcock
	name = "\"Handcock\" lever action rifle"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these items are known to vanish and reappear when left alone. \
			This lever action rifle seems to be masterfully rebored, its loading port skillfully enlarged to allow 14.5mm anti-materiel rounds to be loaded! \
			Wild-west styled antimateriel rifle... who would have thought?"
	icon = 'icons/obj/guns/projectile/lever.dmi'
	icon_state = "lever"
	item_state = "lever"
	fire_sound = 'sound/weapons/guns/fire/sniper.ogg' // High caliber but not AMR sound
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_SCOPE) //Doesn't take a silencer cuz thats just mean, also 14.5 AMR
	bolt_training = FALSE
	caliber = CAL_ANTIM
	max_shells = 4
	init_recoil = HMG_RECOIL(2)
	price_tag = 3000
	gun_parts = null
	serial_type = "BlueCross"

/obj/item/gun/projectile/automatic/slaught_o_matic/lockpickomatic
	name = "\"Lockpick-o-Matic\""
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these items are known to vanish and reappear when left alone. \
			A mix of several other Slot-o-Matics seemingly molten and merged into rainbow. Each pistol holding its trade mark blue cross."
	possible_colors = list("rainbow")
	damage_multiplier = 1
	penetration_multiplier = 0.8
	magazine_type = /obj/item/ammo_magazine/smg_35/bluecross
	gun_tags = list(GUN_PROJECTILE)
	init_recoil = EMBEDDED_RECOIL(0.2)
	serial_type = "BlueCross"
	gun_parts = null
	matter = list()
	price_tag = 0
	throw_range = 7
	var/timerid

/obj/item/gun/projectile/automatic/slaught_o_matic/lockpickomatic/handle_click_empty(mob/user)
	. = ..()
	if (user)
		user.show_message(SPAN_WARNING("Your [src] charges up! Throw it at your enemies!"))
	throwforce = WEAPON_FORCE_LETHAL //Bonus style!
	timerid = addtimer(CALLBACK(src, PROC_REF(crack)), 5 SECONDS, TIMER_UNIQUE|TIMER_OVERRIDE|TIMER_STOPPABLE)

/obj/item/gun/projectile/automatic/slaught_o_matic/lockpickomatic/proc/crack()
	var/turf/T = get_turf(src)
	var/datum/effect/effect/system/spark_spread/sparks = new /datum/effect/effect/system/spark_spread()
	sparks.set_up(5, 0, T)
	sparks.start()
	playsound(src.loc, "sparks", 50, 1)
	src.visible_message(SPAN_DANGER("[src] blows apart!"))
	new /obj/effect/decal/cleanable/generic(src.loc)
	deltimer(timerid)
	qdel(src)

/obj/item/gun/projectile/automatic/slaught_o_matic/lockpickomatic/proc/borrowedtime()
	timerid = addtimer(CALLBACK(src, PROC_REF(crack)), 1 MINUTES, TIMER_UNIQUE|TIMER_STOPPABLE)

/obj/item/gun/projectile/automatic/slaught_o_matic/lockpickomatic/throw_impact(atom/hit_atom)
	if(!..()) //not caught in mid-air
		if(throwforce == WEAPON_FORCE_LETHAL) //Cheesy way to figure out if we ran out of ammo
			if(isliving(hit_atom))
				var/mob/living/victim = hit_atom
				victim.damage_through_armor(throwforce, BRUTE, attack_flag = ARMOR_MELEE)
				if(!ishuman(hit_atom))
					victim.Weaken(6) //Get styled on
				playsound(src.loc, 'sound/weapons/tablehit1.ogg', 100, 1)
				crack()

/obj/item/projectile/bullet/pistol_35/blue
	color = "#5234ff" //its blue

/obj/item/ammo_casing/pistol_35/blue
	projectile_type = /obj/item/projectile/bullet/pistol_35/blue
	is_caseless = TRUE

/obj/item/ammo_magazine/smg_35/bluecross
	ammo_type = /obj/item/ammo_casing/pistol_35/blue
	matter = list()

/obj/item/clothing/accessory/holster/bluecross
	name = "\"Lockpick-o-Matic\" holster"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these items are known to vanish and reappear when left alone. \
			A \"presumebly\" endless supply of slaught-o-matics when drawn. You are never really able to tell when and how a new one takes its place when you draw one."
	price_tag = 4000
	icon_state = "holster_lock_pick"
	var/spam_protection = 2 //The amount of guns we currently store
	var/spam_protection_delay = 2.5 SECOND //How fast we recharge our storage
	var/stored = 2

/obj/item/clothing/accessory/holster/bluecross/Initialize()
	. = ..()
	holstered = new /obj/item/gun/projectile/automatic/slaught_o_matic/lockpickomatic

/obj/item/clothing/accessory/holster/bluecross/New()
	..()
	item_flags |= BLUESPACE
	bluespace_entropy(20, get_turf(src)) //There is a great disturbance in the force
	recharge()

/obj/item/clothing/accessory/holster/bluecross/holster(var/obj/item/I, var/mob/living/user)
	to_chat(user, SPAN_WARNING("There is already \a [holstered] holstered here!"))
	return

/obj/item/clothing/accessory/holster/bluecross/proc/recharge()
	if(stored < spam_protection)
		stored++
	addtimer(CALLBACK(src, PROC_REF(recharge)), spam_protection_delay)

/obj/item/clothing/accessory/holster/bluecross/unholster(mob/user as mob)
	if(user.lying)
		to_chat(user, SPAN_WARNING("You need to be standing!"))
		return

	if(istype(user.get_active_hand(),/obj))
		to_chat(user, SPAN_WARNING("You need an empty hand to draw \the [holstered]!"))
	else
		if(user.a_intent == I_HURT)
			usr.visible_message(
				SPAN_DANGER("[user] draws \the [holstered], ready to fight!"),
				SPAN_WARNING("You draw \the [holstered], ready to fight!")
				)
		else
			user.visible_message(
				SPAN_NOTICE("[user] draws \the [holstered], pointing it at the ground."),
				SPAN_NOTICE("You draw \the [holstered], pointing it at the ground.")
				)
		if(!stored) // Kudos to the gamers who made a unholster\ndrop macro
			to_chat(user, SPAN_WARNING("You try to pull it out but it is stuck! Try waiting a little."))
			return
		var/obj/item/gun/projectile/automatic/slaught_o_matic/lockpickomatic/gun = new /obj/item/gun/projectile/automatic/slaught_o_matic/lockpickomatic(src)
		stored--
		user.put_in_active_hand(gun)
		gun.borrowedtime()
		gun.add_fingerprint(user)
		gun.toggle_safety(user) // Lets pull out our weapons sharp!
		playsound(user, "[sound_out]", 75, 0)

/obj/item/gun/energy/captain/zapper
	name = "\"Retro-Funk\" Zapper"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these items are known to vanish and reappear when left alone. \
			Not really much of an interesting weapon by Bluecross standards, with no unusual properties besides a self charging battery and incredible shot capacity. Often loved for its simplicity and retro style."
	icon = 'icons/obj/guns/energy/zapper.dmi'
	fire_sound = 'sound/weapons/energy/Laser4.ogg' // Retro!
	icon_state = "zap"
	charge_cost = 50
	item_charge_meter = FALSE
	charge_meter = FALSE
	price_tag = 1500
	serial_type = "BlueCross"
	allow_greyson_mods = FALSE

/obj/item/gun/energy/painted_flaregun
	name = "\"Palette\" flaregun"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these items are known to vanish and reappear when left alone. \
			A flaregun that has its barrel longer then most to store inside complex fabrication of flares on demand."
	icon = 'icons/obj/guns/energy/flaregun_bluecross.dmi'
	fire_sound = 'sound/weapons/guns/interact/hpistol_cock.ogg'
	icon_state = "painted_flare"
	charge_cost = 50
	item_charge_meter = FALSE
	charge_meter = FALSE
	serial_type = "BlueCross"
	self_recharge = TRUE
	price_tag = 2250
	init_firemodes = list(
		list(mode_name="red", mode_desc="fires a red flare", projectile_type=/obj/item/projectile/bullet/flare, charge_cost = 50, icon="stun"),
		list(mode_name="green", mode_desc="fires a green flare", projectile_type=/obj/item/projectile/bullet/flare/green, charge_cost = 50, icon="stun"),
		list(mode_name="blue", mode_desc="fires a blue flare", projectile_type=/obj/item/projectile/bullet/flare/blue, charge_cost = 50, icon="stun"),
		list(mode_name="wild", mode_desc="fires a random coloured flare", projectile_type=/obj/item/projectile/bullet/flare/chaos, charge_cost = 10, icon="kill"),
		list(mode_name="key", mode_desc="fires a random yellow flare", projectile_type=/obj/item/projectile/bullet/flare/yellow, charge_cost = 100, icon="kill"),
		list(mode_name="thinner", mode_desc="fires a random colourless flare", projectile_type=/obj/item/projectile/bullet/flare/white, charge_cost = 200, icon="kill")
	)

/obj/item/gun/energy/xray/psychic_cannon
	name = "\"Manta-RAY\" cannon"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these items are known to vanish and reappear when left alone. \
			An unusual gun sought after by the Soteria when it appears for both its utility and its research value. It's unknown technological function allows \
			this weapon to use moderately high damage armor penetrating x-ray laser blasts. While a strict step up from a standard x-ray weapon in all ways, this weapon is more valued for \
			its research points in the deconstrustive analyzer."
	icon = 'icons/obj/guns/energy/psychiccannon.dmi'
	icon_state = "psychic_lasercannon"
	item_state = "psychic_lasercannon"
	fire_sound = 'sound/weapons/energy/laser3.ogg'
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
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these items are known to vanish and reappear when left alone. \
			A sneaky pistol designed to look like a revolver to fool people into thinking you only have six shots. Feeling lucky, punk?"
	icon = 'icons/obj/guns/projectile/that_gun.dmi'
	icon_state = "thatgun"
	item_state = "thatgun"
	caliber = CAL_PISTOL
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_PLASTIC = 6)
	price_tag = 1420
	gun_parts = null
	fire_sound = 'sound/weapons/guns/fire/9mm_pistol.ogg'
	can_dual = TRUE
	load_method = MAGAZINE
	mag_well = MAG_WELL_PISTOL | MAG_WELL_H_PISTOL | MAG_WELL_DRUM
	damage_multiplier = 1.25
	penetration_multiplier = 1
	gun_tags = list(GUN_PROJECTILE, GUN_CALIBRE_9MM, GUN_MAGWELL)
	init_recoil = HANDGUN_RECOIL(0.1)

	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_2_ROUND_NOLOSS,
		BURST_3_ROUND_NOLOSS,
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
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these items are known to vanish and reappear when left alone. \
			A normal looking H&S Colt but somehow made completely out of brass, with a small light in its chamber that glows an eerie red and feeling warm to the touch. If you listen in closely, there's a faint sound of whirling cogs coming from the inside."
	icon = 'icons/obj/guns/projectile/colt.dmi'
	icon_state = "brass"
	item_state = "brass"
	caliber = CAL_PISTOL
	origin_tech = list(TECH_MAGNET = 10) //3500 points for rnd, eh its meant to stay in player hands not be deconned
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_GOLD = 10, MATERIAL_SILVER = 10, MATERIAL_GLASS = 10, MATERIAL_PLATINUM = 8)
	price_tag = 2450
	gun_parts = null
	fire_sound = 'sound/weapons/guns/fire/9mm_pistol.ogg'
	can_dual = TRUE
	load_method = MAGAZINE
	mag_well = MAG_WELL_PISTOL | MAG_WELL_H_PISTOL
	damage_multiplier = 1.5
	penetration_multiplier = 1.2
	init_recoil = HANDGUN_RECOIL(0.3)
	gun_tags = list(GUN_PROJECTILE, GUN_CALIBRE_9MM, GUN_SILENCABLE, GUN_MAGWELL)
	serial_type = "BlueCross"

//Weaker spawn but speed is speed
/obj/item/gun/projectile/cane_pistol_bluecross
	name = "\"Blue Carpet\" cane"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these items are known to vanish and reappear when left alone. \
			A blue handled cane that seems to make you walk faster. It also contains a hidden silenced 12mm pistol inside."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "blue_cane"
	item_state = "stick"
	caliber = CAL_50 //Cant be caseless do to bugs oh well
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_SILVER = 5, MATERIAL_PLATINUM = 3)
	price_tag = 1980
	gun_parts = null
	silenced = TRUE
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING|SPEEDLOADER
	max_shells = 1
	damage_multiplier = 2
	penetration_multiplier = 2
	init_recoil = EMBEDDED_RECOIL(0.3)
	gun_tags = list(GUN_PROJECTILE, GUN_CALIBRE_12MM)
	serial_type = "BlueCross"
	gun_parts = null
	slowdown = -0.2
	slowdown_hold = -0.2

/obj/item/gun/energy/lasersmg/p9evil
	name = "P9 \"Evil\" smg"
	desc = "An anomalous weapon created by rivals of the unknown person(or group?) of the bluecross, their work marked by a crimson cross, these items are known to vanish and reappear when left alone. \
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
	fire_sound = 'sound/weapons/guns/fire/grease_fire.ogg'
	can_dual = TRUE
	damage_multiplier = 1.2
	penetration_multiplier = 1.2
	init_recoil = HANDGUN_RECOIL(0.1)
	gun_tags = list(GUN_ENERGY, GUN_LASER, GUN_SILENCABLE)
	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_3_ROUND,
		FULL_AUTO_300
		)
	serial_type = "Crimson Cross"

/obj/item/gun/energy/lasersmg/p9evil/consume_next_projectile(mob/user)
	visible_message(SPAN_WARNING("The [src] draws the life of the user!"))
	playsound(loc, 'sound/weapons/Egloves.ogg', 50, 1, -1)
	user.maxHealth -=0.1
	user.health -=0.1
	return new projectile_type(src)

//Melee Weapons
/obj/item/tool/nailstick/ogre
	name = "\"Oni\" Greatclub"
	desc = "An anomalous clothing created by rivals of the unknown person(or group?) of the bluecross, their work marked by a crimson cross, these items are known to vanish and reappear when left alone. \
			A stone club inscribed with several symbols of jana, though they make no sense put together. The steel is of unusual qualities. \
			When swinging against a tile or open air, a gemstone will hover in the air, hit it again to hit the gem at a nearby hostile target. \
			The more hurt the user is the sharper the gemstone will be."
	icon_state = "oni" //Sprite by cupofmothium
	damtype = BURN
	force = WEAPON_FORCE_ROBUST
	throwforce = WEAPON_FORCE_ROBUST
	w_class = ITEM_SIZE_NORMAL
	armor_divisor = ARMOR_PEN_HALF
	structure_damage_factor = STRUCTURE_DAMAGE_DESTRUCTIVE
	tool_qualities = list(QUALITY_HAMMERING = 20)
	max_upgrades = 4 //Not that good
	price_tag = 3500
	matter = list(MATERIAL_STEEL = 4, MATERIAL_MARBLE = 1)

	var/GemCooldown = FALSE
	var/GemCooldown_timer = 1 SECONDS
	var/GemColor = "#ff0000"
	var/GemType = /obj/item/projectile/blood_gen
	var/GemDamage_Boost = 0
	var/friendly_fire_protection = TRUE

	embed_mult = 0

/obj/item/tool/nailstick/ogre/attack_self(mob/user)
	friendly_fire_protection = !friendly_fire_protection
	if(friendly_fire_protection)
		to_chat(user, SPAN_NOTICE("Gemstones will now care about friendly fire."))
	else
		to_chat(user, SPAN_NOTICE("Gemstones will not care about same faction or colony allies."))


/obj/item/tool/nailstick/ogre/afterattack(atom/target, mob/user, proximity_flag, params)
	. = ..()
	if(proximity_flag && isturf(target))
		var/turf/T = get_turf(target)
		for(var/obj/item/projectile/blood_gen/BG in T.contents)
			var/obj/item/projectile/blood_gen/GB = BG
			for(var/mob/M in view(5, user))
				if(M.stat != DEAD)
					if(friendly_fire_protection)
						if(M.faction != user.faction && M.colony_friend != user.colony_friend && M.friendly_to_colony != user.friendly_to_colony)
							GB.launch(M)
							GB.def_zone = BP_CHEST
							GB.original_firer = user
							GB.firer = user
							GB.friendly_faction = user.faction
							break
						continue
					if(M != user)
						GB.launch(M)
						GB.firer = user
						GB.def_zone = BP_CHEST
						GB.original_firer = user

		if(!GemCooldown)
			GemCooldown = TRUE
			addtimer(CALLBACK(src, PROC_REF(clear_cooldown)), GemCooldown_timer)
			new GemType(T, src, GemColor, rand(0, 36) * 10, GemDamage_Boost)
			playsound(T, 'sound/weapons/metal_disk_fick.ogg', 100)

/obj/item/tool/nailstick/ogre/proc/clear_cooldown()
	GemCooldown = FALSE

/obj/item/projectile/blood_gen
	var/time2activate = 7 SECONDS
	icon_state = "gemstone"
	icon = 'icons/obj/spatial_cut.dmi'
	color = "#ff0000"
	alpha = 150

	damage_types = list(BURN = 5)
	armor_divisor = 5

	var/qdel_timer
	var/friendly_faction = ""

/obj/item/projectile/blood_gen/attack_mob(mob/living/target_mob, distance, miss_modifier=0)
	//Anti-FF
	if(friendly_faction == target_mob.faction)
		return FALSE // so these pass through friends of the o.g shooter
	if(original_firer == target_mob)
		return FALSE // so these pass through the o.g shooter
	..()

/obj/item/projectile/blood_gen/Initialize(mapload, obj/item/tool/nailstick/ogre/C, _color = color, _angle, GemDamage_Boost)
	. = ..()
	color = _color
	qdel_timer = QDEL_IN(src, time2activate)
	damage_types = list(BURN = 10, BRUTE = GemDamage_Boost)

/obj/item/tool/nailstick/ogre/resolve_attackby(atom/target, mob/user)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		GemDamage_Boost = 0
		var/damages = H.getOxyLoss() + H.getBruteLoss() + H.getFireLoss()

		if(damages)
			damages *= 0.2

			GemDamage_Boost = damages

			GemCooldown_timer = (1.5 + (damages / 10)) SECONDS

		else

			GemCooldown_timer = 2 SECONDS //Rack em up!

	.=..()

/obj/item/tool/knife/dagger/vail_render
	name = "\"Vail Render\" dagger"
	desc = "An anomalous weapon created by rivals of the unknown person(or group?) of the bluecross, their work marked by a crimson cross, these items are known to vanish and reappear when left alone. \
			A dagger that is able to cut deeper the more closer to death the victim is, in addition to the users."
	icon_state = "vail_render"
	item_state = "dagger"
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_PLASTIC = 12)
	force = 15 //Base level
	backstab_damage = 15 //base is 15 but grows
	armor_divisor = ARMOR_PEN_MASSIVE //Less do to how powerful it is
	throwforce = WEAPON_FORCE_ROBUST
	price_tag = 3500
	max_upgrades = 2

/obj/item/tool/knife/dagger/vail_render/resolve_attackby(atom/target, mob/user)
	//Little icky but it works
	var/safty_math =  user.health - user.maxHealth
	var/real_mod = 0

	real_mod += (-safty_math * 0.1)  //The gimmic of this knife isnt self harm, but we do still add a 1/10th
//	message_admins("1knife: safty_math [safty_math] real_mod [real_mod]")

	if(ismob(target))
		var/mob/stabbed = target
		var/health_missing = stabbed.maxHealth - stabbed.health
		health_missing += 1 //Used to make sure the first hit is properly scored
//		message_admins("1.1knife: safty_math [safty_math] real_mod [real_mod] stabbed.maxHealth [stabbed.maxHealth] health_missing [health_missing]")
		if(0 < health_missing)
//			message_admins("1.2knife: safty_math [safty_math] real_mod [real_mod] stabbed.maxHealth [stabbed.maxHealth] health_missing [health_missing]")
			real_mod += health_missing
			real_mod *= 0.25 //1/4th of your targets missing health is now damage.
		else
//			message_admins("1.21knife: safty_math [safty_math] real_mod [real_mod] stabbed.maxHealth [stabbed.maxHealth] health_missing [health_missing]")
			real_mod += stabbed.maxHealth
			real_mod *= 0.15 //This typically will be used on people so we are less, or on dead bodies
//	message_admins("2knife: safty_math [safty_math] real_mod [real_mod]")


	force += real_mod
	backstab_damage += real_mod
//	message_admins("3knife: force [force] real_mod [real_mod]")

	.=..()
	backstab_damage = 15
	refresh_upgrades()


/obj/item/tool/knife/dagger/assassin/ubersaw //Waiting for code to be done to deal blood damage/take % of blood
	name = "\"Uber\" syringe-dagger"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these items are known to vanish and reappear when left alone. \
			Whoever made this was very pro-active about collecting samples in the middle of active combat. They probably lost their medical license."
	price_tag = 1900

/obj/item/tool/wrench/big_wrench/freedom
	name = "\"Freedom\" wrench"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these items are known to vanish and reappear when left alone. \
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
	effective_faction = list("excelsior")
	damage_mult = 2

/obj/item/tool/saw/hyper/doombringer
	name = "\"Doombringer\" chainsword"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these items are known to vanish and reappear when left alone. \
			The only thing they fear is you."
	icon_state = "rip_and_tear"
	item_state = "rip_and_tear"
	switched_on_icon_state = "rip_and_tear"
	switched_on_item_state = "rip_and_tear"
	wielded_icon = "rip_and_tear_on"
	hitsound = WORKSOUND_CHAINSAW
	worksound = WORKSOUND_CHAINSAW
	force = WEAPON_FORCE_DANGEROUS
	switched_on_forcemult = 4.4 //88
	w_class = ITEM_SIZE_NORMAL
	armor_divisor = ARMOR_PEN_DEEP
	switched_on_penmult = 2.5 //50
	matter = list(MATERIAL_SILVER = 2, MATERIAL_PLASTEEL = 10, MATERIAL_PLASTIC = 3)
	tool_qualities = list(QUALITY_SAWING = 70, QUALITY_CUTTING = 60, QUALITY_WIRE_CUTTING = 30)
	max_upgrades = 1//Already over powered.
	degradation = 0.1
	use_power_cost = 1
	suitable_cell = /obj/item/cell/medium
	price_tag = 1850
	blacklist_upgrades = list(/obj/item/tool_upgrade/augment/expansion = TRUE)

/obj/item/tool/saw/hyper/doombringer/turn_on(mob/user)
	if (cell && cell.charge >= 1)
		item_state = "[initial(item_state)]_on"
		to_chat(user, SPAN_NOTICE("You rev up the [src]."))
		to_chat(user, SPAN_WARNING("\red <font size=3><b>Rip and Tear, until it is DONE.</b></font>")) // Berserk pack active
		playsound(loc, 'sound/items/chainsaw_on.ogg', 40)

	else
		item_state = initial(item_state)
		to_chat(user, SPAN_WARNING("[src]'s battery is dead or missing."))
	..()

/obj/item/tool/saw/hyper/doombringer/turn_off(mob/user)
	item_state = initial(item_state)
	playsound(loc, 'sound/items/chainsaw_off.ogg', 80)
	to_chat(user, SPAN_NOTICE("You turn the [src] off."))
	..()

//Movement = Damage
/obj/item/tool/sword/saber/nightmare_saber
	name = "dusk saber"
	desc = "An anomalous weapon created by rivals of the unknown person(or group?) of the bluecross, their work marked by a crimson cross, these items are known to vanish and reappear when left alone. \
			A fine blade for cutting and dicing though the ranks of lower beings and nightmares. The more momentum you have the more damage it deals, at the cost of requiring you to be missing an arm."
	icon = 'icons/obj/weapons-blades.dmi'
	icon_state = "nightmare_saber"
	item_state = "saber"
	price_tag = 5000
	has_alt_mode = TRUE
	alt_mode_damagetype = HALLOSS
	alt_mode_sharp = FALSE
	alt_mode_verbs = list("hilts", "stunts", "wacks", "blunts")
	alt_mode_toggle = "switches their stance to avoid using the blade of their weapon"
	alt_mode_lossrate = 0.2
	effective_faction = list("psi_monster", "stalker") //Nightmares!
	damage_mult = 1.2
	embed_mult = 0
	degradation = 0.1 //We do a LOT of attacks
	//Normal force is 26
	//Normal AP is 10
	var/coin_tracker = 0 //Number not false
	var/tracker

/obj/item/tool/sword/saber/nightmare_saber/resolve_attackby(atom/target, mob/user, give_coin = TRUE)
	//Little icky but it works
	clickdelay_offset = 0
	if(coin_tracker >= 5)
		coin_tracker = 0
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		var/able_to_use = FALSE
		var/robo_lim = 0 //Counts byond just true or false
		//message_admins("1knife: H [H]")
		//message_admins("1knife: give_coin [give_coin]")
		if(!H.get_organ(BP_L_ARM) || !H.get_organ(BP_R_ARM))
			able_to_use = TRUE
		if(istype(H.get_organ(BP_L_ARM), /obj/item/organ/external/stump))
			able_to_use = TRUE
		if(istype(H.get_organ(BP_R_ARM), /obj/item/organ/external/stump))
			able_to_use = TRUE
		//Robo *lim* bypasses needing only 1 arm, but having 2 robo limbs cancle one another out
		if(istype(H.get_organ(BP_L_ARM), /obj/item/organ/external/robotic))
			robo_lim += 1
		if(istype(H.get_organ(BP_R_ARM), /obj/item/organ/external/robotic))
			robo_lim += 1
		if(robo_lim == 1)
			able_to_use = TRUE

		//message_admins("1knife: able_to_use [able_to_use]")

		if(able_to_use)
			//message_admins("2knife: able_to_use [able_to_use]")
			var/speedy_dashing = H.momentum_speed
			//message_admins("2knife: speedy_dashing [speedy_dashing]")
			if(speedy_dashing > 0)
				//Hopefully your running around to accually use this
				armor_divisor *= speedy_dashing
				force *= speedy_dashing
			if(tracker == target.name && give_coin)
				coin_tracker += 1
			else
				if(ismob(target))
					tracker = target.name
					coin_tracker = 0
			//message_admins("3knife: coin_tracker [coin_tracker]")
			if(coin_tracker >= 4)
				for(var/mob/living/victim in range(1, H))
					if(victim != user)
						var/turf/T = get_turf(victim)
						new /atom/movable/DuskCut(T, src)
						resolve_attackby(victim, user, give_coin = FALSE) //Attack again!
						resolve_attackby(victim, user, give_coin = FALSE) //Attack again! 2x
						resolve_attackby(victim, user, give_coin = FALSE) //Attack again! 3x
						resolve_attackby(victim, user, give_coin = FALSE) //Attack again! 4x
				coin_tracker = 0

			clickdelay_offset = -speedy_dashing
	.=..()
	refresh_upgrades()

/atom/movable/DuskCut
	icon = 'icons/obj/weapons-blades.dmi'
	color = "#ffffff"
	icon_state = "nightmare_saber_arc"
	alpha = 200
	layer = 9 //Random number to be ontop of everything
	var/qdel_timer

/atom/movable/DuskCut/Initialize(mapload)
	dir = pick(NORTH, SOUTH, EAST, WEST) //Random
	qdel_timer = QDEL_IN(src, 4)

/obj/item/tool/sword/katana/crimson_arc
	name = "\"Crimson Arc\" katana"
	desc = "An anomalous weapon created by rivals of the unknown person(or group?) of the bluecross, their work marked by a crimson cross, these items are known to vanish and reappear when left alone. \
			What seems to be a normal katana but with a red hilt and a nasty trick, the closer the user is to death the faster it becomes to swing."
	icon_state = "chokuto"
	item_state = "katana"
	hitsound = 'sound/weapons/heavyslash.ogg'
	force = WEAPON_FORCE_BRUTAL
	armor_divisor = ARMOR_PEN_SHALLOW
	price_tag = 2050
	clickdelay_offset = 0
	max_upgrades = 1//Already over powered.
	degradation = 0.1
	blacklist_upgrades = list(/obj/item/tool_upgrade/augment/expansion = TRUE)

/obj/item/tool/sword/katana/crimson_arc/resolve_attackby(atom/target, mob/user)
	.=..()
	//Little icky but it works
	var/safty_math =  user.health
	safty_math = round(safty_math)
	if(safty_math <= 0)
		safty_math = 1
	var/current_health = (user.maxHealth / (safty_math - 10))
	if(current_health <= 0)
		current_health = 8
	else
		current_health = round(current_health)
	current_health = clamp(current_health, -7, 5) //-1 from no bag means this can be in affect a 2 cooldown weapon. This is insanely good
	clickdelay_offset = -current_health

/obj/item/tool/scythe/spectral_harvester
	name = "\"Spectral Harvester\" scythe"
	desc = "An anomalous weapon created by rivals of the unknown person(or group?) of the bluecross, their work marked by a crimson cross, these items are known to vanish and reappear when left alone. \
			A large flat bluespace blade attached to a long red handle that requires two hands to even swing."
	icon_state = "spectral_harvester"
	hitsound = 'sound/weapons/heavyslash.ogg'
	force = WEAPON_FORCE_GODLIKE //88 damage but + weilding
	armor_divisor = ARMOR_PEN_MODERATE
	price_tag = 2750
	clickdelay_offset = 15 //This stacks with base
	max_upgrades = 0 //No...
	degradation = 0.01
	slowdown = 1 //Little missleading as we get teleports
	slowdown_hold = 1
	w_class = ITEM_SIZE_HUGE
	var/entropy_value = 0.5
	var/range = 10
	var/toclose_range = 2

/obj/item/tool/scythe/spectral_harvester/New()
	..()
	item_flags |= BLUESPACE
	bluespace_entropy(5, get_turf(src))

/obj/item/tool/scythe/spectral_harvester/afterattack(mob/living/M, mob/living/user, target_zone)
	clickdelay_offset = 15
	if(!wielded)
		to_chat(user, SPAN_DANGER("\The [src.name] is too heavy to swing with one hand!"))
		return FALSE

	if(get_dist(M, user) > range)
		return FALSE

	if(!(M in view(user)))
		return FALSE

	if(ismob(M))
		if(toclose_range > get_dist(M, user))
			return
		if((M.health - force) <= 0) //Some can survive but not long
			clickdelay_offset = -6 //Almost a complete refund if you get
		var/turf/AtomTurf = get_turf(M)
		resolve_attackby(M, user)
		go_to_bluespace(get_turf(user), entropy_value, FALSE, user, AtomTurf)
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	return

//Need to override this proc to allow range hits
/obj/item/tool/scythe/spectral_harvester/resolve_attackby(atom/A, mob/user, params)
	if(ismob(A))
		if(toclose_range > get_dist(A, user) && A != user)
			to_chat(user, SPAN_DANGER("You are to close to swing [src.name]!"))
			return
	if(item_flags & ABSTRACT)//Abstract items cannot be interacted with. They're not real.
		return 1
	add_fingerprint(user)
	return A.attackby(src, user, params)

/obj/item/tool/scythe/spectral_harvester/Adjacent(var/atom/neighbor, var/recurse = 1)
	return TRUE //We are always adjacent

/obj/item/tool/crit_pipe_bluecross
	name = "\"TingTang\" lead pipe"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these items are known to vanish and reappear when left alone. \
	Luck correlates with skill."
	icon_state = "lead_pipe"
	price_tag = 3750
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_IRON, MATERIAL_URANIUM = 2)
	icon = 'icons/obj/oddities.dmi'
	max_upgrades = 0 //No...
	embed_mult = 0
	degradation = 0.01 //Lead pipes NEVER break!
	force = WEAPON_FORCE_DANGEROUS + 5 //scaling starts at 25

/obj/item/tool/crit_pipe_bluecross/resolve_attackby(atom/target, mob/user)
	//Little icky but it works
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		var/luck = 0
		for(var/stat in ALL_STATS)
			luck += H.stats.getStat(stat, FALSE, TRUE)
		var/luck_lops = 1
		var/crits_happend = 0
		while(luck_lops)
		//	to_chat(H, SPAN_DANGER("luck [luck], force: [force]!"))

			if(prob(luck))
				crits_happend += 1
				force *= 1.2 //Crit!
				luck -= 100 //You spent the crit!
			else
				luck_lops = 0

		if(crits_happend)
			H.visible_message(SPAN_DANGER("[H]'s [src] lands with a heavyer hit!"))
			if(crits_happend >= 2)
				to_chat(H, SPAN_DANGER("You land a mega critical hit with [src.name]!"))
			else
				to_chat(H, SPAN_DANGER("You land a critical hit with [src.name]!"))


	.=..()
	refresh_upgrades()



// Shield

/obj/item/shield/riot/mass_grave
	name = "grave marker shield"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these items are known to vanish and reappear when left alone. \
			A large grave marker degraded by the sands of time to be unreadable. This shield will always help block any physical attack. Has the power of endless growth in power the more *direct* kills directly caused by the shield."
	icon_state = "mass_grave"  //Sprite by gid_git
	item_state = "mass_grave"
	flags = null
	throw_speed = 1
	throw_range = 0
	matter = list(MATERIAL_MARBLE = 120) //V_V
	base_block_chance = -16 //We start out worse then anything you have ever seen
	max_durability = 250
	durability = 200
	armor_list = list(melee = 5, bullet = 5, energy = 5, bomb = 0, bio = 0, rad = 0)
	var/mass_grave_counter = 1 //Here lays... We dont know, they didnt put their name on the stone
	var/post_moder_game_balance = 150
	slowdown = 0.3
	slowdown_hold = 0.3
	//Its a bad weapon
	force = WEAPON_FORCE_PAINFUL
	armor_divisor = ARMOR_PEN_SHALLOW
	has_alt_mode = FALSE

/obj/item/shield/riot/mass_grave/check_shield_arc()
	return TRUE

/obj/item/shield/riot/mass_grave/refresh_upgrades()
	return

/obj/item/shield/riot/mass_grave/proc/upgrade_mass_grave()
	//Endless growth
	max_durability += 1
	switch(mass_grave_counter)
		if(5)
			armor_list = list(melee = 2, bullet = 2, energy = 2, bomb = 0, bio = 0, rad = 0)
			force = WEAPON_FORCE_DANGEROUS
			armor_divisor = ARMOR_PEN_MODERATE
			slowdown = 0.25
			slowdown_hold = 0.25
		if(10)
			armor_list = list(melee = 4, bullet = 4, energy = 4, bomb = 0, bio = 0, rad = 0)
			force = WEAPON_FORCE_ROBUST
			armor_divisor = ARMOR_PEN_DEEP
			slowdown = 0.20
			slowdown_hold = 0.20
		if(20)
			armor_list = list(melee = 6, bullet = 6, energy = 6, bomb = 0, bio = 0, rad = 0)
			force = WEAPON_FORCE_BRUTAL
			armor_divisor = ARMOR_PEN_EXTREME
			slowdown = 0.15
			slowdown_hold = 0.15
		if(50)
			armor_list = list(melee = 9, bullet = 9, energy = 9, bomb = 0, bio = 0, rad = 0)
			force = WEAPON_FORCE_LETHAL
			armor_divisor = ARMOR_PEN_MASSIVE
			slowdown = 0.10
			slowdown_hold = 0.10
		if(100)
			armor_list = list(melee = 10, bullet = 10, energy = 10, bomb = 0, bio = 0, rad = 0)
			force = WEAPON_FORCE_LETHAL + 5
			armor_divisor = ARMOR_PEN_MASSIVE + 5
			slowdown = 0.05
			slowdown_hold = 0.05

	if(mass_grave_counter >= post_moder_game_balance)
		//Endless Growth
		name = "mass grave marker shield"
		force += 1
		armor_divisor += 1
		post_moder_game_balance *= 1.1 //150 x 1.1 = 165 -> 165 x 1.1 = 181.5(182) ect ect
		post_moder_game_balance = round(post_moder_game_balance)

/obj/item/shield/riot/mass_grave/handle_shield()
	//No more grace, you are in endless mode
	if(mass_grave_counter >= 101) //Lets not reset are gains
		mass_grave_counter -= 1
	..()

/obj/item/shield/riot/mass_grave/get_protected_area(mob/user)
	return BP_ALL_LIMBS

/obj/item/shield/riot/mass_grave/get_partial_protected_area(mob/user)
	return BP_ALL_LIMBS

/obj/item/shield/riot/mass_grave/get_block_chance(mob/user, var/damage, atom/damage_source = null, mob/attacker = null)
	return base_block_chance + mass_grave_counter

/obj/item/shield/riot/mass_grave/resolve_attackby(atom/A, mob/user, params)
	if(ismob(A))
		var/mob/living/M = A
		if(M.stat != DEAD)
			if(M.health - force <= 0)
				mass_grave_counter += 1
				upgrade_mass_grave()
				if(!ishuman(M))
					M.gib()
	..()

//Armor

// Regal Outfit (Crimson Clothing)
/obj/item/clothing/suit/crimsoncross_regaloutfit
	name = "\"Regal\" greatcoat"
	desc = "An anomalous clothing created by rivals of the unknown person(or group?) of the bluecross, their work marked by a crimson cross, these items are known to vanish and reappear when left alone. \
	A highly decorated white cloak with golden epaulets over a blue vest and sleek white pants. It is forevermore stained with blood. An air of nobility ensures that no robotic foe may easily rise against its wearer. \
	When fighting anything that isn't a robotic you will take additional damage. The affects of the coat only works if the wearer is completely clean of robotic filth."
	icon_state = "regaloutfit_redder" //Sprite by Ayshe / gid_git
	item_state = "regaloutfit_redder"
	blood_overlay_type = "coat"
	armor_list = list(melee = 2, bullet = 1, energy = 1, bomb = 0, bio = 0, rad = 0)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	min_cold_protection_temperature = T0C - 60
	siemens_coefficient = 0 //Foolishness
	stiffness = 0 //You are above the red tape
	price_tag = 3500 //Silk and gold
	//all its affects are in human_defense.dm

/obj/item/clothing/shoes/crimsoncross_warp
	name = "\"Warp\" Running shoes"
	desc = "An anomalous clothing created by rivals of the unknown person(or group?) of the bluecross, their work marked by a crimson cross, these items are known to vanish and reappear when left alone. \
	A pair of shoes that the more the wearer gets hurt the more charge it builds up. When running, they automatically spend charge to gain a speed boost. Walking doesn't use charge."
	icon_state = "wcorp"
	item_state = "wcorp"
	var/harm_charge = 0
	var/squeaking = 0
	var/drain = 0

/obj/item/clothing/shoes/crimsoncross_warp/examine(mob/user)
	..()
	if(ishuman(user))
		if(user.stats.getPerk(PERK_NO_OBFUSCATION))
			to_chat(user, SPAN_WARNING("The shoes have a charge rating of [harm_charge], last speedboost value was [squeaking]. Last charge use from running was [drain]."))

//Tools and tool mods (these are for things not intended for fighting but for actual tools)
