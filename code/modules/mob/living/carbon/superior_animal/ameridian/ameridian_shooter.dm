// Placeholder name
/mob/living/carbon/superior_animal/ameridian_golem/ameridian_shooter
	name = "ameridian shooter"
	desc = "A weird creature made of ameridian. It is quadruped and seems to shoot ameridian shards."
	health = 50
	maxHealth = 50
	armor = list(melee = 10, bullet = 50, energy = 55, bomb = 30, bio = 100, rad = 100) //We want to be rushed in melee, not shot.
	ranged = TRUE
	rapid = TRUE
	projectiletype = /obj/item/projectile/ameridian_shard/golem
	melee_damage_lower = 10
	melee_damage_upper = 15

	allowed_stat_modifiers = list(
		/datum/stat_modifier/mob/living/carbon/superior_animal/durable = 5,
		/datum/stat_modifier/health/flat/negative/low = 5,
		/datum/stat_modifier/health/flat/positive/low = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/armor/mult/negative/low = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/brutish = 5,
		/datum/stat_modifier/mob/living/damage/negative/mixed/flat/low = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/brutal = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/aggressive/savage = 1,
		/datum/stat_modifier/mob/living/carbon/superior_animal/aggressive = 10,
		/datum/stat_modifier/mob/living/carbon/superior_animal/deadeye = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/slowaimed = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/triggerfinger = 15,
		/datum/stat_modifier/mob/living/carbon/superior_animal/quickdraw = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/slowdraw = 10
	)
