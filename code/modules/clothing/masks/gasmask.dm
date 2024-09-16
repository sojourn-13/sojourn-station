#define GAS_MASK_SANITY_COEFF_BUFF 1.7

/obj/item/clothing/mask/gas
	name = "gas mask"
	desc = "A face-covering mask that can be connected to an air supply. Filters harmful gases from the air along with most of the horrid smells."
	icon_state = "gas_mask"
	item_flags = BLOCK_GAS_SMOKE_EFFECT | AIRTIGHT
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE
	body_parts_covered = FACE|EYES
	w_class = ITEM_SIZE_NORMAL
	item_state = "gas_mask"
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	siemens_coefficient = 0.9
	var/gas_filter_strength = 1			//For gas mask filters
	var/list/filtered_gases = list("plasma", "sleeping_agent")
	armor_list = list(
		melee = 0,
		bullet = 0,
		energy = 0,
		bomb = 0,
		bio = 75,
		rad = 0
	)
	price_tag = 20
	muffle_voice = FALSE
	var/is_alts = TRUE

/obj/item/clothing/mask/gas/New()
	..()
	AddComponent(/datum/component/clothing_sanity_protection, GAS_MASK_SANITY_COEFF_BUFF)

/obj/item/clothing/mask/gas/attackby(obj/item/W, mob/user)
	if(istype(W, /obj/item/tool/screwdriver))
		to_chat(user, SPAN_NOTICE("[user] alters the voice transmitter in [src]."))
		src.muffle_voice = !src.muffle_voice

/obj/item/clothing/mask/gas/filter_air(datum/gas_mixture/air)
	var/datum/gas_mixture/filtered = new

	for(var/g in filtered_gases)
		if(air.gas[g])
			filtered.gas[g] = air.gas[g] * gas_filter_strength
			air.gas[g] -= filtered.gas[g]

	air.update_values()
	filtered.update_values()

	return filtered


/obj/item/clothing/mask/gas/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	var/mob/M = usr
	if(!isliving(loc))
		return

	if(!is_alts)
		to_chat(M, "This mask has no alt icons or ways to change its filter...")
		return


	var/list/options = list()
	options["Base"] = "gas_mask"
	options["Alternative"] = "gas_alt"
	options["Kriosan"] = "kriosan_gasmask"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1 //Or you could just use this instead of making another subtype just for races

//Payday masks, clown alternatives, they function as gas masks.
/obj/item/clothing/mask/gas/dal
	name = "professional clown mask"
	desc = "A face-covering clown mask that hides your identity and functions as a gas mask. This one inspires great experience and cunning intelligence."
	icon_state = "dal"
	is_alts = FALSE

/obj/item/clothing/mask/gas/wolf
	name = "psychopathic clown mask"
	desc = "A face-covering clown mask that hides your identity and functions as a gas mask. This one inspires mood shifts and a desires to use explosives."
	icon_state = "wolf"
	is_alts = FALSE

/obj/item/clothing/mask/gas/hox
	name = "prisoner clown mask"
	desc = "A face-covering clown mask that hides your identity and functions as a gas mask. This one makes you feel as if your shackled yet always capable of escaping."
	icon_state = "hox"
	is_alts = FALSE

/obj/item/clothing/mask/gas/cha
	name = "daredevil clown mask"
	desc = "A face-covering clown mask that hides your identity and functions as a gas mask. This one makes you feel like you should use bullets, a fuckton of bullets and probably a boot knife too."
	icon_state = "cha"
	is_alts = FALSE

/obj/item/clothing/mask/gas/artist_hat
	name = "Spooky Rebreather"
	desc = "Wearing this makes you feel awesome - seeing someone else wearing this makes them look like a loser."
	icon_state = "artist"
	item_state = "artist_hat"
	var/list/states = list("True Form" = "artist", "The clown" = "clown",
	"The mime" = "mime", "The Feminist" = "sexyclown", "The Madman" = "joker",
	"The Rainbow Color" = "rainbow", "The Monkey" = "monkeymask", "The Owl" = "owl")
	muffle_voice = FALSE
	is_alts = FALSE

/obj/item/clothing/mask/gas/artist_hat/attack_self(mob/user)
	var/choice = input(user, "To what form do you wish to morph this mask?","Morph Mask") as null|anything in states

	if(src && choice && !user.incapacitated() && Adjacent(user))
		icon_state = states[choice]
		to_chat(user, "Your mask has now morphed into [choice]!")
		return TRUE

/obj/item/clothing/mask/gas/clown_hat
	name = "clown wig and mask"
	desc = "A true prankster's facial attire. A clown is incomplete without their wig and mask. This one contains hologram tech that allows it to change its appearence."
	icon_state = "clown"
	item_state = "clown_hat"
	muffle_voice = FALSE
	is_alts = FALSE

