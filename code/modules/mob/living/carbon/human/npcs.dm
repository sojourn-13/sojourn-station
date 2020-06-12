/obj/item/clothing/under/rank/punpun
	name = "fancy uniform"
	desc = "It looks like it was tailored for a monkey."
	icon_state = "punpun"
	has_sensor = 0

	species_restricted = list("Monkey")

/mob/living/carbon/human/monkey/punpun/New()
	..()
	spawn(1)
		name = "Pun Pun"
		real_name = name
		w_uniform = new /obj/item/clothing/under/rank/punpun(src)