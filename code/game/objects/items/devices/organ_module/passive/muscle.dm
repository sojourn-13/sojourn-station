/obj/item/organ_module/muscle
	name = "mechanical muscles"
	desc = "A set of mechanical muscles designed to be implanted into legs, increasing speed beyond what human muscles are capable of."
	allowed_organs = list(BP_R_LEG, BP_L_LEG)
	icon_state = "muscle"

/obj/item/organ_module/muscle/onInstall(obj/item/organ/external/E)
	E.tally -= 0.1

/obj/item/organ_module/muscle/onRemove(obj/item/organ/external/E)
	E.tally += 0.1

/obj/item/organ_module/muscle/organic
	name = "organic muscle augments"
	desc = "A set of organic muscles designed to be implanted into legs, empowering the body beyond what its normally capable of."
	allowed_organs = list(BP_R_LEG, BP_L_LEG)
	icon_state = "orgmuscle"
	matter = list(MATERIAL_BIOMATTER = 15)
	is_organic_module = FALSE

//Putting this here because blargh it.
//Not like it needs to be anywhere in particular and I don't want to make an entire new file for a small parent.
/obj/item/biogoop
	icon = 'icons/obj/surgery.dmi'
	icon_state = "biogoop"
	desc = "A pile of formless biomatter with potential to be made useful, with the right tools."
	matter = list(MATERIAL_BIOMATTER = 10)

/obj/item/biogoop/muscle
	name = "incomplete organic muscle implant"


/obj/item/biogoop/muscle/attackby(obj/item/I, mob/user)
	if(istype(I,/obj/item/stack/nanopaste))
		var/obj/item/stack/S = I
		if(S.use(1))
			to_chat(user, SPAN_NOTICE("You apply the nanite matrix, shaping the bioaugment into physical might."))
			playsound(loc, 'sound/items/biotransform.ogg', 50, 1)
			new /obj/item/organ_module/muscle/organic(get_turf(src))
			qdel(src)
			return
	return ..()

