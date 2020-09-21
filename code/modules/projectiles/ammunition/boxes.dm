/*This code for boxes with ammo, you cant use them as magazines, but should be able to fill magazines with them.*/
/obj/item/ammo_magazine/ammobox	//Should not be used by its own
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

/obj/item/ammo_magazine/ammobox/pistol_35
	name = "ammunition packet (.35 Auto)"
	icon_state = "pistol"
	matter = list(MATERIAL_STEEL = 6, MATERIAL_CARDBOARD = 1)
	caliber = CAL_PISTOL
	ammo_type = /obj/item/ammo_casing/pistol_35
	max_ammo = 30

/obj/item/ammo_magazine/ammobox/pistol_35/practice
	name = "ammunition packet (.35 Auto practice)"
	icon_state = "pistol_p"
	ammo_type = /obj/item/ammo_casing/pistol_35/practice

/obj/item/ammo_magazine/ammobox/pistol_35/hv
	name = "ammunition packet (.35 Auto high-velocity)"
	icon_state = "pistol_hv"
	ammo_type = /obj/item/ammo_casing/pistol_35/hv

/obj/item/ammo_magazine/ammobox/pistol_35/rubber
	name = "ammunition packet (.35 Auto rubber)"
	icon_state = "pistol_r"
	ammo_type = /obj/item/ammo_casing/pistol_35/rubber

/obj/item/ammo_magazine/ammobox/pistol_35/lethal
	name = "ammunition packet (.35 Auto hollow-point)"
	desc = "A box of self-defense grade .35 auto hollow-points."
	icon_state = "pistol_l"
	ammo_type = /obj/item/ammo_casing/pistol_35/lethal

//// . 40 ////

/obj/item/ammo_magazine/ammobox/magnum_40
	name = "ammunition packet (.40 Magnum)"
	icon_state = "magnum"
	matter = list(MATERIAL_STEEL = 9, MATERIAL_CARDBOARD = 1)
	caliber = ".40"
	caliber = CAL_MAGNUM
	ammo_type = /obj/item/ammo_casing/magnum_40
	max_ammo = 30

/obj/item/ammo_magazine/ammobox/magnum_40/practice
	name = "ammunition packet (.40 Magnum practice)"
	icon_state = "magnum_p"
	ammo_type = /obj/item/ammo_casing/magnum_40/practice

/obj/item/ammo_magazine/ammobox/magnum_40/hv
	name = "ammunition packet (.40 Magnum high-velocity)"
	icon_state = "magnum_hv"
	ammo_type = /obj/item/ammo_casing/magnum_40/hv

/obj/item/ammo_magazine/ammobox/magnum_40/rubber
	name = "ammunition packet (.40 Magnum rubber)"
	icon_state = "magnum_r"
	ammo_type = /obj/item/ammo_casing/magnum_40/rubber

/obj/item/ammo_magazine/ammobox/magnum_40/lethal
	name = "ammunition packet (.40 Magnum hollow-point)"
	desc = "A box of self-defense grade .40 Auto-Mag hollow-points."
	icon_state = "magnum_l"
	ammo_type = /obj/item/ammo_casing/magnum_40/lethal

//// .257 carbine ////

/obj/item/ammo_magazine/ammobox/light_rifle_257
	name = "ammunition box (.257 Carbine FMJ)"
	icon_state = "box_lrifle"
	matter = list(MATERIAL_STEEL = 30)
	w_class = ITEM_SIZE_BULKY
	mag_type = MAGAZINE
	mag_well = MAG_WELL_BOX
	caliber = CAL_LRIFLE
	ammo_type = /obj/item/ammo_casing/light_rifle_257
	max_ammo = 200

/obj/item/ammo_magazine/ammobox/light_rifle_257/pickup(mob/user)
	..()
	playsound(src,'sound/weapons/guns/interact/magmove.ogg',60,3)

/obj/item/ammo_magazine/ammobox/light_rifle_257/dropped(mob/user)
	..()
	playsound(src,'sound/weapons/guns/interact/ammomove.ogg',60,3)

