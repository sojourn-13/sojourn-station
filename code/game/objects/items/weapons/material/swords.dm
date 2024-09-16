//////////////////////////////////////////////////////////////////////////////
/////////////////////// Material Claymores ///////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
/obj/item/material/sword
	name = "claymore"
	desc = "What are you standing around staring at this for? Get to killing!"
	icon_state = "claymore"
	item_state = "claymore"
	slot_flags = SLOT_BELT
	armor_divisor = ARMOR_PEN_EXTREME
	force_divisor = 0.7 // 42 when wielded with hardnes 60 (steel)
	thrown_force_divisor = 0.5 // 10 when thrown with weight 20 (steel)
	sharp = 1
	edge = 1
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	hitsound = 'sound/weapons/bladeslice.ogg'
	tool_qualities = list(QUALITY_CUTTING = 10)
	structure_damage_factor = STRUCTURE_DAMAGE_BLADE
	default_material = MATERIAL_STEEL

/obj/item/material/sword/handle_shield(mob/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")
	if(default_parry_check(user, attacker, damage_source) && prob(50))
		user.visible_message(SPAN_DANGER("\The [user] parries [attack_text] with \the [src]!"))
		playsound(user.loc, 'sound/weapons/punchmiss.ogg', 50, 1)
		return 1
	return 0

/obj/item/material/sword/gold
	default_material = MATERIAL_GOLD

/obj/item/material/sword/plastic
	default_material = MATERIAL_PLASTIC

/obj/item/material/sword/uranium
	default_material = MATERIAL_URANIUM

/obj/item/material/sword/plasteel
	default_material = MATERIAL_PLASTEEL

/obj/item/material/sword/platinum
	default_material = MATERIAL_PLATINUM

/obj/item/material/sword/iron
	default_material = MATERIAL_IRON

/obj/item/material/sword/silver
	default_material = MATERIAL_SILVER

/obj/item/material/sword/diamond
	default_material = MATERIAL_DIAMOND

//////////////////////////////////////////////////////////////////////////////
/////////////////////// Material  Katana's ///////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/obj/item/material/sword/katana
	name = "katana"
	desc = "Woefully underpowered in D20. This one looks pretty sharp."
	icon_state = "katana"
	item_state = "katana"
	hitsound = 'sound/weapons/heavyslash.ogg'
	slot_flags = SLOT_BELT | SLOT_BACK

/obj/item/material/sword/katana/update_icon()
    ..()
    cut_overlays()
    var/image/I = image(icon, icon_state = "katana_handle")
    I.appearance_flags = RESET_COLOR | DEFAULT_APPEARANCE_FLAGS
    add_overlay(I)

/obj/item/material/sword/katana/gold
	default_material = MATERIAL_GOLD

/obj/item/material/sword/katana/plastic
	default_material = MATERIAL_PLASTIC

/obj/item/material/sword/katana/uranium
	default_material = MATERIAL_URANIUM

/obj/item/material/sword/katana/plasteel
	default_material = MATERIAL_PLASTEEL

/obj/item/material/sword/katana/platinum
	default_material = MATERIAL_PLATINUM

/obj/item/material/sword/katana/iron
	default_material = MATERIAL_IRON

/obj/item/material/sword/katana/silver
	default_material = MATERIAL_SILVER

/obj/item/material/sword/katana/diamond
	default_material = MATERIAL_DIAMOND
