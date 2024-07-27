/obj/item/gun/projectile/shotgun/pump/swat
	name = "\"SWAT\" combat shotgun"
	desc = "The prototype of a Seinemetall Defense GmbH original idea of the \"State\" reinvented to be the be all end all law enforcement shotgun. \
			The \"SWAT\" main appeal other then pure stopping power is the built in pistol to shoot three round for clearing down range targets trying to run away. \
			Can hold up to 7+1 20mm shells in its tube magazine, and 9 10x24 rounds in its underslung pistol."
	icon = 'icons/obj/guns/projectile/swat.dmi' //Sprites by Toriate#0657 many loves and thanks to this amazing spriter!
	icon_state = "swat"
	item_state = "swat"
	w_class = ITEM_SIZE_BULKY
	caliber = CAL_SHOTGUN
	fire_sound = 'sound/weapons/guns/fire/shotgun.ogg'
	origin_tech = list(TECH_COMBAT = 7, TECH_MATERIAL = 4)
	max_shells = 7
	ammo_type = /obj/item/ammo_casing/shotgun
	matter = list(MATERIAL_PLASTEEL = 25, MATERIAL_PLASTIC = 12)
	price_tag = 1500
	damage_multiplier = 1.3
	penetration_multiplier = 1.3
	init_recoil = RIFLE_RECOIL(0.6)
	saw_off = FALSE //No
	folding_stock = TRUE //we can fold are stocks
	gun_parts = null //no deconstructing

	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		list(mode_name="fire 10x24 pistol", mode_desc="Shoot the built in 10x24 pistol",  burst=1, fire_delay=null, move_delay=null,  icon="grenade", use_launcher=1)
		)
	serial_type = "SD GmbH"

	var/obj/item/gun/projectile/automatic/underslung/pistol/pistol

/obj/item/gun/projectile/shotgun/pump/swat/Initialize()
	. = ..()
	pistol = new(src)

/obj/item/gun/projectile/shotgun/pump/swat/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	var/datum/firemode/cur_mode = firemodes[sel_mode]

	if(cur_mode.settings["use_launcher"])
		//We trigger like this three times, and then if nothing is inside the pistol swap back to are normal shotgun mode
		pistol.Fire(target, user, params, pointblank, reflex)
		if(!pistol.contents)
			switch_firemodes() //switch back automatically
	else
		..()


/obj/item/gun/projectile/shotgun/pump/swat/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/ammo_casing/c10x24)))
		pistol.load_ammo(I, user)
	else
		..()

/obj/item/gun/projectile/shotgun/pump/swat/update_icon()
	..()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if(!folded)
		iconstring += "-stock"

	if(wielded)
		itemstring += "_doble"


	icon_state = iconstring
	set_item_state(itemstring)

//Defined here, may be used elsewhere but for now its only used here. -Trilby
/obj/item/gun/projectile/automatic/underslung/pistol
	name = "built in pistol"
	desc = "Not much more than a tube and a firing mechanism, this pistol is designed to be fitted to another gun."
	fire_sound = 'sound/weapons/guns/fire/m41_shoot.ogg'
	bulletinsert_sound = 'sound/weapons/guns/interact/bullet_insert.ogg' // It's not a shotgun!
	w_class = ITEM_SIZE_NORMAL
	matter = null
	damage_multiplier = 1.4
	penetration_multiplier = 1.2
	force = 5
	max_shells = 9
	safety = FALSE
	twohanded = FALSE
	load_method = SINGLE_CASING
	ammo_type = /obj/item/ammo_casing/c10x24
	caliber = "10x24"
	handle_casings = EJECT_CASINGS
	init_firemodes = list(
		BURST_3_ROUND
		)
	serial_type = "SD GmbH"
