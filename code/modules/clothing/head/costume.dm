/*Animals*/

/obj/item/clothing/head/costume/animal/ian
	name = "ian hood"
	desc = "A hood resembling the famous space corgi."
	icon_state = "ian"
	item_state = "ian"
	flags_inv = BLOCKHAIR
	body_parts_covered = HEAD

/obj/item/clothing/head/costume/animal/lobster
	name = "lobster head"
	desc = "A mask resembling a giant lobster."
	icon_state = "lobster"
	item_state = "lobster"
	flags_inv = BLOCKHAIR
	body_parts_covered = HEAD

/obj/item/clothing/head/costume/animal/chicken
	name = "chicken head"
	desc = "Bkaw!"
	icon_state = "chickenhead"
	item_state = "chickenhead"
	flags_inv = BLOCKHAIR
	body_parts_covered = HEAD

/obj/item/clothing/head/costume/animal/griffin
	name = "griffin head"
	desc = "A hood resembling the famous space corgi."
	icon_state = "griffinhat"
	item_state = "griffinhat"
	flags_inv = BLOCKHAIR
	body_parts_covered = HEAD

/obj/item/clothing/head/costume/animal/rabbitears
	name = "rabbit ears"
	desc = "A pair of rabbit ears, usually worn for sex appeal."
	icon_state = "bunny"
	body_parts_covered = 0

/obj/item/clothing/head/costume/animal/bunny
	name = "bunny head"
	desc = "A mask resembling a common bunny."
	icon_state = "rabbithead"
	flags_inv = BLOCKHAIR
	body_parts_covered = HEAD

/obj/item/clothing/head/costume/animal/carp
	name = "carp hood"
	desc = "A hood resembling a vicious space carp."
	icon_state = "carp"
	item_state = "carp"
	flags_inv = BLOCKHAIR
	body_parts_covered = HEAD

/obj/item/clothing/head/costume/animal/rooster
	name = "rooster head"
	desc = "A rubber rooster mask. Feels a bit maniacal somehow."
	icon_state = "richard"
	body_parts_covered = HEAD|FACE
	flags_inv = BLOCKHAIR

/obj/item/clothing/head/costume/animal/kitty
	name = "kitty ears"
	desc = "A pair of kitty ears. Meow!"
	icon_state = "kitty"
	body_parts_covered = 0
	siemens_coefficient = 1.5
	item_icons = list()

/obj/item/clothing/head/costume/animal/kitty/equipped(mob/user, slot)
	if(slot == slot_head)
		update_icon(user)
	..()

/obj/item/clothing/head/costume/animal/kitty/update_icon(var/mob/living/carbon/human/user)
	if(!istype(user))
		return
	var/icon/ears = new/icon('icons/inventory/head/mob.dmi', "kitty")
	ears.Blend(user.hair_color, ICON_ADD)

	var/icon/earbit = new/icon('icons/inventory/head/mob.dmi', "kittyinner")
	ears.Blend(earbit, ICON_OVERLAY)

/*Halloween*/

/obj/item/clothing/head/costume/halloween/cardborg
	name = "cardborg helmet"
	desc = "A helmet made out of a box."
	icon_state = "cardborg_h"
	item_state = "cardborg_h"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/head/costume/halloween/flash
	name = "flash button"
	desc = "You will learn to fear the flash."
	icon_state = "flashsuit"
	item_state = "flashsuit"
	body_parts_covered = HEAD
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE
	body_parts_covered = HEAD|FACE|EYES
/obj/item/clothing/head/costume/halloween/skeleton
	name = "skeleton head"
	desc = "A hollow skull that covers the head. Hopefully fake."
	icon_state = "skully"
	item_state = "skully"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/head/costume/halloween/deathofficer
	name = "death officer cap"
	desc = "A sinister military cap that feels darkly authoritative."
	icon_state = "enclave"

