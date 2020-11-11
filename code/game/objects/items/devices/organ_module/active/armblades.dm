/obj/item/weapon/tool/armblade
	name = "armblade"
	desc = "A mechanical blade deployed from your arm. The favourite hidden weapon of many criminal types."
	icon = 'icons/obj/surgery.dmi'
	icon_state = "armblade"
	item_state = null
	worksound = WORKSOUND_HARD_SLASH
	force = WEAPON_FORCE_DANGEROUS
	throwforce = WEAPON_FORCE_WEAK
	w_class = ITEM_SIZE_SMALL
	attack_verb = list("stabbed", "chopped", "cut")
	armor_penetration = ARMOR_PEN_MODERATE
	tool_qualities = list(QUALITY_CUTTING = 20)

/obj/item/organ_module/active/simple/armblade
	name = "embedded armblade"
	desc = "A mechanical blade designed to be inserted into an arm. Gives you a nice advantage in a brawl."
	verb_name = "Deploy armblade"
	icon_state = "armblade"
	matter = list(MATERIAL_STEEL = 16)
	allowed_organs = list(BP_R_ARM, BP_L_ARM)
	holding_type = /obj/item/weapon/tool/armblade


/obj/item/weapon/tool/armblade/claws
	icon_state = "wolverine"
	name = "claws"
	desc = "A set of claws deployed from the tips of your fingers. Great for cutting people into ribbons."

/obj/item/organ_module/active/simple/wolverine
	name = "embedded claws"
	desc = "A variant on the popular armblade, these claws allow for a more traditional unarmed brawl style while still mantaining your advantage."
	verb_name = "Deploy embedded claws"
	icon_state = "wolverine"
	allowed_organs = list(BP_R_ARM, BP_L_ARM)
	holding_type = /obj/item/weapon/tool/armblade/claws

/obj/item/organ_module/active/simple/armblade/energy_blade
	name = "energy armblade"
	desc = "An energy blade designed to be inserted into an arm. Gives you a nice advantage in a brawl while being maximum cool."
	verb_name = "Deploy energyblade"
	icon_state = "energyblade"
	origin_tech = list(TECH_MAGNET = 3, TECH_ILLEGAL = 4)
	matter = list(MATERIAL_PLASTEEL = 16, MATERIAL_SILVER = 10, MATERIAL_GOLD = 3, )
	holding_type = /obj/item/weapon/melee/energy/blade/organ_module

/obj/item/organ_module/active/simple/armblade/energy_blade/deploy(mob/living/carbon/human/H, obj/item/organ/external/E)
	..()
	playsound(H.loc, 'sound/weapons/saberon.ogg', 50, 1)

/obj/item/organ_module/active/simple/armblade/energy_blade/retract(mob/living/carbon/human/H, obj/item/organ/external/E)
	..()
	playsound(H.loc, 'sound/weapons/saberoff.ogg', 50, 1)

/obj/item/weapon/tool/armscythe
	name = "organic scythe"
	desc = "An organic blade deployed from your arm. The favourite augment for those who prefer alternatives to metal."
	icon = 'icons/obj/surgery.dmi'
	icon_state = "oscythe"
	item_state = null
	worksound = WORKSOUND_HARD_SLASH
	force = WEAPON_FORCE_ROBUST
	throwforce = WEAPON_FORCE_WEAK
	armor_penetration = ARMOR_PEN_MODERATE
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
	holding_type = /obj/item/weapon/tool/armscythe


/obj/item/weapon/biogoop/armscythe
	name = "incomplete organic armscythe implant"


/obj/item/weapon/biogoop/armscythe/attackby(obj/item/I, mob/user)
	if(istype(I,/obj/item/stack/nanopaste))
		var/obj/item/stack/S = I
		if(S.use(1))
			to_chat(user, SPAN_NOTICE("You apply the nanite matrix, shaping the bioaugment into the reaper."))
			playsound(loc, 'sound/items/biotransform.ogg', 50, 1)
			new /obj/item/organ_module/active/simple/armscythe(get_turf(src))
			qdel(src)
			return
	return ..()