/obj/item/ammo_magazine/ammobox/light_rifle_257/rubber
	name = "ammunition box (.257 Carbine rubber)"
	icon_state = "box_lrifle_r"
	ammo_type = /obj/item/ammo_casing/light_rifle_257/rubber

/obj/item/ammo_magazine/ammobox/light_rifle_257/practice
	name = "ammunition box (.257 Carbine practice)"
	icon_state = "box_lrifle_p"
	ammo_type = /obj/item/ammo_casing/light_rifle_257/practice

/obj/item/ammo_magazine/ammobox/light_rifle_257_small
	name = "ammunition box (.257 Carbine FMJ)"
	icon_state = "lrifle"
	matter = list(MATERIAL_STEEL = 15)
	caliber = CAL_LRIFLE
	ammo_type = /obj/item/ammo_casing/light_rifle_257
	max_ammo = 60

/obj/item/ammo_magazine/ammobox/light_rifle_257_small/practice
	name = "ammunition packet (.257 Carbine practice)"
	icon_state = "lrifle_p"
	ammo_type = /obj/item/ammo_casing/light_rifle_257/practice

/obj/item/ammo_magazine/ammobox/light_rifle_257_small/hv
	name = "ammunition packet (.257 Carbine high-velocity)"
	icon_state = "lrifle_hv"
	ammo_type = /obj/item/ammo_casing/light_rifle_257/hv

/obj/item/ammo_magazine/ammobox/light_rifle_257_small/rubber
	name = "ammunition packet (.257 Carbine rubber)"
	icon_state = "lrifle_r"
	ammo_type = /obj/item/ammo_casing/light_rifle_257/rubber

/obj/item/ammo_magazine/ammobox/light_rifle_257_small/lethal
	name = "ammunition packet (.257 Carbine hollow-point)"
	icon_state = "lrifle_l"
	ammo_type = /obj/item/ammo_casing/light_rifle_257/lethal


////7.5 Rifle////

/obj/item/ammo_magazine/ammobox/rifle_75
	name = "ammunition box (7.5mm Rifle ball)"
	icon_state = "boxhrifle"
	desc = "A box of 7.5mm rifle ammunition. 180ct, Full Metal Jacket rounds."
	matter = list(MATERIAL_STEEL = 30)
	w_class = ITEM_SIZE_BULKY
	caliber = CAL_RIFLE
	mag_type = MAGAZINE
	mag_well = MAG_WELL_BOX
	ammo_type = /obj/item/ammo_casing/rifle_75
	mag_type = SPEEDLOADER | MAGAZINE
	max_ammo = 180

/obj/item/ammo_magazine/ammobox/rifle_75/pickup(mob/user)
	..()
	playsound(src,'sound/weapons/guns/interact/magmove.ogg',60,3)

/obj/item/ammo_magazine/ammobox/rifle_75/dropped(mob/user)
	..()
	playsound(src,'sound/weapons/guns/interact/ammomove.ogg',60,3)

/obj/item/ammo_magazine/ammobox/rifle_75/rubber
	name = "ammunition box (7.5mm rubber)"
	icon_state = "boxhrifle-rubber"
	desc = "A box of 7.5mm rifle ammunition. 180ct, deforming traumatic rounds."
	ammo_type = /obj/item/ammo_casing/rifle_75/rubber

/obj/item/ammo_magazine/ammobox/rifle_75/practice
	name = "ammunition box (7.5mm practice)"
	icon_state = "boxhrifle-practice"
	desc = "A box of 7.5mm rifle ammunition. 180ct, frangible training rounds."
	ammo_type = /obj/item/ammo_casing/rifle_75/practice

/obj/item/ammo_magazine/ammobox/rifle_75/lethal
	name = "ammunition box (7.5mm Hollow Point)"
	icon_state = "boxhrifle-lethal"
	desc = "A box of 7.5mm rifle ammunition. 180ct, hollow-point rounds."
	ammo_type = /obj/item/ammo_casing/rifle_75/lethal

