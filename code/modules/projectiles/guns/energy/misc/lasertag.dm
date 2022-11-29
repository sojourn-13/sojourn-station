/obj/item/gun/energy/lasertag
	name = "plasma tag rifle"
	item_state = "laser"
	desc = "Standard-issue weapon of the Imperial Guard."
	origin_tech = list(TECH_COMBAT = 1, TECH_MAGNET = 2)
	self_recharge = 1
	slot_flags = SLOT_BELT|SLOT_BACK
	item_charge_meter = TRUE
	twohanded = TRUE
	init_recoil = CARBINE_RECOIL(1)
	matter = list(MATERIAL_PLASTIC = 6)
	fire_sound = 'sound/weapons/energy/Laser.ogg'
	projectile_type = /obj/item/projectile/plasma/lastertag/blue
	var/required_vest
	serial_type = "TOY-CO"

/obj/item/gun/energy/lasertag/special_check(var/mob/living/carbon/human/M)
	if(ishuman(M))
		if(!istype(M.wear_suit, required_vest))
			to_chat(M, SPAN_WARNING("You need to be wearing your laser tag vest!"))
			return 0
	return ..()

/obj/item/gun/energy/lasertag/shotgun
	name = "plasma tag shotgun"
	desc = "Standard-issue weapon of the Imperial Guard. This one has a slower fire delay but contains an alternate knock back fire to deny charges."
	fire_delay = 6
	sel_mode = 1

/obj/item/gun/energy/lasertag/sniper
	name = "plasma tag sniper"
	desc = "Standard-issue weapon of the Imperial Guard. This one has a hologram projected scope attached that appears when the user looks down the sight. Fancy, but the gun itself is quite slow to fire as a result."
	fire_delay = 10
	zoom_factors = list(1.2) //small zome factor so we can't snipe from all the way accross the map

/obj/item/gun/energy/lasertag/pistol
	name = "plasma tag burst-pistol"
	desc = "Standard-issue weapon of the Imperial Guard. Half the size, half the charge, much faster firing speed. This model also fits a holster."
	twohanded = FALSE
	can_dual = TRUE
	slot_flags = SLOT_BELT|SLOT_BACK|SLOT_HOLSTER
	charge_cost = 100
	init_firemodes = list(
		list(mode_name="semiauto", mode_desc="Standered one shot",       burst=1, fire_delay=1.2, move_delay=null, icon="semi"),
		list(mode_name="3-round bursts", mode_desc="Three shots back to back", burst=3, fire_delay=0.2, move_delay=6, icon="burst"),
		)

/obj/item/gun/energy/lasertag/blue
	icon = 'icons/obj/guns/energy/bluetag.dmi'
	icon_state = "bluetag"
	item_state = "bluetag"
	projectile_color = "#004182"
	projectile_type = /obj/item/projectile/plasma/lastertag/blue
	required_vest = /obj/item/clothing/suit/fluff/bluetag

/obj/item/gun/energy/lasertag/shotgun/blue
	icon = 'icons/obj/guns/energy/bluetag.dmi'
	icon_state = "bluetag"
	item_state = "bluetag"
	projectile_color = "#004182"
	projectile_type = /obj/item/projectile/plasma/lastertag/blue
	required_vest = /obj/item/clothing/suit/fluff/bluetag
	init_firemodes = list(
		list(mode_name="normal", mode_desc="Standered one shot", projectile_type=/obj/item/projectile/plasma/lastertag/blue, fire_sound='sound/weapons/energy/Laser.ogg', icon="destroy"))

/obj/item/gun/energy/lasertag/sniper/blue
	icon = 'icons/obj/guns/energy/bluetag.dmi'
	icon_state = "bluetag"
	item_state = "bluetag"
	projectile_color = "#004182"
	projectile_type = /obj/item/projectile/plasma/lastertag/blue
	required_vest = /obj/item/clothing/suit/fluff/bluetag

/obj/item/gun/energy/lasertag/pistol/blue
	icon = 'icons/obj/guns/energy/bluetagpistol.dmi'
	icon_state = "ntpistol"
	item_state = "ntpistol"
	projectile_color = "#004182"
	projectile_type = /obj/item/projectile/plasma/lastertag/blue
	required_vest = /obj/item/clothing/suit/fluff/bluetag

/obj/item/gun/energy/lasertag/red
	icon = 'icons/obj/guns/energy/redtag.dmi'
	icon_state = "redtag"
	item_state = "redtag"
	projectile_color = "#8e0000"
	projectile_type = /obj/item/projectile/plasma/lastertag/red
	required_vest = /obj/item/clothing/suit/fluff/redtag

