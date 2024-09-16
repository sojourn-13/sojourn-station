/obj/item/tool/armblade
	name = "armblade"
	desc = "A mechanical blade deployed from your arm. The favourite hidden weapon of many criminal types."
	icon = 'icons/obj/surgery.dmi'
	icon_state = "armblade"
	item_state = null
	worksound = WORKSOUND_HARD_SLASH
	hitsound = 'sound/weapons/heavyslash.ogg'
	force = WEAPON_FORCE_BRUTAL
	sharp = TRUE
	edge = TRUE
	clickdelay_offset = FAST_WEAPON_COOLDOWN
	throwforce = WEAPON_FORCE_WEAK
	w_class = ITEM_SIZE_SMALL
	attack_verb = list("stabbed", "chopped", "cut")
	armor_divisor = ARMOR_PEN_MODERATE
	tool_qualities = list(QUALITY_CUTTING = 20)

/obj/item/organ_module/active/simple/proc/get_scanner_name()
	return name

/obj/item/organ_module/active/simple/armblade
	name = "embedded armblade"
	desc = "A mechanical blade designed to be inserted into an arm. Gives you a nice advantage in a brawl."
	verb_name = "Deploy armblade"
	icon_state = "armblade"
	matter = list(MATERIAL_STEEL = 16)
	allowed_organs = list(BP_R_ARM, BP_L_ARM)
	holding_type = /obj/item/tool/armblade
	price_tag = 200 //Just some metal


/obj/item/tool/armblade/claws
	icon_state = "wolverine"
	name = "claws"
	desc = "A set of claws deployed from the tips of your fingers. Great for cutting people into ribbons."
	clickdelay_offset = 0 //No bonus speed.

/obj/item/organ_module/active/simple/wolverine
	name = "embedded claws"
	desc = "A variant on the popular armblade, these claws allow for a more traditional unarmed brawl style while still mantaining your advantage."
	verb_name = "Deploy embedded claws"
	icon_state = "wolverine"
	allowed_organs = list(BP_R_ARM, BP_L_ARM)
	holding_type = /obj/item/tool/armblade/claws

/obj/item/organ_module/active/simple/armblade/energy_blade
	name = "energy armblade"
	desc = "An energy blade designed to be inserted into an arm. Gives you a nice advantage in a brawl while being maximum cool."
	verb_name = "Deploy energyblade"
	icon_state = "energyblade"
	origin_tech = list(TECH_MAGNET = 3, TECH_ILLEGAL = 4)
	matter = list(MATERIAL_PLASTEEL = 16, MATERIAL_SILVER = 10, MATERIAL_GOLD = 3)
	holding_type = /obj/item/melee/energy/blade/organ_module

/obj/item/organ_module/active/simple/armblade/baton
	name = "Embedded baton"
	desc = "A baton designed to be inserted into an arm. Good for LTL CQC."
	verb_name = "Deploy Baton"
	icon_state = "armblade"
	matter = list(MATERIAL_STEEL = 16, MATERIAL_SILVER = 3, MATERIAL_GOLD = 3)
	allowed_organs = list(BP_R_ARM, BP_L_ARM)
	holding_type = /obj/item/tool/baton

/obj/item/organ_module/active/simple/armblade/telescopic_baton
	name = "Embedded telescopic baton"
	desc = "A telescopic baton designed to be inserted into an arm. Good for CQC."
	verb_name = "Deploy Baton"
	icon_state = "armblade"
	matter = list(MATERIAL_STEEL = 16, MATERIAL_PLASTIC = 15, MATERIAL_SILVER = 1)
	allowed_organs = list(BP_R_ARM, BP_L_ARM)
	holding_type = /obj/item/melee/telebaton

/obj/item/organ_module/active/simple/armblade/bs_tomahawk
	name = "Embedded Blackshield Tomahawk"
	desc = "A Tactical Tomahawk designed to be inserted into an arm. Gives you a nice advantage in CQC."
	verb_name = "Deploy Tomahawk"
	icon_state = "armblade"
	matter = list(MATERIAL_STEEL = 16)
	allowed_organs = list(BP_R_ARM, BP_L_ARM)
	holding_type = /obj/item/tool/fireaxe/militia_tomahawk

