/datum/stat_modifier/mob/living/carbon/superior/deadeye

	inherent_projectile_mult_increment = 1 //a little more dps, but more easily avoided
	projectile_armor_divisor_mult_increment = 1.25

	delay_for_range_mult = 1.4
	delay_for_rapid_range_mult = 1.4

	fire_delay_mult = 2
	fire_delay_zeroth = 0.5 //at 0 fire delay, it gets multiplied from 0.5 to 1

	prefix = "Deadeye"

	description = "This one seems to be very accurate and precise with its shots. It'll likely shoot slower, but with more precision, giving it extra damage and AP as well as alining its aim to be for headshots, and arms!."

	stattags = RANGED_STATTAG
	zone_hit_rates_setter = list(BP_HEAD = 30, BP_CHEST = 10, BP_GROIN = 10, BP_R_ARM = 50, BP_L_ARM = 50, BP_R_LEG = 20, BP_L_LEG = 20)

/datum/stat_modifier/mob/living/carbon/superior/slowaimed

	delay_for_range_mult = 1.2
	delay_for_rapid_range_mult = 1.2

	fire_delay_mult = 2
	fire_delay_zeroth = 0.5 //at 0 fire delay, it gets multiplied from 0.5 to 1

	prefix = "Slow-aimed"

	description = "This one seems to take a bit of extra time to aim."

	stattags = RANGED_STATTAG

/datum/stat_modifier/mob/living/carbon/superior/triggerfinger

	rapid_fire_shooting_amount_mult = 2 //pretty noticable damage increase
	delay_for_rapid_range_mult = 0.5 //half the delay

	projectile_armor_divisor_mult_increment = -0.5 //significantly worse armor penetration because they're just shooting whatever part of you they can

	inherent_projectile_mult_increment = -0.3 // but still with higher DPS because theyre shooting you twice as much for 70% damage

	prefix = "Trigger-fingered"

	description = "This one seems overeager to shoot. It's likely they'll fire more often than others, although with less precision, thus less armor penetration and damage."

	stattags = RANGED_STATTAG
	zone_hit_rates_setter = list(BP_HEAD = 5, BP_CHEST = 80, BP_GROIN = 60, BP_R_ARM = 10, BP_L_ARM = 10, BP_R_LEG = 30, BP_L_LEG = 30)


/datum/stat_modifier/mob/living/carbon/superior/quickdraw

	delayed_adjustment = -1 //instantly attacks if they see you by default

	prefix = "Quickdraw"

	description = "This one seems vigilant, especially when it comes to keeping whatever they use as a weapon at the ready. It's likely they'll react faster than others."

	stattags = RANGED_STATTAG
	zone_hit_rates_setter = list(BP_HEAD = 25, BP_CHEST = 25, BP_GROIN = 25, BP_R_ARM = 60, BP_L_ARM = 60, BP_R_LEG = 15, BP_L_LEG = 15)



/datum/stat_modifier/mob/living/carbon/superior/slowdraw

	delayed_adjustment = 1

	prefix = "Slowdraw"

	description = "This one seems to take a bit longer to fire than others."

	stattags = RANGED_STATTAG

/datum/stat_modifier/mob/living/carbon/superior/headhunter
	prefix = "Head Hunter"

	description = "This one is trainned to aim for targets heads rather then center of mass."

	stattags = RANGED_STATTAG
	zone_hit_rates_setter = list(BP_HEAD = 55, BP_CHEST = 35, BP_GROIN = 35, BP_R_ARM = 15, BP_L_ARM = 15, BP_R_LEG = 5, BP_L_LEG = 5)

