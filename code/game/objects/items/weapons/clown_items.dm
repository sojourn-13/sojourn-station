/* Clown Items
 * Contains:
 * 		Banana Peels
 *		Soap
 *		Bike Horns
 */

/*
 * Banana Peals
 */
//its here so that its all contained in 1 file for the var
/obj/item/bananapeel
 	var/how_many_times_we_can_pull_a_pro_clown_gamer_move = 1

/obj/item/bananapeel/Crossed(AM as mob|obj)
	if (isliving(AM) && how_many_times_we_can_pull_a_pro_clown_gamer_move > 0)
		var/mob/living/M = AM
		M.slip("\the [src.name]",4)
		how_many_times_we_can_pull_a_pro_clown_gamer_move -= 1
/*
 * Soap
 */
/obj/item/soap
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
	var/how_many_times_we_can_pull_a_pro_clown_gamer_move = 3 //How many times we can slip something before we got to give it more water
	var/slip_power = 3 //how powerful is our slip?
	var/clean_speed = 50 //How fast we are at cleaning. The smaller the number, the faster.
	var/reagent_storage = 20 //How many units of liquid we can store before we need to be wettened to work once more
	var/cleaning_reagent = "cleaner" //What do we use to clean?
	var/bless_tile = FALSE

/obj/item/soap/New()
	..()
	create_reagents(reagent_storage)
	wet()

/obj/item/soap/examine(mob/user)
	..()
	if (how_many_times_we_can_pull_a_pro_clown_gamer_move > 0)
		to_chat(user, "<span class='info'>[src] looks slippery.</span>")
		return
	if (how_many_times_we_can_pull_a_pro_clown_gamer_move == 0)
		to_chat(user, "<span class='info'>[src] looks a bit dry</span>")
		return


/obj/item/soap/proc/wet()
	playsound(loc, 'sound/effects/slosh.ogg', 25, 1)
	reagents.add_reagent(cleaning_reagent, reagent_storage)
	how_many_times_we_can_pull_a_pro_clown_gamer_move = initial(how_many_times_we_can_pull_a_pro_clown_gamer_move)

/obj/item/soap/Crossed(AM as mob|obj)
	if (isliving(AM) && how_many_times_we_can_pull_a_pro_clown_gamer_move > 0)
		var/mob/living/M = AM
		M.slip("the [src.name]",slip_power)
		how_many_times_we_can_pull_a_pro_clown_gamer_move -= 1

/obj/item/soap/afterattack(atom/target, mob/user as mob, proximity)
	if(!proximity) return

	else if(istype(target,/obj/effect/decal/cleanable))
		to_chat(user, "<span class='notice'>You scrub \the [target.name] out.</span>")
		qdel(target)
		return
	else if(istype(target,/turf))
		to_chat(user, "You start scrubbing \the [target.name]")
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
	else if (istype(target, /obj/structure/mopbucket) || istype(target, /obj/item/reagent_containers/glass) || istype(target, /obj/structure/reagent_dispensers/watertank))
		if (target.reagents && target.reagents.total_volume)
			to_chat(user, "<span class='notice'>You wet \the [src] in the [target].</span>")
			wet()
			return
		else
			to_chat(user, "\The [target] is empty!")

	//I couldn't feasibly  fix the overlay bugs caused by cleaning items we are wearing.
	//So this is a workaround. This also makes more sense from an IC standpoint. ~Carn
	if(user.client && (target in user.client.screen)) // There needs to be a better way to handle this, you have to throw the item to clean it and you should be able to clean it if it's on your hands.
		to_chat(user, "<span class='notice'>You need to take that [target.name] off before cleaning it.</span>")
		return
	else
		to_chat(user, "<span class='notice'>You clean \the [target.name].</span>")
		target.clean_blood(TRUE)
		return



//attack_as_weapon
/obj/item/soap/attack(mob/living/target, mob/living/user, var/target_zone)
	if(ishuman(target) && ishuman(user) && !target.stat && user.targeted_organ == BP_MOUTH)
		user.visible_message(
			SPAN_DANGER("\The [user] washes \the [target]'s mouth out with soap!")
		)
		user.setClickCooldown(DEFAULT_QUICK_COOLDOWN) //prevent spam
		return
	..()

