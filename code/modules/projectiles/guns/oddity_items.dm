/obj/item/weapon/gun/projectile/handmade_pistol/anti_material/reliable
	name = "\"Finger of God\" handmade pistol"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these weapons are known to vanish and reappear when left alone. \
	Whoever made this particular model did exceptional work. Unlike lesser handmade pistols, this one jams less and has much better shot capability. This one chambers .60-06 anti material ammo."
	jam_chance = 5
	damage_multiplier = 1.36
	recoil_buildup = 25
	max_shells = 6

/obj/item/weapon/gun/energy/sniperrifle/saint
	name = "\"Saint\" laser rifle"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these weapons are known to vanish and reappear when left alone. \
	Unlike a standard valkyrie this rifle has an over charged coolant mechanism and redundant power loop to conserve energy between shots."
	charge_cost = 200
	fire_delay = 25

/obj/item/weapon/gun/projectile/automatic/lmg/saw/unicorn
	name = "\"Unicorn\" light machinegun"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these weapons are known to vanish and reappear when left alone. \
	A small carved inscription of a unicorn has been cut into place near some additional added weights, giving this rifle amazing recoil control."
	recoil_buildup = 1

/obj/item/weapon/gun/projectile/revolver/mistral/elite
	name = "\"Elite\" magnum revolver"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these weapons are known to vanish and reappear when left alone. \
	Unlike a standard mistral magnum this one has a bluespace crystal in the cylinder and weighted barrel for better recoil control. How many bullets does it hold? Uses .40 Magnum rounds."
	max_shells = 60
	recoil_buildup = 20

/obj/item/weapon/gun/projectile/revolver/mistral/elite/New()
	..()
	item_flags |= BLUESPACE
	bluespace_entropy(2, get_turf(src)) //Same as the normal bluespace crystal


/obj/item/weapon/gun/projectile/shotgun/pump/obrez/thunderlord
	name = "\"Thunderlord\" shotgun"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these weapons are known to vanish and reappear when left alone. \
	The ultimate back up weapon, someone has fitted a hatton gas tube into the chamber, reducing magazine size to one shotgun shell while increasing its power potential through the roof. Good luck using it one handed."
	max_shells = 1
	damage_multiplier = 2
	penetration_multiplier = 2
	recoil_buildup = 75
	one_hand_penalty = 50

/obj/item/weapon/gun/energy/ntpistol/mana
	name = "\"Mana from Heaven\" energy pistol"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these weapons are known to vanish and reappear when left alone. \
	A standard issue serenity pistol from the church of absolute, nothing seems different about it, yet it seems to conserve power unusually well."
	charge_cost = 2

/obj/item/weapon/gun/projectile/automatic/maxim/replica
	name = "\"Maxim\" light machinegun"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these weapons are known to vanish and reappear when left alone. \
	A common design used by certain nefarious political groups, this model however has been stripped of its fellows evil machinations, making it safe to use by anyone."

/obj/item/weapon/gun/energy/lasersmg/inferno
	name = "Disco Inferno \"Light Show\""
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these weapons are known to vanish and reappear when left alone. \
	Someone has inscribed 'inferno' in a stylized multi-color crayon on the side while modifying its internal power capacitor to be much more effeciant."
	charge_cost = 5

/obj/item/weapon/gun/energy/lasersmg/chaos_engine
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

/obj/item/weapon/gun/projectile/silenced/rat
	name = "\"Rat Man\" silenced pistol"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these weapons are known to vanish and reappear when left alone. \
	A spray painted decal of a rat man with a grinning face has been placed on the grip, the deadliest killers are often those ignored or underestimated by others after all. \
	This particular pistol has been oiled, cleaned, and appears to be so well maintenanced that its become 110% of its normal potential."
	damage_multiplier = 1.4
	recoil_buildup = 4
	one_hand_penalty = 6
	penetration_multiplier = 1.1

/obj/item/weapon/gun/projectile/boltgun/bluecross //Pending balance changes with
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
	price_tag = 750
	sharp = FALSE
	saw_off = FALSE

/obj/item/weapon/gun/projectile/clarissa/devil_eye
	name = "\"Devil Eye\" pistol"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these weapons are known to vanish and reappear when left alone. \
			A small red eye has been painted onto the firing pin of this formerly undepowered pistol, this one has been modified with a better feed mechaism to allow \
			for deadlier shots. Uses .35 rounds and can take standard pistol magazines, high cap magazines, or submachine gun mags."
	price_tag = 2000
	mag_well = MAG_WELL_PISTOL | MAG_WELL_H_PISTOL | MAG_WELL_SMG
	damage_multiplier = 1.5

/obj/item/weapon/gun/projectile/automatic/slaught_o_matic/lockpickomatic
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

/obj/item/weapon/gun/energy/captain/zapper
	name = "\"Retro-Funk\" Zapper"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these weapons are known to vanish and reappear when left alone. \
			Not really much of an interesting weapon by cross standards, with no unusual properties besides a self charging battery and incredible shot capacity. Often loved for its simplicity and retro style."
	icon = 'icons/obj/guns/energy/zapper.dmi'
	icon_state = "zap"
	charge_cost = 50
	item_charge_meter = FALSE
	charge_meter = FALSE

/obj/item/weapon/gun/energy/xray/psychic_cannon
	name = "\"Medijack\" cannon"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these weapons are known to vanish and reappear when left alone. \
			An unusual gun sought after by the Soteria when it appears for both its utility and its research value. It's durasteel interior and unknown technological function allows \
			this weapon to switch between armor penetrating moderate damage x-ray shots or, more unusually, shots that heal toxins, burns, and brute damage in low amounts."
	icon = 'icons/obj/guns/energy/psychiccannon.dmi'
	icon_state = "psychic_lasercannon"
	item_state = "psychic_lasercannon"
	fire_sound = 'sound/weapons/laser3.ogg'
	origin_tech = list(TECH_COMBAT = 19, TECH_MATERIAL = 19, TECH_MAGNET = 19, TECH_ILLEGAL = 19)
	price_tag = 4000
	charge_cost = 100
	twohanded = FALSE
	gun_tags = list(GUN_LASER, GUN_ENERGY)
	init_firemodes = list(
		list(mode_name="x-ray", projectile_type = /obj/item/projectile/beam/xray, icon="kill"),
		list(mode_name="healing", projectile_type = /obj/item/projectile/beam/sniper/healing, icon="stun"),
		)