/obj/item/ammo_magazine/ammobox/rifle_75_small
	name = "ammunition packet (7.5mm Rifle ball)"
	icon_state = "lrifle"
	matter = list(MATERIAL_STEEL = 10, MATERIAL_CARDBOARD = 1)
	caliber = CAL_RIFLE
	ammo_type = /obj/item/ammo_casing/rifle_75
	max_ammo = 30

/obj/item/ammo_magazine/ammobox/rifle_75_small/rubber
	name = "ammunition packet (7.5mm Rifle rubber)"
	icon_state = "rifle_r"
	ammo_type = /obj/item/ammo_casing/rifle_75/rubber

/obj/item/ammo_magazine/ammobox/rifle_75_small/practice
	name = "ammunition packet (7.5mm Rifle practice)"
	icon_state = "rifle_p"
	ammo_type = /obj/item/ammo_casing/rifle_75/practice

/obj/item/ammo_magazine/ammobox/rifle_75_small/hv
	name = "ammunition packet (7.5mm Rifle HV)"
	icon_state = "rifle_hv"
	ammo_type = /obj/item/ammo_casing/rifle_75/hv

/obj/item/ammo_magazine/ammobox/rifle_75_small/lethal
	name = "ammunition packet (7.5mm Rifle hollow-point)"
	icon_state = "rifle_l"
	ammo_type = /obj/item/ammo_casing/rifle_75/lethal

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

/obj/item/ammo_magazine/ammobox/kurtz_50
	name = "ammunition box (.50 kurtz)"
	icon_state = "box50"
	matter = list(MATERIAL_STEEL = 12)
	caliber = CAL_50
	ammo_type = /obj/item/ammo_casing/kurtz_50
	max_ammo = 24

/obj/item/ammo_magazine/ammobox/kurtz_50/rubber
	name = "ammunition box (.50 kurtz rubber)"
	icon_state = "box50-rubber"
	ammo_type = /obj/item/ammo_casing/kurtz_50/rubber

/obj/item/ammo_magazine/ammobox/kurtz_50/practice
	name = "ammunition box (.50 kurtz practice)"
	icon_state = "box50-practice"
	ammo_type = /obj/item/ammo_casing/kurtz_50/practice

/obj/item/ammo_magazine/ammobox/kurtz_50/hv
	name = "ammunition box (.50 kurtz high-velocity)"
	icon_state = "box50-hv"
	ammo_type = /obj/item/ammo_casing/kurtz_50/hv

/obj/item/ammo_magazine/ammobox/kurtz_50/lethal
	name = "ammunition box (.50 kurtz hollow-point)"
	desc = "A box of self-defense grade .50 Kurtz hollow-points."
	icon_state = "box50-hv"
	ammo_type = /obj/item/ammo_casing/kurtz_50/lethal


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

/obj/item/ammo_magazine/ammobox/heavy_rifle_408_small
	name = "ammunition packet (.408 ball)"
	icon_state = "hrifle"
	desc = "A box of .408 Omnirifle ammunition. 40ct, 7mm FMJ subcaliber sabots."
	matter = list(MATERIAL_STEEL = 15, MATERIAL_CARDBOARD = 1)
	caliber = CAL_HRIFLE
	ammo_type = /obj/item/ammo_casing/heavy_rifle_408
	max_ammo = 40

/obj/item/ammo_magazine/ammobox/heavy_rifle_408_small/rubber
	name = "ammunition box (.408 rubber)"
	icon_state = "hrifle_r"
	desc = "A box of .408 heavy rifle ammunition. 40ct, 7mm deforming traumatic rounds."
	ammo_type = /obj/item/ammo_casing/heavy_rifle_408/rubber

/obj/item/ammo_magazine/ammobox/heavy_rifle_408_small/practice
	name = "ammunition box (.408 practice)"
	icon_state = "hrifle_p"
	desc = "A box of .408 heavy rifle ammunition. 40ct, 7mm subcaliber frangible training rounds."
	ammo_type = /obj/item/ammo_casing/heavy_rifle_408/practice

