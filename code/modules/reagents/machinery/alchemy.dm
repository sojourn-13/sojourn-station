//Alchemy!

/obj/structure/alchemy
	name = "Alembic"
	desc = "An archaic type of alchemical still, bonding and condensing different liquids together. Knowledge on how it synthesizes materials has been lost to time, yet it somehow can still be used by the chemistry savvy."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "magic_flask_thing"
	density = FALSE //Its a small thing thats meant to go on tables
	anchored = FALSE
//	var/catalists = null //This is the materal inside are flask to use for bounding
	var/obj/item/reagent_containers/beaker = null

	New() update_icon()

	verb/do_mixing()
		set category = "Object"
		set name = "Start Alchemical Reaction"
		set src in view(1)

		if (usr.stat || usr.restrained() || anchored || !usr.stats.getPerk(PERK_ALCHEMY))
			return

		if (!beaker)
			return

		beaker.reagent_flags &= ~(NO_REACT)
		spawn(10)
		beaker.reagent_flags |= NO_REACT
		beaker.reagents.process_reactions()

	verb/detach_beaker()
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
		to_chat(user, "A fitting beaker is already loaded.")
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

/obj/item/reagent_containers/glass/beaker/flask_alchemy
	name = "ambelic flask"
	desc = "A thick, bulb-like glass bottle that can't hold much liquid and doesn't seem to allow any mixing or reacting within."
	icon_state = "flasky_the_flask"
	matter = list(MATERIAL_GLASS = 1)
	volume = 3
	amount_per_transfer_from_this = 1
	possible_transfer_amounts = list(1,2,3)
	reagent_flags = TRANSPARENT | NO_REACT // It's a stasis BIDON, shouldn't allow chems to react inside it.

/obj/item/alchemy/recipe_scroll
	name = "alchemy recipe"
	desc = "A tatty paper written in a strange language."
	icon = 'icons/obj/scroll_bandange.dmi'
	icon_state = "Scroll ink"

/obj/item/alchemy/recipe_scroll/Initialize()
	var/blurb = pick(list(
		"Iron binds with tungsten, but needs to be recondensed with salt",
		"Ammonia dissolves carbon - crystalize with salt",
		"Water and carbon can be mixed with salt",
		"Detox can be purified when mixed with viroputine and citalopram",
		"Citalopram and purger bring out the purest essence of detox",
		"Iron and silicon, ground into flakes, and enriched with sodiumchloride",
		"Suspend salt in oil, and stir in iron shavings",
		"Ground gold and salt, mixed into a tatonka's milk",
		"Tatonka milk can be fortified with eggs and extra protein",
		"Honey, ethanol and pure protien make an invigorating brew",
		"Ethanol and milk, plus a dash of pepper",
		"Fresh blood and pure gold can distill an elixir of health into its most potent form"))
	desc = "[desc] It reads \"[blurb]\""

/obj/item/alchemy/recipe_scroll/lodge
	name = "hunters' recipe"
	desc = "An old sheet of paper with a carefully-guarded Lodge recipe on it. There's a diagram showing some sort of symbol..."
