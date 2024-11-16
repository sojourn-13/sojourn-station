/****************************/
/*	    A L C H E M Y		*/
/****************************/

// The Alembic, our chemical station required to mix all of our chems
/obj/structure/alchemy
	name = "Alembic"
	desc = "An archaic type of alchemical still, bonding and condensing different liquids together. Knowledge on how it synthesizes materials has been lost to time, yet it somehow can still be used by the chemistry savvy."
	description_info = "Insert an alembic phial, then Ctrl+Shift click on it to start a chemical reaction. Alt+click removes the phial from the alembic, if any."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "magic_flask_thing"
	density = FALSE //Its a small thing thats meant to go on tables
	anchored = FALSE
//	var/catalists = null //This is the materal inside are flask to use for bounding
	var/obj/item/reagent_containers/beaker = null

/obj/structure/alchemy/New()
	update_icon()
	reset_plane_and_layer()

/obj/structure/alchemy/examine(mob/user)
	..()
	to_chat(user, "<span class='info'>Insert an alembic phial, then hold Ctrl+Shift and click on it to start a chemical reaction. \n \
					Holding Alt and clicking on it removes the phial from the alembic, if any.</span>")

/obj/structure/alchemy/verb/do_mixing()
	set category = "Object"
	set name = "Start Alchemical Reaction"
	set src in view(1)

	if (usr.stat || usr.restrained() || !usr.stats.getPerk(PERK_ALCHEMY))
		to_chat(usr, SPAN_NOTICE("You are incapable of operating this, either out of impossibility or lack of knowledge on Alchemy."))
		return

	if (!beaker)
		to_chat(usr, SPAN_WARNING("There is no flask inserted to initiate a reaction in!"))
		return

	beaker.reagent_flags &= ~(NO_REACT)
	beaker.reagents.process_reactions()
	spawn(5)
	beaker.reagent_flags |= NO_REACT

/obj/structure/alchemy/verb/detach_beaker()
	set category = "Object"
	set name = "Remove Beaker"
	set src in view(1)

	if (usr.stat || usr.restrained() || anchored)
		return

	if (!beaker)
		return

	if(beaker) //Just in case this gets ran directly
		var/obj/item/reagent_containers/B = beaker
		B.loc = loc
		beaker = null
		update_icon()


/obj/structure/alchemy/update_icon()
	icon_state = "magic_flask_thing_nobeaker"
	if(beaker)
		icon_state = "magic_flask_thing"

/obj/structure/alchemy/attackby(obj/item/I, mob/living/user)

// Leaving this uncommented as doccumentation on designs, will try to emulate in another way through crayon runes - Seb

//This is a lot harder to code and tweak without being massive changes or re-wrighting how chemicals process - Trilby

/*	if(istype(I, /obj/item/stack))
		var/obj/item/stack/S = I
		if(S.amount >= 1)
			catalists = new I(amount = 1)
			S.use(1)
			to_chat(user, "You add a single sheet of [S] to the flask base.")
		else
			to_chat(user, "You need at lest a single sheet of [src] to add to the flask base.")
*/
	var/obj/item/reagent_containers/B = I
	if(beaker)
		to_chat(user, "A fitting container is already loaded.")
		return
	if(istype(B, /obj/item/reagent_containers/glass))
		if(!istype(B, /obj/item/reagent_containers/glass/beaker/flask_alchemy))
			to_chat(user, SPAN_NOTICE("This only seems to take a really fancy type of flask."))
			return
		src.beaker =  B
		if (user.unEquip(B, src))
			to_chat(user, "You insert the flask into the [src].")
			update_icon()
			return
	if(I.has_quality(QUALITY_BOLT_TURNING)) // So that we can affix it on top of tables and not have it stolen, etc
		anchored = !anchored
		to_chat(user, SPAN_NOTICE("You [anchored? "un" : ""]secured \the [src]!"))
		playsound(loc, 'sound/items/Ratchet.ogg', 75, 1)
		return

/obj/structure/alchemy/AltClick(mob/user)
	if(!usr.stat && !usr.restrained() && !anchored)
		detach_beaker()

/obj/structure/alchemy/CtrlShiftClick(mob/user)
	if(!usr.stat && !usr.restrained() && !anchored && usr.stats.getPerk(PERK_ALCHEMY))
		do_mixing()
		sleep(30) // Prevents spamming this so that we can't turn the flasks into reactive beakers

