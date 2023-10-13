//Adding in robot energy powered variants of guns, to avoid the hassle of needing to reload, etc. Centralising them all here for ease of use.

/obj/item/gun/energy/riot_autoshotgun
	name = "intergrated \"State\" riot shotgun"
	desc = "A Seinemetall Defense GmbH riot auto action shotgun, its uncommonly seen deployed in most police operation due to the success of the \"stolen\" \"Regulator\" design. \
	This particular shotgun has been redesigned many times, never quite reaching a standard everyone was happy with, with some lauding it as confusing for a shotgun. \
	This variant has been designed to flash-synthesise ammunition from an onboard cell, for Synthetic use."
	icon = 'icons/obj/robot_items.dmi'
	icon_state = "riot_shotgun"
	item_state = "riot_shotgun"
	cell_type = /obj/item/cell/medium/greyson
	modifystate = null
	force = WEAPON_FORCE_PAINFUL
	charge_cost = 200
	self_recharge = 1
	init_firemodes = list(
		list(mode_name="beanbag", projectile_type=/obj/item/projectile/bullet/shotgun/beanbag, fire_sound = 'sound/weapons/guns/fire/shotgun_combat.ogg', fire_delay=25, icon="stun"),
		list(mode_name="slug", projectile_type=/obj/item/projectile/bullet/shotgun, fire_sound='sound/weapons/guns/fire/shotgun_combat.ogg', fire_delay=10, icon="kill"),
		list(mode_name="buckshot", projectile_type=/obj/item/projectile/bullet/pellet/shotgun, fire_sound='sound/weapons/guns/fire/shotgun_combat.ogg', fire_delay=10, icon="kill"),
		list(mode_name="pepperball", projectile_type=/obj/item/projectile/bullet/shotgun/beanbag/pepperball, fire_sound='sound/weapons/guns/fire/shotgun_combat.ogg', fire_delay=10, icon="stun")
	)
	serial_type = "SD GmbH"
	charge_meter = FALSE

/obj/item/gun/energy/bsrifle
	name = "integrated \"STS PARA\" Blackshield rifle"
	desc = "A lightweight modified variant of the STS-30 that takes 7.62mm rounds, shedding wartime wood for modern plastic polymer. \
	The lightweight polymer, skeletal stock, and shortened barrel make this weapon much lighter than the standard STS with modified receivers and gas block for better recoil control. \
	This variant has been designed to flash-synthesise ammunition from an onboard cell, for Synthetic use. "
	icon = 'icons/obj/guns/projectile/sts35.dmi'
	icon_state = "stspara"
	item_state = "stspara"
	damage_multiplier = 1.3 //Well oiled
	cell_type = /obj/item/cell/medium/greyson
	modifystate = null
	force = WEAPON_FORCE_PAINFUL
	charge_cost = 80 //about 20 rounds per full charge
	self_recharge = 1
	charge_meter = FALSE
	init_firemodes = list(
		list(mode_name="Standard Burst", projectile_type=/obj/item/projectile/bullet/rifle_75, fire_sound = 'sound/weapons/guns/fire/NM_PARA.ogg', burst = 2  , icon="burst", damage_mult_add = -0.2),
		list(mode_name="Hollowpoint Burst", projectile_type=/obj/item/projectile/bullet/rifle_75/lethal, fire_sound = 'sound/weapons/guns/fire/NM_PARA.ogg', burst = 2  , icon="burst", damage_mult_add = -0.2),
		list(mode_name="Incendiary Burst", projectile_type=/obj/item/projectile/bullet/rifle_75/incend, fire_sound = 'sound/weapons/guns/fire/NM_PARA.ogg', burst = 2, fire_delay = 20  , icon="burst", damage_mult_add = -0.2),
		)


/obj/item/gun/energy/borg/pistol
	name = "\"Disabler\" pistol"
	desc = "A standardised ammunition-synthesising pistol superficially resembling an ancient pistol."
	icon = 'icons/obj/guns/projectile/glock.dmi'
	icon_state = "glock"
	item_state = "glock"
	cell_type = /obj/item/cell/medium/greyson
	modifystate = null
	charge_cost = 100
	self_recharge = 1
	init_firemodes = list(
		list(mode_name="rubber bullet", projectile_type=/obj/item/projectile/bullet/pistol_35/rubber, fire_sound = 'sound/weapons/guns/fire/9mm_pistol.ogg', fire_delay=25, icon="stun"),
		list(mode_name="Hollowpoint round", projectile_type=/obj/item/projectile/bullet/pistol_35/lethal, fire_sound='sound/weapons/guns/fire/9mm_pistol.ogg', fire_delay=10, icon="kill"),
		)
	charge_meter = FALSE

/obj/item/gun/energy/smg
	icon = 'icons/obj/guns/projectile/armsmg.dmi'
	icon_state = "armsmg"
	item_state = null
	name = "embedded energy SMG"
	desc = "An energy-based SMG deployed from your arm. A favoured hidden weapon."
	cell_type = /obj/item/cell/medium/greyson
	charge_cost = 25
	self_recharge = 1
	fire_sound = 'sound/weapons/energy/laser_pistol.ogg'
	projectile_type = /obj/item/projectile/beam
	damage_multiplier = 0.7
	penetration_multiplier = 0.7
	init_recoil = HANDGUN_RECOIL(0.4) //Hard to control accurately in most cases.
	charge_meter = FALSE
	init_firemodes = list(
		FULL_AUTO_300_NOLOSS,
		BURST_3_ROUND_NOLOSS,
		SEMI_AUTO_NODELAY
		)

/obj/item/gun/energy/smg/blackshield
	init_recoil = HANDGUN_RECOIL(0.2) //Unless you've got built-in targetting software.
	cell_type = /obj/item/cell/medium/hyper //we're not Soteria produced, so we don't get a Soteria cell.
