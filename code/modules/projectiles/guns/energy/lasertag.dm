/obj/item/weapon/gun/energy/lasertag
	name = "laser tag gun"
	item_state = "laser"
	desc = "Standard-issue weapon of the Imperial Guard."
	origin_tech = list(TECH_COMBAT = 1, TECH_MAGNET = 2)
	self_recharge = 1
	one_hand_penalty = 5
	slot_flags = SLOT_BELT|SLOT_BACK
	item_charge_meter = TRUE
	twohanded = TRUE
	matter = list(MATERIAL_PLASTIC = 6)
	fire_sound = 'sound/weapons/Laser.ogg'
	projectile_type = /obj/item/projectile/plasma/lastertag/blue
	var/required_vest

/obj/item/weapon/gun/energy/lasertag/special_check(var/mob/living/carbon/human/M)
	if(ishuman(M))
		if(!istype(M.wear_suit, required_vest))
			to_chat(M, SPAN_WARNING("You need to be wearing your laser tag vest!"))
			return 0
	return ..()

/obj/item/weapon/gun/energy/lasertag/blue
	icon = 'icons/obj/guns/energy/bluetag.dmi'
	icon_state = "bluetag"
	item_state = "bluetag"
	projectile_color = "#004182"
	projectile_type = /obj/item/projectile/plasma/lastertag/blue
	required_vest = /obj/item/clothing/suit/fluff/bluetag

/obj/item/weapon/gun/energy/lasertag/red
	icon = 'icons/obj/guns/energy/redtag.dmi'
	icon_state = "redtag"
	item_state = "redtag"
	projectile_color = "#8e0000"
	projectile_type = /obj/item/projectile/plasma/lastertag/red
	required_vest = /obj/item/clothing/suit/fluff/redtag

/obj/item/weapon/gun/energy/lasertag/green
	icon = 'icons/obj/guns/energy/greentag.dmi'
	icon_state = "greentag"
	item_state = "greentag"
	projectile_color = "#008000"
	projectile_type = /obj/item/projectile/plasma/lastertag/green
	required_vest = /obj/item/clothing/suit/fluff/greentag

/obj/item/weapon/gun/energy/lasertag/yellow
	icon = 'icons/obj/guns/energy/yellowtag.dmi'
	icon_state = "yellowtag"
	item_state = "yellowtag"
	projectile_color = "#ffff00"
	projectile_type = /obj/item/projectile/plasma/lastertag/yellow
	required_vest = /obj/item/clothing/suit/fluff/yellowtag