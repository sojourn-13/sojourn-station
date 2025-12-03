/datum/component/modification/organ/stromal/agument

/datum/component/modification/organ/stromal/agument/uninstall(obj/item/I, mob/living/user)
	if(istype(parent, /obj/item/modification/organ/internal/agument))
		var/obj/item/modification/organ/internal/agument/A = parent
		A.sync_remove()

	..()

/datum/component/modification/organ/stromal/agument/apply(atom/holder)
	..()

	if(istype(parent, /obj/item/modification/organ/internal/agument))
		var/obj/item/modification/organ/internal/agument/A = parent

		if(istype(A.loc, /obj/item/organ))
			var/obj/item/organ/O = A.loc
			if(A.cares_about_life && O.status&ORGAN_DEAD)
				return
			A.sync_add(O.owner)
