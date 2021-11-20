
//Growables and cubes

/obj/item/reagent_containers/food/snacks/monkeycube
	name = "monkey cube"
	desc = "Just add water!"
	reagent_flags = REFILLABLE
	icon_state = "monkeycube"
	bitesize = 12
	filling_color = "#ADAC7F"
	center_of_mass = list("x"=16, "y"=14)
	matter = list(MATERIAL_BIOMATTER = 20)
	var/wrapped = FALSE
	var/monkey_type = "Monkey"
	preloaded_reagents = list("protein" = 10)

/obj/item/reagent_containers/food/snacks/monkeycube/attack_self(mob/user as mob)
	if(wrapped)
		Unwrap(user)

/obj/item/reagent_containers/food/snacks/monkeycube/proc/Expand()
	src.visible_message(SPAN_NOTICE("\The [src] expands!"))
	var/turf/T = get_turf(src)
	if(istype(T))
		new /mob/living/carbon/human/monkey(T)
	qdel(src)
	return TRUE

/obj/item/reagent_containers/food/snacks/monkeycube/proc/Unwrap(mob/user as mob)
	icon_state = "monkeycube"
	desc = "Just add water!"
	to_chat(user, "You unwrap the cube.")
	wrapped = FALSE
	reagent_flags |= REFILLABLE
	matter = list(MATERIAL_BIOMATTER = 21)

/obj/item/reagent_containers/food/snacks/monkeycube/on_reagent_change()
	if(reagents.has_reagent("water"))
		Expand()

/obj/item/reagent_containers/food/snacks/monkeycube/wrapped
	desc = "Still wrapped in some paper."
	icon_state = "monkeycubewrap"
	reagent_flags = NONE
	wrapped = TRUE

/obj/item/reagent_containers/food/snacks/cube
	matter = list(MATERIAL_BIOMATTER = 20)

/obj/item/reagent_containers/food/snacks/cube/gun
	name = "Grow-A-Gun Cube"
	desc = "Just add Water!"
	reagent_flags = REFILLABLE
	icon_state = "guncube"
	bitesize = 12
	filling_color = "#ADAC7F"
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("plasticide" = 10)
	//taste_tag = list(MEAT_FOOD,BLAND_FOOD)

/obj/item/reagent_containers/food/snacks/cube/gun/New()
	..()
	color = pick("#EE204D", "#FCE883", "#1F75FE", "#B5674D", "#FF7538", "#1CAC78", "#926EAE", "#232323")

/obj/item/reagent_containers/food/snacks/cube/gun/proc/Expand()
	src.visible_message(SPAN_NOTICE("\The [src] expands!"))
	var/turf/T = get_turf(src)
	new/obj/item/gun/projectile/automatic/slaught_o_matic(T)
	qdel(src)
	return TRUE

/obj/item/reagent_containers/food/snacks/cube/gun/on_reagent_change()
	if(reagents.has_reagent("water"))
		Expand()


/obj/item/reagent_containers/food/snacks/cube/roach
	name = "Roach Cube"
	desc = "Just add Blood!"
	reagent_flags = REFILLABLE
	icon = 'icons/obj/roach_cubes.dmi'
	icon_state = "roachcube"
	bitesize = 12
	filling_color = "#ADAC7F"
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("protein" = 10)
	//taste_tag = list(MEAT_FOOD,BLAND_FOOD)

/obj/item/reagent_containers/food/snacks/cube/roach/proc/Expand()
	src.visible_message(SPAN_NOTICE("\The [src] expands!"))
	var/turf/T = get_turf(src)
	new/mob/living/carbon/superior_animal/roach(T)
	qdel(src)
	return TRUE

/obj/item/reagent_containers/food/snacks/cube/roach/on_reagent_change()
	if(reagents.has_reagent("blood"))
		Expand()

