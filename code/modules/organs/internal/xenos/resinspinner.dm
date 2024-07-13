/obj/item/organ/internal/xenos/resinspinner
	name = "resin spinner"
	parent_organ = BP_HEAD
	icon_state = "xgibmid2"
	organ_tag = BP_RESIN
	owner_verbs = list(
		/mob/living/carbon/human/proc/xeno_plant,
		/mob/living/carbon/human/proc/xeno_resin
	)

/mob/living/carbon/human/proc/xeno_plant()
	set name = "Plant Weeds (50)"
	set desc = "Plants some alien weeds"
	set category = "Abilities"

	var/obj/item/organ/internal/xenos/resinspinner/organ = first_organ_by_type(/obj/item/organ/internal/xenos/resinspinner)
	if(!organ)
		return

	if(organ.check_alien_ability(50, TRUE))
		owner.visible_message("<span class='alium'><B>[owner] has planted some alien weeds!</B></span>")
		new /obj/structure/alien/node(loc)

/mob/living/carbon/human/proc/xeno_resin() // -- TLE
	set name = "Secrete Resin (75)"
	set desc = "Secrete tough, malleable resin."
	set category = "Abilities"

	var/obj/item/organ/internal/xenos/resinspinner/organ = first_organ_by_type(/obj/item/organ/internal/xenos/resinspinner)
	if(!organ)
		return

	var/list/buildings = list(
		"resin door" = /obj/machinery/door/unpowered/simple/resin,
		"resin wall" = /obj/structure/alien/resin/wall,
		"resin membrane" = /obj/structure/alien/resin/membrane,
		"resin nest" = /obj/structure/bed/nest
	)
	var/choice = input("Choose what you wish to shape.","Resin building") as null|anything in buildings
	if(!choice)
		return

	if(!organ.check_alien_ability(75, TRUE))
		return

	visible_message(
		SPAN_WARNING("<B>[src] vomits up a thick purple substance and begins to shape it!</B>"),
		"<span class='alium'>You shape a [choice].</span>"
	)
	var/selected_type = buildings[choice]
	new selected_type (loc)
