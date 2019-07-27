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
