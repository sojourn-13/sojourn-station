/*
 * Defines the helmets, gloves and shoes for rigs.
 */

/obj/item/clothing/head/helmet/space/rig
	name = "helmet"
	item_flags = 		 THICKMATERIAL|COVER_PREVENT_MANIPULATION
	flags_inv = 		 HIDEEARS|HIDEEYES|HIDEFACE|BLOCKHAIR
	overslot = TRUE
	body_parts_covered = HEAD|FACE|EYES
	heat_protection =    HEAD|FACE|EYES
	cold_protection =    HEAD|FACE|EYES
	brightness_on = 4
	max_upgrades = 0 //RIG modules are upgraded, not the rig pieces
	matter = list(MATERIAL_STEEL = 1)

/obj/item/clothing/head/helmet/space/rig/refresh_upgrades()
	..()
	if(ishuman(loc))
		var/mob/living/carbon/human/H = loc
		if(istype(H.back, /obj/item/rig))
			var/obj/item/rig/R = H.back
			R.updateArmor()

/obj/item/clothing/gloves/rig
	name = "gauntlets"
	item_flags = THICKMATERIAL|COVER_PREVENT_MANIPULATION
	overslot = TRUE
	body_parts_covered = ARMS
	heat_protection =    ARMS
	cold_protection =    ARMS
	species_restricted = null
	gender = PLURAL
	matter = list(MATERIAL_STEEL = 1)

/obj/item/clothing/gloves/rig/refresh_upgrades()
	..()
	if(ishuman(loc))
		var/mob/living/carbon/human/H = loc
		if(istype(H.back, /obj/item/rig))
			var/obj/item/rig/R = H.back
			R.updateArmor()

/obj/item/clothing/shoes/magboots/rig
	name = "boots"
	item_flags = COVER_PREVENT_MANIPULATION
	body_parts_covered = LEGS
	cold_protection = LEGS
	heat_protection = LEGS
	species_restricted = null
	gender = PLURAL
	icon_base = null
	matter = list(MATERIAL_STEEL = 1)
	can_hold_knife = TRUE

/obj/item/clothing/shoes/magboots/rig/refresh_upgrades()
	..()
	if(ishuman(loc))
		var/mob/living/carbon/human/H = loc
		if(istype(H.back, /obj/item/rig))
			var/obj/item/rig/R = H.back
			R.updateArmor()

/obj/item/clothing/suit/space/rig
	name = "chestpiece"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	heat_protection =    UPPER_TORSO|LOWER_TORSO
	cold_protection =    UPPER_TORSO|LOWER_TORSO
	flags_inv =          HIDEJUMPSUIT|HIDETAIL
	item_flags =         STOPPRESSUREDAMAGE|THICKMATERIAL|AIRTIGHT|COVER_PREVENT_MANIPULATION
	slowdown = 0
	overslot = TRUE
	breach_threshold = 5
	resilience = 0.087
	can_breach = 1
	supporting_limbs = list()
	retract_while_active = TRUE
	extra_allowed = list(/obj/item/storage/backpack)
	max_upgrades = 0 //RIG modules are upgraded, not the rig pieces
	matter = list(MATERIAL_STEEL = 1)

/obj/item/clothing/suit/space/rig/refresh_upgrades()
	..()
	if(ishuman(loc))
		var/mob/living/carbon/human/H = loc
		if(istype(H.back, /obj/item/rig))
			var/obj/item/rig/R = H.back
			R.updateArmor()

//TODO: move this to modules
/obj/item/clothing/head/helmet/space/rig/proc/prevent_track()
	return FALSE

/obj/item/clothing/gloves/rig/Touch(atom/A, proximity)

	if(!A || !proximity)
		return FALSE

	var/mob/living/carbon/human/H = loc
	if(!istype(H) || !H.back)
		return FALSE

	var/obj/item/rig/suit = H.back
	if(!suit || !istype(suit) || !suit.installed_modules.len)
		return FALSE

	for(var/obj/item/rig_module/module in suit.installed_modules)
		if(module.active && module.activates_on_touch)
			if(module.engage(A))
				return TRUE

	return FALSE

//Rig pieces for non-spacesuit based rigs

/obj/item/clothing/head/lightrig
	name = "mask"
	body_parts_covered = HEAD|FACE|EYES
	heat_protection =    HEAD|FACE|EYES
	cold_protection =    HEAD|FACE|EYES
	flags =              THICKMATERIAL|AIRTIGHT|COVER_PREVENT_MANIPULATION
	matter = list(MATERIAL_STEEL = 1)

/obj/item/clothing/head/lightrig/refresh_upgrades()
	..()
	if(ishuman(loc))
		var/mob/living/carbon/human/H = loc
		if(istype(H.back, /obj/item/rig))
			var/obj/item/rig/R = H.back
			R.updateArmor()

/obj/item/clothing/suit/lightrig
	name = "suit"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	heat_protection =    UPPER_TORSO|LOWER_TORSO
	cold_protection =    UPPER_TORSO|LOWER_TORSO
	flags_inv =          HIDEJUMPSUIT
	flags =              THICKMATERIAL|COVER_PREVENT_MANIPULATION
	extra_allowed = list(/obj/item/storage/backpack) //Light rigs are also allowed a backpack on their suit slot.
	matter = list(MATERIAL_STEEL = 1)

/obj/item/clothing/suit/lightrig/refresh_upgrades()
	..()
	if(ishuman(loc))
		var/mob/living/carbon/human/H = loc
		if(istype(H.back, /obj/item/rig))
			var/obj/item/rig/R = H.back
			R.updateArmor()

/obj/item/clothing/shoes/lightrig
	name = "boots"
	body_parts_covered = LEGS
	cold_protection = LEGS
	heat_protection = LEGS
	species_restricted = null
	gender = PLURAL
	matter = list(MATERIAL_STEEL = 1)

/obj/item/clothing/shoes/lightrig/refresh_upgrades()
	..()
	if(ishuman(loc))
		var/mob/living/carbon/human/H = loc
		if(istype(H.back, /obj/item/rig))
			var/obj/item/rig/R = H.back
			R.updateArmor()

/obj/item/clothing/gloves/lightrig
	name = "gloves"
	flags = THICKMATERIAL
	body_parts_covered = ARMS
	heat_protection =    ARMS
	cold_protection =    ARMS
	species_restricted = null
	gender = PLURAL
	matter = list(MATERIAL_STEEL = 1)

/obj/item/clothing/gloves/lightrig/refresh_upgrades()
	..()
	if(ishuman(loc))
		var/mob/living/carbon/human/H = loc
		if(istype(H.back, /obj/item/rig))
			var/obj/item/rig/R = H.back
			R.updateArmor()