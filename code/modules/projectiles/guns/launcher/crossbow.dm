//AMMUNITION

/obj/item/arrow
	name = "bolt"
	desc = "It's got a tip for you - get the point?"
	icon = 'icons/obj/weapons.dmi'
	icon_state = "bolt"
	item_state = "bolt"
	throwforce = 8
	w_class = ITEM_SIZE_NORMAL
	sharp = 1
	edge = 0

/obj/item/spike
	name = "alloy spike"
	desc = "A foot-long pointed stick made of a strange, silvery metal."
	sharp = 1
	edge = 0
	throwforce = 5
	w_class = ITEM_SIZE_SMALL
	icon = 'icons/obj/weapons.dmi'
	icon_state = "metal-rod"
	item_state = "bolt"

/obj/item/arrow/quill
	name = "vox quill"
	desc = "An alien-looking barbed quill plucked from who-knows-what kind of creature. It might work as a crossbow projectile."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "quill"
	item_state = "quill"
	throwforce = 5

/obj/item/arrow/rod
	name = "metal rod"
	desc = "A projectile for a crossbow. Don't cry for me, Orithena."
	icon_state = "metal-rod"

/obj/item/arrow/rcd
	name = "flashforged bolt"
	desc = "The ultimate ghetto 'deconstruction' implement."
	throwforce = 6

/obj/item/gun/projectile/crossbow
	name = "powered crossbow"
	desc = "A 2557AD twist on an old classic. Pick up that can."
	description_info = "Uses metal rods as ammunition. Insert a rod and use in hand to pull the string, then fire. To fire superheated rods instead, insert a Large powercell. To remove a drained powercell, use a Bolt Turning tool."
	icon = 'icons/obj/guns/launcher/crossbow-solid.dmi'
	icon_state = "crossbow"
	item_state = "crossbow-solid"
	fire_sound = 'sound/weapons/energy/xbow_fire.ogg' // Royalty free crossbow sound. - Seb
	fire_sound_text = "a solid thunk"
	fire_delay = 25
	slot_flags = SLOT_BACK
	safety = FALSE
	twohanded = TRUE
	load_method = SINGLE_CASING
	caliber = CAL_CROSSBOW
	handle_casings = HOLD_CASINGS
	max_shells = 1
	ammo_type = /obj/item/ammo_casing/rod_bolt
	gun_tags = list(GUN_PROJECTILE, GUN_SCOPE)
	var/obj/item/projectile/superheat_type = /obj/item/projectile/bullet/reusable/rod_bolt/superheated
	var/tension = 0                         // Current draw on the bow.
	var/max_tension = 5                     // Highest possible tension.
	cell = null    // Used for firing superheated rods.
	var/current_user                        // Used to check if the crossbow has changed hands since being drawn.
	var/draw_time = 10							// How long it takes to increase the draw on the bow by one "tension"
	serial_type = null //it's a handmade crossbow who's putting serials on it
	var/superheat_cost = 250

	wrench_intraction = TRUE

/obj/item/gun/projectile/crossbow/consume_next_projectile(mob/user)
	if(tension <= 0)
		to_chat(user, SPAN_WARNING("\The [src] is not drawn back!"))
		return null
	if(chambered)
		var/obj/item/projectile/bullet/theBB = chambered.BB
		theBB.multiply_projectile_damage(tension)
		return chambered.BB


/obj/item/gun/projectile/crossbow/loadAmmoBestGuess()
	return

/obj/item/gun/projectile/crossbow/handle_post_fire(mob/user, atom/target)
	tension = 0
	update_icon()
	..()

/obj/item/gun/projectile/crossbow/attack_self(mob/living/user as mob)
	if(tension)
		user.visible_message("[user] relaxes the tension on [src]'s string and unloads it.","You relax the tension on [src]'s string and unload it.")
		tension = 0
		update_icon()
	else
		draw(user)

