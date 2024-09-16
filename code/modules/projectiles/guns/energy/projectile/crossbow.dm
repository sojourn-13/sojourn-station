/obj/item/gun/energy/crossbow
	name = "\"Nemesis\" energy crossbow"
	desc = "An Old Testament mini energy crossbow, currently produced only in small batches. Small, portable, and self-charging, it's great for wilderness survival."
	icon = 'icons/obj/guns/energy/crossbow.dmi'
	icon_state = "crossbow"
	w_class = ITEM_SIZE_SMALL
	can_dual = TRUE
	item_state = "crossbow"
	origin_tech = list(TECH_COMBAT = 2, TECH_MAGNET = 2, TECH_ILLEGAL = 5)
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 10, MATERIAL_SILVER = 6, MATERIAL_URANIUM = 6)
	slot_flags = SLOT_BELT
	silenced = TRUE
	fire_sound = 'sound/weapons/Genhit.ogg'
	projectile_type = /obj/item/projectile/energy/bolt
	self_recharge = 1
	charge_meter = 0
	charge_cost = 200
	price_tag = 1250
	serial_type = "Absolute"

	wield_delay = 0.8 SECOND
	wield_delay_factor = 0.2 // 20 vig

/obj/item/gun/energy/crossbow/ninja
	name = "energy dart thrower"
	desc = "Mini energy crossbow, though this looks black market and doesn't at all resemble existing similar weapons."
	projectile_type = /obj/item/projectile/energy/dart
	safety = FALSE
	restrict_safety = TRUE
	serial_type = "INDEX"
	serial_shown = FALSE

/obj/item/gun/energy/crossbow/largecrossbow
	name = "\"Themis\" energy crossbow"
	desc = "An aging Old Testament energy crossbow, currently produced only in small batches. Favored for game hunting."
	w_class = ITEM_SIZE_BULKY
	force = WEAPON_FORCE_NORMAL
	matter = list(MATERIAL_PLASTEEL = 35, MATERIAL_PLASTIC = 20, MATERIAL_SILVER = 9, MATERIAL_URANIUM = 9)
	projectile_type = /obj/item/projectile/energy/bolt/large
	price_tag = 2000
