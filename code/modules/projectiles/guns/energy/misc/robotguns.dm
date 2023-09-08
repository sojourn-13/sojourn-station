//Adding in robot energy powered variants of guns, to avoid the hassle of needing to reload, etc. Centralising them all here for ease of use.

/obj/item/gun/energy/riot_autoshotgun
	name = "intergrated \"State\" riot shotgun"
	desc = "A Seinemetall Defense GmbH riot auto action shotgun, its uncommonly seen deployed in most police operation due to the success of the \"stolen\" \"Regulator\" design. \
	This particular shotgun has been redesigned many times, never quite reaching a standard everyone was happy with, with some lauding it as confusing for a shotgun. \
	Holds up to six 20mm shells in a tube magazine."
	icon = 'icons/obj/robot_items.dmi'
	icon_state = "riot_shotgun"
	item_state = "riot_shotgun"
	suitable_cell = /obj/item/cell/medium
	modifystate = null
	force = WEAPON_FORCE_PAINFUL
	charge_cost = 600
	self_recharge = 1
	init_firemodes = list(
		list(mode_name="beanbag", projectile_type=/obj/item/projectile/bullet/shotgun/beanbag, fire_sound = 'sound/weapons/guns/fire/shotgun_combat.ogg', fire_delay=25, icon="stun"),
		list(mode_name="slug", projectile_type=/obj/item/projectile/bullet/shotgun, fire_sound='sound/weapons/guns/fire/shotgun_combat.ogg', fire_delay=10, icon="kill"),
		list(mode_name="buckshot", projectile_type=/obj/item/projectile/bullet/pellet/shotgun, fire_sound='sound/weapons/guns/fire/shotgun_combat.ogg'', fire_delay=10, icon="kill"),
		list(mode_name="incendiary", projectile_type=/obj/item/projectile/bullet/shotgun/incendiary, fire_sound='sound/weapons/guns/fire/shotgun_combat.ogg'', fire_delay=10, icon="kill"),
	)
	serial_type = "SD GmbH"
