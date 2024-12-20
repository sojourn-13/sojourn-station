/obj/item/holyvacuum
	desc = "An advanced vacuum cleaner designed by \"Old Testament\" that compresses trash into reusable biomatter bricks. There is no safety switch and it has several warnings on it about the toxic biomatter bricks."
	name = "\"Tersus\" vacuum cleaner"
	icon = 'icons/obj/janitor.dmi'
	icon_state = "vacuum"
	force = WEAPON_FORCE_WEAK
	throwforce = WEAPON_FORCE_WEAK
	throw_speed = 5
	throw_range = 3
	no_double_tact = TRUE
	sanctified = TRUE //Already struggles to compete with mop, let's not make it slower in the hands of those who use it most
	w_class = ITEM_SIZE_BULKY
	attack_verb = list("bashed", "bludgeoned", "whacked")
	matter = list(MATERIAL_PLASTIC = 5, MATERIAL_STEEL = 10, MATERIAL_BIOMATTER = 5)
	price_tag = 300

	var/amount = 0
	var/max_amount = 30
	var/vacuum_time = 45

/obj/item/holyvacuum/Initialize()
	.=..()
	create_reagents(10)
	refill()
	update_icon()

/obj/item/holyvacuum/examine(mob/user)
	..()
	to_chat(user, "\The [src]'s tank contains [amount] units of compressed filth.")

/obj/item/holyvacuum/update_icon()
	.=..()

/obj/item/holyvacuum/proc/refill()
	reagents.add_reagent("cleaner", 10)  // Need to have cleaner in it for /turf/proc/clean

/obj/item/holyvacuum/attack_self(var/mob/user)
	.=..()
	if(amount==0)
		to_chat(user, SPAN_NOTICE("The storage tank of the [src] is already empty."))
	else
		empty(user)

/obj/item/holyvacuum/proc/empty(var/mob/user)
	var/obj/item/compressedfilth/CF = new(user.loc)  // Drop the content of the vacuum cleaner on the ground
	CF.matter[MATERIAL_BIOMATTER] = amount
	amount = 0
	to_chat(user, SPAN_NOTICE("You empty the storage tank of the [src]."))
	update_icon()

/obj/item/holyvacuum/afterattack(atom/A, mob/user, proximity)
	if(!proximity) return
	if(istype(A, /turf) || istype(A, /obj/effect/decal/cleanable) || istype(A, /obj/effect/overlay) && !istype(A, /obj/effect/overlay/water))
		if(amount >= max_amount)
			to_chat(user, SPAN_NOTICE("The storage tank of the [src] is full!"))
			return
		var/turf/T = get_turf(A)
		if(!T)
			return
		spawn()
			user.do_attack_animation(T)
		user.setClickCooldown(2) //We use this to not lock people out of talking or looking around or multy tile vacuuming
		playsound(loc, 'sound/effects/slosh.ogg', 25, 1)
		if(do_after(user, vacuum_time, T))
			if(T)
				amount += 0.1 * T.clean(src, user)  // Fill the vacuum cleaner with the cleaned filth
			to_chat(user, SPAN_NOTICE("You have vacuumed all the filth!"))
			refill()
			update_icon()

/obj/item/compressedfilth
	desc = "A small block of compressed filth. Gross!"
	name = "compressed filth"
	icon = 'icons/obj/janitor.dmi'
	icon_state = "filth-biomatter"
	force = WEAPON_FORCE_HARMLESS
	throwforce = WEAPON_FORCE_HARMLESS
	throw_speed = 5
	throw_range = 6
	w_class = ITEM_SIZE_SMALL
	attack_verb = list("bashed", "bludgeoned", "whacked")
	matter = list(MATERIAL_BIOMATTER=0)
	price_tag = 0

	var/amount = 0
	var/max_amount = 0
	var/vacuum_time = 3
