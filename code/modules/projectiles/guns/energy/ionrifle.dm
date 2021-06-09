/obj/item/weapon/gun/energy/ionrifle
	name = "\"Halicon\" ion-rifle"
	desc = "The OT IR Halicon is a man-portable anti-armor weapon designed to disable mechanical threats, produced by Old Testament. Not the best of its type, but gets the job done."
	icon = 'icons/obj/guns/energy/iongun.dmi'
	icon_state = "ionrifle"
	item_state = "ionrifle"
	item_charge_meter = TRUE
	fire_sound = 'sound/weapons/Laser.ogg'
	origin_tech = list(TECH_COMBAT = 2, TECH_MAGNET = 4)
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_PAINFUL
	flags = CONDUCT
	slot_flags = SLOT_BACK
	charge_cost = 200
	matter = list(MATERIAL_PLASTEEL = 24, MATERIAL_WOOD = 8, MATERIAL_SILVER = 10)
	price_tag = 1500
	projectile_type = /obj/item/projectile/ion
	one_hand_penalty = 5
	twohanded = TRUE
	gun_tags = list(GUN_ENERGY, GUN_SCOPE)

/obj/item/weapon/gun/energy/ionrifle/emp_act(severity)
	..(max(severity, 2)) //so it doesn't EMP itself, I guess

/obj/item/weapon/gun/energy/ionrifle/update_icon(ignore_inhands)
	..(TRUE)
	if(!cell || cell.charge < charge_cost)
		set_item_state("-empty", hands = TRUE)
	else
		set_item_state(null, hands = TRUE)
	//Update here instead of parent proc because we override hands icon
	if(!ignore_inhands)
		update_wear_icon()

/obj/item/weapon/gun/energy/ionpistol
	name = "\"Aedes\" ion-pistol"
	desc = "A compact ion pistol produced by Seinemetall Defense GmbH, used primarly by police specialist units to disable energy weapons or electronics. \
	It's sleek compact and design allows for it to be holsterable."
	icon = 'icons/obj/guns/energy/ionpistol.dmi'
	icon_state = "ionpistol"
	item_state = "ionpistol"
	item_charge_meter = TRUE
	can_dual = TRUE
	fire_sound = 'sound/weapons/Laser.ogg'
	origin_tech = list(TECH_COMBAT = 2, TECH_MAGNET = 3)
	w_class = ITEM_SIZE_SMALL
	flags = CONDUCT
	slot_flags = SLOT_BELT|SLOT_BACK|SLOT_HOLSTER
	charge_cost = 400
	matter = list(MATERIAL_PLASTEEL = 16, MATERIAL_PLASTIC = 5, MATERIAL_SILVER = 8)
	price_tag = 1400
	projectile_type = /obj/item/projectile/ion
	one_hand_penalty = 5
	twohanded = TRUE
	gun_tags = list(GUN_ENERGY, GUN_SCOPE)

/obj/item/weapon/gun/energy/ionpistol/emp_act(severity)
	..(max(severity, 2)) //so it doesn't EMP itself, I guess

/obj/item/weapon/gun/energy/ionpistol/update_icon(ignore_inhands)
	..(TRUE)
	if(!cell || cell.charge < charge_cost)
		set_item_state("-empty", hands = TRUE)
	else
		set_item_state(null, hands = TRUE)
	//Update here instead of parent proc because we override hands icon
	if(!ignore_inhands)
		update_wear_icon()