/obj/screen/nutrition/parasite
	name = "nutrition"
	icon = 'icons/mob/screen/ErisStyle.dmi'
	icon_state = "blank"
	screen_loc = "15,6"
	process_flag = TRUE
	var/mob/living/simple_animal/borer/B

/obj/screen/nutrition/parasite/New()
	..()
	parentmob = B.host
	ovrls["nutrition0"] += new /image (icon = src.icon, icon_state ="nutrition0")
	ovrls["nutrition1"] += new /image/no_recolor(icon = src.icon, icon_state ="nutrition1")
	ovrls["nutrition2"] += new /image/no_recolor(icon = src.icon, icon_state ="nutrition2")
	ovrls["nutrition3"] += new /image/no_recolor(icon = src.icon, icon_state ="nutrition3")
	ovrls["nutrition4"] += new /image/no_recolor(icon = src.icon, icon_state ="nutrition4")
	update_icon()

/obj/screen/nutrition/parasite/Process()
	//var/mob/living/carbon/human/H = parentmob
	update_icon()

/obj/screen/nutrition/parasite/update_icon()
	set src in usr.client.screen
	cut_overlays()
	parentmob = B.host
	var/mob/living/carbon/human/H = parentmob
	if(H.species.reagent_tag == IS_SYNTHETIC)
		return
	switch(H.nutrition)
		if(450 to INFINITY)				add_overlay( ovrls["nutrition0"])
		if(350 to 450)					add_overlay( ovrls["nutrition1"])
		if(250 to 350)					add_overlay( ovrls["nutrition2"])
		if(150 to 250)					add_overlay( ovrls["nutrition3"])
		else							add_overlay( ovrls["nutrition4"])
