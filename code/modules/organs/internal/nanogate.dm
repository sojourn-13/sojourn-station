// Similar to the psionic tumor, this organ give people abilities.
/obj/item/organ/internal/nanogate
	name = "Nanogate"
	max_damage = 60
	desc = "A custom built nanogate designed from the far superior opifex blueprints. It is implanted right where the spine meets the skull and provides a wide variety of nanite based uses."
	organ_efficiency = list(BP_NANOGATE = 100)
	parent_organ_base = BP_HEAD // It's at the base of the skull in the spine.
	icon_state = "nanogate" //TODO: Replace this with a proper sprite.
	force = 1
	w_class = ITEM_SIZE_SMALL
	specific_organ_size = 0.5
	throwforce = 1
	throw_speed = 3
	throw_range = 5
	layer = ABOVE_MOB_LAYER
	nature = MODIFICATION_SILICON //Why wasn't this done by default?
	origin_tech = list(TECH_ENGINEERING = 15, TECH_BIO = 5, TECH_DATA = 10)
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_GOLD = 4, MATERIAL_SILVER = 4, MATERIAL_PLASTIC = 10, MATERIAL_GLASS = 15, MATERIAL_DIAMOND = 1)
	attack_verb = list("attacked", "slapped", "whacked")
	price_tag = 12000
	var/nanite_points = 10
	var/nano_point_cost
	var/mob/living/carbon/superior_animal/nanobot/Stand // The personal robot of the owner. I wonder how many people will get the reference... -R4d6
	var/obj/item/rig/nanite/nanite_rig // The nanite rig you can make
	var/list/perk_list = list() //List of activated perks for later removal
	min_broken_damage = 10 //Should break when organ is at 10 health of its 60.

	owner_verbs = list(
		/obj/item/organ/internal/nanogate/proc/nanite_antenna,
		// Creation and upgrade of the bot

		/obj/item/organ/internal/nanogate/proc/create_nanobot,

		// Upgrades of the user.
		/obj/item/organ/internal/nanogate/proc/nanite_stats,
		/obj/item/organ/internal/nanogate/proc/nanite_regen,
		/obj/item/organ/internal/nanogate/proc/nanite_muscle,
		/obj/item/organ/internal/nanogate/proc/nanite_armor,
		/obj/item/organ/internal/nanogate/proc/nanite_chem,
		/obj/item/organ/internal/nanogate/proc/nanite_food_storage,
		/obj/item/organ/internal/nanogate/proc/nanite_metal_drinker,
		// Rig Upgrades
		/obj/item/organ/internal/nanogate/proc/nanite_rig

		)

// Guild made the original blue prints. There version is better than the one they give to others,
obj/item/organ/internal/nanogate/artificer
	name = "Artificer Nanogate"
	icon_state = "nanogate_art" //TODO: Replace this with a proper sprite. AG branded.
	desc = "A custom built nanogate designed from the far superior opifex blueprints. It is implanted right where the spine meets the skull and provides a wide variety of nanite based uses. This \
	particular design is made by the Artificer Guild, able to store more nanites for additional uses."
	nanite_points = 15
	matter = list(MATERIAL_PLASTEEL = 25, MATERIAL_GOLD = 8, MATERIAL_SILVER = 9, MATERIAL_PLASTIC = 20, MATERIAL_GLASS = 15, MATERIAL_DIAMOND = 2)
	origin_tech = list(TECH_ENGINEERING = 20, TECH_BIO = 10, TECH_DATA = 20)


// Opifexes are the creator of the tech, they get a better one.
/obj/item/organ/internal/nanogate/opifex
	name = "Opifex Nanogate"
	desc = "A custom built nanogate designed from the far superior opifex blueprints. It is implanted right where the spine meets the skull and provides a wide variety of nanite based uses. This \
	particular design is an opifex original and one of the best that can be found in the galaxy."
	icon_state = "nanogate_opi" //TODO: Replace this with a proper sprite. Opifex branded.
	price_tag = 20000 // Better than the standard one.
	nanite_points = 20
	matter = list(MATERIAL_PLASTEEL = 25, MATERIAL_GOLD = 12, MATERIAL_SILVER = 12, MATERIAL_PLASTIC = 20, MATERIAL_GLASS = 15, MATERIAL_DIAMOND = 3)
	origin_tech = list(TECH_ENGINEERING = 25, TECH_BIO = 15, TECH_DATA = 10)

	owner_verbs = list(
		/obj/item/organ/internal/nanogate/proc/nanite_antenna,
		// Creation and upgrade of the bot
		/obj/item/organ/internal/nanogate/proc/create_nanobot,

		// Upgrades of the user.
		/obj/item/organ/internal/nanogate/proc/nanite_stats,
		/obj/item/organ/internal/nanogate/proc/nanite_regen,
		/obj/item/organ/internal/nanogate/proc/nanite_muscle,
		/obj/item/organ/internal/nanogate/proc/nanite_armor,
		/obj/item/organ/internal/nanogate/proc/nanite_chem,
		/obj/item/organ/internal/nanogate/proc/nanite_mod,
		/obj/item/organ/internal/nanogate/proc/nanite_ammo,
		/obj/item/organ/internal/nanogate/proc/nanite_food_storage,
		/obj/item/organ/internal/nanogate/proc/nanite_metal_drinker,

		// Rig Upgrades
		/obj/item/organ/internal/nanogate/proc/nanite_rig_opifex
		)


// Nanogates use either nanomachines or electromagnetic nanites. So - you would be impacted by EMPs.
/obj/item/organ/internal/nanogate/emp_act(severity)
	..()
	switch (severity)
		if(1)
			owner.apply_effect(40, HALLOSS)
		if(2)
			owner.apply_effect(30, HALLOSS)
		if(3)
			owner.apply_effect(20, HALLOSS)

// If the organ goes below is theshold it dies. And does bad effects.
/obj/item/organ/internal/nanogate/die()
	if(status & ORGAN_BROKEN)
		var/obj/item/organ/internal/targeted_organ
		to_chat(owner, SPAN_DANGER("You are in absolute agony as your nanites attack your own body!"))
		var/list/listed_organs  = list("brain",OP_EYES,"heart")
		targeted_organ = owner.random_organ_by_process(pick(listed_organs))
		targeted_organ.damage += rand (5,10)
		owner.apply_effect(60, HALLOSS)
		addtimer(CALLBACK(src, .proc/die), 1 MINUTES, TIMER_STOPPABLE)