/obj/item/soap/nanotrasen
	name = "white soap"
	desc = "An immaculately white bar of soap. Somehow, it smells like plasma."
	icon_state = "soapwhite"
	how_many_times_we_can_pull_a_pro_clown_gamer_move = 4
	clean_speed = 40 // Plasma isn't red! But makes it go fasta!
	matter = list(MATERIAL_BIOMATTER = 11, MATERIAL_PLASMA = 1)

/obj/item/soap/deluxe
	name = "deluxe soap"
	icon_state = "soapdeluxe"
	clean_speed = 40
	how_many_times_we_can_pull_a_pro_clown_gamer_move = 5
	reagent_storage = 25 //we can clean 5 more tiles before needing more water

/obj/item/soap/deluxe/New()
	desc = "A deluxe Lonestar-brand bar of soap. Smells of [pick("lavender", "vanilla", "strawberry", "chocolate" ,"space")]."
	..()

/obj/item/soap/church
	name = "holy soap" // Be clean or be dead
	desc = "An Absolutism-brand bar of soap. It has a faithful smell."
	icon_state = "soapchurch"
	how_many_times_we_can_pull_a_pro_clown_gamer_move = 6
	clean_speed = 45
	reagent_storage = 25 //we can clean 5 more tiles before needing more water
	cleaning_reagent = "holywater"
	bless_tile = TRUE
	price_tag = 30

/obj/item/soap/syndie
	name = "suspicious soap"
	desc = "A suspicious bar of soap. Smells like crime and hospitals."
	icon_state = "soapsyndie"
	clean_speed = 35 //Almost the same as a mop
	reagent_storage = 30 //Same as mop
	slip_power = 5
	cleaning_reagent = "sterilizine" //Syndie bar soaps were always meant to quickly clean bloodstains to hide their crimes. AFAIK this should be a counter to luminol too, making it worth it.
	how_many_times_we_can_pull_a_pro_clown_gamer_move = 15

/obj/item/soap/commie
	name = "excelsior soap"
	desc = "A bar of soap with the words \"For one to be truly free from shackles one must be clean\" engraved on it. Smells of struggles of the working class."
	icon_state = "soapcommie"
	how_many_times_we_can_pull_a_pro_clown_gamer_move = 20
	clean_speed = 35 //Almost the same as a mop
	reagent_storage = 30 //Same as mop
	slip_power = 5

/obj/item/soap/hunters
	name = "handmade soap"
	desc = "A bar of soap made by animal byproducts and ash."
	icon_state = "soaproach_red"
	how_many_times_we_can_pull_a_pro_clown_gamer_move = 10
	clean_speed = 45
	reagent_storage = 10 //less than normal
	slip_power = 2 //weak due to being handmade

/obj/item/soap/hunters/New()
	..()
	if(prob(50))
		icon_state = "soaproach_green"
	else
		icon_state = "soaproach_red"

/obj/item/soap/bluespase
	desc = "An anomalous bar of blue soap created by an unknown person (or group?), their work marked by a blue cross.\
	These items are known to vanish and reappear when left alone. Smells of bluespace and hospitals."
	icon_state = "soapbluespace"
	how_many_times_we_can_pull_a_pro_clown_gamer_move = 30
	clean_speed = 15 // 2x faster then a mop
	reagent_storage = 60 //2x more then a mop
	slip_power = 10 //Long fall
	matter = list(MATERIAL_BIOMATTER = 10, MATERIAL_PLASMA = 3, MATERIAL_GOLD = 3, MATERIAL_SILVER = 3, MATERIAL_DIAMOND = 3)
	cleaning_reagent = "sterilizine" //We use something that removes blood

/obj/item/soap/bluespase/New()
	..()
	item_flags |= BLUESPACE
	bluespace_entropy(5, get_turf(src))

/*
 * Bike Horns
 */
/obj/item/bikehorn
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

/obj/item/bikehorn/attack_self(mob/user as mob)
	if (spam_flag == 0)
		spam_flag = 1
		playsound(src.loc, 'sound/items/bikehorn.ogg', 50, 1)
		src.add_fingerprint(user)
		spawn(20)
			spam_flag = 0
