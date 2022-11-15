/mob/living/carbon/superior_animal/shell_hound
	name = "Shell hound"
	desc = "A heavy plated hound, coated in bone armor, its exposed underbelly shows fleshy muscle, with no skin to cover it. \
	Along its bone shell back are spines of mineral by the looks of it. "
	icon_state = "q-hound"
	icon_living = "q-hound"
	icon = 'icons/mob/mobs-monster.dmi'
	maxHealth = 400
	health = 400
	attack_sound = 'sound/xenomorph/alien_footstep_charge1.ogg'
	melee_damage_lower = 20
	melee_damage_upper = 30
	emote_see = list("howls in a broken voice", "wracks its claws against the ground", "gnarls")
	turns_per_move = 3
	attacktext = "carves"
	faction = "daskvey"

	friendly_to_colony = FALSE

	has_special_parts = TRUE //var for checking during the butcher process.
	special_parts = list(/obj/item/animal_part/chimera_fang)


	armor_penetration = 25 //Sharp bones


	//Good stats baseline in case admins dont edit these
	armor = list(melee = 45, bullet = 15, energy = 45, bomb = 10, bio = 100, rad = 100, agony = 70)