// The phial that goes inside of the alembic, and the only reagent container in which we can mix our newly found chems
/obj/item/reagent_containers/glass/beaker/flask_alchemy
	name = "alembic phial"
	desc = "A thick, bulb-like glass bottle that can't hold much liquid and doesn't seem to allow any mixing or reacting within, unless used on an alembic."
	icon_state = "flasky_the_flask"
	matter = list(MATERIAL_GLASS = 1)
	volume = 3
	amount_per_transfer_from_this = 1
	possible_transfer_amounts = list(1,2,3)
	filling_states = "1;2;3" // So we can see if it has stuff on it or not
	reagent_flags = OPENCONTAINER | NO_REACT // It's a stasis container, shouldn't allow chems to react inside it, that's handled by the

// A flask that breaks if thrown on harm intent, spilling its contents offensively all over their target
// They are also small 5u containers for health potions and the like
/obj/item/reagent_containers/food/drinks/bottle/alchemy
	name = "throwing flask"
	desc = "A fragile, conical flask meant to be filled with harmful (or beneficial) chemicals and thrown to provoke its contents' effects."
	icon_state = "throwing_flask"
	volume = 5 // Let's not get out of hand some stuff is too potent and most recipes produce 1 unit of a given chemical
	amount_per_transfer_from_this = 1 // Finnicky given the OD rate of most alchemy reagents
	possible_transfer_amounts = list(1,2,5)
	smash_duration = 7
	rag_underlay = "rag_flask"
	filling_states = "20;40;60;80;100"

/obj/item/reagent_containers/food/drinks/bottle/alchemy/Initialize()
	. = ..()
	update_icon()
	if(isGlass)
		unacidable = TRUE

/obj/item/reagent_containers/food/drinks/bottle/alchemy/update_icon()
	underlays.Cut()
	cut_overlays()
	if(reagents && reagents.total_volume)
		var/mutable_appearance/filling = mutable_appearance('icons/obj/reagentfillings.dmi', "[icon_state]-[get_filling_state()]")
		filling.color = reagents.get_color()
		add_overlay(filling)
	if(rag)
		var/underlay_image = image(icon='icons/obj/drinks.dmi', icon_state=rag.on_fire? "[rag_underlay]_lit" : rag_underlay)
		underlays += underlay_image
		set_light(2)
	else
		set_light(0)

// A belt-worn satchel that only holds throwing flasks for an alchemist, to store potions or offensive flasks
/obj/item/storage/pouch/alchemy
	name = "alchemy flask satchel"
	desc = "A satchel meant to be worn at the waist, for ease of carry and access to alchemical flasks of all kinds."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "alchemy_satchel"
	item_state = "alchemy_satchel"
	w_class = ITEM_SIZE_NORMAL // Bulkier
	slot_flags = SLOT_BELT
	reagent_flags = REFILLABLE | NO_REACT // Don't ask...
	price_tag = 500
	storage_slots = 5 // Five flasks
	sliding_behavior = TRUE // Fast access!
	can_hold = list(
		/obj/item/reagent_containers/food/drinks/bottle/alchemy,
		/obj/item/reagent_containers/glass/beaker/flask_alchemy,
		/obj/item/weldpack/canister/oil
		)
	var/open = FALSE

/obj/item/storage/pouch/alchemy/Initialize()
	. = ..()
	update_icon()

/obj/item/storage/pouch/alchemy/New()
	. = ..()
	update_icon()

/obj/item/storage/pouch/alchemy/slide_out_item(mob/living/carbon/human/user)
	if(!open)
		return
	..()

/obj/item/storage/pouch/alchemy/update_icon()
	..()
	cut_overlays()
	if(contents.len)
		add_overlay(image('icons/obj/chemical.dmi', "flask_[contents.len]"))
	if(open)
		add_overlay(image('icons/obj/chemical.dmi', "open_lid"))
	else
		add_overlay(image('icons/obj/chemical.dmi', "closed_lid"))

/obj/item/storage/pouch/alchemy/can_interact(mob/user, require_adjacent_turf = TRUE, show_message = TRUE)
	if((!ishuman(user) && (loc != user)) || user.stat || user.restrained())
		return 1
	if(istype(loc, /obj/item/storage))
		return 2
	return 0

/obj/item/storage/pouch/alchemy/open(mob/user)
	if(!open)
		to_chat(user, SPAN_NOTICE("\The [src] is closed."))
		return
	. = ..()

/obj/item/storage/pouch/alchemy/verb/quick_open_close(mob/user)
	set name = "Close Satchel"
	set category = "Object"
	set src in view(1)

	if(!isliving(loc))
		return

	if(can_interact(user) == 1)
		return

	open_close(user)

/obj/item/storage/pouch/alchemy/AltClick(mob/user)
	var/able = can_interact(user)
	if(able == 1)
		return

	if(able == 2)
		to_chat(user, SPAN_NOTICE("You cannot open \the [src] while it\'s in a container."))
		return

	open_close(user)

