/obj/item/material/baseballbat
	name = "bat"
	desc = "HOME RUN!"
	icon_state = "metalbat0"
	wielded_icon = "metalbat1"
	item_state = "metalbat0"
	attack_verb = list("smashed", "beaten", "slammed", "smacked", "struck", "battered", "bonked")
	hitsound = 'sound/weapons/blunthit.ogg' // Ouch!
	default_material = MATERIAL_WOOD
	force_divisor = 0.84           // 15 when unwielded 22 when wielded with weight 18 (wood)
	slot_flags = SLOT_BACK
	structure_damage_factor = STRUCTURE_DAMAGE_HEAVY

/obj/item/material/baseballbat/update_force()
	..()
	force_unwielded = force
	force_wielded = force * 1.5

//Predefined materials go here.
/obj/item/material/baseballbat/metal/New(var/newloc)
	..(newloc,MATERIAL_STEEL)

/obj/item/material/baseballbat/uranium/New(var/newloc)
	..(newloc,MATERIAL_URANIUM)

/obj/item/material/baseballbat/gold/New(var/newloc)
	..(newloc,MATERIAL_GOLD)

/obj/item/material/baseballbat/platinum/New(var/newloc)
	..(newloc,MATERIAL_PLATINUM)

/obj/item/material/baseballbat/diamond/New(var/newloc)
	..(newloc,MATERIAL_DIAMOND)
