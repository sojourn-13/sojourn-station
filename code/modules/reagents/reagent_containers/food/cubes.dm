
//Growables and cubes

/obj/item/reagent_containers/snacks/monkeycube
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
	volume = 500
	preloaded_reagents = list("protein" = 10)

/obj/item/reagent_containers/snacks/monkeycube/attack_self(mob/user as mob)
	if(wrapped)
		Unwrap(user)

/obj/item/reagent_containers/snacks/monkeycube/proc/Expand()
	src.visible_message(SPAN_NOTICE("\The [src] expands!"))
	var/turf/T = get_turf(src)
	if(istype(T))
		new /mob/living/carbon/human/monkey(T)
	qdel(src)
	return TRUE

/obj/item/reagent_containers/snacks/monkeycube/proc/Unwrap(mob/user as mob)
	icon_state = "monkeycube"
	desc = "Just add water!"
	to_chat(user, "You unwrap the cube.")
	wrapped = FALSE
	reagent_flags |= REFILLABLE
	matter = list(MATERIAL_BIOMATTER = 21)

/obj/item/reagent_containers/snacks/monkeycube/on_reagent_change()
	if(reagents.has_reagent("water"))
		Expand()

/obj/item/reagent_containers/snacks/monkeycube/wrapped
	desc = "Still wrapped in some paper."
	icon_state = "monkeycubewrap"
	reagent_flags = NONE
	wrapped = TRUE

/obj/item/reagent_containers/snacks/cube
	matter = list(MATERIAL_BIOMATTER = 20)
	var/grow_into = /mob/living/carbon/human/monkey

/obj/item/reagent_containers/snacks/cube/proc/Expand()
	src.visible_message(SPAN_NOTICE("\The [src] expands!"))
	var/turf/T = get_turf(src)
	new grow_into(T)
	qdel(src)
	return TRUE

/obj/item/reagent_containers/snacks/cube/gun
	name = "Grow-A-Gun Cube"
	desc = "Just add Water!"
	reagent_flags = REFILLABLE
	icon_state = "guncube"
	bitesize = 12
	filling_color = "#ADAC7F"
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("plasticide" = 10)
	taste_tag = list(MEAT_FOOD,BLAND_FOOD)
	grow_into = /obj/item/gun/projectile/automatic/slaught_o_matic

/obj/item/reagent_containers/snacks/cube/gun/New()
	..()
	color = pick("#EE204D", "#FCE883", "#1F75FE", "#B5674D", "#FF7538", "#1CAC78", "#926EAE", "#232323")

/obj/item/reagent_containers/snacks/cube/gun/on_reagent_change()
	if(reagents.has_reagent("water"))
		Expand()

/obj/item/reagent_containers/snacks/cube/roach
	name = "Roach Cube"
	desc = "Just add Blood!"
	reagent_flags = REFILLABLE
	icon = 'icons/obj/roach_cubes.dmi'
	icon_state = "roachcube"
	bitesize = 12
	filling_color = "#ADAC7F"
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("protein" = 10)
	grow_into = /mob/living/carbon/superior/roach
	taste_tag = list(MEAT_FOOD,BLAND_FOOD)
	volume = 500

/obj/item/reagent_containers/snacks/cube/roach/on_reagent_change()
	if(reagents.has_reagent("blood"))
		Expand()

/obj/item/reagent_containers/snacks/cube/roach/fuhrer
	name = "Fuhrer Cube"
	desc = "Just add Blood!"
	reagent_flags = REFILLABLE
	icon = 'icons/obj/roach_cubes.dmi'
	icon_state = "fuhrercube"
	bitesize = 12
	filling_color = "#ADAC7F"
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("protein" = 10)
	taste_tag = list(MEAT_FOOD,BLAND_FOOD)
	grow_into = /mob/living/carbon/superior/roach/fuhrer

/obj/item/reagent_containers/snacks/cube/roach/jager
	name = "Jager Cube"
	desc = "Just add Blood!"
	reagent_flags = REFILLABLE
	icon = 'icons/obj/roach_cubes.dmi'
	icon_state = "jagercube"
	bitesize = 12
	filling_color = "#ADAC7F"
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("protein" = 10)
	taste_tag = list(MEAT_FOOD,BLAND_FOOD)
	grow_into = /mob/living/carbon/superior/roach/hunter

