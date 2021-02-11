//Warning! If you change icon_state or item_state, make sure you change path for sneath as well. icons/obj/sneath.dmi
/obj/item/weapon/tool/sword/nt
	name = "Short Sword"
	desc = "A saintly looking sword, made to do God's work. It bears a tau cross marking it as produced by the Church of Absolute's New Testament weapons division."
	icon = 'icons/obj/nt_melee.dmi'
	icon_state = "nt_shortsword"
	item_state = "nt_shortsword"
	force = WEAPON_FORCE_DANGEROUS
	throwforce = WEAPON_FORCE_WEAK
	armor_penetration = ARMOR_PEN_DEEP
	price_tag = 300
	matter = list(MATERIAL_BIOMATTER = 25, MATERIAL_STEEL = 5)

/obj/item/weapon/tool/sword/nt/longsword
	name = "Longsword"
	desc = "A saintly looking longsword, recommended by experienced crusaders. It bears a tau cross marking it as produced by the Church of Absolute's New Testament weapons division."
	icon_state = "nt_longsword"
	item_state = "nt_longsword"
	force = WEAPON_FORCE_ROBUST
	armor_penetration = ARMOR_PEN_EXTREME
	w_class = ITEM_SIZE_BULKY
	price_tag = 1200
	matter = list(MATERIAL_BIOMATTER = 75, MATERIAL_STEEL = 10, MATERIAL_PLASTEEL = 5)

/obj/item/weapon/tool/knife/dagger/nt
	name = "Dagger"
	desc = "A saintly looking dagger, may the absolute have mercy. It bears a tau cross marking it as produced by the Church of Absolute's New Testament weapons division."
	icon = 'icons/obj/nt_melee.dmi'
	icon_state = "nt_dagger"
	item_state = "nt_dagger"
	force = WEAPON_FORCE_PAINFUL
	armor_penetration = ARMOR_PEN_MASSIVE
	price_tag = 120
	matter = list(MATERIAL_BIOMATTER = 10, MATERIAL_STEEL = 1)

/obj/item/weapon/tool/spear/halberd
	name = "Halberd"
	desc = "This weapon of ancient design appears to be a spear-axe hybrid. It saw a lot of use back in the Dark Ages back on Earth - in more recent times, sablekyne hunters use a similar weapon \
	on their homeworlds, the weapons practical use taking down huge and heavily armored wildlife lead to the church adopting its own design. Additionally, due to the halberd being so long, you can attack \
	enemies from up to a tile away with it - twice as far as most other weapons can. It bears a tau cross marking it as produced by the Church of Absolute's New Testament weapons division."
	icon = 'icons/obj/nt_melee.dmi'
	icon_state = "nt_halberd"
	item_state = "nt_halberd"
	wielded_icon = "nt_halberd_wielded"
	force = WEAPON_FORCE_BRUTAL
	armor_penetration = ARMOR_PEN_MASSIVE
	price_tag = 600
	matter = list(MATERIAL_BIOMATTER = 80, MATERIAL_STEEL = 8, MATERIAL_WOOD = 10, MATERIAL_PLASTEEL = 2)

/obj/item/weapon/tool/sword/nt/scourge
	name = "Scourge"
	desc = "A saintly looking scourge, extreme punishment in handheld form. Can be extended to cut deeper. It bears a tau cross marking it as produced by the Church of Absolute's New Testament weapons division."
	icon_state = "nt_scourge"
	item_state = "nt_scourge"
	force = WEAPON_FORCE_PAINFUL
	var/force_extended = WEAPON_FORCE_DANGEROUS
	armor_penetration = ARMOR_PEN_DEEP
	var/armor_penetration_extended = ARMOR_PEN_HALF
	var/extended = FALSE
	w_class = ITEM_SIZE_BULKY
	price_tag = 1000
	matter = list(MATERIAL_BIOMATTER = 50, MATERIAL_STEEL = 5, MATERIAL_PLASTEEL = 2)

/obj/item/weapon/tool/sword/nt/scourge/attack_self(mob/user)
	if(isBroken)
		to_chat(user, SPAN_WARNING("\The [src] is broken."))
		return
	if(extended)
		unextend()
	else
		extend()

/obj/item/weapon/tool/sword/nt/scourge/proc/extend()
	extended = TRUE
	force += (force_extended - initial(force))
	armor_penetration += (armor_penetration_extended - initial(armor_penetration))
	slot_flags = null
	w_class = ITEM_SIZE_HUGE
	update_icon()

/obj/item/weapon/tool/sword/nt/scourge/proc/unextend()
	extended = FALSE
	w_class = initial(w_class)
	slot_flags = initial(slot_flags)
	armor_penetration = initial(armor_penetration)
	refresh_upgrades() //it's also sets all to default
	update_icon()

/obj/item/weapon/tool/sword/nt/scourge/update_icon()
	if(extended)
		icon_state = initial(icon_state) + "_extended"
	else
		icon_state = initial(icon_state)
	..()

/obj/item/weapon/shield/riot/nt
	name = "Shield"
	desc = "A saintly looking shield, let the God protect you. It bears a tau cross marking it as produced by the Church of Absolute's New Testament weapons division."
	icon = 'icons/obj/nt_melee.dmi'
	icon_state = "nt_shield"
	item_state = "nt_shield"
	matter = list(MATERIAL_BIOMATTER = 25, MATERIAL_STEEL = 5, MATERIAL_PLASTEEL = 2)
	price_tag = 1000
	base_block_chance = 40

/obj/item/weapon/shield/riot/nt/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/melee/baton) || istype(W, /obj/item/weapon/tool/sword/nt))
		on_bash(W, user)
	else
		..()

/obj/item/weapon/shield/riot/nt/get_block_chance(mob/user, var/damage, atom/damage_source = null, mob/attacker = null)
	return base_block_chance

/obj/item/weapon/tool/sword/crusader
	name = "crusader great sword"
	desc = "A traditional blade meeting the materials and design of the future. It's made from durasteel and the craftsmanship is of the highest quality. It bears the insignia of the Church. Deus Vult."
	icon = 'icons/obj/weapons-blades.dmi'
	icon_state = "crusader"
	item_state = "crusader"
	force = WEAPON_FORCE_LETHAL
	armor_penetration = ARMOR_PEN_HALF
	matter = list(MATERIAL_DURASTEEL = 25, MATERIAL_PLASTIC = 3)
	price_tag = 10000
