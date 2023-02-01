/obj/item/gun/launcher
	name = "launcher"
	desc = "A device that launches things."
	icon = 'icons/obj/guns/launcher/pneumatic.dmi'
	icon_state = "pneumatic"
	w_class = ITEM_SIZE_HUGE
	flags = CONDUCT
	slot_flags = SLOT_BACK
	gun_tags = list(GUN_SCOPE)

	var/release_force = 0
	var/throw_distance = 10
	muzzle_flash = 0
	fire_sound_text = "a launcher firing"


//This normally uses a proc on projectiles and our ammo is not strictly speaking a projectile.
/obj/item/gun/launcher/can_hit(var/mob/living/target as mob, var/mob/living/user as mob)
	return 1

//Override this to avoid a runtime with suicide handling.
/obj/item/gun/launcher/handle_suicide(mob/living/user)
	to_chat(user, SPAN_WARNING("Shooting yourself with \a [src] is pretty tricky. You can't seem to manage it."))
	return

/obj/item/gun/launcher/proc/update_release_force(obj/item/projectile)
	return 0

/obj/item/gun/launcher/process_projectile(obj/item/projectile, mob/user, atom/target, var/target_zone, var/params=null, var/pointblank=0, var/reflex=0)
	update_release_force(projectile)
	projectile.loc = get_turf(user)
	projectile.throw_at(target, throw_distance, release_force, user)
	return 1

/obj/item/gun/launcher/pickup(mob/user)
	..()
	playsound(src,'sound/weapons/guns/interact/smg_cock.ogg',20,4)

/obj/item/gun/launcher/dropped(mob/user)
	..()
	playsound(src,'sound/weapons/guns/interact/lmg_magin.ogg',20,4)

/obj/item/gun/matter/launcher/reclaimer
	name = "Excelsior \"Reclaimer\""
	desc = "The weapon of choice for swiftly appropriating matter for communal use. Uses a cellulose based solution to dissolve matter into its original components, not 100% effective."
	icon_state = "reclaimer"
	icon = 'icons/obj/guns/matter/reclaimer.dmi'
	slot_flags = SLOT_BACK
	w_class = ITEM_SIZE_BULKY
	fire_sound = 'sound/weapons/guns/fire/GLfire.ogg'
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 3, TECH_BIO = 8, TECH_ILLEGAL = 1)
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_WOOD = 5, MATERIAL_PLASTIC = 20)
	matter_type = MATERIAL_WOOD

	stored_matter = 5
	projectile_cost = 0.5
	projectile_type = /obj/item/arrow/reclaiming
	serial_type = "EXC"


/obj/item/arrow/reclaiming
	icon = 'icons/obj/projectiles.dmi'
	icon_state = "evil_foam"
	throwforce = 1
	sharp = FALSE

/obj/item/arrow/reclaiming/throw_impact()
	..()

	create_reagents(5)
	reagents.add_reagent("deconstructor", 1)
	reagents.add_reagent("surfactant", 2)
	reagents.add_reagent("water", 2)

	qdel(src)

/obj/item/gun/matter/launcher/breaker
	name = "Artificer \"Breaker\""
	desc = "A weapon designed to break down objects and materials to base parts for other uses, a favorite for scavengers and those who hate wasting materials. Uses a cellulose based solution to dissolve matter into its original components, not 100% effective."
	icon_state = "breaker"
	icon = 'icons/obj/guns/matter/breaker.dmi'
	slot_flags = SLOT_BACK
	w_class = ITEM_SIZE_BULKY
	fire_sound = 'sound/weapons/guns/fire/GLfire.ogg'
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 3, TECH_BIO = 8, TECH_ILLEGAL = 1)
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_WOOD = 5, MATERIAL_PLASTIC = 20)
	matter_type = MATERIAL_WOOD

	stored_matter = 0
	projectile_cost = 1
	projectile_type = /obj/item/arrow/reclaiming
	serial_type = "AG"
