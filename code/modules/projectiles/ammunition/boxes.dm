/*This code for boxes with ammo, you cant use them as magazines, but should be able to fill magazines with them.*/
/obj/item/ammo_magazine/ammobox	//Should not be used bu its own
	name = "ammunition box"
	desc = "Gun ammunition stored in a shiny new box. You can see caliber information on the label."
	mag_type = SPEEDLOADER	//To prevent load in magazine filled guns
	icon = 'icons/obj/ammo.dmi'
	multiple_sprites = 1
	reload_delay = 30
	ammo_mag = "box"

/obj/item/ammo_magazine/ammobox/resolve_attackby(atom/A, mob/user)
	if(isturf(A) && locate(/obj/item/ammo_casing) in A || istype(A, /obj/item/ammo_casing))
		if(!do_after(user, src.reload_delay, src))
			to_chat(user, SPAN_WARNING("You stoped scooping ammo into [src]."))
			return
		if(collectAmmo(get_turf(A), user))
			return TRUE
	..()

/obj/item/ammo_magazine/ammobox/proc/collectAmmo(var/turf/target, var/mob/user)
	ASSERT(istype(target))
	. = FALSE
	for(var/obj/item/ammo_casing/I in target)
		if(stored_ammo.len >= max_ammo)
			break
		if(I.caliber == src.caliber)
			for(var/j = 1 to I.amount)
				if(stored_ammo.len >= max_ammo)
					break
				. |= TRUE
				insertCasing(I)
	if(user)
		if(.)
			user.visible_message(SPAN_NOTICE("[user] scoopes some ammo in [src]."),SPAN_NOTICE("You scoop some ammo in [src]."),SPAN_NOTICE("You hear metal clanging."))
		else
			to_chat(user, SPAN_NOTICE("You fail to pick anything up with \the [src]."))
	update_icon()

/obj/item/ammo_magazine/ammobox/a10mm
	name = "ammunition box (10mm)"
	icon_state = "box10mm"
	matter = list(MATERIAL_STEEL = 6)
	caliber = "10mm"
	ammo_type = /obj/item/ammo_casing/a10mm
	max_ammo = 32

/obj/item/ammo_magazine/ammobox/a10mm/rubber
	name = "ammunition box (10mm rubber)"
	icon_state = "box10mm-rubber"
	ammo_type = /obj/item/ammo_casing/a10mm/rubber

/obj/item/ammo_magazine/ammobox/a10mm/practice
	name = "ammunition box (10mm practice)"
	icon_state = "box10mm-practice"
	ammo_type = /obj/item/ammo_casing/a10mm/practice

/obj/item/ammo_magazine/ammobox/a10mm/hv
	name = "ammunition box (10mm high velocity)"
	icon_state = "box10mm-hv"
	ammo_type = /obj/item/ammo_casing/a10mm/hv

/obj/item/ammo_magazine/ammobox/c10mm
	name = "ammunition box (10x50mm ball)"
	icon_state = "box10x50mm"
	desc = "A box of 10x50mm Omnirifle ammunition. 80ct, 7mm FMJ subcaliber sabots."
	matter = list(MATERIAL_STEEL = 20)
	w_class = ITEM_SIZE_BULKY
	caliber = "10x50mm"
	ammo_type = /obj/item/ammo_casing/c10mm
	max_ammo = 80

/obj/item/ammo_magazine/ammobox/c10mm/pickup(mob/user)
	..()
	playsound(src,'sound/weapons/guns/interact/magmove.ogg',60,3)

/obj/item/ammo_magazine/ammobox/c10mm/dropped(mob/user)
	..()
	playsound(src,'sound/weapons/guns/interact/ammomove.ogg',60,3)

/obj/item/ammo_magazine/ammobox/c10mm/update_icon()
	if (!stored_ammo.len)
		icon_state = "box10x50mm-0"
		return
	if (stored_ammo.len == max_ammo)
		icon_state = "box10x50mm"
		return

	var/number = 0
	if (stored_ammo.len && max_ammo)
		var/percent = (stored_ammo.len / max_ammo) * 100
		number = round(percent, 25)
	icon_state = "box10x50mm-[number]"

