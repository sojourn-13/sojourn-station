// COLOR SHOES
/obj/item/clothing/shoes/color/black
	name = "black shoes"
	desc = "A pair of black shoes."
	icon_state = "black"
	cold_protection = LEGS
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = LEGS
	max_heat_protection_temperature = SHOE_MAX_HEAT_PROTECTION_TEMPERATURE

/obj/item/clothing/shoes/color
	name = "white shoes"
	initial_name = "white shoes"
	desc = "A pair of white shoes."
	icon_state = "white"

/obj/item/clothing/shoes/color/blue
	name = "blue shoes"
	initial_name = "blue shoes"
	desc = "A pair of blue shoes."
	icon_state = "blue"

/obj/item/clothing/shoes/color/green
	name = "green shoes"
	initial_name = "green shoes"
	desc = "A pair of green shoes."
	icon_state = "green"

/obj/item/clothing/shoes/color/yellow
	name = "yellow shoes"
	initial_name = "yellow shoes"
	desc = "A pair of yellow shoes."
	icon_state = "yellow"

/obj/item/clothing/shoes/color/purple
	name = "purple shoes"
	initial_name = "purple shoes"
	desc = "A pair of purple shoes."
	icon_state = "purple"

/obj/item/clothing/shoes/color/pink
	name = "pink shoes"
	initial_name = "pink shoes"
	desc = "A pair of pink shoes."
	icon_state = "pink"

/obj/item/clothing/shoes/color/brown
	name = "brown shoes"
	initial_name = "brown shoes"
	desc = "A pair of brown shoes."
	icon_state = "brown"

/obj/item/clothing/shoes/custom
	name = "shoes"
	desc = "A pair of customized shoes in a tailored color."
	icon_state = "white"
	flags = GEAR_HAS_COLOR_SELECTION

/obj/item/clothing/shoes/color/red
	name = "red shoes"
	initial_name = "red shoes"
	desc = "A pair of red shoes."
	icon_state = "red"

/obj/item/clothing/shoes/costume/misc/rainbow
	name = "rainbow shoes"
	name = "rainbow shoes"
	desc = "A pair of radiantly vibrant shoes."
	icon_state = "rain_bow"

/obj/item/clothing/shoes/orange
	name = "orange shoes"
	initial_name = "orange shoes"
	desc = "A pair of orange shoes."
	icon_state = "orange"
	var/obj/item/handcuffs/chained = null

/obj/item/clothing/shoes/orange/proc/attach_cuffs(var/obj/item/handcuffs/cuffs, mob/user as mob)
	if (src.chained) return

	user.drop_item()
	cuffs.loc = src
	src.chained = cuffs
	src.slowdown = 15
	src.icon_state = "orange1"

/obj/item/clothing/shoes/orange/proc/remove_cuffs(mob/user as mob)
	if (!src.chained) return

	user.put_in_hands(src.chained)
	src.chained.add_fingerprint(user)

	src.slowdown = initial(slowdown)
	src.icon_state = "orange"
	src.chained = null

/obj/item/clothing/shoes/orange/attack_self(mob/user as mob)
	..()
	remove_cuffs(user)

/obj/item/clothing/shoes/orange/attackby(H as obj, mob/user as mob)
	..()
	if (istype(H, /obj/item/handcuffs))
		attach_cuffs(H, user)


