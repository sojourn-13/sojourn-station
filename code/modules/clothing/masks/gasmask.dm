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
	armor = list(
		melee = 0,
		bullet = 0,
		energy = 0,
		bomb = 0,
		bio = 75,
		rad = 0
	)
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
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/mask/gas/ihs
	name = "security gasmask"
	icon_state = "IHSgasmask"
	siemens_coefficient = 0.7
	body_parts_covered = FACE|EYES
	price_tag = 40

/obj/item/clothing/mask/gas/tactical
	name = "tactical mask"
	desc = "A close-fitting tactical mask that can be connected to an air supply."
	icon_state = "swat"
	siemens_coefficient = 0.7
	price_tag = 50

/obj/item/clothing/mask/gas/death_commando
	name = "death commando mask"
	icon_state = "death_commando_mask"
	item_state = "death_commando_mask"
	siemens_coefficient = 0.2

/obj/item/clothing/mask/gas/cyborg
	name = "cyborg visor"
	desc = "Beep boop."
	icon_state = "death"

/obj/item/clothing/mask/gas/industrial
	name = "industrial gas mask"
	desc = "An industrial gas mask designed for heavy usage."
	icon_state = "gas_wide"
	armor = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 80, rad = 0)

/obj/item/clothing/mask/gas/old
	name = "enviro gas mask"
	desc = "An archaic gas mask still widely available due to its mass production."
	icon_state = "gas_old"
	armor = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 70, rad = 0)

/obj/item/clothing/mask/gas/opifex
	name = "opifex gas mask"
	desc = "An archaic gas mask used commonly by opifex to filter out oxygen and other biohazards. They'll slowly die without wearing this, as will any other race that dons this mask."
	icon_state = "gas_mask_opi"
	item_state = "gas_mask_opi"
	armor = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 80, rad = 0)
	filtered_gases = list("plasma", "sleeping_agent", "oxygen")
	var/mask_open = FALSE	// Controls if the Opifex can eat through this mask
	action_button_name = "Toggle Feeding Port"

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