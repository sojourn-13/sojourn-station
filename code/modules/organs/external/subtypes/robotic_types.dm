/obj/item/organ/external/robotic/bishop
	name = "Bishop"
	desc = "Prosthesis with white polymer casing with blue holo-displays."
	force_icon = 'icons/mob/human_races/cyberlimbs/bishop.dmi'
	model = "bishop"

/obj/item/organ/external/robotic/hesphaistos
	name = "Hesphaistos"
	desc = "Prosthesis with militaristic black and green casing with gold stripes."
	force_icon = 'icons/mob/human_races/cyberlimbs/hesphaistos.dmi'
	model = "hesphaistos"

/obj/item/organ/external/robotic/zenghu
	name = "Zeng-Hu"
	desc = "Prosthesis with rubbery fleshtone covering with visible seams."
	force_icon = 'icons/mob/human_races/cyberlimbs/zenghu.dmi'
	model = "zenghu"

/obj/item/organ/external/robotic/xion
	name = "Xion"
	desc = "Prosthesis with minimalist black and red casing."
	force_icon = 'icons/mob/human_races/cyberlimbs/xion.dmi'
	model = "xion"

//Character setup prostheses

/obj/item/organ/external/robotic/asters
	name = "Lonestars \"Movement Lock\""
	desc = "Generic gray prostesis for everyday use."
	force_icon = 'icons/mob/human_races/cyberlimbs/asters.dmi'
	model = "asters"

/obj/item/organ/external/robotic/serbian
	name = "\"Voidwolf Arms\""
	desc = "Battle hardened green and brown prosthesis rebranded several times."
	force_icon = 'icons/mob/human_races/cyberlimbs/serbian.dmi'
	model = "serbian"

/obj/item/organ/external/robotic/frozen_star
	name = "\"H&S Augments\""
	desc = "Tactical \"Holland & Sullivan\" blue and gray prosthesis for dangerous environment."
	force_icon = 'icons/mob/human_races/cyberlimbs/frozen_star.dmi'
	model = "frozen_star"

/obj/item/organ/external/robotic/technomancer
	name = "Artificer Guild \"Homebrew\""
	desc = "Artificer Guild \"branded\" \"functional\" prosthesis."
	force_icon = 'icons/mob/human_races/cyberlimbs/technomancer.dmi'
	model = "technomancer"

obj/item/organ/external/robotic/technomancer/groin
	name = "\"Artificer Guild\" Groin"
	default_description = /datum/organ_description/groin

/obj/item/organ/external/robotic/technomancer/torso
	name = "\"Artificer Guild\" Torso"
	default_description = /datum/organ_description/chest

/obj/item/organ/external/robotic/technomancer/head
	name = "\"Artificer Guild\" Head"
	default_description = /datum/organ_description/head

/obj/item/organ/external/robotic/full_body_prosthetic
	name = "Full Body Prosthetic \"Synth-Skin\""
	desc = "A full body prosthetic with \"realistic\" synth skin."
	force_icon = 'icons/mob/human_races/cyberlimbs/fbp.dmi'
	model = "fbp"

obj/item/organ/external/robotic/full_body_prosthetic/groin
	name = "Full Body Prosthetic \"Synth-Skin\" Groin"
	default_description = /datum/organ_description/groin

/obj/item/organ/external/robotic/full_body_prosthetic/torso
	name = "Full Body Prosthetic \"Synth-Skin\" Torso"
	default_description = /datum/organ_description/chest

/obj/item/organ/external/robotic/full_body_prosthetic/head
	name = "Full Body Prosthetic \"Synth-Skin\" Head"
	default_description = /datum/organ_description/head

/obj/item/organ/external/robotic/junktech
	name = "\"Junktech\""
	desc = "Custom tooled and held together by hope and duct tape."
	force_icon = 'icons/mob/human_races/cyberlimbs/advanced_ghetto.dmi'
	model = "ghetto"
	armor = list(melee = 10, bullet = 10, energy = 10, bomb = -5, bio = 100, rad = 100)
	matter = list(MATERIAL_STEEL = 3, MATERIAL_PLASTIC = 1)
	min_broken_damage = 30
	min_malfunction_damage = 15

/obj/item/organ/external/robotic/junktech/l_arm
	default_description = /datum/organ_description/arm/left

/obj/item/organ/external/robotic/junktech/r_arm
	default_description = /datum/organ_description/arm/right

/obj/item/organ/external/robotic/junktech/l_leg
	default_description = /datum/organ_description/leg/left

/obj/item/organ/external/robotic/junktech/r_leg
	default_description = /datum/organ_description/leg/right