/obj/item/gun/energy/lasertag/shotgun/red
	icon = 'icons/obj/guns/energy/redtag.dmi'
	icon_state = "redtag"
	item_state = "redtag"
	projectile_color = "#8e0000"
	projectile_type = /obj/item/projectile/plasma/lastertag/red
	required_vest = /obj/item/clothing/suit/fluff/redtag
	init_firemodes = list(
		list(mode_name="normal", mode_desc="Standered one shot", projectile_type=/obj/item/projectile/plasma/lastertag/red, fire_sound='sound/weapons/energy/Laser.ogg', icon="destroy")
		)

/obj/item/gun/energy/lasertag/sniper/red
	icon = 'icons/obj/guns/energy/redtag.dmi'
	icon_state = "redtag"
	item_state = "redtag"
	projectile_color = "#8e0000"
	projectile_type = /obj/item/projectile/plasma/lastertag/red
	required_vest = /obj/item/clothing/suit/fluff/redtag

/obj/item/gun/energy/lasertag/pistol/red
	icon = 'icons/obj/guns/energy/redtagpistol.dmi'
	icon_state = "ntpistol"
	item_state = "ntpistol"
	projectile_color = "#8e0000"
	projectile_type = /obj/item/projectile/plasma/lastertag/red
	required_vest = /obj/item/clothing/suit/fluff/redtag

/obj/item/gun/energy/lasertag/green
	icon = 'icons/obj/guns/energy/greentag.dmi'
	icon_state = "greentag"
	item_state = "greentag"
	projectile_color = "#008000"
	projectile_type = /obj/item/projectile/plasma/lastertag/green
	required_vest = /obj/item/clothing/suit/fluff/greentag

/obj/item/gun/energy/lasertag/shotgun/green
	icon = 'icons/obj/guns/energy/greentag.dmi'
	icon_state = "greentag"
	item_state = "greentag"
	projectile_color = "#008000"
	projectile_type = /obj/item/projectile/plasma/lastertag/green
	required_vest = /obj/item/clothing/suit/fluff/greentag
	init_firemodes = list(
		list(mode_name="normal", mode_desc="Standered one shot", projectile_type=/obj/item/projectile/plasma/lastertag/green, fire_sound='sound/weapons/energy/Laser.ogg', icon="destroy"))

/obj/item/gun/energy/lasertag/sniper/green
	icon = 'icons/obj/guns/energy/greentag.dmi'
	icon_state = "greentag"
	item_state = "greentag"
	projectile_color = "#008000"
	projectile_type = /obj/item/projectile/plasma/lastertag/green
	required_vest = /obj/item/clothing/suit/fluff/greentag

/obj/item/gun/energy/lasertag/pistol/green
	icon = 'icons/obj/guns/energy/greentagpistol.dmi'
	icon_state = "ntpistol"
	item_state = "ntpistol"
	projectile_color = "#008000"
	projectile_type = /obj/item/projectile/plasma/lastertag/green
	required_vest = /obj/item/clothing/suit/fluff/greentag

/obj/item/gun/energy/lasertag/yellow
	icon = 'icons/obj/guns/energy/yellowtag.dmi'
	icon_state = "yellowtag"
	item_state = "yellowtag"
	projectile_color = "#ffff00"
	projectile_type = /obj/item/projectile/plasma/lastertag/yellow
	required_vest = /obj/item/clothing/suit/fluff/yellowtag

/obj/item/gun/energy/lasertag/shotgun/yellow
	icon = 'icons/obj/guns/energy/yellowtag.dmi'
	icon_state = "yellowtag"
	item_state = "yellowtag"
	projectile_color = "#ffff00"
	projectile_type = /obj/item/projectile/plasma/lastertag/yellow
	required_vest = /obj/item/clothing/suit/fluff/yellowtag
	init_firemodes = list(
		list(mode_name="normal", mode_desc="Standered one shot", projectile_type=/obj/item/projectile/plasma/lastertag/yellow, fire_sound='sound/weapons/energy/Laser.ogg', icon="destroy"))

/obj/item/gun/energy/lasertag/sniper/yellow
	icon = 'icons/obj/guns/energy/yellowtag.dmi'
	icon_state = "yellowtag"
	item_state = "yellowtag"
	projectile_color = "#ffff00"
	projectile_type = /obj/item/projectile/plasma/lastertag/yellow
	required_vest = /obj/item/clothing/suit/fluff/yellowtag

/obj/item/gun/energy/lasertag/pistol/yellow
	icon = 'icons/obj/guns/energy/yellowtagpistol.dmi'
	icon_state = "ntpistol"
	item_state = "ntpistol"
	projectile_color = "#ffff00"
	projectile_type = /obj/item/projectile/plasma/lastertag/yellow
	required_vest = /obj/item/clothing/suit/fluff/yellowtag
