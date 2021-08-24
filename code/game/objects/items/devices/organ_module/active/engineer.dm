/obj/item/organ_module/active/simple/engineer
	name = "embedded engineers multitool"
	desc = "An all-in-one engineering tool implant. Convenient to use and more effective than the basics, but much less efficient than customized or more specialized tools."
	verb_name = "Deploy engineering omnitool"
	icon_state = "multitool"
	allowed_organs = list(BP_R_ARM, BP_L_ARM)
	holding_type = /obj/item/tool/engimplant
	price_tag = 575

/obj/item/organ_module/active/simple/engineer/organic
	name = "embedded organic engineering multitool"
	desc = "An all in one organic engineering tool made of biomass that functions through a set of chemicals, enzymes, and the users will."
	verb_name = "Deploy organic engineering omnitool"
	icon_state = "organicengimplant"
	allowed_organs = list(BP_R_ARM, BP_L_ARM)
	holding_type = /obj/item/tool/engimplant/organic
	matter = list(MATERIAL_BIOMATTER = 10)
	is_organic_module = TRUE

/obj/item/biogoop/engineer
	name = "incomplete organic engineering augment"


/obj/item/biogoop/engineer/attackby(obj/item/I, mob/user)
	if(istype(I,/obj/item/stack/nanopaste))
		var/obj/item/stack/S = I
		if(S.use(1))
			to_chat(user, SPAN_NOTICE("You apply the nanite matrix, shaping the bioaugment into the creator."))
			playsound(loc, 'sound/items/biotransform.ogg', 50, 1)
			new /obj/item/organ_module/active/simple/engineer/organic(get_turf(src))
			qdel(src)
			return
	return ..()
