/obj/item/gun/projectile/revolver/lemant
	name = "\"Pilgrim\" magnum revolver"
	desc = "Once a legendary frontier weapon on old earth, hailing from its second greatest empire, this signature weapon holds nine .40 rounds and one single action underslung 20mm shell. \
	This particular model is crafted by the New Testament, having good utility and plenty of shots, but is painstaking to reload since it requires removing each spent shell individually."
	icon = 'icons/obj/guns/projectile/lemant.dmi'
	icon_state = "lemant"
	item_state = "lemant"
	caliber = CAL_MAGNUM
	drawChargeMeter = FALSE
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 3)
	max_shells = 9
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 8)
	price_tag = 450
	damage_multiplier = 1.2
	penetration_multiplier = 1.1
	recoil_buildup = 4
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_REVOLVER)

	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		list(mode_name="fire 20mm shell", mode_desc="Shoot the underbarrel shotgun shell",  burst=null, fire_delay=null, move_delay=null,  icon="grenade", use_launcher=1)
		)

	var/obj/item/gun/projectile/underslung_shotgun/shotgun

/obj/item/gun/projectile/revolver/lemant/claw
	name = "\"Pilgrim Claw\" magnum revolver"
	desc = "Once a legendary frontier weapon on old earth, hailing from its second greatest empire, this signature weapon holds nine .40 rounds and one single action underslung 20mm shell. \
	This particular model is crafted by the New Testament, having good utility and plenty of shots, but is painstaking to reload since it requires removing each spent shell individually. \
	Someone added a spike to the grip, allowing it to function as a rather deadly knife when pistol whipping, handy given how long it takes to reload."
	icon_state = "lemant_claw"
	item_state = "lemant_claw"
	force = 20 // Up from 10, essentially a knife by harder to mod. -Kaz
	recoil_buildup = 3 //Addded weight, better control. -Kaz
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_REVOLVER, GUN_BAYONET)

//Defined here, may be used elsewhere but for now its only used here. -Kaz
/obj/item/gun/projectile/underslung_shotgun
	name = "underslung shotgun"
	desc = "Not much more than a tube and a firing mechanism, this shotgun is designed to be fitted to another gun."
	fire_sound = 'sound/weapons/guns/fire/shotgunp_fire.ogg'
	bulletinsert_sound = 'sound/weapons/guns/interact/shotgun_insert.ogg'
	w_class = ITEM_SIZE_NORMAL
	matter = null
	force = 5
	max_shells = 1
	safety = FALSE
	twohanded = FALSE
	caliber = CAL_SHOTGUN
	handle_casings = EJECT_CASINGS

/obj/item/gun/projectile/underslung_shotgun/attack_self()
	return

/obj/item/gun/projectile/revolver/lemant/Initialize()
	. = ..()
	shotgun = new(src)

/obj/item/gun/projectile/revolver/lemant/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/ammo_casing/shotgun)))
		shotgun.load_ammo(I, user)
	else
		..()

/obj/item/gun/projectile/revolver/lemant/attack_hand(mob/user)
	var/datum/firemode/cur_mode = firemodes[sel_mode]

	if(user.get_inactive_hand() == src && cur_mode.settings["use_launcher"])
		shotgun.unload_ammo(user)
	else
		..()

/obj/item/gun/projectile/revolver/lemant/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	var/datum/firemode/cur_mode = firemodes[sel_mode]

	if(cur_mode.settings["use_launcher"])
		shotgun.Fire(target, user, params, pointblank, reflex)
		if(!shotgun.chambered)
			switch_firemodes() //switch back automatically
	else
		..()

/obj/item/gun/projectile/revolver/lemant/examine(mob/user)
	..()
	if(shotgun.loaded.len)
		to_chat(user, "\The [shotgun] has \a [shotgun.chambered] loaded.")
	else
		to_chat(user, "\The [shotgun] is empty.")

/obj/item/gun/projectile/revolver/deacon
	name = "\"Deacon\" heavy revolver"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these weapons are known to vanish and reappear when left alone. \
	Some pilgrims find what they are looking for..."
	icon = 'icons/obj/guns/projectile/lemant_blue.dmi'
	icon_state = "lemant_blue"
	item_state = "lemant_blue"
	caliber = CAL_50
	drawChargeMeter = FALSE
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 3)
	max_shells = 9
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 8)
	price_tag = 450
	damage_multiplier = 1.2
	penetration_multiplier = 1.1
	recoil_buildup = 4
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_REVOLVER, GUN_CALIBRE_50)
	var/obj/item/gun/projectile/underslung/launcher
	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		list(mode_name="fire grenades", mode_desc="Shoot the underbarrel grenade shell",  burst=null, fire_delay=null, move_delay=null,  icon="grenade", use_launcher=1)
		)

/obj/item/gun/projectile/revolver/deacon/Initialize()
	. = ..()
	launcher = new(src)

/obj/item/gun/projectile/revolver/deacon/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/ammo_casing/grenade)))
		launcher.load_ammo(I, user)
	else
		..()

/obj/item/gun/projectile/revolver/deacon/attack_hand(mob/user)
	var/datum/firemode/cur_mode = firemodes[sel_mode]

	if(user.get_inactive_hand() == src && cur_mode.settings["use_launcher"])
		launcher.unload_ammo(user)
	else
		..()

/obj/item/gun/projectile/revolver/deacon/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	var/datum/firemode/cur_mode = firemodes[sel_mode]

	if(cur_mode.settings["use_launcher"])
		launcher.Fire(target, user, params, pointblank, reflex)
		if(!launcher.chambered)
			switch_firemodes() //switch back automatically
	else
		..()

/obj/item/gun/projectile/revolver/deacon/examine(mob/user)
	..()
	if(launcher.loaded.len)
		to_chat(user, "\The [launcher] has \a [launcher.chambered] loaded.")
	else
		to_chat(user, "\The [launcher] is empty.")