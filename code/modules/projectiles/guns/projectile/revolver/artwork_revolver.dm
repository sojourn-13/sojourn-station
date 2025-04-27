/obj/item/gun/projectile/revolver/artwork_revolver
	name = "Weird Revolver"
	desc = "This is an artistically-made revolver with a limited use chameleon projector."
	icon = 'icons/obj/guns/projectile/artwork_revolver.dmi'
	icon_state = "artwork_revolver_1"
	item_state = "artwork_revolver_1"
	drawChargeMeter = FALSE
	max_shells = 7
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 4) //Arbitrary values
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_WOOD = 6)
	price_tag = 1000
	damage_multiplier = 1.4 //From havelock.dm
	penetration_multiplier = 1.4
	max_upgrades = 0 //Upgrading this revolver destorys its stats
	serial_type = "INDEX" //We live in a suscity
	serial_shown = FALSE
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_REVOLVER)
	init_recoil = HANDGUN_RECOIL(1.2)
	gun_parts = null

	var/fake_name

/obj/item/gun/projectile/revolver/artwork_revolver/refresh_upgrades()
	force = initial(force)
	name = fake_name
	if(wielded)
		if(force_wielded_multiplier)
			force = force * force_wielded_multiplier
		else //This will give items wielded 30% more damage. This is balanced by the fact you cannot use your other hand.
			force = (force * 1.3) //Items that do 0 damage will still do 0 damage though.
		name = "[fake_name] (Wielded)"
	return //Same reason why we dont have max upgrades, refreshing in this case is always bad

/obj/item/gun/projectile/revolver/artwork_revolver/proc/ensure_updates()
	if(caliber == CAL_PISTOL)
		gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_REVOLVER, GUN_CALIBRE_35)// if we get .35 then we should take .35 upgrades

	if(caliber == CAL_PISTOL)
		gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_REVOLVER, GUN_CALIBRE_50)// if we get .50 Kurz then we should take .50 Kurz upgrades


	if(recoil)
		recoil = recoil.modifyAllRatings(1+rand(-2,2)/10)
	else
		init_recoil = HANDGUN_RECOIL(1.2)
		recoil = getRecoil(arglist(init_recoil))
		recoil = recoil.modifyAllRatings(1+rand(-2,2)/10)
	name = fake_name

/obj/item/gun/projectile/revolver/artwork_revolver/Initialize()
	fake_name = get_weapon_name(capitalize = TRUE)

	var/random_icon = rand(1,5)
	icon_state = "artwork_revolver_[random_icon]"
	item_state = "artwork_revolver_[random_icon]"
	. = ..()

/obj/item/gun/projectile/revolver/artwork_revolver/get_item_cost(export)
	. = ..()
	. += rand(-1000,2500)

/obj/item/gun/projectile/revolver/artwork_revolver/spin_cylinder()
	set name = "Spin revolver"
	set desc = "Fun when you're bored out of your skull. Or if you want to change your revolvers appearance."
	set category = "Object"

	chamber_offset = 0
	visible_message(SPAN_WARNING("\The [usr] spins \the [src]!"), \
	SPAN_NOTICE("You hear something metallic spin and click."))
	playsound(src.loc, 'sound/weapons/revolver_spin.ogg', 100, 1)
	loaded = shuffle(loaded)
	if(rand(1,max_shells) > loaded.len)
		chamber_offset = rand(0,max_shells - loaded.len)
	icon_state = "[icon_state]_spin"
	spawn(10)
		var/random_icon = rand(1,5)
		icon_state = "artwork_revolver_[random_icon]"
