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


//// .35 ////

/obj/item/ammo_magazine/ammobox/pistol
	name = "ammunition packet (.35 Auto)"
	icon_state = "pistol"
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

/obj/item/ammo_magazine/ammobox/pistol/lethal
	name = "ammunition packet (.35 Auto hollow-point)"
	desc = "A box of self-defense grade .35 auto hollow-points."
	icon_state = "pistol_l"
	ammo_type = /obj/item/ammo_casing/pistol/lethal

//// . 40 ////

/obj/item/ammo_magazine/ammobox/magnum
	name = "ammunition packet (.40 Magnum)"
	icon_state = "magnum"
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

/obj/item/ammo_magazine/ammobox/magnum/lethal
	name = "ammunition packet (.40 Magnum hollow-point)"
	desc = "A box of self-defense grade .40 Auto-Mag hollow-points."
	icon_state = "magnum_l"
	ammo_type = /obj/item/ammo_casing/magnum/lethal

//// .257 carbine ////

obj/item/ammo_magazine/ammobox/lrifle
	name = "ammunition box (.257 Carbine FMJ)"
	icon_state = "box_lrifle"
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
	name = "ammunition box (.257 Carbine rubber)"
	icon_state = "box_lrifle_r"
	ammo_type = /obj/item/ammo_casing/lrifle/rubber

/obj/item/ammo_magazine/ammobox/lrifle/practice
	name = "ammunition box (.257 Carbine rubber)"
	icon_state = "box_lrifle_p"
	ammo_type = /obj/item/ammo_casing/lrifle/practice

obj/item/ammo_magazine/ammobox/lrifle_small
	name = "ammunition box (.257 Carbine FMJ)"
	icon_state = "lrifle"
	matter = list(MATERIAL_STEEL = 15)
	caliber = CAL_LRIFLE
	ammo_type = /obj/item/ammo_casing/lrifle
	max_ammo = 60

/obj/item/ammo_magazine/ammobox/lrifle_small/practice
	name = "ammunition packet (.257 Carbine practice)"
	icon_state = "lrifle_p"
	ammo_type = /obj/item/ammo_casing/lrifle/practice

/obj/item/ammo_magazine/ammobox/lrifle_small/hv
	name = "ammunition packet (.257 Carbine high-velocity)"
	icon_state = "lrifle_hv"
	ammo_type = /obj/item/ammo_casing/lrifle/hv

/obj/item/ammo_magazine/ammobox/lrifle_small/rubber
	name = "ammunition packet (.257 Carbine rubber)"
	icon_state = "lrifle_r"
	ammo_type = /obj/item/ammo_casing/lrifle/rubber

/obj/item/ammo_magazine/ammobox/lrifle_small/lethal
	name = "ammunition packet (.257 Carbine hollow-point)"
	icon_state = "lrifle_l"
	ammo_type = /obj/item/ammo_casing/lrifle/lethal


////7.5 Rifle////

obj/item/ammo_magazine/ammobox/rifle
	name = "ammunition box (7.5mm Rifle ball)"
	icon_state = "boxhrifle"
	desc = "A box of 7.5mm rifle ammunition. 180ct, Full Metal Jacket rounds."
	matter = list(MATERIAL_STEEL = 30)
	w_class = ITEM_SIZE_BULKY
	caliber = CAL_RIFLE
	ammo_type = /obj/item/ammo_casing/rifle
	mag_type = SPEEDLOADER | MAGAZINE
	max_ammo = 180

/obj/item/ammo_magazine/ammobox/rifle/pickup(mob/user)
	..()
	playsound(src,'sound/weapons/guns/interact/magmove.ogg',60,3)

/obj/item/ammo_magazine/ammobox/rifle/dropped(mob/user)
	..()
	playsound(src,'sound/weapons/guns/interact/ammomove.ogg',60,3)

/obj/item/ammo_magazine/ammobox/rifle/rubber
	name = "ammunition box (7.5mm rubber)"
	icon_state = "boxhrifle-rubber"
	desc = "A box of 7.5mm rifle ammunition. 180ct, deforming traumatic rounds."
	ammo_type = /obj/item/ammo_casing/rifle/rubber

/obj/item/ammo_magazine/ammobox/rifle/practice
	name = "ammunition box (7.5mm practice)"
	icon_state = "boxhrifle-practice"
	desc = "A box of 7.5mm rifle ammunition. 180ct, frangible training rounds."
	ammo_type = /obj/item/ammo_casing/rifle/practice

/obj/item/ammo_magazine/ammobox/rifle/lethal
	name = "ammunition box (7.5mm practice)"
	icon_state = "boxhrifle-lethal"
	desc = "A box of 7.5mm rifle ammunition. 180ct, hollow-point rounds."
	ammo_type = /obj/item/ammo_casing/rifle/lethal

/obj/item/ammo_magazine/ammobox/rifle_small
	name = "ammunition packet (7.5mm Rifle ball)"
	icon_state = "lrifle"
	matter = list(MATERIAL_STEEL = 10, MATERIAL_CARDBOARD = 1)
	caliber = CAL_RIFLE
	ammo_type = /obj/item/ammo_casing/rifle
	max_ammo = 30

