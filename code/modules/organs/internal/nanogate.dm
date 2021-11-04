// Similar to the psionic tumor, this organ give people abilities.
/obj/item/organ/internal/nanogate
	name = "Nanogate"
	max_damage = 60
	desc = "A custom built nanogate designed from the far superior opifex blueprints. It is implanted right where the spine meets the skull and provides a wide variety of nanite based uses."
	organ_efficiency = list(BP_NANOGATE = 100)
	parent_organ_base = BP_HEAD // It's at the base of the skull in the spine.
	icon_state = "nanogate" //TODO: Replace this with a proper sprite.
	force = 1.0
	w_class = ITEM_SIZE_SMALL
	specific_organ_size = 0.5
	throwforce = 1.0
	throw_speed = 3
	throw_range = 5
	layer = ABOVE_MOB_LAYER
	origin_tech = list(TECH_ENGINEERING = 20)
	attack_verb = list("attacked", "slapped", "whacked")
	price_tag = 12000
	var/nanite_points = 10
	var/nano_point_cost
	var/mob/living/carbon/superior_animal/nanobot/Stand // The personal robot of the owner. I wonder how many people will get the reference... -R4d6
	var/obj/item/rig/nanite/nanite_rig // The nanite rig you can make

	owner_verbs = list(
		/obj/item/organ/internal/nanogate/proc/nanite_message,
		// Creation and upgrade of the bot
		/obj/item/organ/internal/nanogate/proc/create_nanobot,
		/obj/item/organ/internal/nanogate/proc/stand_damage,
		/obj/item/organ/internal/nanogate/proc/stand_health,
		/obj/item/organ/internal/nanogate/proc/stand_armor,
		/obj/item/organ/internal/nanogate/proc/stand_repair,

		// Activation of vocal protocols for the bots
		/obj/item/organ/internal/nanogate/proc/autodoc_mode,
		/obj/item/organ/internal/nanogate/proc/radio_mode,
		/obj/item/organ/internal/nanogate/proc/console_mode,
		/obj/item/organ/internal/nanogate/proc/control_bot,

		// Upgrades of the user.
		/obj/item/organ/internal/nanogate/proc/nanite_regen,
		/obj/item/organ/internal/nanogate/proc/nanite_muscle,
		/obj/item/organ/internal/nanogate/proc/nanite_armor,
		/obj/item/organ/internal/nanogate/proc/nanite_chem,

		// Rig Upgrades
		/obj/item/organ/internal/nanogate/proc/nanite_rig,
		/obj/item/organ/internal/nanogate/proc/nanite_rig_storage,
		/obj/item/organ/internal/nanogate/proc/nanite_rig_laser,
		/obj/item/organ/internal/nanogate/proc/nanite_rig_autodoc,
		/obj/item/organ/internal/nanogate/proc/nanite_rig_eva

		)

// Guild made the original blue prints. There version is better than the one they give to others,
obj/item/organ/internal/nanogate/artificer
	name = "Artificer Nanogate"
	icon_state = "nanogate_art" //TODO: Replace this with a proper sprite. AG branded.
	desc = "A custom built nanogate designed from the far superior opifex blueprints. It is implanted right where the spine meets the skull and provides a wide variety of nanite based uses. This \
	particular design is made by the Artificer Guild, able to store more nanites for additional uses."
	nanite_points = 15

// Opifexes are the creator of the tech, they get a better one.
/obj/item/organ/internal/nanogate/opifex
	name = "Opifex Nanogate"
	desc = "A custom built nanogate designed from the far superior opifex blueprints. It is implanted right where the spine meets the skull and provides a wide variety of nanite based uses. This \
	particular design is an opifex original and one of the best that can be found in the galaxy."
	icon_state = "nanogate_opi" //TODO: Replace this with a proper sprite. Opifex branded.
	price_tag = 20000 // Better than the standard one.
	nanite_points = 20

	owner_verbs = list(
		/obj/item/organ/internal/nanogate/proc/nanite_message,
		// Creation and upgrade of the bot
		/obj/item/organ/internal/nanogate/proc/create_nanobot,
		/obj/item/organ/internal/nanogate/proc/stand_damage,
		/obj/item/organ/internal/nanogate/proc/stand_health,
		/obj/item/organ/internal/nanogate/proc/stand_armor,
		/obj/item/organ/internal/nanogate/proc/stand_repair,

		// Activation of vocal protocols for the bots
		/obj/item/organ/internal/nanogate/proc/autodoc_mode,
		/obj/item/organ/internal/nanogate/proc/radio_mode,
		/obj/item/organ/internal/nanogate/proc/console_mode,
		/obj/item/organ/internal/nanogate/proc/food_mode,
		/obj/item/organ/internal/nanogate/proc/control_bot,

		// Upgrades of the user.
		/obj/item/organ/internal/nanogate/proc/nanite_regen,
		/obj/item/organ/internal/nanogate/proc/nanite_muscle,
		/obj/item/organ/internal/nanogate/proc/nanite_armor,
		/obj/item/organ/internal/nanogate/proc/nanite_chem,
		/obj/item/organ/internal/nanogate/proc/nanite_mod,
		/obj/item/organ/internal/nanogate/proc/nanite_ammo,

		// Rig Upgrades
		/obj/item/organ/internal/nanogate/proc/nanite_rig_opifex,
		/obj/item/organ/internal/nanogate/proc/nanite_rig_storage,
		/obj/item/organ/internal/nanogate/proc/nanite_rig_laser,
		/obj/item/organ/internal/nanogate/proc/nanite_rig_autodoc,
		/obj/item/organ/internal/nanogate/proc/nanite_rig_eva
		)
