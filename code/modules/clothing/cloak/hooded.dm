//
/// General hooded code.
//

/obj/item/clothing/suit/hooded
	var/obj/item/clothing/head/hood/hood
	var/hoodtype = null //So other clothing can override this.

/obj/item/clothing/suit/hooded/New()
	MakeHood()
	..()

/obj/item/clothing/suit/hooded/Destroy()
	qdel(hood)
	return ..()

/obj/item/clothing/suit/hooded/proc/MakeHood()
	if(!hood && hoodtype)
		hood = new hoodtype(src)

/obj/item/clothing/suit/hooded/equipped(mob/M)
	..()

	if (is_held())
		retract()

	var/mob/living/carbon/human/H = M

	if(!istype(H)) return

	if(H.wear_suit != src)
		return

/obj/item/clothing/suit/hooded/dropped()
	..()
	retract()

/obj/item/clothing/suit/hooded/proc/retract()
	var/mob/living/carbon/human/H

	if(hood)
		H = hood.loc
		if(istype(H))
			if(hood && H.head == hood)
				H.drop_from_inventory(hood)
				hood.forceMove(src)
				if(hood.overslot)
					hood.remove_overslot_contents(H)

/obj/item/clothing/suit/hooded/verb/toggle_hood()

	set name = "Toggle Hood"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	if(!hood)
		usr << "There is no hood."
		return

	var/mob/living/carbon/human/H = usr

	if(!istype(H)) return
	if(H.stat) return
	if(H.wear_suit != src) return

	if(H.head == hood)
		H << SPAN_NOTICE("You lower your hood.")
		hood.canremove = 1
		H.drop_from_inventory(hood)
		hood.forceMove(src)
	else
		if(H.head)
			H << SPAN_DANGER("You cannot rise your hood while wearing \the [H.head].")
			return
		if(H.equip_to_slot_if_possible(hood, slot_head))
			hood.canremove = 0
			H << "<span class='info'>You rise your hood.</span>"

// Cloak Base
/obj/item/clothing/suit/hooded/cloak
	name = "cloak"
	icon_state = "cloak"
	desc = "A simple cloak."
	w_class = ITEM_SIZE_SMALL
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	flags_inv = HIDESUITSTORAGE
	hoodtype = /obj/item/clothing/head/hood/cloakhood

/obj/item/clothing/head/hood/cloakhood
	name = "cloak hood"
	icon_state = "cloak_hood"
	desc = "A hood from cloak. It hides away your eyes and head."
	flags_inv = HIDEEARS|HIDEEYES|BLOCKHEADHAIR
	body_parts_covered = HEAD|EARS|EYES

// To separate general cloaks away from department ones for loadout
/obj/item/clothing/suit/hooded/cloak/simple
	name = "dark cloak"

/obj/item/clothing/suit/hooded/cloak/simple/red
	name = "red cloak"
	icon_state = "redcloak"
	desc = "A simple dark-red cloak."
	hoodtype = /obj/item/clothing/head/hood/cloakhood/red

/obj/item/clothing/head/hood/cloakhood/red
	name = "red cloak hood"
	icon_state = "redcloak_hood"

/*Winter Coats*/
/obj/item/clothing/suit/hooded/wintercoat
	name = "winter coat"
	desc = "A heavy jacket designed for cold environments."
	icon_state = "coatwinter"
	item_state_slots = list(slot_r_hand_str = "coatwinter", slot_l_hand_str = "coatwinter")
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	armor_list = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 10, rad = 0)
	//hoodtype = /obj/item/clothing/head/hood/winter
	allowed = list (/obj/item/gun/projectile, /obj/item/gun/energy, /obj/item/device/flash, /obj/item/pen, /obj/item/paper, /obj/item/device/lighting/toggleable/flashlight,/obj/item/tank/emergency_oxygen, /obj/item/storage/fancy/cigarettes, /obj/item/storage/box/matches, /obj/item/reagent_containers/food/drinks/flask)

/obj/item/clothing/suit/hooded/wintercoat/captain
	name = "premier's winter coat"
	desc = "A heavy premier's jacket designed for cold environments. Hidden armor plating is sewn into it."
	icon_state = "coatcaptain"
	item_state_slots = list(slot_r_hand_str = "coatcaptain", slot_l_hand_str = "coatcaptain")
	armor_list = list(melee = 5, bullet = 3, energy = 2, bomb = 15, bio = 0, rad = 0)
	//hoodtype = /obj/item/clothing/head/hood/winter/captain

