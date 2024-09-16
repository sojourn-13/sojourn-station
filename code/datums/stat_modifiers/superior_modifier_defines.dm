/datum/stat_modifier/mob/living/carbon/superior_animal

	/// Assoc list. If the key is present in the target's armor list var, add the value of this key to their key. If it isnt present, set the value to this key's value.
	var/armor_adjustment = list(

	)

	/// Assoc list. If the key is present in the target's armor list var, multiply the value of their key by this value. If it isnt present, continue.
	var/armor_mult = list(

	)

	/**
	 * If the current armor value is negative, and this is true, and we are multiplying our target's armor,
	 * get the difference between the target's current armor value of the current key, and subtract it with the difference between the value and the product of value*mult.
    **/
	var/invert_armor_mult_if_negative = FALSE
	/// If we inverted due to armor being negative, we store the key of the armor and the difference between the initial value and the mult.
	var/list/mult_diff = list(

	)

	var/flash_resistances_increment
	var/flash_resistances_mult
	var/flash_resistances_zeroth = 0.5

	var/armor_divisor_increment
	var/armor_divisor_mult
	var/armor_divisor_zeroth = 1

	var/rapid_fire_shooting_amount_increment
	var/rapid_fire_shooting_amount_mult
	var/rapid_fire_shooting_amount_zeroth = 0.5

	var/delay_for_rapid_range_adjustment
	var/delay_for_rapid_range_mult
	var/delay_for_rapid_range_zeroth = 0

	var/fire_delay_increment
	var/fire_delay_mult
	var/fire_delay_zeroth = 0.5

	var/delay_for_range_mult
	var/delay_for_range_adjustment
	var/delay_for_range_zeroth = 0

	var/delayed_adjustment
	var/delayed_mult
	var/delayed_zeroth = 0.5

	var/poison_per_bite_increment
	var/poison_per_bite_mult
	var/poison_per_bite_zeroth = 0

