/obj/item/gun/projectile/automatic/ak47
	name = "Excelsior \"Kalashnikov\" rifle"
	desc = "\"We stand for organized terror - this should be frankly admitted. Terror is an absolute necessity during times of revolution.\"\
		 A copy of the Kalashnikov pattern, shortened into a mid-length rifle and chambered in 7.62mm. This is an abysmal, printed copy."
	icon = 'icons/obj/guns/projectile/ak.dmi'
	icon_state = "AK"
	item_state = "AK"
	item_suffix = ""
	excelsior = TRUE
	w_class = ITEM_SIZE_BULKY
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_RIFLE
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1, TECH_ILLEGAL = 4)
	slot_flags = SLOT_BACK
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_RIFLE
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 10)
	price_tag = 1000
	fire_sound = 'sound/weapons/guns/fire/ltrifle_fire.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/ltrifle_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/ltrifle_cock.ogg'
	damage_multiplier = 1.2 //the uncheap
	init_recoil = RIFLE_RECOIL(0.8)
	gun_tags = list(GUN_PROJECTILE, GUN_SCOPE, GUN_MAGWELL)

	init_firemodes = list(
		FULL_AUTO_300,
		SEMI_AUTO_NODELAY
		)
	serial_type = "EXC"

/obj/item/gun/projectile/automatic/ak47/NM_colony
	name = "polymer \"Kalashnikov\" rifle"
	desc = " A copy of the Kalashnikov pattern, shortened into a mid-length rifle and chambered in 7.62mm. This is an abysmal, printed copy."
	excelsior = FALSE
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1)
	price_tag = 800
	serial_type = "NM"

/obj/item/gun/projectile/automatic/ak47/update_icon()
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

/obj/item/gun/projectile/automatic/ak47/Initialize()
	. = ..()
	update_icon()

/obj/item/gun/projectile/automatic/ak47/saiga
	name = "Excelsior \"Saiga 12\" shotgun"
	desc = "\"Let the ruling classes tremble at a Communistic revolution. The proletarians have nothing to lose but their chains. They have a world to win..\"\
		 A bulked up and modified version of the kalashnikov made to fire 20mm shotgun slugs, similar to the sol federation SBAW design. Uses 20mm in SBAW magazines."
	icon = 'icons/obj/guns/projectile/saiga12.dmi'
	icon_state = "saiga"
	item_state = "saiga"
	fire_sound = 'sound/weapons/guns/fire/shotgun.ogg'
	excelsior = TRUE
	caliber = CAL_SHOTGUN
	origin_tech = list(TECH_COMBAT = 9, TECH_MATERIAL = 1, TECH_ILLEGAL = 4)
	mag_well = MAG_WELL_RIFLE //Have you ever seen saiga with drum magazine because I haven't
	init_recoil = RIFLE_RECOIL(1.3)
	serial_type = "EXC"

/obj/item/gun/projectile/automatic/ak47/saiga/NM_colony
	name = "\"Saigini 12\" shotgun"
	desc = "A bulked up and modified version of the kalashnikov made to fire 20mm shotgun slugs, similar to the sol federation SBAW design. Uses 20mm in SBAW magazines."
	penetration_multiplier = 0.9 //Non-Excelsior varient, it's powerful as is. Pug on crack.
	excelsior = FALSE
	origin_tech = list(TECH_COMBAT = 9, TECH_MATERIAL = 1)
	price_tag = 800
	serial_type = "NM"

/obj/item/gun/projectile/automatic/ak47/sa
	name = "\"Kalashnikov\" rifle"
	desc = "Weapon of the oppressed, oppressors, and extremists of all flavours. \
		 A copy of the AKM pattern, shortened into a mid-length rifle and chambered in 7.62mm. The left arm of the unfree world."
	icon = 'icons/obj/guns/projectile/ak_wood.dmi'
	icon_state = "AK"
	item_state = "AK"
	excelsior = FALSE
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_WOOD = 10)
	price_tag = 900
	init_recoil = RIFLE_RECOIL(0.9)
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	saw_off = TRUE
	sawn = /obj/item/gun/projectile/automatic/ak47/sawn
	serial_type = "SA"

/obj/item/gun/projectile/automatic/ak47/sawn
	name = "sawn-off \"Kalashnikov\" rifle"
	desc = "Weapon of the oppressed, oppressors, and extremists of all flavours. \
	A copy of the AKM pattern chambered in 7.62mm and crudely sawed down to a shadow of its former self. Rifle was fine. Was."
	icon = 'icons/obj/guns/projectile/sawnoff/ak.dmi'
	icon_state = "AK"
	item_state = "AK"
	excelsior = FALSE
	w_class = ITEM_SIZE_NORMAL
	force = WEAPON_FORCE_NORMAL
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 5)
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	price_tag = 800
	init_recoil = RIFLE_RECOIL(1)
	damage_multiplier = 1
	saw_off = FALSE
	serial_type = "SA"
	wield_delay = 0.8 SECOND
	wield_delay_factor = 0.2 // 20 vig for insta wield