/obj/item/gun/projectile/crossbow/proc/draw(var/mob/user as mob)

	if(!chambered)
		to_chat(user, "You don't have anything nocked to [src].")
		return

	if(user.restrained())
		return

	current_user = user
	playsound(loc, 'sound/weapons/bow_draw.ogg', 50, 1)
	user.visible_message("[user] begins to draw back the string of [src].",SPAN_NOTICE("You begin to draw back the string of [src]."))
	tension = 1

	while(chambered && tension && loc == current_user)
		if(!do_after(user, draw_time, src, immobile = FALSE)) //crossbow strings don't just magically pull back on their own.
			user.visible_message("[usr] stops drawing and relaxes the string of [src].",SPAN_WARNING("You stop drawing back and relax the string of [src]."))
			tension = 0
			update_icon()
			return

		//double check that the user hasn't removed the bolt in the meantime
		if(!(chambered && tension && loc == current_user))
			return

		tension++
		update_icon()

		if(tension >= max_tension)
			tension = max_tension
			to_chat(user, "[src] gives a satisfying clunk as the string is pulled back as far as it can go!")
			return

		user.visible_message("[usr] draws back the string of [src]!",SPAN_NOTICE("You continue drawing back the string of [src]!"))

/obj/item/gun/projectile/crossbow/attackby(obj/item/I, mob/user)
	if(istype(I,/obj/item/stack/rods) && !chambered)
		var/obj/item/stack/rods/R = I
		if(R.use(1))
			chambered = new /obj/item/ammo_casing/rod_bolt(src)
			chambered.fingerprintslast = src.fingerprintslast
			update_icon()
			user.visible_message("[user] jams a [R] into [src].","You jam a [R] into [src].")
			superheat_rod(user)


	else if(istype(I, /obj/item/cell/large))
		if(!cell)
			insert_item(I, user)
			cell = I
			superheat_rod(user)
		else
			to_chat(user, SPAN_NOTICE("[src] already has a cell installed."))

	else if(chambered)
		user.visible_message("[user] relaxes the tension on [src]'s string and removes [chambered].","You relax the tension on [src]'s string and remove [chambered].")
		new /obj/item/stack/rods(get_turf(src))
		QDEL_NULL(chambered)
		tension = 0
		update_icon()

	else
		..()

/obj/item/gun/projectile/crossbow/wrench_intraction(obj/item/I, mob/user)
	if(I.get_tool_type(user, list(QUALITY_BOLT_TURNING), src))
		if(cell)
			eject_item(cell, user)
			cell = null
		else
			to_chat(user, SPAN_NOTICE("[src] doesn't have a cell installed."))
	return


/obj/item/gun/projectile/crossbow/proc/superheat_rod(var/mob/user)
	if(!user || !cell || !chambered)
		return
	if(cell.charge < superheat_cost)
		return
	if(istype(chambered.BB, superheat_type))
		return

	to_chat(user, SPAN_NOTICE("[chambered] sparks and crackles as it gives off a red-hot glow."))
	QDEL_NULL(chambered.BB)
	chambered.BB = new superheat_type(chambered)
	cell.use(superheat_cost)

/obj/item/gun/projectile/crossbow/update_icon()
	if(tension > 1)
		icon_state = "crossbow-drawn"
	else if(chambered)
		icon_state = "crossbow-nocked"
	else
		icon_state = "crossbow"

/*////////////////////////////
//	Rapid Crossbow Device	//
*/////////////////////////////

/obj/item/gun/projectile/crossbow/RCD
	name = "rapid crossbow device"
	desc = "A hacked together RCD turns an innocent construction tool into the penultimate 'deconstruction' tool. Flashforges projectiles using matter units when the string is drawn back."
	icon = 'icons/obj/guns/launcher/rxb.dmi'
	icon_state = "rxb"
	fire_sound = 'sound/weapons/rail.ogg' // Basically a downgraded myrmidon.
	slot_flags = null
	caliber = CAL_RXBOW
	draw_time = 7.5
	superheat_cost = 150 //guild design, more efficient or something
	var/stored_matter = 0
	var/max_stored_matter = 60
	var/boltcost = 5
	var/obj/item/ammo_casing/flashforge_type = /obj/item/ammo_casing/rod_bolt/rcd
	superheat_type = /obj/item/projectile/bullet/reusable/rod_bolt/rcd/superhot