/obj/item/ammo_magazine/ammobox/c10mm/rubber
	name = "ammunition box (10x50mm rubber)"
	icon_state = "box10x50mmr"
	desc = "A box of 10x50mm Omnirifle ammunition. 80ct, 10mm deforming traumatic rounds."
/
obj/item/ammo_magazine/ammobox/c10mm/rubber/update_icon()
	if (!stored_ammo.len)
		icon_state = "box10x50mmr-0"
		return
	if (stored_ammo.len == max_ammo)
		icon_state = "box10x50mmr"
		return

	var/number = 0
	if (stored_ammo.len && max_ammo)
		var/percent = (stored_ammo.len / max_ammo) * 100
		number = round(percent, 25)
	icon_state = "box10x50mmr-[number]"

/obj/item/ammo_magazine/ammobox/c10mm/practice
	name = "ammunition box (10x50mm training)"
	icon_state = "box10x50mmp"
	desc = "A box of 10x50mm Omnirifle ammunition. 80ct, 7mm subcaliber frangible training rounds."

obj/item/ammo_magazine/ammobox/c10mm/practice/update_icon()
	if (!stored_ammo.len)
		icon_state = "box10x50mmr-0"
		return
	if (stored_ammo.len == max_ammo)
		icon_state = "box10x50mmp"
		return

	var/number = 0
	if (stored_ammo.len && max_ammo)
		var/percent = (stored_ammo.len / max_ammo) * 100
		number = round(percent, 25)
	icon_state = "box10x50mmp-[number]"

/obj/item/ammo_magazine/ammobox/c10mm/hv
	name = "ammunition box (10x50mm SLAP)"
	icon_state = "box10x50mmhv"
	desc = "A box of 10x50mm Omnirifle ammunition. 80ct, 5mm Saboted Light Armor Penetrators, spoon-tipped."

obj/item/ammo_magazine/ammobox/c10mm/hv/update_icon()
	if (!stored_ammo.len)
		icon_state = "box10x50mmhv-0"
		return
	if (stored_ammo.len == max_ammo)
		icon_state = "box10x50mmhv"
		return

	var/number = 0
	if (stored_ammo.len && max_ammo)
		var/percent = (stored_ammo.len / max_ammo) * 100
		number = round(percent, 25)
	icon_state = "box10x50mmhv-[number]"

/obj/item/ammo_magazine/ammobox/c10mm/lethal
	name = "ammunition box (10x50mm hollow-tip)"
	icon_state = "box10x50mml"
	desc = "A box of 10x50mm Omnirifle ammunition. 60ct, 10mm hollow-tipped full-caliber."

obj/item/ammo_magazine/ammobox/c10mm/lethal/update_icon()
	if (!stored_ammo.len)
		icon_state = "box10x50mml-0"
		return
	if (stored_ammo.len == max_ammo)
		icon_state = "box10x50mml"
		return

	var/number = 0
	if (stored_ammo.len && max_ammo)
		var/percent = (stored_ammo.len / max_ammo) * 100
		number = round(percent, 25)
	icon_state = "box10x50mml-[number]"

//// .35 ////

/obj/item/ammo_magazine/ammobox/pistol
	name = "ammunition packet (.35 Auto)"
	icon_state = "pistol_l"
	matter = list(MATERIAL_STEEL = 6, MATERIAL_CARDBOARD = 1)
	caliber = CAL_PISTOL
	ammo_type = /obj/item/ammo_casing/pistol
	max_ammo = 30

/obj/item/ammo_magazine/ammobox/pistol/practice
	name = "ammunition packet (.35 Auto practice)"
	icon_state = "pistol_p"
	ammo_type = /obj/item/ammo_casing/pistol/practice

/obj/item/ammo_magazine/ammobox/pistol/hv
	name = "ammunition packet (.35 Auto high-velocity)"
	icon_state = "pistol_hv"
	ammo_type = /obj/item/ammo_casing/pistol/hv