/obj/item/storage/pouch/alchemy/proc/open_close(mob/living/carbon/human/H, user)
	if(!open)
		to_chat(user, SPAN_NOTICE("You open \the [src]."))
		w_class = ITEM_SIZE_BULKY
		open = TRUE
	else
		to_chat(user, SPAN_NOTICE("You close \the [src]."))
		w_class = ITEM_SIZE_NORMAL
		open = FALSE
	playsound(loc, 'sound/items/storage/briefcase.ogg', 100, 1)
	update_icon()

/obj/item/storage/pouch/alchemy/attackby(obj/item/W, mob/user)
	if(!open)
		to_chat(user, SPAN_NOTICE("You try to access \the [src] but it\'s closed!"))
		return
	. = ..()

/obj/item/storage/pouch/alchemy/attack_self(mob/user)
	if(can_interact(user) == 1)
		return
	open_close(user)

// FIXME: With sliding behavior turned on by default, you can still draw items from it while closed, please fix
/obj/item/storage/pouch/alchemy/attack_hand(mob/living/carbon/human/user)
	if(sliding_behavior && contents.len && (src in user))
		var/obj/item/I = contents[contents.len]
		if(istype(I) && src.open)
			hide_from(usr)
			var/turf/T = get_turf(user)
			remove_from_storage(I, T)
			usr.put_in_hands(I)
			add_fingerprint(user)
	..()

// A paper containing all alchemy recipes so that alchemists have at least a basis of knowledge on chemical reactions
// And they don't have to codedive to get to know them.
/obj/item/paper/alchemy_recipes
	name = "Alchemy Recipes"
	desc = "A tattered parchment written in a strange language, detailing the sum knowledge of alchemical compounds..."
	icon = 'icons/obj/scroll_bandange.dmi'
	icon_state = "Scroll ink"
	item_state = "crayon_scroll_open"
	language = LANGUAGE_CULT // So that only cultists can read it
	info = "<h1>Notes on alchemical compounds</h1><hr>\
			<font color='red'><small><i>(The following are your hastily scribbled thoughts put to pen after having a flash of inspiration. It is up to you to make sense out of these...)</i></small></font><br><br>\
			<i>\"Iron binds with tungsten, but needs to be recondensed with salt. Hardens the body, but at what cost...?\"</i><br><br>\
			<i>\"Ammonia dissolves carbon - crystalize with salt. Be careful of potent toxicity.\"</i><br><br>\
			<i>\"Water and carbon can be mixed with salt to cure the eyes.\"</i><br><br>\
			<i>\"Detox can be purified when mixed with viroputine and citalopram into an elixir of health.\"</i><br><br>\
			<i>\"Citalopram and purger bring out the purest essence of detox...\"</i><br><br>\
			<i>\"Iron and silicon, ground into flakes, and enriched with salt...Pocket sand?\"</i><br><br>\
			<i>\"Suspend salt in oil, and stir in iron shavings...mind the exotermic reaction when exposed to skin!\"</i><br><br>\
			<i>\"Ground gold and salt, mix into milk. It will help make the mind sharper.\"</i><br><br>\
			<i>\"Milk can be fortified with eggs and extra protein. The handyman's elixir of excellence.\"</i><br><br>\
			<i>\"Honey, ethanol and pure protein make an invigorating brew for a tussle.\"</i><br><br>\
			<i>\"Ethanol and milk, plus a dash of pepper, make a liquor that grants the eyes of an eagle...\"</i><br><br>\
			<i>\"Fresh blood and pure gold can distill an elixir of health into its most potent form...one step closer towards a true elixir of life.\"</i><br><br><hr>"

// No crumpling this one
/obj/item/paper/alchemy_recipes/attack_self(mob/living/user as mob)
	user.examinate(src)

// No using it as lipstick wipe either.
/obj/item/paper/alchemy_recipes/attack(mob/living/carbon/M as mob, mob/living/carbon/user as mob)
	if(user.targeted_organ == BP_EYES)
		user.visible_message(SPAN_NOTICE("You show the paper to [M]. "), \
			SPAN_NOTICE(" [user] holds up a paper and shows it to [M]. "))
		M.examinate(src)

// No stacking or doing anything else either. But you can burn it.
/obj/item/paper/alchemy_recipes/attackby(obj/item/P as obj, mob/user as mob)
	..()

	if(istype(P, /obj/item/paper) || istype(P, /obj/item/photo))
		to_chat(user, SPAN_NOTICE("You cannot stack this parchment with common papers."))
		return
	else if(istype(P, /obj/item/flame))
		burnpaper(P, user)
	add_fingerprint(user)
	return

// No renaming either.
/obj/item/paper/alchemy_recipes/rename()
	to_chat(usr, SPAN_NOTICE("You cannot rename this scroll."))
	return
