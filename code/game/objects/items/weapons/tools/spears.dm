//POLEARMS
/obj/item/tool/spear
	icon = 'icons/obj/weapons.dmi'
	icon_state = "spear_glass"
	item_state = "spear_glass"
	wielded_icon = "spear_glass_wielded"
	name = "shard spear"
	desc = "A spiky bit of material tied onto a metal pole with some wire. It's an insult to spears across the galaxy - but it can still do some nasty damage and has some decent armor-piercing capabilities. Spears like these are often seen in the hands of vagrants, muggers, or desperate militias. Due to this weapon - if you could call it that - being so long, you're able to attack enemies from up to a tile away."
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK
	throw_speed = 3
	edge = TRUE
	sharp = TRUE
	extended_reach = TRUE
	tool_qualities = list(QUALITY_CUTTING = 10)
	origin_tech = list(TECH_COMBAT = 1)
	hitsound = 'sound/weapons/slice.ogg' // Sounds more like a stab than a cut.
	attack_verb = list("attacked", "poked", "jabbed", "torn", "gored")
	embed_mult = 1.5
	price_tag = 50
	//attack_distance = 2

	force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_DANGEROUS
	armor_divisor = ARMOR_PEN_MODERATE
	throw_speed = 3
	max_upgrades = 5

	item_icons = list(
		slot_back_str = 'icons/inventory/back/mob.dmi')
	item_state_slots = list(
		slot_back_str = "spearglass0_back"
		)

	has_alt_mode = TRUE
	alt_mode_damagetype = HALLOSS
	alt_mode_sharp = FALSE
	alt_mode_verbs = list("bashes", "stunts", "wacks", "blunts")
	alt_mode_toggle = "switches their stance to strike at targets with the shaft"
	alt_mode_lossrate = 0.4
	no_swing = TRUE

/obj/item/tool/spear/steel
	name = "steel spear"
	desc = "A steel spearhead welded to a crude metal shaft, made from two welded rods. It'll serve well enough."
	icon_state = "spear_steel"
	item_state = "spear_steel"
	wielded_icon = "spear_steel_wielded"
	force = WEAPON_FORCE_DANGEROUS
	throwforce = WEAPON_FORCE_ROBUST
	armor_divisor = ARMOR_PEN_DEEP
	tool_qualities = list(QUALITY_CUTTING = 10,  QUALITY_WIRE_CUTTING = 5, QUALITY_SCREW_DRIVING = 5)
	matter = list(MATERIAL_STEEL = 3)
	structure_damage_factor = STRUCTURE_DAMAGE_WEAK

/obj/item/tool/spear/plasteel
	name = "plasteel spear"
	desc = "A carefully crafted plasteel spearhead affixed to a metal shaft, it is welded securely on and feels balanced. Show them the past still lives."
	icon_state = "spear_plasteel"
	item_state = "spear_plasteel"
	wielded_icon = "spear_plasteel_wielded"
	force = WEAPON_FORCE_ROBUST
	throwforce = WEAPON_FORCE_BRUTAL
	armor_divisor = ARMOR_PEN_DEEP
	tool_qualities = list(QUALITY_CUTTING = 15,  QUALITY_WIRE_CUTTING = 10, QUALITY_SCREW_DRIVING = 10)
	matter = list(MATERIAL_STEEL = 1, MATERIAL_PLASTEEL = 2)
	structure_damage_factor = STRUCTURE_DAMAGE_NORMAL

/obj/item/tool/spear/uranium
	name = "uranium spear"
	desc = "A steel spear with a uranium lined spearhead. Your foes may survive the stab, but the toxin will linger."
	icon_state = "spear_uranium"
	item_state = "spear_uranium"
	wielded_icon = "spear_uranium_wielded"
	force = WEAPON_FORCE_DANGEROUS
	throwforce = WEAPON_FORCE_DANGEROUS
	armor_divisor = ARMOR_PEN_DEEP
	tool_qualities = list(QUALITY_CUTTING = 10,  QUALITY_WIRE_CUTTING = 5, QUALITY_SCREW_DRIVING = 5)
	matter = list(MATERIAL_STEEL = 3, MATERIAL_URANIUM = 1)

