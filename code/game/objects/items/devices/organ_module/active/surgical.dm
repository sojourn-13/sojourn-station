/obj/item/organ_module/active/simple/surgical
	name = "embedded surgical multitool"
	desc = "An all-in-one medical tool implant based on the legendary Greyson Positronic model. While convenient, it is less efficient than more advanced surgical tools, such as laser scalpels, and requires a power cell."
	verb_name = "Deploy surgical omnitool"
	icon_state = "medimplant"
	allowed_organs = list(BP_R_ARM, BP_L_ARM)
	holding_type = /obj/item/weapon/tool/medmultitool/medimplant

/obj/item/organ_module/active/simple/surgical/organic
	name = "embedded organic surgical multitool"
	desc = "An all in one organic surgical tool made of biomass that functions through a set of chemicals, enzymes, and the users will."
	verb_name = "Deploy organic surgical omnitool"
	icon_state = "organicmedimplant"
	allowed_organs = list(BP_R_ARM, BP_L_ARM)
	holding_type = /obj/item/weapon/tool/medmultitool/medimplant/organic
	matter = list(MATERIAL_BIOMATTER = 10)

/obj/item/weapon/biogoop/surgical
	name = "incomplete organic surgical augment"


/obj/item/weapon/biogoop/surgical/attackby(obj/item/I, mob/user)
	if(istype(I,/obj/item/stack/nanopaste))
		var/obj/item/stack/S = I
		if(S.use(1))
			to_chat(user, SPAN_NOTICE("You apply the nanite matrix, shaping the bioaugment into the healer."))
			playsound(loc, 'sound/items/biotransform.ogg', 50, 1)
			new /obj/item/organ_module/active/simple/surgical/organic(get_turf(src))
			qdel(src)
			return
	return ..()