/datum/stat_modifier/mob/living/carbon/superior_animal/remove(qdel_src = TRUE)
	if (issuperioranimal(holder))
		var/mob/living/carbon/superior_animal/superior_holder = holder

		if (armor_adjustment)
			for (var/key in armor_adjustment)
				if (key in superior_holder.armor)
					superior_holder.armor[key] = (superior_holder.armor[key] - armor_adjustment[key])
				else
					continue //we add any missing keys in apply_to so this shouldnt happen but lets be careful

		if (armor_mult)
			for (var/key in armor_mult)
				if (key in superior_holder.armor)
					if ((superior_holder.armor[key] < 0) && invert_armor_mult_if_negative)
						superior_holder.armor[key] = (superior_holder.armor[key] + mult_diff[key]) //add the multiplication difference between the initial armor value and our mult
					else
						superior_holder.armor[key] = (superior_holder.armor[key] / armor_mult[key]) //warning. negatives multiply into negatives
				else
					continue

		if (flash_resistances_increment)
			superior_holder.flash_resistances = ZERO_OR_MORE(superior_holder.flash_resistances - flash_resistances_increment)
		if (flash_resistances_mult)
			superior_holder.flash_resistances = ZERO_OR_MORE(round(superior_holder.flash_resistances / flash_resistances_mult))

		if (armor_divisor_increment)
			superior_holder.armor_divisor = ZERO_OR_MORE(superior_holder.armor_divisor - armor_divisor_increment)
		if (armor_divisor_mult)
			superior_holder.armor_divisor = ZERO_OR_MORE(superior_holder.armor_divisor / armor_divisor_mult)

		if (fire_delay_increment)
			superior_holder.fire_delay = ZERO_OR_MORE(superior_holder.fire_delay - fire_delay_increment)
			superior_holder.fire_delay_initial = ZERO_OR_MORE(superior_holder.fire_delay_initial - fire_delay_increment)
		if (fire_delay_mult)
			superior_holder.fire_delay = ZERO_OR_MORE(round(superior_holder.fire_delay / fire_delay_mult))
			superior_holder.fire_delay_initial = ZERO_OR_MORE(round(superior_holder.fire_delay_initial / fire_delay_mult))

		if (rapid_fire_shooting_amount_increment)
			superior_holder.rapid_fire_shooting_amount = ZERO_OR_MORE(superior_holder.rapid_fire_shooting_amount - rapid_fire_shooting_amount_increment)
		if (rapid_fire_shooting_amount_mult)
			superior_holder.rapid_fire_shooting_amount = ZERO_OR_MORE(round(superior_holder.rapid_fire_shooting_amount / rapid_fire_shooting_amount_mult))
		if (superior_holder.rapid_fire_shooting_amount <= 0)
			superior_holder.rapid = FALSE

		if (issuperiorspider(superior_holder))
			var/mob/living/carbon/superior_animal/giant_spider/spider_target = holder

			if (poison_per_bite_increment)
				spider_target.poison_per_bite = ZERO_OR_MORE(spider_target.poison_per_bite - poison_per_bite_increment)
			if (poison_per_bite_mult)
				spider_target.poison_per_bite = ZERO_OR_MORE(spider_target.poison_per_bite / poison_per_bite_mult)

		if (delay_for_range_adjustment)
			superior_holder.delay_for_range = ZERO_OR_MORE(superior_holder.delay_for_range - delay_for_range_adjustment)
		if (delay_for_range_mult)
			superior_holder.delay_for_range = ZERO_OR_MORE(superior_holder.delay_for_range / delay_for_range_mult)

		if (superior_holder.rapid)
			if (delay_for_rapid_range_adjustment)
				superior_holder.delay_for_rapid_range = ZERO_OR_MORE(superior_holder.delay_for_rapid_range - delay_for_rapid_range_adjustment)
			if (delay_for_rapid_range_mult)
				superior_holder.delay_for_rapid_range = ZERO_OR_MORE(superior_holder.delay_for_rapid_range / delay_for_rapid_range_mult)

		if (delayed_adjustment)
			superior_holder.delayed = ZERO_OR_MORE(superior_holder.delayed - delayed_adjustment)
			superior_holder.delayed_initial = ZERO_OR_MORE(superior_holder.delayed_initial - delayed_adjustment)
		if (delayed_mult)
			superior_holder.delayed = ZERO_OR_MORE(superior_holder.delayed / delayed_mult)
			superior_holder.delayed_initial = ZERO_OR_MORE(superior_holder.delayed_initial / delayed_mult)

	return ..(qdel_src)

