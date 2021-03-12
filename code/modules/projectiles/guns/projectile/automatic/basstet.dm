/obj/item/weapon/gun/projectile/automatic/basstet
	name = "\"Basstet\" carbine"
	desc = "Made by Nadezhda Marshals gunsmiths, the basstet is the most cheapest made carbine on the colony. \
		 A copy of the bulldog pattern, shortened into a mid-length carbine, made as cheap as possable will still making sure to not blow up in your hand, chambered in .257."
	icon = 'icons/obj/guns/projectile/basstet.dmi'
	icon_state = "basstet"
	item_state = "basstet"
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_WOOD = 10)
	price_tag = 150
	damage_multiplier = 0.9 //Cheaer AK basiclly
	w_class = ITEM_SIZE_NORMAL
	recoil_buildup = 10
	one_hand_penalty = 12 //automatic rifle level
	gun_tags = list(GUN_PROJECTILE, GUN_SCOPE, GUN_MAGWELL)
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)

/obj/item/weapon/gun/projectile/automatic/basstet/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "[ammo_magazine? "_mag[ammo_magazine.max_ammo]": ""]"
		itemstring += "_full"

	if(wielded)
		itemstring += "_doble"

	icon_state = iconstring
	set_item_state(itemstring)
