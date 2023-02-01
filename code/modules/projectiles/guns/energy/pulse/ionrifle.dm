/obj/item/gun/energy/ionrifle
	name = "\"Halicon\" ion-rifle"
	desc = "The OT IR Halicon is a man-portable anti-armor weapon designed to disable mechanical threats, produced by Old Testament. Not the best of its type, but gets the job done."
	icon = 'icons/obj/guns/energy/iongun.dmi'
	icon_state = "ionrifle"
	item_state = "ionrifle"
	item_charge_meter = TRUE
	fire_sound = 'sound/weapons/energy/pulsegunfire.ogg'
	origin_tech = list(TECH_COMBAT = 2, TECH_MAGNET = 4)
	w_class = ITEM_SIZE_BULKY
	force = WEAPON_FORCE_PAINFUL
	flags = CONDUCT
	slot_flags = SLOT_BACK
	charge_cost = 200
	matter = list(MATERIAL_PLASTEEL = 24, MATERIAL_WOOD = 8, MATERIAL_SILVER = 10)
	price_tag = 1500
	projectile_type = /obj/item/projectile/ion
	init_recoil = CARBINE_RECOIL(1.6)
	twohanded = TRUE
	gun_tags = list(GUN_ENERGY, GUN_SCOPE)
	serial_type = "Absolute"

	wield_delay = 0.7 SECOND
	wield_delay_factor = 0.3 // 30 vig

/obj/item/gun/energy/ionrifle/emp_act(severity)
	..(max(severity, 2)) //so it doesn't EMP itself, I guess

/obj/item/gun/energy/ionpistol
	name = "\"Aedes\" ion-pistol"
	desc = "A compact ion pistol produced by Seinemetall Defense GmbH, used primarly by police specialist units to disable energy weapons or electronics. \
	It's sleek compact and design allows for it to be holsterable."
	icon = 'icons/obj/guns/energy/ionpistol.dmi'
	icon_state = "ionpistol"
	item_state = "ionpistol"
	item_charge_meter = TRUE
	can_dual = TRUE
	fire_sound = 'sound/weapons/energy/pulsegunfire.ogg'
	origin_tech = list(TECH_COMBAT = 2, TECH_MAGNET = 3)
	w_class = ITEM_SIZE_SMALL
	flags = CONDUCT
	slot_flags = SLOT_BELT|SLOT_BACK|SLOT_HOLSTER
	charge_cost = 400
	matter = list(MATERIAL_PLASTEEL = 16, MATERIAL_PLASTIC = 5, MATERIAL_SILVER = 8)
	price_tag = 1250
	projectile_type = /obj/item/projectile/ion
	init_recoil = CARBINE_RECOIL(1)
	twohanded = FALSE
	gun_tags = list(GUN_ENERGY, GUN_SCOPE)
	serial_type = "SD GmbH"

/obj/item/gun/energy/ionpistol/emp_act(severity)
	..(max(severity, 2)) //so it doesn't EMP itself, I guess