/obj/item/clothing/head/costume/halloween/mad
	name = "mad scientist's wig"
	desc = "A hairstyle for only the truly insane."
	icon_state = "philosopher_wig"
	item_state_slots = list(
		slot_l_hand_str = "pwig",
		slot_r_hand_str = "pwig",
		)
	flags_inv = BLOCKHAIR
	siemens_coefficient = 2.0 //why is it so conductive?!
	body_parts_covered = 0

/obj/item/clothing/head/costume/halloween/pumpkin
	name = "carved pumpkin"
	desc = "A jack o' lantern! Believed to ward off evil spirits."
	icon_state = "hardhat0_pumpkin"//Could stand to be renamed
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EYES
	brightness_on = 2
	light_overlay = "helmet_light"
	w_class = ITEM_SIZE_NORMAL

/obj/item/clothing/head/costume/halloween/syndicate
	name = "red space-helmet replica"
	item_state_slots = list(
		slot_l_hand_str = "syndicate-helm-black-red",
		slot_r_hand_str = "syndicate-helm-black-red",
		)
	icon_state = "syndicate"
	desc = "A plastic replica of a bloodthirsty mercenary's space helmet, you'll look just like a real murderous criminal operative in this! This is a toy, it is not made for use in space!"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|BLOCKHAIR
	siemens_coefficient = 2.0
	body_parts_covered = HEAD|FACE|EYES
	item_flags = COVER_PREVENT_MANIPULATION

/obj/item/clothing/head/costume/halloween/witch
	name = "witch costume wig"
	desc = "Eeeee~heheheheheheh!"
	icon_state = "witch"
	flags_inv = BLOCKHEADHAIR
	siemens_coefficient = 2.0

/obj/item/clothing/head/collectable/gnome
	name = "gnome hat"
	desc = "Why do gnomes come out of our toilet? Maybe they're searching for money?"
	icon_state = "gnome_hat"
	body_parts_covered = 0

/obj/item/clothing/head/costume/halloween/mummy
	name = "pharaoh crown"
	desc = "A dusty ornate crown of ancient striped design."
	icon_state = "pharoah_hat"
	flags_inv = BLOCKHAIR
	siemens_coefficient = 2.0

/obj/item/clothing/head/costume/halloween/scarecrow
	name = "scarecrow hat"
	desc = "A battered straw hat. It's seen better days."
	icon_state = "scarecrow"

/obj/item/clothing/head/costume/halloween/xenos
	name = "xenos helmet"
	icon_state = "xenos"
	item_state_slots = list(
		slot_l_hand_str = "xenos_helm",
		slot_r_hand_str = "xenos_helm",
		)
	desc = "A helmet made out of chitinous alien hide."
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|BLOCKHAIR
	siemens_coefficient = 2.0
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/head/costume/halloween/scream
	name = "Ghastly hood"
	desc = "A sleek, black hood - all the better to hide your identity when stalking through the night"
	icon_state = "ghosthood"
	flags_inv = BLOCKHAIR
	body_parts_covered = HEAD

/obj/item/clothing/head/costume/halloween/rando
	name = "warlord's helmet"
	desc = "A menacing, imposing and spiky helmet of a post-apocalyptic warlord. It conceals one's face quite well..."
	icon_state = "rando"
	item_state = "rando"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EYES


/*History*/

/obj/item/clothing/head/costume/history/anarchist_cap
	name = "anarchist cap"
	desc = "A black styled piss-cover with a white skull symbol on the front of it. Mother Anarchy loves her sons.."
	icon_state = "anarchist_cap"

/obj/item/clothing/head/costume/history/anarchist
	name = "black papakha"
	desc = "A black dyed-fur hat with a white skull symbol on the front of it. Mother Anarchy is not for sale.."
	icon_state = "anarchist"
	body_parts_covered = 0

/obj/item/clothing/head/costume/history/pirate
	name = "pirate hat"
	desc = "Yarr."
	icon_state = "pirate"
	body_parts_covered = 0