/obj/item/organ/external/robotic/moebius
	name = "\"Soteria\""
	desc = "Reinforced purple and white prosthesis designed for space exploration and light combat."
	force_icon = 'icons/mob/human_races/cyberlimbs/moebius.dmi'
	model = "moebius"
	armor = list(melee = 35, bullet = 35, energy = 35, bomb = 35, bio = 100, rad = 100)
	matter = list(MATERIAL_STEEL = 2, MATERIAL_PLASTIC = 2, MATERIAL_PLASTEEL = 1)
	max_damage = 60
	min_broken_damage = 40

/obj/item/organ/external/robotic/moebius/l_arm
	default_description = /datum/organ_description/arm/left

/obj/item/organ/external/robotic/moebius/r_arm
	default_description = /datum/organ_description/arm/right

/obj/item/organ/external/robotic/moebius/l_leg
	default_description = /datum/organ_description/leg/left

/obj/item/organ/external/robotic/moebius/r_leg
	default_description = /datum/organ_description/leg/right

/obj/item/organ/external/robotic/moebius/groin
	default_description = /datum/organ_description/groin

/obj/item/organ/external/robotic/moebius/torso
	name = "\"Soteria\" Torso"
	default_description = /datum/organ_description/chest

/obj/item/organ/external/robotic/moebius/head
	name = "\"Soteria\" Head"
	default_description = /datum/organ_description/head

/obj/item/organ/external/robotic/blackshield
	name = "\"Blackshield\""
	desc = "Reinforced dark prosthesis designed for heavy combat."
	force_icon = 'icons/mob/human_races/cyberlimbs/blackshield.dmi'
	model = "blackshield"
	armor = list(melee = 40, bullet = 40, energy = 25, bomb = 25, bio = 100, rad = 100)
	matter = list(MATERIAL_STEEL = 15, MATERIAL_PLASTIC = 5, MATERIAL_PLASTEEL = 10)
	max_damage = 70
	min_broken_damage = 50
	min_malfunction_damage = 30

/obj/item/organ/external/robotic/blackshield/l_arm
	default_description = /datum/organ_description/arm/left

/obj/item/organ/external/robotic/blackshield/r_arm
	default_description = /datum/organ_description/arm/right

/obj/item/organ/external/robotic/blackshield/l_leg
	default_description = /datum/organ_description/leg/left

/obj/item/organ/external/robotic/blackshield/r_leg
	default_description = /datum/organ_description/leg/right

/obj/item/organ/external/robotic/blackshield/groin
	default_description = /datum/organ_description/groin

/obj/item/organ/external/robotic/blackshield/torso
	name = "\"Blackshield\" Torso"
	default_description = /datum/organ_description/chest

/obj/item/organ/external/robotic/blackshield/head
	name = "\"Blackshield\" Head"
	default_description = /datum/organ_description/head

//In game prostheses
/obj/item/organ/external/robotic/excelsior
	name = "Excelsior"
	desc = "Plasma reinforced black prosthesis designed for heavy combat."
	force_icon = 'icons/mob/human_races/cyberlimbs/excelsior.dmi'
	model = "excelsior"
	armor = list(melee = 50, bullet = 50, energy = 50, bomb = 50, bio = 0, rad = 100)
	matter = list(MATERIAL_STEEL = 2, MATERIAL_PLASTEEL = 1, MATERIAL_PLASMA = 0.5) //Plasma needed as a material that excelsiors can't teleport in
	max_damage = 65
	min_broken_damage = 45

/obj/item/organ/external/robotic/excelsior/l_arm
	default_description = /datum/organ_description/arm/left

/obj/item/organ/external/robotic/excelsior/r_arm
	default_description = /datum/organ_description/arm/right

/obj/item/organ/external/robotic/excelsior/l_leg
	default_description = /datum/organ_description/leg/left

/obj/item/organ/external/robotic/excelsior/r_leg
	default_description = /datum/organ_description/leg/right

/obj/item/organ/external/robotic/one_star
	name = "Greyson"
	desc = "Advanced, extremely resilient and mobile prosthetic. Inscribed with \"Made in\" followed by gibberish, must have been lost to time."
	force_icon = 'icons/mob/human_races/cyberlimbs/one_star.dmi'
	model = "one_star"
	armor = list(melee = 65, bullet = 65, energy = 65, bomb = 65, bio = 0, rad = 100)
	matter = list(MATERIAL_STEEL = 1, MATERIAL_PLASTIC = 4, MATERIAL_PLATINUM = 2)
	max_damage = 70
	min_broken_damage = 50

/obj/item/organ/external/robotic/one_star/l_arm
	default_description = /datum/organ_description/arm/left

/obj/item/organ/external/robotic/one_star/r_arm
	default_description = /datum/organ_description/arm/right

/obj/item/organ/external/robotic/one_star/l_leg
	default_description = /datum/organ_description/leg/left

/obj/item/organ/external/robotic/one_star/r_leg
	default_description = /datum/organ_description/leg/right
