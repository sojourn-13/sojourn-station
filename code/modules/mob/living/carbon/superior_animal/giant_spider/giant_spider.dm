//basic spider mob, these generally guard nests
/mob/living/carbon/superior/spider
	name = "guardian spider"
	desc = "Furry and black, it makes you shudder to look at it. This one has deep red eyes."
	icon = 'icons/mob/mobs-spider.dmi'
	icon_state = "guard"
	icon_living = "guard"
	pass_flags = PASSTABLE

	mob_size = MOB_MEDIUM

	maxHealth = 100 * SPIDER_HEALTH_MOD
	health = 100 * SPIDER_HEALTH_MOD

	attack_sound = 'sound/weapons/spiderlunge.ogg'
	speak_emote = list("chitters")
	emote_see = list("chitters.", "rubs its legs.")
	speak_chance = 5

	get_stat_modifier = FALSE //We're too baby to get extra mods.
	armor_divisor = 1

	armor = list(melee = 1, bullet = 0, energy = 0, bomb = 1, bio = 10, rad = 25)

	allowed_stat_modifiers = list(
		/datum/stat_modifier/mob/living/carbon/superior/lustrous = 33,
		/datum/stat_modifier/mob/living/carbon/superior/padded/ = 17,
		/datum/stat_modifier/mob/living/carbon/superior/durable/spider = 50,
		/datum/stat_modifier/mob/living/carbon/superior/young/spider = 33,
		/datum/stat_modifier/mob/living/carbon/superior/old/spider = 50,
		/datum/stat_modifier/mob/living/carbon/superior/venomous = 1,
		/datum/stat_modifier/mob/living/carbon/superior/brutish = 16,
	)

	move_to_delay = 4.5
	turns_per_move = 5
	see_in_dark = 10
	meat_type = /obj/item/reagent_containers/snacks/meat/spider
	meat_amount = 3
	leather_amount = 0
	bones_amount = 0
	stop_automated_movement_when_pulled = 1

	melee_damage_lower = 12
	melee_damage_upper = 17

	min_breath_required_type = 3
	min_air_pressure = 15 //below this, brute damage is dealt

	fleshcolor = "#1E536E"
	bloodcolor = "#1E536E"

	poison_per_bite = 2
	poison_type = "pararein"
	faction = "spiders"

	price_tag = 250 //in case you sell these???

	colony_friend = FALSE
	friendly_to_colony = FALSE
	fancy_attack_overlay = "spider_bite_flick"
	fancy_attack_shading = "#CBC3E3"

/mob/living/carbon/superior/spider/New(var/location, var/atom/parent)
	get_light_and_color(parent)
	..()

/mob/living/carbon/superior/spider/isValidAttackTarget(var/atom/O)
	if (isliving(O))
		var/mob/living/L = O
		if(L.faction=="sproachder")
			return
	return ..(O)