/obj/item/clothing/suit/hooded/wintercoat/security
	name = "security winter coat"
	desc = "A heavy security jacket designed for cold environments. Armor plating has been sewn into it."
	icon_state = "coatsecurity"
	item_state_slots = list(slot_r_hand_str = "coatsecurity", slot_l_hand_str = "coatsecurity")
	armor_list = list(melee = 6, bullet = 5, energy = 3, bomb = 20, bio = 0, rad = 0)
	//hoodtype = /obj/item/clothing/head/hood/winter/security

/obj/item/clothing/suit/hooded/wintercoat/medical
	name = "medical winter coat"
	desc = "A heavy medical jacket designed for cold environments. The inner lining has been treated with a biomesh, giving some resistance to biological hazards."
	icon_state = "coatmedical"
	item_state_slots = list(slot_r_hand_str = "coatmedical", slot_l_hand_str = "coatmedical")
	armor_list = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 50, rad = 0)
	//hoodtype = /obj/item/clothing/head/hood/winter/medical

/obj/item/clothing/suit/hooded/wintercoat/science
	name = "science winter coat"
	desc = "A heavy science jacket designed for cold environments."
	icon_state = "coatscience"
	item_state_slots = list(slot_r_hand_str = "coatscience", slot_l_hand_str = "coatscience")
	armor_list = list(melee = 0, bullet = 0, energy = 0, bomb = 10, bio = 0, rad = 0)
	//hoodtype = /obj/item/clothing/head/hood/winter/science

/obj/item/clothing/suit/hooded/wintercoat/engineering
	name = "artificer winter coat"
	desc = "A heavy artificer's guild jacket designed for cold environments. The material is somewhat resistant to radiation."
	icon_state = "coatengineer"
	item_state_slots = list(slot_r_hand_str = "coatengineer", slot_l_hand_str = "coatengineer")
	armor_list = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 0, rad = 20)
	//hoodtype = /obj/item/clothing/head/hood/winter/engineering

/obj/item/clothing/suit/hooded/wintercoat/engineering/atmos
	name = "atmospherics winter coat"
	desc = "A heavy atmospherics jacket designed for cold environments. This coat is quite old and doesn't seem to belong anywhere."
	icon_state = "coatatmos"
	item_state_slots = list(slot_r_hand_str = "coatatmos", slot_l_hand_str = "coatatmos")
	//hoodtype = /obj/item/clothing/head/hood/winter/engineering/atmos

/obj/item/clothing/suit/hooded/wintercoat/botany
	name = "botany winter coat"
	desc = "A heavy botany jacket designed for cold environments."
	icon_state = "coathydro"
	item_state_slots = list(slot_r_hand_str = "coathydro", slot_l_hand_str = "coathydro")
	//hoodtype = /obj/item/clothing/head/hood/winter/botany

/obj/item/clothing/suit/hooded/wintercoat/cargo
	name = "cargo winter coat"
	desc = "A heavy cargo jacket designed for cold environments."
	icon_state = "coatcargo"
	item_state_slots = list(slot_r_hand_str = "coatcargo", slot_l_hand_str = "coatcargo")
	//hoodtype = /obj/item/clothing/head/hood/winter/cargo

/obj/item/clothing/suit/hooded/wintercoat/cargo/miner
	name = "mining winter coat"
	desc = "A heavy mining jacket designed for cold environments. The leather is quite tough and provides a small amount of protection."
	icon_state = "coatminer"
	item_state_slots = list(slot_r_hand_str = "coatminer", slot_l_hand_str = "coatminer")
	armor_list = list(melee = 2, bullet = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
	//hoodtype = /obj/item/clothing/head/hood/winter/cargo/miner

/obj/item/clothing/suit/hooded/costume/techpriest
	name = "techpriest cloak"
	desc = "For larping as the other techno cult."
	icon_state = "techpriest"
	item_state = "techpriest"
	hoodtype = /obj/item/clothing/head/hood/techpriest

/obj/item/clothing/suit/hooded/costume/techpriest_explorator
	name = "explorator armor"
	desc = "For larping as the other techno cult. This time with armor, the metal platings provided decent protection, roughly on par with a hand made vest."
	icon_state = "explorator"
	item_state = "explorator"
	armor_list = list(melee = 7, bullet = 5, energy = 3, bomb = 10, bio = 15, rad = 5)
	hoodtype = /obj/item/clothing/head/hood/techpriest

/obj/item/clothing/suit/hooded/absolutecloak
	name = "absolutist cloak"
	icon_state = "absolutecloak"
	desc = "A simple charcoal cloak with gold livery for showing off your Absolute devotion. Comes with a large hood."
	w_class = ITEM_SIZE_SMALL
	armor_list = list(
		melee = 0,
		bullet = 0, //unarmoured, but bioproof
		energy = 0,
		bomb = 0,
		bio = 100,
		rad = 0
	)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	flags_inv = HIDESUITSTORAGE
	hoodtype = /obj/item/clothing/head/hood/absolutecloakhood