/obj/item/ammo_magazine/ammobox/pistol/rubber
	name = "ammunition packet (.35 Auto rubber)"
	icon_state = "pistol_r"
	ammo_type = /obj/item/ammo_casing/pistol/rubber

//// . 40 ////

/obj/item/ammo_magazine/ammobox/magnum
	name = "ammunition packet (.40 Magnum)"
	icon_state = "magnum_l"
	matter = list(MATERIAL_STEEL = 9, MATERIAL_CARDBOARD = 1)
	caliber = ".40"
	caliber = CAL_MAGNUM
	ammo_type = /obj/item/ammo_casing/magnum
	max_ammo = 30

/obj/item/ammo_magazine/ammobox/magnum/practice
	name = "ammunition packet (.40 Magnum practice)"
	icon_state = "magnum_p"
	ammo_type = /obj/item/ammo_casing/magnum/practice

/obj/item/ammo_magazine/ammobox/magnum/hv
	name = "ammunition packet (.40 Magnum high-velocity)"
	icon_state = "magnum_hv"
	ammo_type = /obj/item/ammo_casing/magnum/hv

/obj/item/ammo_magazine/ammobox/magnum/rubber
	name = "ammunition packet (.40 Magnum rubber)"
	icon_state = "magnum_r"
	ammo_type = /obj/item/ammo_casing/magnum/rubber

//// . 208 ////

/obj/item/ammo_magazine/ammobox/srifle
	name = "ammunition box (.208 Rifle FMJ)"
	icon_state = "box_srifle_l"
	matter = list(MATERIAL_STEEL = 30)
	w_class = ITEM_SIZE_BULKY
	caliber = "srifle"
	caliber = CAL_SRIFLE
	ammo_type = /obj/item/ammo_casing/srifle
	max_ammo = 240

/obj/item/ammo_magazine/ammobox/srifle/pickup(mob/user)
	..()
	playsound(src,'sound/weapons/guns/interact/magmove.ogg',60,3)

/obj/item/ammo_magazine/ammobox/srifle/dropped(mob/user)
	..()
	playsound(src,'sound/weapons/guns/interact/ammomove.ogg',60,3)

/obj/item/ammo_magazine/ammobox/srifle/rubber
	name = "ammunition box (.208 Rifle rubber)"
	icon_state = "box_srifle_r"
	ammo_type = /obj/item/ammo_casing/srifle/rubber

/obj/item/ammo_magazine/ammobox/srifle/practice
	name = "ammunition box (.208 Rifle practice)"
	icon_state = "box_srifle_p"
	ammo_type = /obj/item/ammo_casing/srifle/practice

/obj/item/ammo_magazine/ammobox/srifle_small
	name = "ammunition packet (.20 Rifle)"
	icon_state = "srifle_l"
	matter = list(MATERIAL_STEEL = 20, MATERIAL_CARDBOARD = 1)
	caliber = CAL_SRIFLE
	ammo_type = /obj/item/ammo_casing/srifle
	max_ammo = 60

/obj/item/ammo_magazine/ammobox/srifle_small/practice
	name = "ammunition packet (.208 Rifle practice)"
	icon_state = "srifle_p"
	ammo_type = /obj/item/ammo_casing/srifle/practice

/obj/item/ammo_magazine/ammobox/srifle_small/rubber
	name = "ammunition packet (.208 Rifle rubber)"
	icon_state = "srifle_r"
	ammo_type = /obj/item/ammo_casing/srifle/rubber

////6.5mm////

obj/item/ammo_magazine/ammobox/lrifle
	name = "ammunition box (6.5x39mm FMJ)"
	icon_state = "box_lrifle_l"
	matter = list(MATERIAL_STEEL = 30)
	w_class = ITEM_SIZE_BULKY
	caliber = CAL_LRIFLE
	ammo_type = /obj/item/ammo_casing/lrifle
	max_ammo = 240

