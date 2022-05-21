/mob/living/carbon/superior_animal/ameridian_golem
	name = "ameridian golem"
	desc = "A weird creature made of ameridian"
	icon = 'icons/obj/ameridian.dmi'
	icon_state = "golem_ameridian" // Sprite from Eris, I don't know who made them. -R4d6
	faction = "ameridian"
	attacktext = "smashed"
	breath_required_type = 0 // Doesn't need to breath, in a space suit
	breath_poison_type = 0 // Can't be poisoned
	min_air_pressure = 0 // Doesn't need pressure
	move_to_delay = 4
	turns_per_move = 5
	light_range = 2
	light_color = COLOR_LIGHTING_GREEN_BRIGHT
	mob_classification = CLASSIFICATION_SYNTHETIC
	status_flags = CANPUSH // Cannot be stun, weakened or paralyzed

	armor = list(melee = 30, bullet = 20, energy = 35, bomb = 30, bio = 100, rad = 100) //We want to be gunned down, not lasered

	do_gibs = FALSE

	attack_sound = 'sound/weapons/heavysmash.ogg' //So we dont make bite sounds

	deathmessage = "shatters in a pile of rubbles."
	health = 100
	maxHealth = 100
	melee_damage_lower = 10
	melee_damage_upper = 25
	leather_amount = 0
	bones_amount = 0
	randpixel = 0
	viewRange = 8
	reagent_immune = TRUE
	toxin_immune = TRUE
	cold_protection = 1
	heat_protection = 1
	can_burrow = FALSE
	colony_friend = FALSE
	friendly_to_colony = FALSE
	known_languages = list(LANGUAGE_COMMON)
	var/obj/structure/ameridian_crystal/node
	var/drop_amount = 1 // How many crystals we drop on death
	var/size_factor = 1 // Size, in %, of the golem

/mob/living/carbon/superior_animal/ameridian_golem/Initialize()
	..()
	update_icon()

/mob/living/carbon/superior_animal/ameridian_golem/death()
	..()
	playsound(get_turf(src), "sound/effects/crumble[pick(1, 2, 3, 4, 5)].ogg", 50)
	if(drop_amount)
		var/obj/item/stack/material/ameridian/loot = new /obj/item/stack/material/ameridian(get_turf(src))
		loot.amount = drop_amount
	qdel(src)

/mob/living/carbon/superior_animal/ameridian_golem/Destroy()
	..()
	node?.golem = null

/mob/living/carbon/superior_animal/ameridian_golem/update_icon()
	transform = initial(transform)
	transform *= size_factor

/mob/living/carbon/superior_animal/ameridian_golem/bullet_act(var/obj/item/projectile/P, var/def_zone)
	if(istype(P, /obj/item/projectile/sonic_bolt))
		var/obj/item/projectile/sonic_bolt/SB = P
		SB.multiply_projectile_damage(SB.golem_damage_bonus)
		drop_amount = 0 // No loot

	..()

	spawn(10) // Wait 0.1 seconds to see if we died
		if(stat != DEAD) // We're still alive!
			drop_amount = initial(drop_amount) // So we still have loot

// Stole this code from 'code/__HELPERS/matrices.dm' because otherwise the golems shrink during the shake animation. -R4d6
/mob/living/carbon/superior_animal/ameridian_golem/shake_animation(var/intensity = 8)
	var/init_px = pixel_x
	var/shake_dir = pick(-1, 1)
	animate(src, transform=turn(matrix(), intensity*shake_dir)*size_factor, pixel_x=init_px + 2*shake_dir, time=1)
	animate(transform=matrix().Translate(0,16*(size_factor-1))*size_factor, pixel_x=init_px, time=6, easing=ELASTIC_EASING) //We're using the size multiplier on a matrix translated to make sure we are *all* on the same height on a tile.
