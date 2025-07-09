//Less "Machinery" and more like fluff items and set pieces.

/obj/structure/lazbench
	name = "Lazarus Writings Bench"
	desc = "A reconstucted verson of Saint Lazarus writing station. \
	Every books' words have been cencered, and countless talisman hide under the thin cloth."
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
	name = "Lazarus Works"
	//Basically you cant open this with force
	desc = "A heavy box that is unable to be open do to talismans with pre-latin verses. \
	On the side of the case is simular pre-latin verses."
	icon = 'icons/obj/neotheology_machinery.dmi'
	icon_state = "candle1"
	item_state = "lazbench"
	w_class = ITEM_SIZE_TINY
	force = WEAPON_FORCE_HARMLESS

/obj/item/lazarus_box/New()
	..()
	if(loc)
		var/obj/effect/temp_visual/text/T = new  /obj/effect/temp_visual/text
		T.duration = 35 //in deciseconds
		T.randomdir = FALSE
		T.txt_color = "#A77D02"  // Gold-ish yellow
		//if(prob(30))
		T.txt = "Many wish to escape death..."
		if(prob(15))
			T.txt = "...Few are able to understand the ¦¦¦¦¦¦¦..."
		if(prob(10))
			T.txt = "...I however saw a fraction too..."
		if(prob(1))
			T.txt = "...Commited unspeakable heresy..."
		if(prob(0.1))
			T.txt = "My work lives on, unlike myself, yet my wishes linger on for others to use."
		T.forceMove(loc)