/obj/item/gun/projectile/automatic/ak47/sa/tac
	name = "Breacher \"Kalashnikov\" rifle"
	desc = "The breacher, or the 'tactical', varient of the AKM pattern Kalash is rather similar to its basic counterparts. \
	Sporting a polymer frame this Kalash also comes kitted with a internally loaded shotgun attachment to its underbarrel. \
	Comfortable to shoot, versetile and able to clear a room with ease."
	icon = 'icons/obj/guns/projectile/ak_tact.dmi'
	icon_state = "AK"
	item_state = "AK"
	price_tag = 1250
	init_recoil = RIFLE_RECOIL(0.8)
	saw_off = FALSE
	serial_type = "SA"

	var/obj/item/gun/projectile/automatic/underslung/shotgun_3/shotgun
	init_firemodes = list(
		FULL_AUTO_300,
		SEMI_AUTO_NODELAY,
		list(mode_name="fire shotgun", mode_desc="Shoot the underbarrel shotgun",  burst=null, fire_delay=null, move_delay=null,  icon="grenade", use_launcher=1)
		)

/obj/item/gun/projectile/automatic/ak47/sa/tac/Initialize()
	. = ..()
	shotgun = new(src)

/obj/item/gun/projectile/automatic/ak47/sa/tac/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	var/datum/firemode/cur_mode = firemodes[sel_mode]

	if(cur_mode.settings["use_launcher"])
		//We trigger like this three times, and then if nothing is inside the pistol swap back to are normal shotgun mode
		shotgun.Fire(target, user, params, pointblank, reflex)
		if(!shotgun.contents)
			switch_firemodes() //switch back automatically
	else
		..()

/obj/item/gun/projectile/automatic/ak47/sa/tac/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/ammo_casing/shotgun)))
		shotgun.load_ammo(I, user)
	else
		..()

/obj/item/gun/projectile/automatic/underslung/shotgun_3
	name = "built in shotgun"
	desc = "Not much more than a tube and a firing mechanism, this shotgun is designed to be fitted to another gun."
	fire_sound = 'sound/weapons/guns/fire/shotgun.ogg'
	bulletinsert_sound = 'sound/weapons/guns/interact/shotgun_insert.ogg'
	w_class = ITEM_SIZE_NORMAL
	matter = null
	force = 5
	max_shells = 3
	init_recoil = RIFLE_RECOIL(1.2)
	safety = FALSE
	twohanded = FALSE
	load_method = SINGLE_CASING
	ammo_type = /obj/item/ammo_casing/shotgun/beanbag
	caliber = CAL_SHOTGUN
	handle_casings = EJECT_CASINGS
	serial_type = "SA"
	init_firemodes = list(
		list(mode_name = "semiauto",  mode_desc = "Fire as fast as you can pull the trigger", burst=1, fire_delay=2.5, move_delay=null, icon="semi"),
		)

/obj/item/gun/projectile/automatic/ak47/makeshift
	name = "Homemade \"Kalashnikov\" rifle"
	desc = "Weapon of the oppressed, oppressors, and extremists of all flavours. \
			This is a copy of an ancient semi-automatic rifle chambered for 7.62mm. If it won't fire, percussive maintenance should get it working again. \
			It is known for its easy maintenance, and low price. This gun is not in active military service anymore, but has become ubiquitous among criminals and insurgents. \
			This crude copy shows just how forgiving the design can be."
	icon = 'icons/obj/guns/projectile/ak_homemade.dmi'
	w_class = ITEM_SIZE_HUGE
	init_recoil = RIFLE_RECOIL(0.7)
	mag_well = MAG_WELL_RIFLE
	excelsior = FALSE

	origin_tech = list(TECH_COMBAT = 2)	//bad copies don't give good science
	matter = list(MATERIAL_STEEL = 20, MATERIAL_WOOD = 10)
	damage_multiplier = 1.1
	penetration_multiplier = 0.8

	init_firemodes = list(
		SEMI_AUTO_NODELAY	//too poorly made for burst or automatic
	)
	matter = list(MATERIAL_STEEL = 22, MATERIAL_PLASTEEL = 18, MATERIAL_PLASTIC = 5, MATERIAL_WOOD = 12)
	price_tag = 500
	serial_type = "INDEX"
	serial_shown = FALSE