/obj/item/reagent_containers/food/snacks/cube/fuhrer
	name = "Fuhrer Cube"
	desc = "Just add Blood!"
	reagent_flags = REFILLABLE
	icon = 'icons/obj/roach_cubes.dmi'
	icon_state = "fuhrercube"
	bitesize = 12
	filling_color = "#ADAC7F"
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("protein" = 10)
	//taste_tag = list(MEAT_FOOD,BLAND_FOOD)

/obj/item/reagent_containers/food/snacks/cube/fuhrer/proc/Expand()
	src.visible_message(SPAN_NOTICE("\The [src] expands!"))
	var/turf/T = get_turf(src)
	new/mob/living/carbon/superior_animal/roach/fuhrer(T)
	qdel(src)
	return TRUE

/obj/item/reagent_containers/food/snacks/cube/fuhrer/on_reagent_change()
	if(reagents.has_reagent("blood"))
		Expand()

/obj/item/reagent_containers/food/snacks/cube/jager
	name = "Jager Cube"
	desc = "Just add Blood!"
	reagent_flags = REFILLABLE
	icon = 'icons/obj/roach_cubes.dmi'
	icon_state = "jagercube"
	bitesize = 12
	filling_color = "#ADAC7F"
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("protein" = 10)
	//taste_tag = list(MEAT_FOOD,BLAND_FOOD)

/obj/item/reagent_containers/food/snacks/cube/jager/proc/Expand()
	src.visible_message(SPAN_NOTICE("\The [src] expands!"))
	var/turf/T = get_turf(src)
	new/mob/living/carbon/superior_animal/roach/hunter(T)
	qdel(src)
	return TRUE

/obj/item/reagent_containers/food/snacks/cube/jager/on_reagent_change()
	if(reagents.has_reagent("blood"))
		Expand()

/obj/item/reagent_containers/food/snacks/cube/kraftwerk
	name = "Kraftwerk Cube"
	desc = "Just add Blood!"
	reagent_flags = REFILLABLE
	icon = 'icons/obj/roach_cubes.dmi'
	icon_state = "kraftwerkcube"
	bitesize = 12
	filling_color = "#ADAC7F"
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("protein" = 10)
	//taste_tag = list(MEAT_FOOD,BLAND_FOOD)

/obj/item/reagent_containers/food/snacks/cube/kraftwerk/proc/Expand()
	src.visible_message(SPAN_NOTICE("\The [src] expands!"))
	var/turf/T = get_turf(src)
	new/mob/living/carbon/superior_animal/roach/nanite(T)
	qdel(src)
	return TRUE

/obj/item/reagent_containers/food/snacks/cube/kraftwerk/on_reagent_change()
	if(reagents.has_reagent("blood"))
		Expand()

/obj/item/reagent_containers/food/snacks/cube/roachling
	name = "Roachling Cube"
	desc = "Just add Blood!"
	reagent_flags = REFILLABLE
	icon = 'icons/obj/roach_cubes.dmi'
	icon_state = "babycube"
	bitesize = 12
	filling_color = "#ADAC7F"
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("protein" = 10)
	//taste_tag = list(MEAT_FOOD,BLAND_FOOD)

/obj/item/reagent_containers/food/snacks/cube/roachling/proc/Expand()
	src.visible_message(SPAN_NOTICE("\The [src] expands!"))
	var/turf/T = get_turf(src)
	new/mob/living/carbon/superior_animal/roach/roachling(T)
	qdel(src)
	return TRUE

/obj/item/reagent_containers/food/snacks/cube/roachling/on_reagent_change()
	if(reagents.has_reagent("blood"))
		Expand()

/obj/item/reagent_containers/food/snacks/cube/seuche
	name = "Seuche Cube"
	desc = "Just add Blood!"
	reagent_flags = REFILLABLE
	icon = 'icons/obj/roach_cubes.dmi'
	icon_state = "seuchecube"
	bitesize = 12
	filling_color = "#ADAC7F"
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("protein" = 10)
	//taste_tag = list(MEAT_FOOD,BLAND_FOOD)