/obj/item/organ_module/active/simple/armblade/longsword
	name = "Embedded Longsword"
	desc = "A longsword designed to be inserted into an arm. You can't expect God to do all the work."
	verb_name = "Deploy longsword"
	icon_state = "nt_longsword"
	matter = list(MATERIAL_BIOMATTER = 25, MATERIAL_STEEL = 5)
	allowed_organs = list(BP_R_ARM, BP_L_ARM)
	holding_type = /obj/item/tool/sword/nt/longsword

/obj/item/organ_module/active/simple/armblade/ritual
	name = "Embedded Knife"
	desc = "A ceremonial knife designed to be inserted into an arm, may The Absolute have mercy."
	verb_name = "Deploy knife"
	icon_state = "neot-knife"
	matter = list(MATERIAL_PLASTEEL = 4, MATERIAL_PLASTIC = 1)
	allowed_organs = list(BP_R_ARM, BP_L_ARM)
	holding_type = /obj/item/tool/knife/neotritual

/obj/item/organ_module/active/simple/armblade/energy_blade/deploy(mob/living/carbon/human/H, obj/item/organ/external/E)
	..()
	playsound(H.loc, 'sound/weapons/saberon.ogg', 50, 1)

/obj/item/organ_module/active/simple/armblade/energy_blade/retract(mob/living/carbon/human/H, obj/item/organ/external/E)
	..()
	playsound(H.loc, 'sound/weapons/saberoff.ogg', 50, 1)

/obj/item/tool/cht_mant_claws
	name = "chitinous claws"
	desc = "A set of cht'mant claws, hard as chitin and suited as dangerous armor rending weapons."
	icon = 'icons/obj/surgery.dmi'
	icon_state = "chtmant_claws"
	item_state = null
	worksound = WORKSOUND_HARD_SLASH
	force = WEAPON_FORCE_ROBUST
	throwforce = WEAPON_FORCE_WEAK
	armor_divisor = ARMOR_PEN_MODERATE
	w_class = ITEM_SIZE_SMALL
	attack_verb = list("stabbed", "chopped", "cut", "sliced", "reaped")
	tool_qualities = list(QUALITY_CUTTING = 30)
	degradation = 0
	max_upgrades = 0

/obj/item/organ_module/active/simple/cht_mant_claws
	name = "chitinous claws"
	desc = "A set of cht'mant claws, hard as chitin and suited as dangerous armor rending weapons."
	verb_name = "Deploy chitinous claws"
	icon_state = "chtmant_claws"
	matter = list(MATERIAL_BIOMATTER = 20)
	allowed_organs = list(BP_R_ARM, BP_L_ARM)
	holding_type = /obj/item/tool/cht_mant_claws
	is_organic_module = TRUE

/obj/item/tool/armscythe
	name = "organic scythe"
	desc = "An organic blade deployed from your arm. The favourite augment for those who prefer alternatives to metal."
	icon = 'icons/obj/surgery.dmi'
	icon_state = "oscythe"
	item_state = null
	worksound = WORKSOUND_HARD_SLASH
	force = WEAPON_FORCE_ROBUST
	throwforce = WEAPON_FORCE_WEAK
	armor_divisor = ARMOR_PEN_MODERATE
	w_class = ITEM_SIZE_SMALL
	attack_verb = list("stabbed", "chopped", "cut", "sliced", "reaped")
	tool_qualities = list(QUALITY_CUTTING = 30)
	degradation = 0
	max_upgrades = 0

/obj/item/organ_module/active/simple/armscythe
	name = "embedded scythe"
	desc = "An organic scythe deployed from your arm. The blade folds and retracts at your will, like a third arm."
	verb_name = "Deploy scythe"
	icon_state = "oscythe"
	matter = list(MATERIAL_BIOMATTER = 20)
	allowed_organs = list(BP_R_ARM, BP_L_ARM)
	holding_type = /obj/item/tool/armscythe
	is_organic_module = TRUE


/obj/item/biogoop/armscythe
	name = "incomplete organic armscythe implant"


/obj/item/biogoop/armscythe/attackby(obj/item/I, mob/user)
	if(istype(I,/obj/item/stack/nanopaste))
		var/obj/item/stack/S = I
		if(S.use(1))
			to_chat(user, SPAN_NOTICE("You apply the nanite matrix, shaping the bioaugment into the reaper."))
			playsound(loc, 'sound/items/biotransform.ogg', 50, 1)
			new /obj/item/organ_module/active/simple/armscythe(get_turf(src))
			qdel(src)
			return
	return ..()
