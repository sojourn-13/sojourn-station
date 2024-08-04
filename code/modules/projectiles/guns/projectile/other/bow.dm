//All bows are in this file.


/obj/item/gun/projectile/bow
	name = "simple bow"
	desc = "A incredibly basic bow. Fires arrows."
	icon = 'icons/obj/guns/bow.dmi'
	icon_state = "bow"
	item_state = "bow"
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK
	silenced = TRUE
	caliber = CAL_ARROW
	matter = list(MATERIAL_WOOD = 10)
	fire_sound_silenced = 'sound/weapons/energy/xbow_fire.ogg' // Always meant to be shared with the crossbow.
	bulletinsert_sound = 'sound/effects/pageturn2.ogg'   //Placeholder, could use a new sound
	fire_sound_text = "a dull twang"
	gun_tags = list(GUN_SCOPE, ARROW_FIRING)
	max_upgrades = 2
	overcharge_timer_step = 7.5
	price_tag = 100
	init_firemodes = list(
			list(mode_name="normal", mode_desc="Draw the bow to fire a shot", mode_type = /datum/firemode/charge, icon="charge")
			)
	serial_type = null
	twohanded = TRUE
	safety = FALSE
	restrict_safety = TRUE
	var/arrow_x_offset_per_tension = -1
	var/arrow_y_offset_per_tension = 1

/obj/item/gun/projectile/bow/proc/update_draw()
	var/true_tension = round(overcharge_level/2,1)
	if(overcharge_level == overcharge_max)
		true_tension = 6
	icon_state = "[initial(icon_state)]-[true_tension]"

/obj/item/gun/projectile/bow/update_icon()
	cut_overlays()
	update_draw()
	if(chambered)
		var/true_tension = round(overcharge_level/2,1)
		if(overcharge_level == overcharge_max)
			true_tension = 6
		var/mutable_appearance/arrow_overlay = mutable_appearance('icons/obj/guns/bow.dmi', chambered.icon_state)
		arrow_overlay.pixel_x = true_tension * arrow_x_offset_per_tension
		arrow_overlay.pixel_y = true_tension * arrow_y_offset_per_tension
		add_overlay(arrow_overlay)

/obj/item/gun/projectile/bow/attackby(obj/item/A, mob/user)
	if(chambered)
		return
	..()
	if(LAZYLEN(loaded))
		chambered = loaded[1]
		loaded -= chambered
	update_icon()


/obj/item/gun/projectile/bow/unload_ammo(mob/user, allow_dump)
	if(chambered)
		user.put_in_hands(chambered)
		chambered = null
	else
		to_chat(user, SPAN_WARNING("[src] is empty."))
	update_icon()

/obj/item/gun/projectile/bow/consume_next_projectile()
	if(chambered)
		return chambered.BB


/obj/item/gun/projectile/bow/begin_charge(mob/living/user)
	to_chat(user, SPAN_NOTICE("You begin drawing back the string on [src]."))
	playsound(loc, 'sound/weapons/bow_draw.ogg', 50, 1)
	overcharge_timer = addtimer(CALLBACK(src, PROC_REF(add_charge), user), overcharge_timer_step, TIMER_STOPPABLE)

/obj/item/gun/projectile/bow/add_charge(mob/living/user)
	deltimer(overcharge_timer)
	if(get_holding_mob() == user && chambered)
		overcharge_level = min(overcharge_level + 1 + get_overcharge_add(user), overcharge_max)
		to_chat(user, SPAN_NOTICE("You continue drawing the bow back..."))
		update_icon()
		if(overcharge_level < overcharge_max)
			overcharge_timer = addtimer(CALLBACK(src, PROC_REF(add_charge), user), overcharge_timer_step, TIMER_STOPPABLE)
		else
			to_chat(user, SPAN_NOTICE("\The [src] is fully drawn!"))
		return

/obj/item/gun/projectile/bow/release_charge(atom/target, mob/living/user)
	deltimer(overcharge_timer)
	Fire(target, user, extra_proj_damagemult = overcharge_level, extra_proj_penmult = overcharge_level, extra_proj_stepdelaymult = (overcharge_level > 5 ? 1 : 0.4), multiply_projectile_agony = overcharge_level)
	overcharge_level = 0
	update_icon()

/obj/item/gun/projectile/bow/dropped()
	overcharge_level = 0
	update_icon()
	..()

/obj/item/gun/projectile/bow/hunting
	name = "hunting bow"
	icon_state = "recurve"
	desc = "A recurve hunting bow, made alternating bands of stalker chitin, animal sinew and wood laminated together."
	matter = list(MATERIAL_BONE = 10, MATERIAL_WOOD = 10, MATERIAL_PLASTIC = 5)
	penetration_multiplier = 1.5
	gun_tags = list(ARROW_FIRING)
	zoom_factors = list(2.0)
	extra_damage_mult_scoped = 0.2
	overcharge_timer_step = 4
	price_tag = 1200

//currently unobtainable due to no unique sprite

/obj/item/gun/projectile/bow/xbow
	name = "\"Whaler\" heavy compound bow"
	desc = "A heavy compound bow made from plastic, with a plasteel riser. Not originally an Artificer's Guild design, but the tight tolerances and high skill required to construct means that they remain the only group capable of manufacturing them. \
	A modified \"Watchman\" scope is attached to the riser, with arrow drop markers for various weights of arrow present."
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_PLASTIC = 40, MATERIAL_PLASMAGLASS = 2)
	damage_multiplier = 1.2
	penetration_multiplier = 1.2
	gun_tags = list(ARROW_FIRING)
	max_upgrades = 4
	zoom_factors = list(1.4)
	extra_damage_mult_scoped = 0.1