/datum/stat_modifier/mob/living/carbon/superior_animal/apply_to(atom/target, list/arguments, arguments_to_pass)

	if (issuperioranimal(target))
		var/mob/living/carbon/superior_animal/superior_target = target

		if (armor_mult)
			for (var/key in armor_mult)
				if (key in superior_target.armor)
					if ((superior_target.armor[key] < 0) && invert_armor_mult_if_negative)
						mult_diff[key] = MULT_DIFFERENCE(superior_target.armor[key], armor_mult[key]) //we get the difference between the multiplier and product
						superior_target.armor[key] = (superior_target.armor[key] - mult_diff[key]) //subtract the armor by the difference between itself and the mult) //then we subtract the armor value with the inverted value. -60*1.3 = -42 with this
					else
						superior_target.armor[key] = (superior_target.armor[key] * armor_mult[key]) //warning. negatives multiply into negatives
				else
					continue //we arent trying to override or anything, just multiply. this is practically already zero, so, lets just leave it

		if (armor_adjustment)
			for (var/key in armor_adjustment)
				if (key in superior_target.armor)
					superior_target.armor[key] = (superior_target.armor[key] + armor_adjustment[key])
				else
					superior_target.armor[key] = armor_adjustment[key]

		if (flash_resistances_mult)
			superior_target.flash_resistances = ZERO_OR_MORE(round(SAFEMULT(superior_target.flash_resistances, flash_resistances_mult, flash_resistances_zeroth)))
		if (flash_resistances_increment)
			superior_target.flash_resistances = ZERO_OR_MORE(superior_target.flash_resistances + flash_resistances_increment)

		if (armor_divisor_mult)
			superior_target.armor_divisor = (SAFEMULT(superior_target.armor_divisor, armor_divisor_mult, armor_divisor_zeroth))
		if (armor_divisor_increment)
			superior_target.armor_divisor = (superior_target.armor_divisor + armor_divisor_increment)

		if (fire_delay_mult)
			superior_target.fire_delay_initial = ZERO_OR_MORE(round(SAFEMULT(superior_target.fire_delay_initial, fire_delay_mult, fire_delay_zeroth)))
			superior_target.fire_delay = ZERO_OR_MORE(round(SAFEMULT(superior_target.fire_delay, fire_delay_mult, fire_delay_zeroth)))
		if (fire_delay_increment)
			superior_target.fire_delay_initial = ZERO_OR_MORE(superior_target.fire_delay_initial + fire_delay_increment)
			superior_target.fire_delay = ZERO_OR_MORE(superior_target.fire_delay + fire_delay_increment)

		if (delay_for_range_mult)
			superior_target.delay_for_range = ZERO_OR_MORE(SAFEMULT(superior_target.delay_for_range, delay_for_range_mult, delay_for_range_zeroth))
		if (delay_for_range_adjustment)
			superior_target.delay_for_range = ZERO_OR_MORE(superior_target.delay_for_range + delay_for_range_adjustment)

		if (delayed_mult)
			superior_target.delayed_initial = ZERO_OR_MORE(round(SAFEMULT(superior_target.delayed_initial, delayed_mult, delayed_zeroth)))
			superior_target.delayed = ZERO_OR_MORE(round(SAFEMULT(superior_target.delayed, delayed_mult, delayed_zeroth)))
		if (delayed_adjustment)
			superior_target.delayed_initial = ZERO_OR_MORE(superior_target.delayed_initial + delayed_adjustment)
			superior_target.delayed = ZERO_OR_MORE(superior_target.delayed + delayed_adjustment)

		if (rapid_fire_shooting_amount_mult)
			superior_target.rapid_fire_shooting_amount = ZERO_OR_MORE(round(SAFEMULT(superior_target.rapid_fire_shooting_amount, rapid_fire_shooting_amount_mult, rapid_fire_shooting_amount_zeroth)))
		if (rapid_fire_shooting_amount_increment)
			superior_target.rapid_fire_shooting_amount = ZERO_OR_MORE(superior_target.rapid_fire_shooting_amount + rapid_fire_shooting_amount_increment)
		if ((superior_target.rapid_fire_shooting_amount > 0) && (!(superior_target.rapid))) //if we are rapid firing and dont have the var set, lets set it
			superior_target.rapid = TRUE

		if (delay_for_rapid_range_mult)
			superior_target.delay_for_rapid_range = ZERO_OR_MORE(SAFEMULT(superior_target.delay_for_rapid_range, delay_for_rapid_range_mult, delay_for_rapid_range_zeroth))
		if (delay_for_rapid_range_adjustment)
			superior_target.delay_for_rapid_range = ZERO_OR_MORE(superior_target.delay_for_rapid_range + delay_for_rapid_range_adjustment)

		if (issuperiorspider(superior_target))
			var/mob/living/carbon/superior_animal/giant_spider/spider_target = target

			if (poison_per_bite_mult)
				spider_target.poison_per_bite = ZERO_OR_MORE(SAFEMULT(spider_target.poison_per_bite, poison_per_bite_mult, poison_per_bite_zeroth))
			if (poison_per_bite_increment)
				spider_target.poison_per_bite = ZERO_OR_MORE(spider_target.poison_per_bite + poison_per_bite_increment)

	return ..(target, arguments, arguments_to_pass)