/obj/item/reagent_containers/snacks/cube/roach/kraftwerk
	name = "Kraftwerk Cube"
	desc = "Just add Blood!"
	reagent_flags = REFILLABLE
	icon = 'icons/obj/roach_cubes.dmi'
	icon_state = "kraftwerkcube"
	bitesize = 12
	filling_color = "#ADAC7F"
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("protein" = 10)
	taste_tag = list(MEAT_FOOD,BLAND_FOOD)
	grow_into = /mob/living/carbon/superior/roach/nanite

/obj/item/reagent_containers/snacks/cube/roach/roachling
	name = "Roachling Cube"
	desc = "Just add Blood!"
	reagent_flags = REFILLABLE
	icon = 'icons/obj/roach_cubes.dmi'
	icon_state = "babycube"
	bitesize = 12
	filling_color = "#ADAC7F"
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("protein" = 10)
	taste_tag = list(MEAT_FOOD,BLAND_FOOD)
	grow_into = /mob/living/carbon/superior/roach/roachling

/obj/item/reagent_containers/snacks/cube/roach/seuche
	name = "Seuche Cube"
	desc = "Just add Blood!"
	reagent_flags = REFILLABLE
	icon = 'icons/obj/roach_cubes.dmi'
	icon_state = "seuchecube"
	bitesize = 12
	filling_color = "#ADAC7F"
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("protein" = 10)
	taste_tag = list(MEAT_FOOD,BLAND_FOOD)
	grow_into = /mob/living/carbon/superior/roach/support

/obj/item/reagent_containers/snacks/cube/roach/panzer
	name = "Panzer Cube"
	desc = "Just add Blood!"
	reagent_flags = REFILLABLE
	icon = 'icons/obj/roach_cubes.dmi'
	icon_state = "panzercube"
	bitesize = 12
	filling_color = "#ADAC7F"
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("protein" = 10)
	taste_tag = list(MEAT_FOOD,BLAND_FOOD)
	grow_into = /mob/living/carbon/superior/roach/tank

/obj/item/reagent_containers/snacks/cube/roach/elektromagnetisch
	name = "Elektromagnetisch Cube"
	desc = "Just add Blood!"
	reagent_flags = REFILLABLE
	icon = 'icons/obj/roach_cubes.dmi'
	icon_state = "elektromagnetischrcube"
	bitesize = 12
	filling_color = "#ADAC7F"
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("protein" = 10)
	taste_tag = list(MEAT_FOOD,BLAND_FOOD)
	grow_into = /mob/living/carbon/superior/roach/elektromagnetisch

/obj/item/reagent_containers/snacks/cube/roach/glowing
	name = "Gluhend Cube"
	desc = "Just add Blood!"
	reagent_flags = REFILLABLE
	icon = 'icons/obj/roach_cubes.dmi'
	icon_state = "glowingcube"
	bitesize = 12
	filling_color = "#ADAC7F"
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("protein" = 10)
	taste_tag = list(MEAT_FOOD,BLAND_FOOD)
	grow_into = /mob/living/carbon/superior/roach/glowing

/obj/item/reagent_containers/snacks/cube/roach/grestrahlte
	name = "Grestrahlte Cube"
	desc = "Just add Blood!"
	reagent_flags = REFILLABLE
	icon = 'icons/obj/roach_cubes.dmi'
	icon_state = "gestrahltecube"
	bitesize = 12
	filling_color = "#ADAC7F"
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("protein" = 10)
	taste_tag = list(MEAT_FOOD,BLAND_FOOD)
	grow_into = /mob/living/carbon/superior/roach/toxic

/obj/item/reagent_containers/snacks/cube/roach/nitro
	name = "Benzin Cube"
	desc = "Just add Blood!"
	reagent_flags = REFILLABLE
	icon = 'icons/obj/roach_cubes.dmi'
	icon_state = "benzincube"
	bitesize = 12
	filling_color = "#ADAC7F"
	center_of_mass = list("x"=16, "y"=14)
	preloaded_reagents = list("protein" = 10)
	taste_tag = list(MEAT_FOOD,BLAND_FOOD)
	grow_into = /mob/living/carbon/superior/roach/nitro