
/*
PP Station 13 Foreskin Magic
Made with love by woross
*/


/obj/structure/jewaltar
	name = "altar"
	desc = "An altar, presumably to the Moloch."
	icon = 'ppstation/icons/jew.dmi'
	icon_state = "jewaltar"
	density = TRUE
	anchored = TRUE
	layer = TABLE_LAYER
	climbable = FALSE
	pass_flags = LETPASSTHROW //You can throw objects over this, despite it's density.")
	max_integrity = 10000
	integrity_failure = 30
	var/foreskincount = 0

/obj/structure/jewaltar/attackby(obj/item/I, mob/user, params)
	if(user.a_intent != INTENT_HARM && istype(I, /obj/item/organ/foreskin))
		if(user.transferItemToLoc(I, drop_location()))
			var/list/click_params = params2list(params)
			if(!click_params || !click_params["icon-x"] || !click_params["icon-y"])
				return
			I.pixel_x = CLAMP(text2num(click_params["icon-x"]) - 16, -(world.icon_size/2), world.icon_size/2)
			I.pixel_y = CLAMP(text2num(click_params["icon-y"]) - 16, -(world.icon_size/2), world.icon_size/2)
			return 1

/obj/structure/jewaltar/attack_hand(mob/living/user)
	if(user.mind.assigned_role == "Rabbi")
		icon_state = "jewaltar_burning"
		to_chat(user, "<span class='notice'>The altar lights up...</span>")
		sleep(10)
		for (var/obj/item/organ/foreskin/M in get_turf(src))
			sleep(10)
			playsound(src, "sound/effects/splat.ogg", 30, 1, 5)
			qdel(M)
			var/obj/item/stack/spacecash/c1000/dosh = new/obj/item/stack/spacecash/c1000(src.loc)
			dosh.throw_at(user, 1, 1)
			foreskincount += 1
		if(foreskincount == 0)
			to_chat(user, "<span class='notice'>...but nothing happens.</span>")
		icon_state = "jewaltar"
		foreskincount = 0
	else
		to_chat(user, "<span class='warning'>The altar burns you, goy!</span>")
		user.apply_damage(10,"burn","chest")
		user.say("*scream")
		icon_state = "jewaltar_goyim"
		sleep(10)
		icon_state = "jewaltar"
	return ..()