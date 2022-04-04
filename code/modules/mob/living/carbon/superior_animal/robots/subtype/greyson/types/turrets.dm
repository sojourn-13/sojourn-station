// OneStar patrol borg that defends OneStar facilities
// Sprites by Keereere
/mob/living/carbon/superior_animal/robot/greyson/stalker
	name = "\"Iron Lock Security\" Stalker Mk1"
	desc = "A ruthless patrol borg that defends Greyson facilities. This one has a single \"Scaffold\" caseless rifle, still enough to kill pesky intruders."
	icon_state = "stalker_mk1"
	icon_living = "stalker_mk1"
	pass_flags = PASSTABLE

	mob_size = MOB_MEDIUM

	maxHealth = 150
	health = 150

	faction = "greyson"

	deathmessage = "suddenly shuts down, its eye light switching to a dim red."
	attacktext = "bonked"
	attack_sound = 'sound/weapons/smash.ogg'
	speak_emote = list("beeps")
	emote_see = list("beeps repeatedly", "whirrs violently", "flashes its indicator lights", "emits a ping sound")
	speak_chance = 5

	move_to_delay = 6
	turns_per_move = 5
	see_in_dark = 10
	meat_type = null
	meat_amount = 0
	stop_automated_movement_when_pulled = 0

	melee_damage_lower = 12
	melee_damage_upper = 17
	destroy_surroundings = FALSE
	armor = list(melee = 35, bullet = 25, energy = 40, bomb = 60, bio = 100, rad = 100) //We want to be gunned down, not lasered
	contaminant_immunity = TRUE

	light_range = 3
	light_color = COLOR_LIGHTING_BLUE_BRIGHT
	mob_classification = CLASSIFICATION_SYNTHETIC

	reload_message = "ejects a magazome as it loudly reload with mechanical speed!"
	ranged = TRUE //will it shoot?
	rapid = FALSE //will it shoot fast?
	projectiletype = /obj/item/projectile/bullet/c10x24
	projectilesound = 'sound/weapons/Gunshot.ogg'
	limited_ammo = TRUE
	mag_drop = TRUE
	rounds_left = 99
	mag_type = /obj/item/ammo_magazine/c10x24/empty
	mags_left = 1
	casingtype = null
	ranged_cooldown = 5
	fire_verb = "fires"
	acceptableTargetDistance = 6
	comfy_range = 5

/mob/living/carbon/superior_animal/robot/greyson/stalker/New()
	..()
	pixel_x = 0
	pixel_y = 0
	if(prob(1))
		drop1 = /obj/item/gun/projectile/automatic/scaffold
	if(prob(30))
		cell_drop = /obj/item/cell/large

/mob/living/carbon/superior_animal/robot/greyson/stalker/dual
	name = "\"Iron Lock Security\" Stalker Mk2"
	desc = "A ruthless patrol borg that defends Greyson facilities. This one is an upgraded version with dual \"Scaffold\" caseless rifles, don\'t stand in front of it for too long."
	icon_state = "stalker_mk2"
	icon_living = "stalker_mk2"
	ranged_cooldown = 8
	rounds_left = 33
	mags_left = 3
	maxHealth = 250
	health = 250
	rapid = TRUE


/mob/living/carbon/superior_animal/robot/greyson/stalker/dual/New()
	..()
	if(prob(1))
		drop2 = /obj/item/gun/projectile/automatic/scaffold