/obj/item/ammo_magazine/ammobox/heavy_rifle_408_small/hv
	name = "ammunition box (.408 SLAP)"
	icon_state = "hrifle_hv"
	desc = "A box of .408 heavy rifle ammunition. 40ct, 7mm Saboted Light Armor Penetrators, spoon-tipped."
	matter = list(MATERIAL_STEEL = 10, MATERIAL_PLASTEEL = 5)
	ammo_type = /obj/item/ammo_casing/heavy_rifle_408/hv

/obj/item/ammo_magazine/ammobox/heavy_rifle_408_small/lethal
	name = "ammunition box (.408 hollow point)"
	icon_state = "hrifle_l"
	desc = "A box of .408 heavy rifle ammunition. 40ct, 7mm hollow-tipped full-caliber."
	ammo_type = /obj/item/ammo_casing/heavy_rifle_408/lethal

////bulk .408////
/obj/item/ammo_magazine/ammobox/heavy_rifle_408
	name = "ammunition box (.408 ball)"
	icon_state = "boxhrifle"
	desc = "A box of .408 heavy rifle ammunition. 120ct, 7mm FMJ subcaliber sabots."
	matter = list(MATERIAL_STEEL = 30)
	w_class = ITEM_SIZE_BULKY
	mag_type = MAGAZINE
	mag_well = MAG_WELL_BOX
	caliber = CAL_HRIFLE
	ammo_type = /obj/item/ammo_casing/heavy_rifle_408
	max_ammo = 120

/obj/item/ammo_magazine/ammobox/heavy_rifle_408/pickup(mob/user)
	..()
	playsound(src,'sound/weapons/guns/interact/magmove.ogg',60,3)

/obj/item/ammo_magazine/ammobox/heavy_rifle_408/dropped(mob/user)
	..()
	playsound(src,'sound/weapons/guns/interact/ammomove.ogg',60,3)

/obj/item/ammo_magazine/ammobox/heavy_rifle_408/update_icon()
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

/obj/item/ammo_magazine/ammobox/heavy_rifle_408/rubber
	name = "ammunition box (.408 rubber)"
	icon_state = "boxhrifle-rubber"
	desc = "A box of .408 heavy rifle ammunition. 120ct, 7mm deforming traumatic rounds."
	ammo_type = /obj/item/ammo_casing/heavy_rifle_408/rubber

/obj/item/ammo_magazine/ammobox/heavy_rifle_408/rubber/update_icon()
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

/obj/item/ammo_magazine/ammobox/heavy_rifle_408/practice
	name = "ammunition box (.408 practice)"
	icon_state = "boxhrifle-practice"
	desc = "A box of .408 heavy rifle ammunition. 80ct, 7mm subcaliber frangible training rounds."
	ammo_type = /obj/item/ammo_casing/heavy_rifle_408/practice

/obj/item/ammo_magazine/ammobox/heavy_rifle_408/practice/update_icon()
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

/obj/item/ammo_magazine/ammobox/heavy_rifle_408/hv
	name = "ammunition box (.408 SLAP)"
	icon_state = "boxhrifle-hv"
	desc = "A box of .408 heavy rifle ammunition. 120ct, 7mm Saboted Light Armor Penetrators, spoon-tipped."
	matter = list(MATERIAL_STEEL = 20, MATERIAL_PLASTEEL = 10)
	ammo_type = /obj/item/ammo_casing/heavy_rifle_408/hv

/obj/item/ammo_magazine/ammobox/heavy_rifle_408/hv/update_icon()
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

/obj/item/ammo_magazine/ammobox/heavy_rifle_408/lethal
	name = "ammunition box (.408 hollow-tip)"
	icon_state = "boxhrifle-lethal"
	desc = "A box of .408 heavy rifle ammunition. 120ct, 7mm hollow-tipped full-caliber."
	ammo_type = /obj/item/ammo_casing/heavy_rifle_408/lethal

/obj/item/ammo_magazine/ammobox/heavy_rifle_408/lethal/update_icon()
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