/obj/item/organ_module/active/hud
	name = "Embedded Hud"
	desc = "If you see this hud in game, congratulation!"
	verb_name = "Activate Hud"
	icon_state = "hud"
	matter = list(MATERIAL_STEEL = 3, MATERIAL_GLASS = 2)
	allowed_organs = list(BP_HEAD)
	var/obj/item/clothing/glasses/holding = null
	var/holding_type = null

/obj/item/organ_module/active/hud/New()
	..()
	if(holding_type)
		holding = new holding_type(src)
		holding.canremove = 0

/obj/item/organ_module/active/hud/proc/deploy(mob/living/carbon/human/H, obj/item/organ/external/E)
	if(H.can_equip(holding, slot_glasses, disable_warning = FALSE, skip_item_check = FALSE, skip_covering_check = TRUE))
		H.equip_to_slot(holding, slot_glasses)
		H.visible_message(
			SPAN_NOTICE("[H] extend \his [holding.name] from [E]."),
			SPAN_NOTICE("You extend your [holding.name] from [E].")
		)

/obj/item/organ_module/active/hud/proc/retract(obj/item/organ/external/E)
	if(holding.loc == src)
		return

	if(ismob(holding.loc))
		var/mob/M = holding.loc
		M.drop_from_inventory(holding)
		M.visible_message(
			SPAN_NOTICE("[M] retract \his [holding.name] into [E]."),
			SPAN_NOTICE("You retract your [holding.name] into [E].")
		)
	holding.forceMove(src)

/obj/item/organ_module/active/hud/trigger(mob/living/carbon/human/H, obj/item/organ/external/E)
	if(!can_trigger(H, E))
		return

	if(holding.loc == src) //item not in hands
		deploy(H, E)
	else //retract item
		retract(E)

/obj/item/organ_module/active/hud/onRemove(var/obj/item/organ/external/E)
	retract(E)
	if(istype(holding, /obj/item/clothing/glasses/powered) && (holding.active) && E.owner)
		holding.toggle(E.owner)
	..()