/obj/item/gun/projectile/crossbow/RCD/proc/genBolt(var/mob/user)
	if(stored_matter >= boltcost && !chambered)
		chambered = new flashforge_type(src)
		stored_matter -= boltcost
		to_chat(user, "<span class='notice'>The RXD flashforges a new bolt!</span>")
		playsound(loc, 'sound/weapons/guns/interact/hydra_crossbow_load.ogg', 50, 1) // Fitting considering the mechanism at play. - Seb
		update_icon()
	else
		to_chat(user, "<span class='warning'>The \'Low Ammo\' light on the device blinks yellow.</span>")
		flick("[icon_state]-empty", src)

/obj/item/gun/projectile/crossbow/RCD/attack_self(mob/living/user as mob)
	if(tension)
		user.visible_message("[user] relaxes the tension on [src]'s string.","You relax the tension on [src]'s string.")
		if(chambered)
			if((stored_matter + 5) > max_stored_matter)
				to_chat(user, "<span class='notice'>Unable to reclaim flashforged bolt. The RXD can't hold that many additional matter-units.</span>")
				new /obj/item/arrow/rcd(get_turf(src))
				return
			to_chat(user, "<span class='notice'>Reclaimed flashforged bolt.</span>")
			QDEL_NULL(chambered)
			stored_matter += 5
		tension = 0
		update_icon()
	else
		genBolt(user)
		draw(user)

/obj/item/gun/projectile/crossbow/RCD/attackby(obj/item/W as obj, mob/user as mob)
	var/obj/item/stack/material/M = W
	if(istype(M) && M.material.name == MATERIAL_COMPRESSED_MATTER)
		var/amount = min(M.get_amount(), round(max_stored_matter - stored_matter))
		if(M.use(amount) && stored_matter < max_stored_matter)
			stored_matter += amount
			playsound(src.loc, 'sound/machines/click.ogg', 50, 1)
			to_chat(user, "<span class='notice'>You load [amount] Compressed Matter into \the [src].</span>. The RXD now holds [stored_matter]/[max_stored_matter] matter-units.")
			update_icon()	//Updates the ammo counter
		if (M.use(amount) && stored_matter >= max_stored_matter)
			to_chat(user, "<span class='notice'>The RXD is full.")
	else
		..()
	if(istype(W, /obj/item/arrow/rcd))
		var/obj/item/arrow/rcd/A = W
		if((stored_matter + 5) > max_stored_matter)
			to_chat(user, "<span class='notice'>Unable to reclaim flashforged bolt. The RXD can't hold that many additional matter-units.</span>")
			return
		stored_matter += 5
		qdel(A)
		playsound(src.loc, 'sound/machines/click.ogg', 50, 1)
		to_chat(user, "<span class='notice'>Flashforged bolt reclaimed. The RXD now holds [stored_matter]/[max_stored_matter] matter-units.</span>")
		update_icon()
		return

/obj/item/gun/projectile/crossbow/RCD/update_icon()
	cut_overlays()
	if(chambered)
		add_overlay("rxb-bolt")
	var/ratio = 0
	if(stored_matter < boltcost)
		ratio = 0
	else
		ratio = stored_matter / max_stored_matter
		ratio = max(round(ratio, 0.25) * 100, 25)
	add_overlay("rxb-[ratio]")
	if(tension > 1)
		icon_state = "rxb-drawn"
	else
		icon_state = "rxb"

/obj/item/gun/projectile/crossbow/RCD/examine(mob/user)
	..()
	to_chat(user, "It currently holds [stored_matter]/[max_stored_matter] matter-units.")
