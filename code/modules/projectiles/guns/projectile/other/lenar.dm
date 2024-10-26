/obj/item/gun/projectile/grenade/lenar
	name = "SD GmbH GL \"Lenar\""
	desc = "A more than bulky pump-action grenade launcher used by Police during riots. Holds up to 6 grenade shells in a revolving magazine."
	icon = 'icons/obj/guns/launcher/grenadelauncher.dmi'
	icon_state = "Grenadelauncher_PMC"
	item_state = "pneumatic"
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK
	matter = list(MATERIAL_PLASTEEL = 30, MATERIAL_PLASTIC = 10)
	fire_sound = 'sound/weapons/guns/fire/ubgl.ogg'
	bulletinsert_sound = 'sound/weapons/guns/interact/china_lake_reload.ogg'
	fire_sound_text = "a metallic thunk"
	price_tag = 1200
	serial_type = "SD GmbH"
	wield_delay = 1.5 SECOND
	wield_delay_factor = 0.6 // 60 vig , heavy stuff
	gun_parts = list(/obj/item/part/gun = 2, /obj/item/part/gun/grip/rubber = 1, /obj/item/part/gun/mechanism/shotgun = 1)

/obj/item/gun/projectile/grenade/lenar/proc/update_charge()
	var/ratio = loaded.len / max_shells
	if(ratio < 0.33 && ratio != 0)
		ratio = 0.33
	ratio = round(ratio, 0.33) * 100
	add_overlay("grenademag_[ratio]")

/obj/item/gun/projectile/grenade/lenar/update_icon()
	cut_overlays()
	update_charge()


/obj/item/gun/projectile/grenade/lenar/update_icon()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if(wielded)
		itemstring += "_doble"

	icon_state = iconstring
	set_item_state(itemstring)
