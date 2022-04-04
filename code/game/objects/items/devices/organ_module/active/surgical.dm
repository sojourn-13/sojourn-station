/obj/item/organ_module/active/simple/surgical
	name = "embedded surgical multitool"
	desc = "An all-in-one medical tool implant based on the legendary Greyson Positronic model. While convenient, it is less efficient than more advanced surgical tools, such as laser scalpels, and requires a power cell."
	verb_name = "Deploy surgical omnitool"
	icon_state = "medimplant"
	allowed_organs = list(BP_R_ARM, BP_L_ARM)
	holding_type = /obj/item/tool/medmultitool/medimplant
	price_tag = 685

/obj/item/organ_module/active/simple/surgical/cht_mant
	name = "surgical omni-gland"
	desc = "An all in one organic touch that functions through a set of chemicals, enzymes, and a cht'mants sensitive glands."
	verb_name = "Ready surgical hand"
	icon_state = "cht_nerves"
	allowed_organs = list(BP_R_ARM, BP_L_ARM)
	holding_type = /obj/item/tool/medmultitool/medimplant/cht_mant
	matter = list(MATERIAL_BIOMATTER = 10)
	is_organic_module = TRUE

/obj/item/organ_module/active/simple/surgical/organic
	name = "embedded organic surgical multitool"
	desc = "An all in one organic surgical tool made of biomass that functions through a set of chemicals, enzymes, and the users will."
	verb_name = "Deploy organic surgical omnitool"
	icon_state = "organicmedimplant"
	allowed_organs = list(BP_R_ARM, BP_L_ARM)
	holding_type = /obj/item/tool/medmultitool/medimplant/organic
	matter = list(MATERIAL_BIOMATTER = 10)
	is_organic_module = TRUE

/obj/item/biogoop/surgical
	name = "incomplete organic surgical augment"

/obj/item/biogoop/surgical/attackby(obj/item/I, mob/user)
	if(istype(I,/obj/item/stack/nanopaste))
		var/obj/item/stack/S = I
		if(S.use(1))
			to_chat(user, SPAN_NOTICE("You apply the nanite matrix, shaping the bioaugment into the healer."))
			playsound(loc, 'sound/items/biotransform.ogg', 50, 1)
			new /obj/item/organ_module/active/simple/surgical/organic(get_turf(src))
			qdel(src)
			return
	return ..()