/obj/item/reagent_containers/food/snacks/cube/seuche/proc/Expand()
	src.visible_message(SPAN_NOTICE("\The [src] expands!"))
	var/turf/T = get_turf(src)
	new/mob/living/carbon/superior_animal/roach/support(T)
	qdel(src)
	return TRUE

/obj/item/reagent_containers/food/snacks/cube/seuche/on_reagent_change()
	if(reagents.has_reagent("blood"))
		Expand()

/obj/item/reagent_containers/food/snacks/cube/panzer
	name = "Panzer Cube"
	desc = "Just add Blood!"
	reagent_flags = REFILLABLE
	icon = 'icons/obj/roach_cubes.dmi'
	icon_state = "panzercube"
	bitesize = 12
	filling_color = "#ADAC7F"
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("protein" = 10)
	//taste_tag = list(MEAT_FOOD,BLAND_FOOD)

/obj/item/reagent_containers/food/snacks/cube/panzer/proc/Expand()
	src.visible_message(SPAN_NOTICE("\The [src] expands!"))
	var/turf/T = get_turf(src)
	new/mob/living/carbon/superior_animal/roach/tank(T)
	qdel(src)
	return TRUE

/obj/item/reagent_containers/food/snacks/cube/panzer/on_reagent_change()
	if(reagents.has_reagent("blood"))
		Expand()

/obj/item/reagent_containers/food/snacks/cube/elektromagnetisch
	name = "Elektromagnetisch Cube"
	desc = "Just add Blood!"
	reagent_flags = REFILLABLE
	icon = 'icons/obj/roach_cubes.dmi'
	icon_state = "elektromagnetischrcube"
	bitesize = 12
	filling_color = "#ADAC7F"
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("protein" = 10)
	//taste_tag = list(MEAT_FOOD,BLAND_FOOD)

/obj/item/reagent_containers/food/snacks/cube/elektromagnetisch/proc/Expand()
	src.visible_message(SPAN_NOTICE("\The [src] expands!"))
	var/turf/T = get_turf(src)
	new/mob/living/carbon/superior_animal/roach/elektromagnetisch(T)
	qdel(src)
	return TRUE

/obj/item/reagent_containers/food/snacks/cube/elektromagnetisch/on_reagent_change()
	if(reagents.has_reagent("blood"))
		Expand()

/obj/item/reagent_containers/food/snacks/cube/glowing
	name = "Gluhend Cube"
	desc = "Just add Blood!"
	reagent_flags = REFILLABLE
	icon = 'icons/obj/roach_cubes.dmi'
	icon_state = "glowingcube"
	bitesize = 12
	filling_color = "#ADAC7F"
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("protein" = 10)
	//taste_tag = list(MEAT_FOOD,BLAND_FOOD)

/obj/item/reagent_containers/food/snacks/cube/glowing/proc/Expand()
	src.visible_message(SPAN_NOTICE("\The [src] expands!"))
	var/turf/T = get_turf(src)
	new/mob/living/carbon/superior_animal/roach/glowing(T)
	qdel(src)
	return TRUE

/obj/item/reagent_containers/food/snacks/cube/glowing/on_reagent_change()
	if(reagents.has_reagent("blood"))
		Expand()

/obj/item/reagent_containers/food/snacks/cube/grestrahlte
	name = "Grestrahlte Cube"
	desc = "Just add Blood!"
	reagent_flags = REFILLABLE
	icon = 'icons/obj/roach_cubes.dmi'
	icon_state = "gestrahltecube"
	bitesize = 12
	filling_color = "#ADAC7F"
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("protein" = 10)
	//taste_tag = list(MEAT_FOOD,BLAND_FOOD)

/obj/item/reagent_containers/food/snacks/cube/grestrahlte/proc/Expand()
	src.visible_message(SPAN_NOTICE("\The [src] expands!"))
	var/turf/T = get_turf(src)
	new/mob/living/carbon/superior_animal/roach/toxic(T)
	qdel(src)
	return TRUE

/obj/item/reagent_containers/food/snacks/cube/grestrahlte/on_reagent_change()
	if(reagents.has_reagent("blood"))
		Expand()
