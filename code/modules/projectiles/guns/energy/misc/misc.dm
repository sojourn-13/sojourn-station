

/obj/item/gun/energy/grappler
	name = "integrated grappler"
	icon = 'icons/obj/guns/energy/cog.dmi'
	icon_state = "cog"
	item_state = null
	item_charge_meter = TRUE
	desc = "If you're seeing this outside of a hardsuit, please report it and have fun."
	fire_sound = 'sound/machines/hiss.ogg'
	projectile_type = /obj/item/projectile/tether
	init_recoil = CARBINE_RECOIL(1)
	charge_cost = 0
	self_recharge = TRUE
	twohanded = FALSE
	safety = FALSE
	restrict_safety = TRUE
