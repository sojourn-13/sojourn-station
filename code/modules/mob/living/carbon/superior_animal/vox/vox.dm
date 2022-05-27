/mob/living/carbon/superior_animal/vox
	name = "Matasa sojoji"
	desc = "A small predator native to these lands. They are known for their limited craftsmanship and manipulation of objects."
	icon_state = "vox_marsmud"
	icon = 'icons/mob/mobs-voxy.dmi'

	maxHealth = 50 //No. This is being nerfed until Niko fixes his AI stuff
	health = 50 //Ditto

	faction = "vox_tribe" //In case of different tribes
	turns_per_move = 3 //Ditto. No.
	move_to_delay = 3 //This is added to prevent them from being menaces to EVERYONE
	see_in_dark = 10
	speak_emote = list("grumbles")
	emote_see = list("looks around for a target.")
	attacktext = "claws"
	meat_amount = 4
	meat_type = /obj/item/reagent_containers/food/snacks/meat/chicken/vox
	mob_size = MOB_MEDIUM
	can_burrow = FALSE
	randpixel = 0
	deathmessage = "slumps down and seems to no longer move!"
	attack_sound = 'sound/weapons/slash.ogg'

	has_special_parts = TRUE
	special_parts = list(/obj/item/animal_part/wolf_tooth)

	armor = list(melee = 10, bullet = 15, energy = 5, bomb = 20, bio = 20, rad = 0)

	fire_verb = "flings a rock"

	melee_damage_lower = 8 //They attack faster.
	melee_damage_upper = 10 //They attack faster.

	colony_friend = FALSE
	friendly_to_colony = FALSE

	projectiletype = /obj/item/projectile/bullet/rock
	limited_ammo = TRUE
	mag_drop = FALSE
	ranged = TRUE
	rounds_left = 1
	mag_type = /obj/item/stack/ore
	mags_left = 4 //each vox has 4 rocks normally - Nerfed
	rounds_per_fire = 1
	reload_message = "picks up a rock!"

	var/knock_over_odds = 5
