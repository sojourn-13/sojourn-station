/datum/stat_modifier/mob/living/carbon/superior_animal

	var/armor_adjustment = list(
		melee = 0,
		bullet = 0,
		energy = 0,
		bomb = 0,
		bio = 0,
		rad = 0,
		agony = 0
	)

	var/flash_armor = 0
	var/armor_penetration = 0
	var/rapid_adjustment = 0
	var/fire_delay_increment = 0

	var/fire_telegraph_delay_mult = 1

	var/retarget_timer_adjustment = 0

	var/viewRange_adjustment = 0

	var/poison_adjustment = 0

/datum/stat_modifier/mob/living/carbon/superior_animal/remove()
	if (issuperioranimal(holder))
		var/mob/living/carbon/superior_animal/superior_holder = holder

		superior_holder.flash_resistances -= flash_armor
		superior_holder.armor_penetration -= armor_penetration
		superior_holder.fire_delay -= fire_delay_increment
		superior_holder.fire_delay_initial -= fire_delay_increment

		superior_holder.rapid_fire_shooting_amount -= rapid_adjustment
		if (superior_holder.rapid_fire_shooting_amount == 0)
			superior_holder.rapid = FALSE

		if (issuperiorspider(superior_holder))
			var/mob/living/carbon/superior_animal/giant_spider/spider_target = holder

			spider_target.poison_per_bite -= poison_adjustment

	return ..()

/datum/stat_modifier/mob/living/carbon/superior_animal/apply_to(atom/target)

	if (issuperioranimal(target))
		var/mob/living/carbon/superior_animal/superior_target = target
		for (var/key in armor_adjustment)
			if (key in superior_target.armor)
				superior_target.armor[key] += armor_adjustment[key]
			else
				superior_target.armor[key] = armor_adjustment[key]

			superior_target.flash_resistances += flash_armor
			superior_target.armor_penetration += armor_penetration
			superior_target.fire_delay += fire_delay_increment
			superior_target.fire_delay_initial += fire_delay_increment
			superior_target.delay_for_range = ((superior_target.delay_for_range) * (fire_telegraph_delay_mult))

		if (rapid_adjustment)
			if (!superior_target.rapid)
				superior_target.rapid = TRUE
			superior_target.rapid_fire_shooting_amount += rapid_adjustment

		if (issuperiorspider(superior_target))
			var/mob/living/carbon/superior_animal/giant_spider/spider_target = target

			spider_target.poison_per_bite += poison_adjustment

	return ..()

/datum/stat_modifier/mob/living/carbon/superior_animal/durable

	armor_adjustment = list(
	melee = 5,
	bullet = 5,
	bomb = 15,
	agony = 30
	)

	flash_armor = 1

	prefix = "Durable"

	description = "This one looks somewhat more sturdy than others. It'll likely be more resistant to damage and pain."

/datum/stat_modifier/mob/living/carbon/superior_animal/brutish

	armor_adjustment = list(
		melee = 5,
		bullet = 5,
		energy = -5,
		bomb = 5,
		agony = 15
		)

	melee_lower_adjust = 2
	melee_upper_adjust = 2
	max_health_adjustment = 5
	health_adjustment = 5
	armor_penetration = 2

	description = "This one is noticably muscular. It looks like it might hit harder than others."

	prefix = "brutish"

/datum/stat_modifier/mob/living/carbon/superior_animal/padded

	armor_adjustment = list(
		melee = 10,
		bullet = 5,
		bomb = 10,
		agony = 15 //Rubbers deal way less to us!
	)

	health_adjustment = 10
	max_health_adjustment = 10

	prefix = "padded"

	description = "This one seems to be a bit 'puffier' than others. It looks like your attacks will do somewhat less on it."

/datum/stat_modifier/mob/living/carbon/superior_animal/old

	armor_adjustment = list(
		melee = 5,
		bullet = 5,
		bomb = 10,
		agony = 20 //just cant feel it
	)

	max_health_adjustment = 20 //life already seen them by
	health_adjustment = 20
	movement_adjust = 1 // Very slow

	prefix = "old"

	description = "This one seems old - lethargic, but seasoned. It's likely to be slower but harder to kill."

/datum/stat_modifier/mob/living/carbon/superior_animal/young

	armor_adjustment = list(
		melee = -5,
		bullet = -5,
		energy = -5,
		agony = -5
	)

	max_health_adjustment = -10
	health_adjustment = -10

	movement_adjust = -0.5

	prefix = "young"

	description = "This one seems to be more active and energetic than the others, but somewhat smaller. It's likely to be more fragile, but quicker."

/// slower, deadlier, significantly tanker -- a significant buff
/datum/stat_modifier/mob/living/carbon/superior_animal/brutal

	armor_adjustment = list(
		melee = 15,
		bullet = 5,
		bomb = 15,
		agony = 60 //good luck using rubbers
	)

	flash_armor = 2

	armor_penetration = 5

	melee_lower_adjust = null
	melee_upper_adjust = null //calculated in apply_to

	movement_adjust = 1

	description = "This one looks exceptionally muscular and scarred. You get the feeling they might be significantly physically stronger, durable, and resistant to pain, than others of its like."

/datum/stat_modifier/mob/living/carbon/superior_animal/brutal/apply_to(atom/target)

	if (isliving(target))
		var/mob/living/living_target = target

		melee_lower_adjust = ((living_target.melee_damage_lower)*(1.3)) // times 1.3
		melee_upper_adjust = ((living_target.melee_damage_upper)*(1.3))

	max_health_adjustment = ((target.maxHealth*(1.3)))
	health_adjustment = max_health_adjustment

	. = ..()
