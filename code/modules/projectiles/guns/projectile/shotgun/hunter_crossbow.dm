/obj/item/weapon/gun/projectile/shotgun/pump/hunter_crossbow
	name = "bolt lance"
	desc = "A modified crossbow powered by an internal battery device that rapidly winds up a hydraulic winch to deliver a devastating, superheated bolt shot. \
	Hand-crafted by the local Hunting Lodge, it uses a design commonly found on Onkarth, the homeworld of the Sablekyne."
	icon = 'icons/obj/guns/projectile/hunter_crossbow.dmi'
	icon_state = "hunter_crossbow"
	item_state = "hunter_crossbow"
	fire_sound = 'sound/weapons/guns/fire/hydra_crossbow_fire.ogg' // TODO: Decent THWOK noise.
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	max_shells = 7
	caliber = CAL_CROSSBOW
	damage_multiplier = 1
	ammo_type = /obj/item/ammo_casing/crossbow_bolts
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 6)
	price_tag = 750
	recoil_buildup = 1
	one_hand_penalty = 14
	saw_off = FALSE
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_SCOPE)

/obj/item/weapon/gun/projectile/shotgun/pump/hunter_crossbow/pump(mob/M as mob)
	//var/turf/newloc = get_turf(src)
	playsound(M, 'sound/weapons/guns/interact/hydra_crossbow_load.ogg', 60, 1)

	if(chambered)//We have a shell in the chamber
		//chambered.forceMove(newloc) //Eject casing
		chambered = null

	if(loaded.len)
		var/obj/item/ammo_casing/AC = loaded[1] //load next casing.
		loaded -= AC //Remove casing from loaded list.
		chambered = AC

	update_icon()
