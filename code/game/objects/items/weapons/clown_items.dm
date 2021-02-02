/* Clown Items
 * Contains:
 * 		Banana Peels
 *		Soap
 *		Bike Horns
 */

/*
 * Banana Peals
 */
/obj/item/weapon/bananapeel/Crossed(AM as mob|obj)
	if (isliving(AM))
		var/mob/living/M = AM
		M.slip("the [src.name]",4)
/*
 * Soap
 */
/obj/item/weapon/soap
	name = "soap"
	desc = "An unbranded and unscented bar of soap."
	gender = PLURAL
	icon = 'icons/obj/items.dmi'
	icon_state = "soap"
	w_class = ITEM_SIZE_SMALL
	throwforce = 0
	throw_speed = 4
	throw_range = 20
	matter = list(MATERIAL_BIOMATTER = 12)
	var/slip_power = 3 //how powerful is are slip?
	var/clean_speed = 50 //How fast we are at cleaning
	var/reagent_storage = 20 //How many units we store
	var/cleaning_reagent = "cleaner" //What do we use to clean?
	var/bless_tile = FALSE

/obj/item/weapon/soap/New()
	..()
	create_reagents(reagent_storage)
	wet()

/obj/item/weapon/soap/proc/wet()
	playsound(loc, 'sound/effects/slosh.ogg', 25, 1)
	reagents.add_reagent(cleaning_reagent, reagent_storage)

/obj/item/weapon/soap/Crossed(AM as mob|obj)
	if (isliving(AM))
		var/mob/living/M = AM
		M.slip("the [src.name]",slip_power)

/obj/item/weapon/soap/afterattack(atom/target, mob/user as mob, proximity)
	if(!proximity) return

	else if(istype(target,/obj/effect/decal/cleanable))
		to_chat(user, "<span class='notice'>You scrub \the [target.name] out.</span>")
		qdel(target)
		return
	else if(istype(target,/turf))
		to_chat(user, "You start scrubbing the [target.name]")
		if(do_after(user, clean_speed, target)) //Soap should be slower and worse than mop
			to_chat(user, "<span class='notice'>You scrub \the [target.name] clean.</span>")
			var/turf/T = target
			T.clean(src, user)
			if(bless_tile)
				T.holy = 1
				return
			return
		else
			to_chat(user, "<span class='notice'>You need to stand still to clean \the [target.name]!</span>")
			return
	else if(istype(target,/obj/structure/sink) || istype(target,/obj/structure/sink))
		to_chat(user, "<span class='notice'>You wet \the [src] in the sink.</span>")
		wet()
		return
	else if (istype(target, /obj/structure/mopbucket) || istype(target, /obj/item/weapon/reagent_containers/glass) || istype(target, /obj/structure/reagent_dispensers/watertank))
		if (target.reagents && target.reagents.total_volume)
			to_chat(user, "<span class='notice'>You wet \the [src] in the [target].</span>")
			wet()
			return
		else
			to_chat(user, "\The [target] is empty!")

	//I couldn't feasibly  fix the overlay bugs caused by cleaning items we are wearing.
	//So this is a workaround. This also makes more sense from an IC standpoint. ~Carn
	if(user.client && (target in user.client.screen))
		to_chat(user, "<span class='notice'>You need to take that [target.name] off before cleaning it.</span>")
		return
	else
		to_chat(user, "<span class='notice'>You clean \the [target.name].</span>")
		target.clean_blood()
		return



//attack_as_weapon
/obj/item/weapon/soap/attack(mob/living/target, mob/living/user, var/target_zone)
	if(ishuman(target) && ishuman(user) && !target.stat && user.targeted_organ == BP_MOUTH)
		user.visible_message(
			SPAN_DANGER("\The [user] washes \the [target]'s mouth out with soap!")
		)
		user.setClickCooldown(DEFAULT_QUICK_COOLDOWN) //prevent spam
		return
	..()

/obj/item/weapon/soap/nanotrasen
	desc = "A NanoTrasen-brand bar of soap. Smells of plasma."
	icon_state = "soapnt"
	clean_speed = 45 //Plasma is red
	matter = list(MATERIAL_BIOMATTER = 11, MATERIAL_PLASMA = 1)

/obj/item/weapon/soap/deluxe
	icon_state = "soapdeluxe"
	clean_speed = 40
	reagent_storage = 25 //we can clean 5 more tiles before needing more water

/obj/item/weapon/soap/deluxe/New()
	desc = "A deluxe Lonestar brand bar of soap. Smells of [pick("lavender", "vanilla", "strawberry", "chocolate" ,"space")]."
	..()

/obj/item/weapon/soap/church
	desc = "A Absolute brand bar of soap. It has a faithful smell."
	icon_state = "soapchuchie"
	clean_speed = 45
	reagent_storage = 25 //we can clean 5 more tiles before needing more water
	cleaning_reagent = "holywater"
	bless_tile = TRUE

/obj/item/weapon/soap/syndie
	desc = "An untrustworthy bar of soap. Smells of fear."
	icon_state = "soapsyndie"
	clean_speed = 35 //Almost the same as a mop
	reagent_storage = 30 //Same as mop
	slip_power = 5

/obj/item/weapon/soap/commie
	name = "excelsior soap"
	desc = "A bar of with the words of \"For one to be truly free from shackles one must be clean\". Smells of struggles of the working class."
	icon_state = "soapcommie"
	clean_speed = 35 //Almost the same as a mop
	reagent_storage = 30 //Same as mop
	slip_power = 5

/obj/item/weapon/soap/bluespase
	desc = "An anomalous bar of blue soap created by an unknown person (or group?) their work marked by a blue cross,\
	these items are known to vanish and reappear when left alone. Smells of bluespace and hospitals."
	icon_state = "soapblue"
	clean_speed = 15 // 2x faster then a mop
	reagent_storage = 60 //2x more then a mop
	slip_power = 10 //Long fall
	matter = list(MATERIAL_BIOMATTER = 10, MATERIAL_PLASMA = 3, MATERIAL_GOLD = 3, MATERIAL_SILVER = 3, MATERIAL_DIAMOND = 3)
	cleaning_reagent = "sterilizine" //We use something that removes blood

/obj/item/weapon/soap/bluespase/New()
	..()
	item_flags |= BLUESPACE
	bluespace_entropy(5, get_turf(src))

/*
 * Bike Horns
 */
/obj/item/weapon/bikehorn
	name = "bike horn"
	desc = "A loud bike horn. Favored by entertainers system-wide."
	icon = 'icons/obj/items.dmi'
	icon_state = "bike_horn"
	item_state = "bike_horn"
	throwforce = WEAPON_FORCE_HARMLESS
	w_class = ITEM_SIZE_SMALL
	throw_speed = 3
	throw_range = 15
	attack_verb = list("HONKED")
	var/spam_flag = 0

/obj/item/weapon/bikehorn/attack_self(mob/user as mob)
	if (spam_flag == 0)
		spam_flag = 1
		playsound(src.loc, 'sound/items/bikehorn.ogg', 50, 1)
		src.add_fingerprint(user)
		spawn(20)
			spam_flag = 0
