/obj/item/slime_extract
	name = "slime plort"
	desc = "A round plort extracted from a slime. Legends claim these to have \"magical powers\"."
	icon = 'icons/mob/slimes.dmi'
	icon_state = "grey slime extract"
	force = 1
	w_class = ITEM_SIZE_TINY
	throwforce = 0
	throw_speed = 3
	throw_range = 6
	origin_tech = list(TECH_BIO = 4)
	var/Uses = 1 // uses before it goes inert
	var/enhanced = 0 //has it been enhanced before?
	reagent_flags = REFILLABLE | DRAINABLE | AMOUNT_VISIBLE
	price_tag = 800

	attackby(obj/item/O as obj, mob/user as mob)
		if(istype(O, /obj/item/slimesteroid2))
			if(enhanced == 1)
				to_chat(user, SPAN_WARNING(" This extract has already been enhanced!"))
				return ..()
			if(Uses == 0)
				to_chat(user, SPAN_WARNING(" You can't enhance a used extract!"))
				return ..()
			to_chat(user, "You apply the enhancer. It now has triple the amount of uses.")
			Uses = 3
			enhanced = 1
			qdel(O)

/obj/item/slime_extract/New()
	..()
	create_reagents(100)
	reagents.add_reagent("slimejelly", 30)

/obj/item/slime_extract/grey
	name = "grey slime plort"
	icon_state = "grey slime extract"
	price_tag = 800

/obj/item/slime_extract/gold
	name = "gold slime plort"
	icon_state = "gold slime extract"
	price_tag = 1700

/obj/item/slime_extract/silver
	name = "silver slime plort"
	icon_state = "silver slime extract"
	price_tag = 1300

/obj/item/slime_extract/metal
	name = "metal slime plort"
	icon_state = "metal slime extract"
	price_tag = 1000

/obj/item/slime_extract/purple
	name = "purple slime plort"
	icon_state = "purple slime extract"
	price_tag = 1200

/obj/item/slime_extract/darkpurple
	name = "dark purple slime plort"
	icon_state = "dark purple slime extract"
	price_tag = 1400

/obj/item/slime_extract/orange
	name = "orange slime plort"
	icon_state = "orange slime extract"
	price_tag = 1000

/obj/item/slime_extract/yellow
	name = "yellow slime plort"
	icon_state = "yellow slime extract"
	price_tag = 1200

/obj/item/slime_extract/red
	name = "red slime plort"
	icon_state = "red slime extract"
	price_tag = 1300

/obj/item/slime_extract/blue
	name = "blue slime plort"
	icon_state = "blue slime extract"
	price_tag = 1500

/obj/item/slime_extract/darkblue
	name = "dark blue slime plort"
	icon_state = "dark blue slime extract"
	price_tag = 1600

/obj/item/slime_extract/pink
	name = "pink slime plort"
	icon_state = "pink slime extract"
	price_tag = 1700

/obj/item/slime_extract/green
	name = "green slime plort"
	icon_state = "green slime extract"
	price_tag = 1800

/obj/item/slime_extract/lightpink
	name = "light pink slime plort"
	icon_state = "light pink slime extract"
	price_tag = 2000

/obj/item/slime_extract/black
	name = "black slime plort"
	icon_state = "black slime extract"
	price_tag = 2100

/obj/item/slime_extract/oil
	name = "oil slime plort"
	icon_state = "oil slime extract"
	price_tag = 2200

/obj/item/slime_extract/adamantine
	name = "adamantine slime plort"
	icon_state = "adamantine slime extract"
	price_tag = 2500

/obj/item/slime_extract/bluespace
	name = "bluespace slime plort"
	icon_state = "bluespace slime extract"
	price_tag = 2750

/obj/item/slime_extract/bluespace/New()
	..()
	item_flags |= BLUESPACE

/obj/item/slime_extract/pyrite
	name = "pyrite slime plort"
	icon_state = "pyrite slime extract"
	price_tag = 3000

/obj/item/slime_extract/cerulean
	name = "cerulean slime plort"
	icon_state = "cerulean slime extract"
	price_tag = 3500

/obj/item/slime_extract/sepia
	name = "sepia slime plort"
	icon_state = "sepia slime extract"
	price_tag = 5000

/obj/item/slime_extract/rainbow
	name = "rainbow slime plort"
	icon_state = "rainbow slime extract"
	price_tag = 8000
