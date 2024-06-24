/obj/item/bottle_kit
	name = "Bottling Kit"
	desc = "A box that holds glasses fabricators, lables, caps and quarks ready for home brewing and bottling."
	icon = 'icons/obj/objects.dmi'
	icon_state = "bottler_box"
	w_class = ITEM_SIZE_NORMAL
	matter = list(MATTER_STEEL = 10, MATTER_GLASS = 10)
	var/glass_colour = "brew_bottle"
	var/fake_glass_name = "Kinda Blue"

/obj/item/bottle_kit/examine(mob/user)
	..()
	to_chat(user, "<span class='info'>Current Glass Bottle Printing Type: [fake_glass_name].</span>")


/obj/item/bottle_kit/attack_self(mob/user as mob)
	..()
	glass_picker(user)

/obj/item/bottle_kit/proc/glass_picker(mob/user as mob)
	var/list/options = list()
	options["Kinda Blue"] = "brew_bottle"
	options["Redish"] = "brew_red_bottle"
	options["Green-Adjcent"] = "brew_green_bottle"
	options["Scuffed Platium"] = "brew_white_bottle"
	options["Sorta Coal"] = "brew_coal_bottle"
	options["Maybe Bronze"] = "brew_fancy_bottle"
	options["Off-Amethyst"] = "brew_funky_bottle"
	options["Odd Sky Shade"] = "brew_sky_bottle"
	options["Washed Out Brass"] = "brew_saint_po_bottle"
	options["Faded Caramel"] = "brew_gold_bottle"
	options["Approximate Sea Shore"] = "brew_pianowoman_bottle"
	options["Faded Dust"] = "brew_noir_bottle"
	options["Close Honeycomb"] = "brew_bees_bottle"


	if(!options.len)
		to_chat(user, "<span class='info'>The bottle kit is limited to only normal blue bottles. Oh no!</span>")
		glass_colour = "brew_bottle"
		fake_glass_name = "Blue"
		return

	var/choice = input(user,"What colour do you pick?") as null|anything in options

	var/printing_choice = options[choice]

	if(!printing_choice)
		glass_colour = "brew_bottle"
		fake_glass_name = "Kinda Blue"
		return

	fake_glass_name = choice
	glass_colour = printing_choice