/obj/item/clothing/head/costume/history/piratecap
	name = "pirate hat"
	desc = "Yarr."
	icon_state = "hgpiratecap"
	body_parts_covered = 0

/obj/item/clothing/head/costume/history/plaguedoctor
	name = "plague doctor's hat"
	desc = "These were once used by Plague doctors. They're pretty much useless."
	icon_state = "plaguedoctor"
	permeability_coefficient = 0.01
	siemens_coefficient = 0.9
	body_parts_covered = 0

/obj/item/clothing/head/costume/history/powdered
	name = "powdered wig"
	desc = "A powdered wig."
	icon_state = "pwig"
	item_state = "pwig"

/obj/item/clothing/head/costume/history/napoleonic
	name = "napoleonic tricorne"
	icon_state = "redcoat"
	desc = "A triangular cap of quite old-fashioned design."

/obj/item/clothing/head/costume/history/jester
	name = "street jester hat"
	icon_state = "jester1"
	desc = "The merry jangly hat of a street jester."

/obj/item/clothing/head/costume/history/jester/court
	name = "court jester hat"
	icon_state = "jester2"
	desc = "The extravagant jangly hat of a court jester."

/obj/item/clothing/head/costume/livesey
	name = "naval surgeon tricorne"
	desc = "A tricorne worn by naval surgeons of antiquity, complete with an advocate wig."
	icon_state = "livesey"
	flags_inv = HIDEEARS|BLOCKHAIR

/*Job*/

/obj/item/clothing/head/costume/job/mailman
	name = "mail cap"
	icon_state = "mailman"
	desc = "A blue cap worn by the long-defunct local mail service."
	body_parts_covered = 0

/obj/item/clothing/head/costume/job/nun
	name = "nun hood"
	desc = "Maximum piety in this star system."
	icon_state = "nun_hood"
	flags_inv = BLOCKHAIR
	body_parts_covered = HEAD

/obj/item/clothing/head/costume/job/nun/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["default nun hood"] = "nun_hood"
	options["sine cornette"] = "sine_cornette"
	options["sine cornette switched"] = "sine_cornette_switched"
	options["sine cornette switched alternative"] = "sine_cornette_switched_alternative"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1


/obj/item/clothing/head/costume/job/police
	name = "police cap"
	desc = "A blue cap traditionally worn by city police."
	icon_state = "retropolice"
	flags_inv = BLOCKHAIR
	body_parts_covered = HEAD

/obj/item/clothing/head/costume/job/nurse
	name = "nurse's hat"
	desc = "It allows quick identification of trained medical personnel."
	icon_state = "nursehat"
	siemens_coefficient = 0.9
	body_parts_covered = 0

/*Misc*/

/obj/item/clothing/head/costume/misc/paper
	name = "paper hat"
	icon_state = "paper"
	desc = "A flimsy paper hat. Probably better than nothing."
	flags_inv = 0
	body_parts_covered = 0

/obj/item/clothing/head/costume/misc/santa
	name = "santa hat"
	desc = "A festive red hat. Merry Christmas!"
	icon_state = "santahat"
	item_state = "santahat"
	flags_inv = BLOCKHAIR
	body_parts_covered = HEAD

/obj/item/clothing/head/costume/misc/santa/elf
	name = "elf hat"
	desc = "A festive green hat worn by the minions of Santa."
	icon_state = "santahatgreen"
	item_state = "santahatgreen"
	flags_inv = BLOCKHAIR
	body_parts_covered = HEAD

/obj/item/clothing/head/costume/misc/festive
	name = "festive paper hat"
	icon_state = "xmashat"
	desc = "A crappy paper hat that you are REQUIRED to wear."
	flags_inv = 0
	body_parts_covered = 0

/obj/item/clothing/head/costume/misc/petehat
	name = "cuban pete's hat"
	desc = "A replica of the hat worn by the infamous Cuban Pete."
	icon_state = "petehat"

