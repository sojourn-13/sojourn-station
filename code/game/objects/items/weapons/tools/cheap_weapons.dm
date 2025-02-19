//Shitty loadout weapons
/obj/item/tool/cheap
	name = "cheap sword"
	desc = "A sword of acceptable quality, mass-produced by Lonestar. It's no work art, but it's sharp enough to get the job done."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "cheap_sword"
	item_state = "cheap_sword"
	matter = list(MATERIAL_STEEL = 10, MATERIAL_PLASTIC = 5)
	sharp = TRUE
	edge = TRUE
	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BELT
	worksound = WORKSOUND_HARD_SLASH
	force = WEAPON_FORCE_ROBUST
	armor_divisor = ARMOR_PEN_DEEP

	throwforce = WEAPON_FORCE_NORMAL
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	hitsound = 'sound/weapons/bladeslice.ogg'
	tool_qualities = list(QUALITY_CUTTING = 10, QUALITY_SAWING = 10)
	structure_damage_factor = STRUCTURE_DAMAGE_BLADE
	w_class = ITEM_SIZE_NORMAL
	price_tag = 100

	has_alt_mode = TRUE
	alt_mode_damagetype = HALLOSS
	alt_mode_sharp = FALSE
	alt_mode_verbs = list("bashes", "stunts", "wacks", "blunts")
	alt_mode_toggle = "switches their stance to avoid using the blade of their weapon"
	alt_mode_lossrate = 0.9 //Little loss so people can use these in real gimmics

/obj/item/tool/cheap/axe
	name = "cheap tomahawk"
	desc = "A tomahawk of acceptable quality, mass-produced by Lonestar. Just expensive enough to be called tactical."
	icon_state = "cheap_axe"
	item_state = "cheap_axe"
	structure_damage_factor = STRUCTURE_DAMAGE_WEAK
	attack_verb = list("attacked", "slashed", "chopped", "sliced", "torn", "ripped", "diced", "cut")

/obj/item/tool/cheap/katana
	name = "cheap katana"
	desc = "A katana of acceptable quality, mass-produced by Lonestar. Easily their best-selling product from this lineup."
	icon_state = "katana_old"
	item_state = "katana"
	force = WEAPON_FORCE_DANGEROUS
	armor_divisor = ARMOR_PEN_EXTREME

/obj/item/tool/cheap/spear
	name = "cheap spear"
	desc = "A spear of acceptable quality, mass-produced by Lonestar. Place sharp end towards enemy."
	icon_state = "cheap_spear"
	item_state = "cheap_spear"
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK|SLOT_BELT
	throwforce = WEAPON_FORCE_BRUTAL
	throw_speed = 3
	embed_mult = 1.5
	structure_damage_factor = STRUCTURE_DAMAGE_WEAK
	tool_qualities = list(QUALITY_CUTTING = 15,  QUALITY_WIRE_CUTTING = 10, QUALITY_SCREW_DRIVING = 10)
	hitsound = 'sound/weapons/slice.ogg'
	attack_verb = list("attacked", "poked", "jabbed", "torn", "gored")
	item_icons = list(
		slot_back_str = 'icons/inventory/back/mob.dmi')
	item_state_slots = list(
		slot_back_str = "cheap_spear"
		)
	alt_mode_toggle = "switches their stance to strike at targets with the shaft"
	alt_mode_lossrate = 0.4
	extended_reach = TRUE

/obj/item/tool/cheap/saber
	name = "cheap saber"
	desc = "A saber of acceptable quality, mass-produced by Lonestar. Probably not fit for parrying, but why not give it a try?"
	icon_state = "cheap_saber"
	item_state = "cutlass"

//Complex cheap weapon arts
/obj/item/tool/cheap/rapier
	name = "cheap cinq rapier"
	desc = "A mass-produced copy of a cinq rapier by Lonestar. Is unable to be used for parrying but has some techniques."
	icon_state = "cheap_rapier"
	item_state = "katana"
	force = WEAPON_FORCE_NORMAL
	armor_divisor = ARMOR_PEN_EXTREME
	clickdelay_offset = -2 //DEFAULT_QUICK_COOLDOWN = 4 so we offset are weapon to quick
	var/coin_tracker = 0 //Used to track hits used in fancy modes
	alt_mode_toggle = "switches their stance to strike without stabbing"
	alt_mode_lossrate = 0.4

/obj/item/tool/cheap/rapier/resolve_attackby(atom/target, mob/user)
	clickdelay_offset = -2 //Resets

	if(coin_tracker >= 10)
		force += 5
		icon_state = "cheap_rapier_form_two"
	if(coin_tracker >= 20)
		if(prob(coin_tracker))
			force += 3 //20% more base damage rounded up
		clickdelay_offset = -3 //slightly faster attacking

	if(coin_tracker >= 25)
		coin_tracker = 0
		clickdelay_offset = -8 //Refund that click
		icon_state = "cheap_rapier"


	if(ismob(target))
		var/mob/living/M = target
		if(M.stat != DEAD)
			coin_tracker += 1

	.=..()
	refresh_upgrades()

	//So this is a bit missleading, reach attacks do *not* chain themselfs so you must range one attack folks
	if(coin_tracker >= 5 && coin_tracker <= 10)
		extended_reach = TRUE
		icon_state = "cheap_rapier_form_one"


/obj/item/tool/cheap/rapier/dropped()
	coin_tracker = 0
	refresh_upgrades()
	update_icon()
	icon_state = "cheap_rapier"
	..()
