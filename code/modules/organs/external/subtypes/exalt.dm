/obj/item/organ/external/exalt
	name = "external exalt"

/obj/item/organ/external/exalt/chest
	default_description = /datum/organ_description/chest/exalt

/obj/item/organ/external/exalt/groin
	default_description = /datum/organ_description/groin/exalt

/obj/item/organ/external/exalt/head
	default_description = /datum/organ_description/head/exalt

/obj/item/organ/external/exalt/head/New(mob/living/carbon/human/holder, datum/organ_description/OD)
	..(holder, OD)
	var/obj/item/organ_module/install_implant = new /obj/item/organ_module/active/hud/night_bio
	install_implant.install(src)

/obj/item/organ/external/exalt/head/removed_mob()
	name = "[owner.real_name]'s head"
	spawn(1)
		if(owner) // In case owner was destroyed already - gibbed, for example
			owner.update_hair()
	..()

//Exalt faces are so perfect that they are a little more likely to be disfigured by damage
/obj/item/organ/external/exalt/head/take_damage(brute, burn, sharp, edge, used_weapon = null, list/forbidden_limbs = list(), silent)
	. = ..()
	if(. && !disfigured)
		if (brute_dam > 35)
			if (prob(50))
				disfigure("brute")
		if (burn_dam > 35)
			disfigure("burn")

/obj/item/organ/external/exalt/head/get_conditions()
	var/list/conditions_list = ..()
	if(disfigured)
		var/list/condition = list(
			"name" = "Imperfect face",
			"fix_name" = "Restore",
			"step" = /datum/surgery_step/fix_face
		)
		conditions_list.Add(list(condition))
	return conditions_list

/obj/item/organ/external/exalt/make_nerves()
	var/obj/item/organ/internal/nerve/nerve = new /obj/item/organ/internal/nerve/sensitive_nerve/exalt
	nerve?.replaced(src)

/obj/item/organ/external/exalt/make_muscles()
	var/obj/item/organ/internal/muscle/muscle = new /obj/item/organ/internal/muscle/super_muscle/exalt
	muscle?.replaced(src)

/obj/item/organ/external/exalt/make_blood_vessels()
	var/obj/item/organ/internal/blood_vessel/blood_vessel = new /obj/item/organ/internal/blood_vessel/extensive/exalt
	blood_vessel?.replaced(src)