/obj/item/clothing/mask/gas/clown_hat/attack_self(mob/user)
	var/list/options = list()
	options["True Form"] = "clown"
	options["The Feminist"] = "sexyclown"
	options["The Madman"] = "joker"
	options["The Rainbow"] ="rainbow"

	var/choice = input(user, "To what form do you wish to morph this mask?","Morph Mask") as null|anything in options

	if(src && choice && !user.incapacitated() && Adjacent(user))
		icon_state = options[choice]
		to_chat(user, "Your Clown Mask has now morphed into [choice], all praise the Honk Mother!")
		return TRUE

//Plague Dr suit can be found in clothing/suits/bio.dm
/obj/item/clothing/mask/costume/history/plaguedoctor
	name = "plague doctor mask"
	desc = "A modernised version of the classic design, this mask will not only filter out plasma but it can also be connected to an air supply."
	icon_state = "plaguedoctor"
	item_state = "plaguedoctor"
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/mask/gas/ihs
	name = "security gasmask"
	icon_state = "IHSgasmask"
	siemens_coefficient = 0.7
	body_parts_covered = FACE|EYES
	price_tag = 40
	is_alts = FALSE

/obj/item/clothing/mask/gas/ihs/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Sec gasmask"] = "IHSgasmask"
	options["Xeno Sec Gasmask"] = "IHSgasmask_a"
	options["Extended Xeno Sec Gasmask"] = "IHSgasmask_k"


	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1 //Or you could just use this instead of making another subtype just for races

/obj/item/clothing/mask/gas/tactical
	name = "tactical mask"
	desc = "A close-fitting tactical mask that can be connected to an air supply."
	icon_state = "swat"
	siemens_coefficient = 0.7
	price_tag = 50
	is_alts = FALSE

/obj/item/clothing/mask/gas/germanmask
	name = "church gas mask"
	desc = "A close-fitting tactical mask that can be connected to an air supply. Best for when you need to get out of here. This one bears a small tau cross, noting it as a church branded design."
	icon_state = "germangasmask"
	siemens_coefficient = 0.7
	price_tag = 50
	is_alts = FALSE

/obj/item/clothing/mask/gas/death_commando
	name = "death commando mask"
	icon_state = "death_commando_mask"
	item_state = "death_commando_mask"
	siemens_coefficient = 0.2
	is_alts = FALSE

/obj/item/clothing/mask/gas/cyborg
	name = "cyborg visor"
	desc = "Beep boop."
	icon_state = "death"
	is_alts = FALSE

/obj/item/clothing/mask/gas/blackshield_gasmask
	name = "tactical camo gas mask"
	desc = "A camouflaged gas mask, helps the user blend in with the enviroment while keeping harmful gasses at bay."
	icon_state = "gas_bs"

/obj/item/clothing/mask/gas/blackshield_gasmask/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Base"] = "gas_bs"
	options["Desert Sands Blue Eyes"] = "gas_bs_alt"
	options["Green Forest Amber Eyes"] = "gas_mil"
	options["Desert Sands Amber Eyes"] = "gas_mil_alt"
	options["Black Night Amber Eyes"] = "gas_black"
	options["Industrial Black"] = "s10_plain"
	options["Industrial Black Blue Eyes"] = "s10_blue"
	options["Industrial Black Red Eyes"] = "s10_red"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1 //Or you could just use this instead of making another subtype just for races


//Sprite by INFRARED_BARON
/obj/item/clothing/mask/gas/big_shot
	name = "trader mask"
	desc = "A mask used by salesperson."
	icon_state = "big_shot"
	is_alts = FALSE

//Sprite by INFRARED_BARON
/obj/item/clothing/mask/gas/colony
	name = "jester mask"
	desc = "A green wig and colourful mask to make anyone smile."
	icon_state = "colony"
	is_alts = FALSE

/obj/item/clothing/mask/gas/industrial
	name = "industrial gas mask"
	desc = "An industrial gas mask designed for heavy usage."
	icon_state = "gas_wide"
	armor_list = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 80, rad = 0)
	is_alts = FALSE

/obj/item/clothing/mask/gas/old
	name = "enviro gas mask"
	desc = "An archaic gas mask still widely available due to its mass production."
	icon_state = "gas_old"
	armor_list = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 70, rad = 0)
	is_alts = FALSE

/obj/item/clothing/mask/gas/bigguy
	name = "compact rebreather"
	desc = "A small, Lonestar-brand rebreather designed to regulate the flux of gasses fed to its user. Taking it off will not make you die...unless you're in a non-breathable environment." // It won't be extremely painful either. - Seb
	flags_inv = BLOCKFACEHAIR
	body_parts_covered = FACE
	icon_state = "bane"
	is_alts = FALSE

/obj/item/clothing/mask/gas/artificer
	name = "artificer's gas mask"
	desc = "An industrial gas mask bearing the colors of the artificer's guild."
	icon_state = "gas_guild" // Sprites by Ezoken/Dromkii
	armor_list = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 60, rad = 80)
	is_alts = FALSE

