// A one-use item that summon a specific type of roach and tame it.
/* Here is the current list of choices :
	- "kampfer" : Default Roach
	- "unbekannt" : Bluespace Roach
	- "elektromagnetisch" : EMP Roach
	- "fuhrer" : Fuhrer Roach
	- "gluhend" : Glowing Roach
	- "jager" : Hunter Roach
	- "kaiser" : Kaiser Roach
	- "kraftwerk" : Nanite Roach
	- "seuche" : Support Roach
	- "panzer" : Tank Roach
	- "gestrahlte" : Toxic Roach
*/
/obj/item/roach_summon
	name = "bluespace roach beacon"
	desc = "The result of a collaboration between Soteria and the Cht'mant hive. This beacon allow to summon a single tamed roach."
	icon = 'icons/obj/device.dmi'
	icon_state = "uplink_access"
	item_state = "uplink_access"
	w_class = ITEM_SIZE_SMALL
	price_tag = 2500
	var/roach_type = "kampfer" // The type of roach to spawn.
	var/mob/living/carbon/superior_animal/roach/roach // A reference to the roach this item summoned.
	var/entropy_value = 3
	var/used = FALSE //Are we used? Prevents an issue with mass spaming the item
	var/entropy = FALSE //Do we make entropy on summan? Debug things shouldnt mess with the round

/obj/item/roach_summon/New()
	..()
	item_flags |= BLUESPACE

/obj/item/roach_summon/attack_self(mob/user as mob)
	if(used)
		return
	switch(roach_type)
		if("kampfer")
			roach = new /mob/living/carbon/superior_animal/roach(src)
		if("unbekannt")
			roach = new /mob/living/carbon/superior_animal/roach/bluespace(src)
		if("elektromagnetisch")
			roach = new /mob/living/carbon/superior_animal/roach/elektromagnetisch(src)
		if("fuhrer")
			roach = new /mob/living/carbon/superior_animal/roach/fuhrer(src)
		if("gluhend")
			roach = new /mob/living/carbon/superior_animal/roach/glowing(src)
		if("jager")
			roach = new /mob/living/carbon/superior_animal/roach/hunter(src)
		if("kaiser")
			roach = new /mob/living/carbon/superior_animal/roach/kaiser(src)
		if("kraftwerk")
			roach = new /mob/living/carbon/superior_animal/roach/nanite(src)
		if("seuche")
			roach = new /mob/living/carbon/superior_animal/roach/support(src)
		if("panzer")
			roach = new /mob/living/carbon/superior_animal/roach/tank(src)
		if("gestrahlte")
			roach = new /mob/living/carbon/superior_animal/roach/toxic(src)

	if(roach) // Checking to be sure we got something
		// Making it a fren and ridable
		used = TRUE
		roach.friends += user
		roach.colony_friend = TRUE
		roach.friendly_to_colony = TRUE
		roach.can_buckle = TRUE
		roach.density = FALSE
		roach.buckle_movable = TRUE
		roach.desc += " It is tamed and friendly"
		if(entropy)
			bluespace_entropy(entropy_value, get_turf(src), TRUE)
		roach.forceMove(user.loc) // Free the roach
		// TODO : Special message and fancy teleportation effect here.
		spawn(20) qdel(src) // Delete the item

/obj/item/roach_summon/panzer
	entropy = TRUE
	roach_type = "panzer"