/obj/item/ammo_magazine/ammobox/rifle_small/rubber
	name = "ammunition packet (7.5mm Rifle rubber)"
	icon_state = "rifle_r"
	ammo_type = /obj/item/ammo_casing/rifle/rubber

/obj/item/ammo_magazine/ammobox/rifle_small/practice
	name = "ammunition packet (7.5mm Rifle practice)"
	icon_state = "rifle_p"
	ammo_type = /obj/item/ammo_casing/rifle/practice

/obj/item/ammo_magazine/ammobox/rifle_small/hv
	name = "ammunition packet (7.5mm Rifle AP)"
	icon_state = "rifle_hv"
	ammo_type = /obj/item/ammo_casing/rifle/hv

/obj/item/ammo_magazine/ammobox/rifle_small/lethal
	name = "ammunition packet (7.5mm Rifle hollow-point)"
	icon_state = "rifle_l"
	ammo_type = /obj/item/ammo_casing/rifle/lethal

////snowflake 10x24////

/obj/item/ammo_magazine/ammobox/c10x24
	name = "ammunition box (10x24mm caseless)"
	icon_state = "box10x24"
	desc = "A box of 10mm caseless round, how odd."
	matter = list(MATERIAL_STEEL = 8)
	caliber = "10x24"
	ammo_type = /obj/item/ammo_casing/c10x24
	max_ammo = 200

////.50 kurtz

/obj/item/ammo_magazine/ammobox/kurtz
	name = "ammunition box (.50 kurtz)"
	icon_state = "box50"
	matter = list(MATERIAL_STEEL = 12)
	caliber = CAL_50
	ammo_type = /obj/item/ammo_casing/kurtz
	max_ammo = 24

/obj/item/ammo_magazine/ammobox/kurtz/rubber
	name = "ammunition box (.50 kurtz rubber)"
	icon_state = "box50-rubber"
	ammo_type = /obj/item/ammo_casing/kurtz/rubber

/obj/item/ammo_magazine/ammobox/kurtz/practice
	name = "ammunition box (.50 kurtz practice)"
	icon_state = "box50-practice"
	ammo_type = /obj/item/ammo_casing/kurtz/practice

/obj/item/ammo_magazine/ammobox/kurtz/hv
	name = "ammunition box (.50 kurtz high-velocity)"
	icon_state = "box50-hv"
	ammo_type = /obj/item/ammo_casing/kurtz/hv

/obj/item/ammo_magazine/ammobox/kurtz/lethal
	name = "ammunition box (.50 kurtz hollow-point)"
	desc = "A box of self-defense grade .50 Kurtz hollow-points."
	icon_state = "box50-hv"
	ammo_type = /obj/item/ammo_casing/kurtz/lethal


//// .60-06 ////

/obj/item/ammo_magazine/ammobox/antim
	name = "ammunition box (.60-06 AP)"
	icon_state = "antim"
	desc = "A box of .60-06 antimateriel rounds."
	matter = list(MATERIAL_STEEL = 30, MATERIAL_PLASTEEL = 30)
	w_class = ITEM_SIZE_BULKY
	caliber = CAL_ANTIM
	ammo_type = /obj/item/ammo_casing/antim
	max_ammo = 30

//// .408 Omni ////

/obj/item/ammo_magazine/ammobox/hrifle_small
	name = "ammunition packet (.408 ball)"
	icon_state = "hrifle"
	desc = "A box of .408 Omnirifle ammunition. 40ct, 7mm FMJ subcaliber sabots."
	matter = list(MATERIAL_STEEL = 15, MATERIAL_CARDBOARD = 1)
	caliber = CAL_HRIFLE
	ammo_type = /obj/item/ammo_casing/hrifle
	max_ammo = 40

/obj/item/ammo_magazine/ammobox/hrifle_small/rubber
	name = "ammunition box (.408 rubber)"
	icon_state = "hrifle_r"
	desc = "A box of .408 heavy rifle ammunition. 40ct, 10mm deforming traumatic rounds."
	ammo_type = /obj/item/ammo_casing/hrifle/rubber

/obj/item/ammo_magazine/ammobox/hrifle_small/practice
	name = "ammunition box (.408 practice)"
	icon_state = "hrifle_p"
	desc = "A box of .408 heavy rifle ammunition. 40ct, 7mm subcaliber frangible training rounds."
	ammo_type = /obj/item/ammo_casing/hrifle/practice

/obj/item/ammo_magazine/ammobox/hrifle_small/hv
	name = "ammunition box (.408 SLAP)"
	icon_state = "hrifle_hv"
	desc = "A box of .408 heavy rifle ammunition. 40ct, 5mm Saboted Light Armor Penetrators, spoon-tipped."
	matter = list(MATERIAL_STEEL = 10, MATERIAL_PLASTEEL = 5)
	ammo_type = /obj/item/ammo_casing/hrifle/hv

