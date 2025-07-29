// Placeholder name
/mob/living/carbon/superior/ameridian_golem/ameridian_shooter
	name = "ameridian shooter"
	desc = "A weird creature made of ameridian. It is quadruped and seems to shoot ameridian shards."
	health = 50 * AMGOLEM_HEALTH_MOD
	maxHealth = 50 * AMGOLEM_HEALTH_MOD
	armor = list(melee = 2, bullet = 4, energy = 6, bomb = 30, bio = 100, rad = 100) //We want to be rushed in melee, not shot.
	ranged = TRUE
	rapid = TRUE
	projectiletype = /obj/item/projectile/ameridian_shard/golem
	melee_damage_lower = 10
	melee_damage_upper = 15

	allowed_stat_modifiers = list(
		/datum/stat_modifier/mob/living/carbon/superior/durable = 5,
		/datum/stat_modifier/health/flat/negative/low = 5,
		/datum/stat_modifier/health/flat/positive/low = 5,
		/datum/stat_modifier/mob/living/carbon/superior/armor/mult/negative/low = 5,
		/datum/stat_modifier/mob/living/carbon/superior/brutish = 5,
		/datum/stat_modifier/mob/living/damage/negative/mixed/flat/low = 5,
		/datum/stat_modifier/mob/living/carbon/superior/brutal = 5,
		/datum/stat_modifier/mob/living/carbon/superior/aggressive/savage = 1,
		/datum/stat_modifier/mob/living/carbon/superior/aggressive = 10,
		/datum/stat_modifier/mob/living/carbon/superior/deadeye = 5,
		/datum/stat_modifier/mob/living/carbon/superior/slowaimed = 5,
		/datum/stat_modifier/mob/living/carbon/superior/triggerfinger = 15,
		/datum/stat_modifier/mob/living/carbon/superior/quickdraw = 5,
		/datum/stat_modifier/mob/living/carbon/superior/slowdraw = 10
	)

	mob_ablative_armor = 8
	research_value = 1500