/obj/item/clothing/mask/gas/guild_rebreather
	name = "artificer's rebreather"
	desc = "An industrial gas mask bearing the colors of the artificer's guild."
	icon_state = "bane_guild" // Sprites by Ezoken/Dromkii
	armor_list = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 30, rad = 40) // Half coverage, half bonuses.
	flags_inv = BLOCKFACEHAIR
	body_parts_covered = FACE
	is_alts = FALSE

/obj/item/clothing/mask/gas/opifex
	name = "opifex gas mask"
	desc = "An archaic gas mask used commonly by opifex to filter out oxygen and other biohazards. They'll slowly die without wearing this, as will any other race that dons this mask."
	icon_state = "gas_mask_opi"
	item_state = "gas_mask_opi"
	armor_list = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 80, rad = 0)
	filtered_gases = list("plasma", "sleeping_agent", "oxygen")
	var/mask_open = FALSE	// Controls if the Opifex can eat through this mask
	action_button_name = "Toggle Feeding Port"
	is_alts = FALSE

/obj/item/clothing/mask/gas/opifex/proc/feeding_port(mob/user)
	if(user.canmove && !user.stat)
		mask_open = !mask_open
		if(mask_open)
			body_parts_covered = EYES
			to_chat(user, "Your mask moves to allow you to eat.")
		else
			body_parts_covered = FACE|EYES
			to_chat(user, "Your mask moves to cover your mouth.")
	return

/obj/item/clothing/mask/gas/opifex/attack_self(mob/user)
	feeding_port(user)
	..()

/obj/item/clothing/mask/gas/opifex/alt_mask
	name = "opifex gas mask"
	desc = "An archaic gas mask is used commonly by opifex to filter out oxygen and other biohazards. This one is outfitted to more long beaks."
	icon_state = "gas_mask_opi_san"
	item_state = "gas_mask_opi_san"

/obj/item/clothing/mask/opifex_no_mask
	name = "opifex gas synthetizer"
	desc = "A newly advanced gas synthesizer is used commonly by opifex to filter oxygen from their lungs, being able to feed and eat any moment they wish with their beak exposed. They'll slowly die without wearing this, as will any other race that uses this device."
	icon_state = "gas_mask_free_beak"
	item_state = "gas_mask_free_beak"
	armor_list = list(melee = 0, bullet = 0, energy = 1, bomb = 5, bio = 0, rad = 15)
	var/list/filtered_gases = list("plasma", "sleeping_agent", "oxygen")
	var/gas_filter_strength = 1			//For gas mask filters
	item_flags = AIRTIGHT
	w_class = ITEM_SIZE_SMALL
	body_parts_covered = EYES //We only care about the eyes.
	cold_protection = 0.5 //Instead of giving gas protection, it gives you other types of protection
	heat_protection = 0.5
	gas_transfer_coefficient = 0.001
	permeability_coefficient = 0.001
	siemens_coefficient = 0.001

/obj/item/clothing/mask/opifex_no_mask/filter_air(datum/gas_mixture/air)
	var/datum/gas_mixture/filtered = new

	for(var/g in filtered_gases)
		if(air.gas[g])
			filtered.gas[g] = air.gas[g] * gas_filter_strength
			air.gas[g] -= filtered.gas[g]

	air.update_values()
	filtered.update_values()

	return filtered

/obj/item/clothing/mask/gas/bigguy/sleekguy
	name = "sleek grey rebreather"
	desc = "A small, Soteria-brand rebreather designed to regulate the flux of gasses fed to its user." // take that Lonestar, no longer will you have a monopoly on cool facewear -Mus
	icon_state = "srebreath"

/obj/item/clothing/mask/gas/bigguy/sleekblueguy
	name = "sleek blue rebreather"
	desc = "A small, Soteria-brand rebreather designed to regulate the flux of gasses fed to its user. This one is blue and has a Soteria Medical marking"
	icon_state = "srebreath_blue"

/obj/item/clothing/mask/gas/bigguy/sleekgoldguy
	name = "sleek gold rebreather"
	desc = "A small, Soteria-brand rebreather designed to regulate the flux of gasses fed to its user. This one is gold and has a Lonestar marking."
	icon_state = "srebreath_gold"

/obj/item/clothing/mask/gas/bigguy/sleekorangeguy
	name = "sleek orange rebreather"
	desc = "A small, Soteria-brand rebreather designed to regulate the flux of gasses fed to its user. This one is orange and has a Guild marking."
	icon_state = "srebreath_orange"

/obj/item/clothing/mask/gas/bigguy/sleekmarshalguy
	name = "sleek marshal rebreather"
	desc = "A small, Soteria-brand rebreather designed to regulate the flux of gasses fed to its user. This one carries the Marshal colors and has thicker filters."
	icon_state = "srebreath_marshal"

/obj/item/clothing/mask/gas/bigguy/sleekpurpleguy
	name = "sleek purple rebreather"
	desc = "A small, Soteria-brand rebreather designed to regulate the flux of gasses fed to its user. This one is purple and has a Soteria Research marking."
	icon_state = "srebreath_purple"
