// Crayon Colors
/obj/item/pen/crayon/red
	icon_state = "crayonred"
	colour = COLOR_CRAYON_RED
	shadeColour = COLOR_CRAYON_SHADE_RED
	colourName = "red"

/obj/item/pen/crayon/orange
	icon_state = "crayonorange"
	colour = COLOR_CRAYON_ORANGE
	shadeColour = COLOR_CRAYON_SHADE_ORANGE
	colourName = "orange"

/obj/item/pen/crayon/yellow
	icon_state = "crayonyellow"
	colour = COLOR_CRAYON_YELLOW
	shadeColour = COLOR_CRAYON_SHADE_YELLOW
	colourName = "yellow"

/obj/item/pen/crayon/green
	icon_state = "crayongreen"
	colour = COLOR_CRAYON_GREEN
	shadeColour = COLOR_CRAYON_SHADE_GREEN
	colourName = "green"

/obj/item/pen/crayon/blue
	icon_state = "crayonblue"
	colour = COLOR_CRAYON_BLUE
	shadeColour = COLOR_CRAYON_SHADE_BLUE
	colourName = "blue"

/obj/item/pen/crayon/purple
	icon_state = "crayonpurple"
	colour = COLOR_CRAYON_PURPLE
	shadeColour = COLOR_CRAYON_SHADE_PURPLE
	colourName = "purple"

/obj/item/pen/crayon/black
	icon_state = "crayonblack"
	colour = COLOR_CRAYON_BLACK
	shadeColour = COLOR_CRAYON_SHADE_BLACK
	colourName = "black"

/obj/item/pen/crayon/white
	icon_state = "crayonwhite"
	colour = COLOR_CRAYON_WHITE
	shadeColour = COLOR_CRAYON_SHADE_WHITE
	colourName = "white"

/obj/item/pen/crayon/mime
	icon_state = "crayonmime"
	desc = "A very sad-looking crayon."
	colour = COLOR_CRAYON_WHITE
	shadeColour = COLOR_CRAYON_BLACK
	colourName = "mime"
	uses = 0
	grindable = FALSE

/obj/item/pen/crayon/rainbow
	icon_state = "crayonrainbow"
	colour = "#FFF000"
	shadeColour = "#000FFF"
	colourName = "rainbow"
	uses = 0
	grindable = FALSE

// Crayon Logic
/obj/item/pen/crayon/afterattack(atom/target, mob/user as mob, proximity)
	if(!proximity) return
	if(istype(target,/turf/simulated/floor))
		var/drawtype = input("Choose what you'd like to draw.", "Crayon scribbles") in list("graffiti","rune","letter","arrow")
		var/link_to_rune = FALSE
		switch(drawtype)
			if("letter")
				drawtype = input("Choose the letter.", "Crayon scribbles") in list("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z")
				to_chat(user, "You start drawing a letter on the [target.name].")
			if("graffiti")
				to_chat(user, "You start drawing graffiti on the [target.name].")
			if("rune")
				to_chat(user, "You start drawing a rune on the [target.name].")
				link_to_rune = TRUE
			if("arrow")
				drawtype = input("Choose the arrow.", "Crayon scribbles") in list("left", "right", "up", "down")
				to_chat(user, "You start drawing an arrow on the [target.name].")
		if(instant || do_after(user, 50))
			//This looks bad do to needing to cross-reference 2 paths thare are related
			var/obj/effect/decal/cleanable/crayon/drawing_to_spawn = new /obj/effect/decal/cleanable/crayon(target,colour,shadeColour,drawtype)
			if(link_to_rune)
				drawing_to_spawn.follow_crayon = src
			to_chat(user, "You finish drawing.")
			target.add_fingerprint(user)		// Adds their fingerprints to the floor the crayon is drawn on.
			if(uses)
				uses--
				if(!uses)
					to_chat(user, SPAN_WARNING("You used up your crayon!"))
					qdel(src)
	return

/obj/item/pen/crayon/attack(mob/living/carbon/M as mob, mob/user as mob)
	if(istype(M) && M == user)
		to_chat(M, "You take a bite of the crayon and swallow it.")
		M.nutrition += 1
		M.reagents.add_reagent("crayon_dust",min(5,uses)/3)
		if(uses)
			uses -= 5
			if(uses <= 0)
				to_chat(M, SPAN_WARNING("You ate your crayon!"))
				qdel(src)
	else
		..()

// Mime Crayon Logic
/obj/item/pen/crayon/mime/attack_self(mob/living/user as mob)
	if(colour != COLOR_CRAYON_WHITE && shadeColour != COLOR_CRAYON_BLACK)
		colour = COLOR_CRAYON_WHITE
		shadeColour = COLOR_CRAYON_BLACK
		to_chat(user, "You will now draw in white and black with this crayon.")
	else
		colour = COLOR_CRAYON_BLACK
		shadeColour = COLOR_CRAYON_WHITE
		to_chat(user, "You will now draw in black and white with this crayon.")
	return

// Rainbow Crayon Logic
/obj/item/pen/crayon/rainbow/attack_self(mob/living/user as mob)
	colour = input(user, "Please select the main color.", "Crayon color") as color
	shadeColour = input(user, "Please select the shade color.", "Crayon color") as color
	return
