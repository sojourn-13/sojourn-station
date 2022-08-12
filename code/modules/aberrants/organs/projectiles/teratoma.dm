/obj/item/projectile/parasitic_teratoma
	name = "parasitic teratoma"
	icon = 'icons/obj/aberrant_organs.dmi'
	icon_state = "teratoma"
	damage_types = list(CLONE = 1, TOX = 3)
	check_armour = ARMOR_BIO
	step_delay = 1

/obj/item/projectile/parasitic_teratoma/New()
	..()
	icon_state += "-[rand(1,6)]"
	color = pick("#183311", "#8bb0db")

/obj/item/projectile/parasitic_teratoma/on_hit(atom/target, def_zone)
	. = ..()
	try_implant_teratoma(target, def_zone)
	
/obj/item/projectile/parasitic_teratoma/proc/try_implant_teratoma(atom/target, def_zone)
	if(ishuman(target) && prob(33))
		var/mob/living/carbon/human/H = target
		var/obj/item/organ/external/parent_organ = H.get_organ(def_zone)
		var/armor = H.getarmor(def_zone, ARMOR_BIO)
		var/armor_effectiveness = max(0, armor)

		var/obj/item/organ/internal/scaffold/aberrant/teratoma/parasitic/P = new (get_turf(H))

		if(armor_effectiveness < 75)
			P.replaced(parent_organ)
			H.apply_damage(10, HALLOSS)
			to_chat(H, SPAN_DANGER("The [P] is <span style='color:pink'>forcibly implanted</span> into your [parent_organ]!"))
		else
			to_chat(H, SPAN_DANGER("The [P] bounces off you and lands at your feet."))