/obj/item/ammo_magazine/ammobox/lrifle/pickup(mob/user)
	..()
	playsound(src,'sound/weapons/guns/interact/magmove.ogg',60,3)

/obj/item/ammo_magazine/ammobox/lrifle/dropped(mob/user)
	..()
	playsound(src,'sound/weapons/guns/interact/ammomove.ogg',60,3)

/obj/item/ammo_magazine/ammobox/lrifle/rubber
	name = "ammunition box (6.5x39mm rubber)"
	icon_state = "box_lrifle_r"
	ammo_type = /obj/item/ammo_casing/lrifle/rubber

/obj/item/ammo_magazine/ammobox/lrifle/practice
	name = "ammunition box (6.5x39mm rubber)"
	icon_state = "box_lrifle_p"
	ammo_type = /obj/item/ammo_casing/lrifle/practice

/obj/item/ammo_magazine/ammobox/lrifle/hv
	name = "ammunition box (6.5x39mm rubber)"
	icon_state = "box_lrifle_l"
	ammo_type = /obj/item/ammo_casing/lrifle/hv

/obj/item/ammo_magazine/ammobox/lrifle_small/practice
	name = "ammunition packet (6.5x39mm practice)"
	icon_state = "lrifle_p"
	ammo_type = /obj/item/ammo_casing/lrifle/practice

/obj/item/ammo_magazine/ammobox/lrifle_small/hv
	name = "ammunition packet (6.5x39mm high-velocity)"
	icon_state = "lrifle_hv"
	ammo_type = /obj/item/ammo_casing/lrifle/hv

/obj/item/ammo_magazine/ammobox/lrifle_small/rubber
	name = "ammunition packet (.6.5x39mm rubber)"
	icon_state = "lrifle_r"
	ammo_type = /obj/item/ammo_casing/lrifle/rubber


////7.62 Rifle////

obj/item/ammo_magazine/ammobox/hrifle
	name = "ammunition box (7.62mm Rifle lethal)"
	icon_state = "box10x50mm"
	matter = list(MATERIAL_STEEL = 30)
	w_class = ITEM_SIZE_BULKY
	caliber = CAL_HRIFLE
	ammo_type = /obj/item/ammo_casing/hrifle
	mag_type = SPEEDLOADER | MAGAZINE
	max_ammo = 120

/obj/item/ammo_magazine/ammobox/hrifle_small
	name = "ammunition packet (7.62mm Rifle lethal)"
	icon_state = "lrifle_l"
	matter = list(MATERIAL_STEEL = 20, MATERIAL_CARDBOARD = 1)
	caliber = "lrifle"
	caliber = CAL_HRIFLE
	ammo_type = /obj/item/ammo_casing/hrifle
	max_ammo = 30

////snowflake 10x24////

/obj/item/ammo_magazine/ammobox/c10x24
	name = "ammunition box (10x24mm caseless)"
	icon_state = "box10x24"
	matter = list(MATERIAL_STEEL = 8)
	caliber = "10x24"
	ammo_type = /obj/item/ammo_casing/c10x24
	max_ammo = 200

////.50 kurtz

/obj/item/ammo_magazine/ammobox/c50
	name = "ammunition box (.50 kurtz)"
	icon_state = "box50"
	matter = list(MATERIAL_STEEL = 10)
	caliber = CAL_50
	ammo_type = /obj/item/ammo_casing/a50
	max_ammo = 20

/obj/item/ammo_magazine/ammobox/c50/rubber
	name = "ammunition box (.50 kurtz rubber)"
	icon_state = "box50-rubber"
	ammo_type = /obj/item/ammo_casing/a50/rubber

//// .60-06 ////

/obj/item/ammo_magazine/ammobox/antim
	name = "ammunition box (.60-06 AP)"
	icon_state = "antim"
	matter = list(MATERIAL_STEEL = 30, MATERIAL_PLASTEEL = 30)
	w_class = ITEM_SIZE_BULKY
	caliber = CAL_ANTIM
	ammo_type = /obj/item/ammo_casing/antim
	max_ammo = 30
