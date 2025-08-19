//Less "Machinery" and more like fluff items and set pieces.

/obj/structure/lazbench
	name = "Lazarus' Writings Bench"
	desc = "A reconstructed version of Saint Lazarus' writing station. \
	Every books' words have been censored, and countless talisman hide under the thin cloth."
	icon = 'icons/obj/neotheology_machinery.dmi'
	icon_state = "lazbench"

/obj/structure/lazbench/attackby(obj/item/W, mob/living/user, var/params)
	if(!istype(W))
		return

	if(user.a_intent == I_HELP && istype(W, /obj/item/gun))
		var/obj/item/gun/G = W
		G.gun_brace(user, src)
		return

	if (user.unEquip(W, loc))
		set_pixel_click_offset(W, params)

	return

/obj/item/lazarus_box
	name = "Lazarus' Works"
	//Basically you cant open this with force
	desc = "A heavy box that is unable to be opened due to talismans with pre-latin verses. \
	On the side of the case are simular pre-latin verses."
	icon = 'icons/obj/neotheology_machinery.dmi'
	icon_state = "lazwork"
	w_class = ITEM_SIZE_TINY
	force = WEAPON_FORCE_HARMLESS

/obj/item/lazarus_box/New()
	..()
	if(loc)
		var/obj/effect/temp_visual/text/laz_box/T = new /obj/effect/temp_visual/text/laz_box(src.loc)
		var/overlap_prevent = FALSE
		if(prob(30))
			T.create_text_overlay(T, "Many wish to escape death...")
			overlap_prevent = TRUE
		if(prob(15) && !overlap_prevent)
			T.create_text_overlay(T, "...Few are able to understand the ¦¦¦¦¦¦¦...")
			overlap_prevent = TRUE
		if(prob(10) && !overlap_prevent)
			T.create_text_overlay(T, "...I however saw a fraction too...")
			overlap_prevent = TRUE
		if(prob(1) && !overlap_prevent)
			T.create_text_overlay(T, "...Commited unspeakable heresy...")
			overlap_prevent = TRUE
		if(prob(0.1) && !overlap_prevent)
			T.create_text_overlay(T, "My work lives on, unlike myself, yet my legacy lingers for others to use.")
			overlap_prevent = TRUE