/obj/item/tool/spear/uranium/apply_hit_effect(mob/living/carbon/human/target, mob/living/user, hit_zone)
	..()
	if(istype(target))
		target.apply_effect(rand(5, 10), IRRADIATE)

/obj/item/tool/spear/makeshift_halberd
	name = "makeshift halberd"
	desc = "Slap a heavy blade on some rods duct-taped together and call it a day."
	icon_state = "makeshift_halberd"
	item_state = "makeshift_halberd"
	wielded_icon = "makeshift_halberd_wielded"
	force = WEAPON_FORCE_ROBUST
	throwforce = WEAPON_FORCE_NORMAL
	armor_divisor = ARMOR_PEN_SHALLOW
	tool_qualities = list(QUALITY_CUTTING = 10)
	matter = list(MATERIAL_STEEL = 5)

/obj/item/tool/spear/hunter_halberd
	name = "halberd"
	desc = "A hand-crafted halberd with a red cloth wrapped around the base of the blade itself. A Hunter's signature melee weapon of choice."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "hunter_halberd"
	item_state = "hunter_halberd"
	wielded_icon = "hunter_halberd_wielded"
	force = WEAPON_FORCE_BRUTAL
	armor_divisor = ARMOR_PEN_DEEP
	effective_faction = list("wurm", "roach", "spider", "vox_tribe", "russian", "tengo", "tengolo_berserker", "xenomorph", "stalker") // This is the janky solution but works.
	damage_mult = 2 //We are better for hunting, worse for "real fights"
	price_tag = 500
	matter = list(MATERIAL_STEEL = 22, MATERIAL_WOOD = 10, MATERIAL_PLASTEEL = 4)

//Sea Branch
/obj/item/tool/spear/sea
	name = "\"MSLP-Wave Type\" trident"
	desc = "A golden trident with drill like tips."
	icon_state = "trident"
	item_state = "spear_plasteel"
	wielded_icon = "spear_plasteel_wielded"
	force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_BRUTAL
	armor_divisor = ARMOR_PEN_DEEP
	//Has better tool qualities
	tool_qualities = list(QUALITY_DIGGING = 25,  QUALITY_WIRE_CUTTING = 30, QUALITY_SCREW_DRIVING = 30)
	matter = list(MATERIAL_PLASTEEL = 2, MATERIAL_GOLD = 15, MATERIAL_TITANIUM = 3)
	structure_damage_factor = STRUCTURE_DAMAGE_NORMAL
	effective_faction = list("psi_monster", "xenomorph", "stalker")

/obj/item/tool/spear/sea/refresh_upgrades()
	..()
	if(ishuman(src.loc))
		var/mob/living/carbon/human/H = src.loc
		if(istype(H.head, /obj/item/clothing/head/helmet/sea))
			extended_reach += 1
			armor_divisor += 0.2
		if(istype(H.gloves, /obj/item/clothing/gloves/dusters/sea))
			extended_reach += 1
			force += 10


/obj/item/tool/spear/sea/examine(mob/user)
	..()
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(istype(H.head, /obj/item/clothing/head/helmet/sea))
			to_chat(user, SPAN_NOTICE("When looking at the spear with the crown on, it buzzes information to your brain cortex."))
			to_chat(user, SPAN_NOTICE("\"The Wave Type Trident, a spear made for both underwater mining and fighting this model is typically given to common hunters to fight off the hostile Sea.\"."))
			if(istype(H.gloves, /obj/item/clothing/gloves/dusters))
				to_chat(user, SPAN_NOTICE("\"Dept Type gloves will allow the trident to reach even further as well as strike harder do to the Nyomatic Authority. However do to being outside of \
				the Authority of The Diving Bell the fission based explositive tip functionality is unable to activeate\"."))


/obj/item/tool/spear/sea/dropped(var/mob/M)
	..()
	refresh_upgrades(M)

/obj/item/tool/spear/sea/equipped(var/mob/M)
	..()
	refresh_upgrades(M)