/obj/item/ammo_magazine/ammobox/hrifle_small/lethal
	name = "ammunition box (.408 hollow point)"
	icon_state = "hrifle_l"
	desc = "A box of .408 heavy rifle ammunition. 40ct, 10mm hollow-tipped full-caliber."
	ammo_type = /obj/item/ammo_casing/hrifle/lethal

////bulk .408////
/obj/item/ammo_magazine/ammobox/hrifle
	name = "ammunition box (.408 ball)"
	icon_state = "boxhrifle"
	desc = "A box of .408 heavy rifle ammunition. 120ct, 7mm FMJ subcaliber sabots."
	matter = list(MATERIAL_STEEL = 30)
	w_class = ITEM_SIZE_BULKY
	caliber = "10x50mm"
	ammo_type = /obj/item/ammo_casing/hrifle
	max_ammo = 120

/obj/item/ammo_magazine/ammobox/hrifle/pickup(mob/user)
	..()
	playsound(src,'sound/weapons/guns/interact/magmove.ogg',60,3)

/obj/item/ammo_magazine/ammobox/hrifle/dropped(mob/user)
	..()
	playsound(src,'sound/weapons/guns/interact/ammomove.ogg',60,3)

/obj/item/ammo_magazine/ammobox/hrifle/update_icon()
	if (!stored_ammo.len)
		icon_state = "boxhrifle-0"
		return
	if (stored_ammo.len == max_ammo)
		icon_state = "boxhrifle"
		return

	var/number = 0
	if (stored_ammo.len && max_ammo)
		var/percent = (stored_ammo.len / max_ammo) * 100
		number = round(percent, 25)
	icon_state = "boxhrifle-[number]"

/obj/item/ammo_magazine/ammobox/hrifle/rubber
	name = "ammunition box (.408 rubber)"
	icon_state = "boxhrifle-rubber"
	desc = "A box of .408 heavy rifle ammunition. 120ct, 10mm deforming traumatic rounds."
	ammo_type = /obj/item/ammo_casing/hrifle/rubber

/obj/item/ammo_magazine/ammobox/hrifle/rubber/update_icon()
	if (!stored_ammo.len)
		icon_state = "boxhrifle-rubber-0"
		return
	if (stored_ammo.len == max_ammo)
		icon_state = "boxhrifle-rubber"
		return

	var/number = 0
	if (stored_ammo.len && max_ammo)
		var/percent = (stored_ammo.len / max_ammo) * 100
		number = round(percent, 25)
	icon_state = "boxhrifle-rubber-[number]"

/obj/item/ammo_magazine/ammobox/hrifle/practice
	name = "ammunition box (.408 training)"
	icon_state = "boxhrifle-practice"
	desc = "A box of .408 heavy rifle ammunition. 80ct, 7mm subcaliber frangible training rounds."
	ammo_type = /obj/item/ammo_casing/hrifle/practice

obj/item/ammo_magazine/ammobox/hrifle/practice/update_icon()
	if (!stored_ammo.len)
		icon_state = "boxhrifle-practice-0"
		return
	if (stored_ammo.len == max_ammo)
		icon_state = "boxhrifle-practice"
		return

	var/number = 0
	if (stored_ammo.len && max_ammo)
		var/percent = (stored_ammo.len / max_ammo) * 100
		number = round(percent, 25)
	icon_state = "boxhrifle-practice-[number]"

/obj/item/ammo_magazine/ammobox/hrifle/hv
	name = "ammunition box (.408 SLAP)"
	icon_state = "boxhrifle-hv"
	desc = "A box of .408 heavy rifle ammunition. 120ct, 5mm Saboted Light Armor Penetrators, spoon-tipped."
	matter = list(MATERIAL_STEEL = 20, MATERIAL_PLASTEEL = 10)
	ammo_type = /obj/item/ammo_casing/hrifle/hv

obj/item/ammo_magazine/ammobox/hrifle/hv/update_icon()
	if (!stored_ammo.len)
		icon_state = "boxhrifle-hv-0"
		return
	if (stored_ammo.len == max_ammo)
		icon_state = "boxhrifle-hv"
		return

	var/number = 0
	if (stored_ammo.len && max_ammo)
		var/percent = (stored_ammo.len / max_ammo) * 100
		number = round(percent, 25)
	icon_state = "boxhrifle-hv-[number]"

/obj/item/ammo_magazine/ammobox/hrifle/lethal
	name = "ammunition box (.408 hollow-tip)"
	icon_state = "boxhrifle-lethal"
	desc = "A box of .408 heavy rifle ammunition. 120ct, 10mm hollow-tipped full-caliber."
	ammo_type = /obj/item/ammo_casing/hrifle/lethal

obj/item/ammo_magazine/ammobox/hrifle/lethal/update_icon()
	if (!stored_ammo.len)
		icon_state = "boxhrifle-lethal-0"
		return
	if (stored_ammo.len == max_ammo)
		icon_state = "boxhrifle-lethal"
		return

	var/number = 0
	if (stored_ammo.len && max_ammo)
		var/percent = (stored_ammo.len / max_ammo) * 100
		number = round(percent, 25)
	icon_state = "boxhrifle-lethal-[number]"