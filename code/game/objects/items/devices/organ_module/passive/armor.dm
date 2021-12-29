/obj/item/organ_module/armor
	name = "subdermal armor"
	desc = "A set of subdermal steel plates, designed to provide additional impact protection while remaining lightweight."
	allowed_organs = list(BP_CHEST)
	icon_state = "armor-chest"

/obj/item/organ_module/armor/onInstall(obj/item/organ/external/E)
	E.brute_mod -= 0.3

/obj/item/organ_module/armor/onRemove(obj/item/organ/external/E)
	E.brute_mod += 0.3


/obj/item/organ_module/armor/organic
	name = "exoskeleton armor"
	desc = "A collection of subdermal organic exoskeleton plates, made to provide additional protection from brute force while remaining discrete."
	allowed_organs = list(BP_CHEST)
	icon_state = "orgarmor-chest"
	matter = list(MATERIAL_BIOMATTER = 30)
	is_organic_module = TRUE

/obj/item/biogoop/armor
	name = "incomplete exeskeleton implant"

/obj/item/biogoop/armor/attackby(obj/item/I, mob/user)
	if(istype(I,/obj/item/stack/nanopaste))
		var/obj/item/stack/S = I
		if(S.use(1))
			to_chat(user, SPAN_NOTICE("You apply the nanite matrix, shaping the bioaugment into the defensive bulwark."))
			playsound(loc, 'sound/items/biotransform.ogg', 50, 1)
			new /obj/item/organ_module/armor/organic(get_turf(src))
			qdel(src)
			return
	return ..()
