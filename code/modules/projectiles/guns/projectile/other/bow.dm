/obj/item/gun/projectile/bow
	name = "simple bow"
	desc = "A incredibly basic bow. Fires arrows."
	icon = 'icons/obj/guns/launcher/grenadelauncher.dmi'
	icon_state = "Grenadelauncher_PMC"
	item_state = "pneumatic"
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK
	silenced = TRUE
	matter = list(MATERIAL_PLASTEEL = 30, MATERIAL_PLASTIC = 10)
	fire_sound_silenced = 'sound/weapons/guns/fire/GLfire.ogg'
	bulletinsert_sound = 'sound/weapons/guns/interact/batrifle_magin.ogg'   //Placeholder, could use a new sound
	fire_sound_text = "a metallic thunk"
	overcharge_timer_step = 5
	price_tag = 1200
		init_firemodes = list(
			list(mode_name="normal", mode_desc="Draw the bow to fire a shot", mode_type = /datum/firemode/charge, icon="charge")
			)
	serial_type = null

/obj/item/gun/projectile/bow/proc/update_draw()
	true_tension = round(tension/2,1)
	icon_state = "[initial(icon_state)]-[true_tension]"

/obj/item/gun/projectile/bow/update_icon()
	cut_overlays()
	update_draw()

/obj/item/gun/projectile/bow/begin_charge(var/mob/living/user)
	to_chat(user, SPAN_NOTICE("You begin drawing back the string on [src]."))
	draw_timer = addtimer(CALLBACK(src, .proc/add_charge, user), draw_time, TIMER_STOPPABLE)

/obj/item/gun/projectile/bow/add_charge(var/mob/living/user)
	deltimer(draw_timer)
	if(get_holding_mob() == user && chambered)
		tension = min(tension++, max_tension)
		if(tension < max_tension)
			draw_timer = addtimer(CALLBACK(src, .proc/add_charge, user), draw_time, TIMER_STOPPABLE)
		else
			to_chat(user, SPAN_NOTICE("\The [src] is fully drawn!"))
		return


/obj/item/gun/projectile/bow/release_charge(var/atom/target, var/mob/living/user)
	deltimer(draw_timer)
	Fire(target, user, clickparams, extra_proj_damagemult = overcharge_level, extra_proj_penmult = overcharge_level, extra_proj_wallbangmult = overcharge_level, extra_proj_stepdelaymult = (overcharge_level > 5 ? 1 : 0.5), multiply_projectile_agony = overcharge_level)
	overcharge_level = 0