/obj/item/clothing/head/costume/misc/rainbow
	name = "rainbow cap"
	initial_name = "rainbow cap"
	desc = "A peaked cap in a bright array of colors."
	icon_state = "rainbowsoft"

/obj/item/clothing/head/costume/misc/snowman
	name = "snowman head"
	desc = "A festive ball of white styrofoam."
	icon_state = "snowman"
	item_state = "snowman"
	flags_inv = BLOCKHAIR
	body_parts_covered = HEAD

/obj/item/clothing/head/costume/misc/cueball
	name = "cueball helmet"
	desc = "A large, featureless white orb worn on the head. Hard to see through!"
	icon_state = "cueball"
	item_state= "cueball"
	body_parts_covered = HEAD

/obj/item/clothing/head/costume/misc/cueball/electric
	name = "electric cueball helmet"
	desc = "A large, featureless white orb that gives you an electric presence."
	icon_state = "cueballelectric"
	item_state= "cueballelectric"
	body_parts_covered = HEAD

/obj/item/clothing/head/costume/misc/fishbowl
	name = "fishbowl helmet"
	desc = "A large, featureless clear orb worn on the head. Reminds you of fish!"
	icon_state = "fishbowl"
	item_state= "fishbowl"
	body_parts_covered = HEAD|FACE

/obj/item/clothing/head/costume/misc/justice
	name = "red justice helm"
	desc = "The helm of the heroic red justice ranger."
	icon_state = "justicered"
	flags_inv = BLOCKHAIR
	body_parts_covered = HEAD|EYES

/obj/item/clothing/head/costume/misc/justice/blue
	name = "blue justice helm"
	desc = "The helm of the cunning blue justice ranger."
	icon_state = "justiceblue"

/obj/item/clothing/head/costume/misc/justice/yellow
	name = "yellow justice helm"
	desc = "The helm of the mighty yellow justice ranger."
	icon_state = "justiceyellow"

/obj/item/clothing/head/costume/misc/justice/green
	name = "green justice helm"
	desc = "The helm of the nervous green justice ranger."
	icon_state = "justicegreen"

/obj/item/clothing/head/costume/misc/justice/pink
	name = "pink justice helm"
	desc = "The helm of the supportive pink justice ranger."
	icon_state = "justicepink"

/obj/item/clothing/head/costume/misc/hastur
	name = "hastur hood"
	desc = "An extremely stylish hood."
	icon_state = "hasturhood"
	flags_inv = BLOCKHAIR
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/head/costume/misc/cake
	name = "cake-hat"
	desc = "It's tasty looking!"
	icon_state = "cake0"
	item_state = "cake0"
	var/onfire = 0
	body_parts_covered = HEAD

/obj/item/clothing/head/costume/misc/cake/Process()
	if(!onfire)
		STOP_PROCESSING(SSobj, src)
		return

	var/turf/location = src.loc
	if(istype(location, /mob/))
		var/mob/living/carbon/human/M = location
		if(M.l_hand == src || M.r_hand == src || M.head == src)
			location = M.loc

	if (istype(location, /turf))
		location.hotspot_expose(700, 1)

/obj/item/clothing/head/costume/misc/cake/attack_self(mob/user as mob)
	src.onfire = !( src.onfire )
	if (src.onfire)
		src.force = 3
		src.damtype = BURN
		src.icon_state = "cake1"
		src.item_state = "cake1"
		START_PROCESSING(SSobj, src)
	else
		src.force = null
		src.damtype = BRUTE
		src.icon_state = "cake0"
		src.item_state = "cake0"
	return

/* Magic! */

/obj/item/clothing/head/mage_hat
	name = "magic hat"
	desc = "A dark hat with a blue ribbon warn by people that do magic tricks or other slight of hand."
	icon_state = "mage_hat"
	item_state = "mage_hat"


