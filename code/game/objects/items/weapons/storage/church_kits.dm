/obj/item/gunbox/church //credit goes to Hestia both for the idea of loadout gun box and for the code, sprite is Polyushko
	name = "\improper Armor Bundle"
	desc = "A secure box containing church equipment."
	icon = 'icons/obj/storage.dmi'
	icon_state = "armor_bundle"

/obj/item/gunbox/church/attack_self(mob/living/user)
	..()
	var/stamped
	if(!stamped)
		stamped = TRUE
		var/list/options = list()
		options["Divisor"] = list(/obj/item/clothing/head/helmet/path/divisor, /obj/item/clothing/suit/armor/vest/path/divisor)
		options["Tessellate"] = list(/obj/item/clothing/head/helmet/path/tessallate, /obj/item/clothing/suit/armor/vest/path/tessallate)
		options["Lemniscate"] = list(/obj/item/clothing/head/helmet/path/lemniscate, /obj/item/clothing/suit/armor/vest/path/lemniscate)
		options["Monomial"] = list(/obj/item/clothing/head/helmet/path/monomial, /obj/item/clothing/suit/armor/vest/path/monomial)
		options["Factorial"] = list(/obj/item/clothing/head/helmet/path/factorial, /obj/item/clothing/suit/armor/vest/path/factorial)
		var/choice = input(user,"What type of equipment?") as null|anything in options
		if(src && choice)
			var/list/things_to_spawn = options[choice]
			for(var/new_type in things_to_spawn)
				var/atom/movable/AM = new new_type(get_turf(src))
				if(istype(AM, /obj/item/gun/))
					to_chat(user, "You have chosen \the [AM].")
			qdel(src)
		else
			stamped = FALSE
