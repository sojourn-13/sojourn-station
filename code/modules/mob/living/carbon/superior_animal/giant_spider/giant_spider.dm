//basic spider mob, these generally guard nests
/mob/living/carbon/superior_animal/giant_spider
	name = "guardian spider"
	desc = "Furry and black, it makes you shudder to look at it. This one has deep red eyes."
	icon = 'icons/mob/mobs-spider.dmi'
	icon_state = "guard"
	icon_living = "guard"
	pass_flags = PASSTABLE

	mob_size = MOB_MEDIUM

	maxHealth = 120
	health = 120

	attack_sound = 'sound/weapons/spiderlunge.ogg'
	speak_emote = list("chitters")
	emote_see = list("chitters.", "rubs its legs.")
	speak_chance = 5

	give_randomized_armor = TRUE //We get randomized addition armor

	armor = list(melee = 5, bullet = 5, energy = 0, bomb = 5, bio = 10, rad = 25)

	move_to_delay = 6
	turns_per_move = 5
	see_in_dark = 10
	meat_type = /obj/item/reagent_containers/food/snacks/meat/spider
	meat_amount = 3
	leather_amount = 0
	bones_amount = 0
	stop_automated_movement_when_pulled = 1

	melee_damage_lower = 12
	melee_damage_upper = 17

	min_breath_required_type = 3
	min_air_pressure = 15 //below this, brute damage is dealt

	fleshcolor = "#666600"
	bloodcolor = "#666600"

	var/poison_per_bite = 2
	var/poison_type = "pararein"
	faction = "spiders"

	colony_friend = FALSE
	friendly_to_colony = FALSE

/mob/living/carbon/superior_animal/giant_spider/New(var/location, var/atom/parent)
	get_light_and_color(parent)
	..()

/mob/living/carbon/superior_animal/giant_spider/isValidAttackTarget(var/atom/O)
	if (isliving(O))
		var/mob/living/L = O
		if(L.faction=="sproachder")
			return
	return ..(O)