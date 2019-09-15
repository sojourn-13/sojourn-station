/obj/item/clothing/mask/gas
	name = "gas mask"
	desc = "A face-covering mask that can be connected to an air supply. Filters harmful gases from the air."
	icon_state = "gas_alt"
	item_flags = BLOCK_GAS_SMOKE_EFFECT | AIRTIGHT
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE
	body_parts_covered = FACE|EYES
	w_class = ITEM_SIZE_NORMAL
	item_state = "gas_alt"
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	siemens_coefficient = 0.9
	var/gas_filter_strength = 1			//For gas mask filters
	var/list/filtered_gases = list("plasma", "sleeping_agent")
	armor = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 75, rad = 0)
	price_tag = 20

/obj/item/clothing/mask/gas/filter_air(datum/gas_mixture/air)
	var/datum/gas_mixture/filtered = new

	for(var/g in filtered_gases)
		if(air.gas[g])
			filtered.gas[g] = air.gas[g] * gas_filter_strength
			air.gas[g] -= filtered.gas[g]

	air.update_values()
	filtered.update_values()

	return filtered

//Plague Dr suit can be found in clothing/suits/bio.dm
/obj/item/clothing/mask/costume/history/plaguedoctor
	name = "plague doctor mask"
	desc = "A modernised version of the classic design, this mask will not only filter out plasma but it can also be connected to an air supply."
	icon_state = "plaguedoctor"
	item_state = "gas_mask"
	armor = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 90, rad = 0)
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/mask/gas/swat
	name = "\improper SWAT mask"
	desc = "A close-fitting tactical mask that can be connected to an air supply."
	icon_state = "swat"
	siemens_coefficient = 0.7
	body_parts_covered = FACE|EYES
	price_tag = 50

/obj/item/clothing/mask/gas/ihs
	name = "Ironhammer gasmask"
	icon_state = "IHSgasmask"
	siemens_coefficient = 0.7
	body_parts_covered = FACE|EYES
	price_tag = 40

/obj/item/clothing/mask/gas/syndicate
	name = "tactical mask"
	desc = "A close-fitting tactical mask that can be connected to an air supply."
	icon_state = "swat"
	siemens_coefficient = 0.7
	price_tag = 50

/obj/item/clothing/mask/costume/job/clown
	name = "clown mask"
	desc = "A true prankster's facial attire. A clown is incomplete without their wig and mask."
	icon_state = "clown"
	item_state = "clown_hat"

/obj/item/clothing/mask/costume/misc/rainbowclown
	name = "rainbow clown mask"
	desc = "A very colorful clown wig and mask."
	icon_state = "rainbowclown"
	item_state = "rainbowclown"

/obj/item/clothing/mask/costume/kinky/sexy_clown
	name = "sexy clown mask"
	desc = "A feminine clown mask for the dabbling crossdressers or female entertainers."
	icon_state = "sexyclown"
	item_state = "sexyclown"

/obj/item/clothing/mask/costume/job/mime
	name = "mime mask"
	desc = "The traditional mime's mask. It has an eerie facial posture."
	icon_state = "mime"
	item_state = "mime"

/obj/item/clothing/mask/costume/animal/monkey
	name = "monkey mask"
	desc = "A mask used when acting as a monkey."
	icon_state = "monkeymask"
	item_state = "monkeymask"
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/mask/costume/animal/rat
	name = "rat mask"
	desc = "A mask made of soft vinyl and latex, representing the head of a rat."
	icon_state = "rat"
	item_state = "rat"
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/mask/costume/animal/fox
	name = "fox mask"
	desc = "A mask made of soft vinyl and latex, representing the head of a fox."
	icon_state = "fox"
	item_state = "fox"
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/mask/costume/animal/bee
	name = "bee mask"
	desc = "A mask made of soft vinyl and latex, representing the head of a bee."
	icon_state = "bee"
	item_state = "bee"
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/mask/costume/animal/bear
	name = "bear mask"
	desc = "A mask made of soft vinyl and latex, representing the head of a bear."
	icon_state = "bear"
	item_state = "bear"
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/mask/costume/animal/frog
	name = "frog mask"
	desc = "A mask made of soft vinyl and latex, representing the head of a frog."
	icon_state = "frog"
	item_state = "frog"

/obj/item/clothing/mask/costume/animal/bat
	name = "bat mask"
	desc = "A mask made of soft vinyl and latex, representing the head of a bat."
	icon_state = "bat"
	item_state = "bat"
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/mask/costume/animal/raven
	name = "raven mask"
	desc = "A mask made of soft vinyl and latex, representing the head of a raven."
	icon_state = "raven"
	item_state = "raven"
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/mask/costume/animal/jackal
	name = "jackal mask"
	desc = "A mask made of soft vinyl and latex, representing the head of a jackal."
	icon_state = "jackal"
	item_state = "jackal"
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/mask/costume/kinky/sexy_mime
	name = "sexy mime mask"
	desc = "A traditional female mime's mask."
	icon_state = "sexymime"
	item_state = "sexymime"

/obj/item/clothing/mask/gas/death_commando
	name = "Death Commando Mask"
	icon_state = "death_commando_mask"
	item_state = "death_commando_mask"
	siemens_coefficient = 0.2

/obj/item/clothing/mask/gas/cyborg
	name = "cyborg visor"
	desc = "Beep boop."
	icon_state = "death"

/obj/item/clothing/mask/costume/animal/owl
	name = "owl mask"
	desc = "Twoooo!"
	icon_state = "owl"
	body_parts_covered = HEAD|FACE|EYES
