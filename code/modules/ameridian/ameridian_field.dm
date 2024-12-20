/obj/machinery/shieldwallgen/ameridian
	name = "ameridian sonic fence generator"
	desc = "A sonic fence generator specially designed to contain and destroy ameridian crystals."
	shield_type = /obj/machinery/shieldwall/ameridian
	circuit = /obj/item/circuitboard/ameridianshieldwallgen
	locked = FALSE // We do not start locked
	power_draw = 15000 // 15 kW
	req_access = null

/obj/machinery/shieldwallgen/ameridian/New()
	..()
	spawn(10)
		update_icon()

/obj/machinery/shieldwall/ameridian
	name = "sonic fence"
	desc = "A sonic fence specially designed to destroy ameridian crystals by targeting its resonant frequency. \
			However, any amount of interference alter the frequency and doesn't damage the crystal, thus allowing \
			people to carry them through the field."
	density = FALSE
	power_usage = 1000
	generate_power_usage = 2000

/obj/machinery/shieldwall/ameridian/New()
	..()
	spawn(1)
		for(var/obj/structure/ameridian_crystal/AC in get_turf(src))
			//Yes even the spirer should be destoryed
			AC.visible_message("[AC] shatter into dust under the sonic field.")
			AC.Destroy()

		for(var/obj/item/stack/material/ameridian/A in get_turf(src))
			A.visible_message("[A] shatter into dust under the sonic field.")
			qdel(A)

		for(var/mob/living/carbon/superior_animal/ameridian_golem/G in get_turf(src))
			G.drop_amount = 0 // The crystal golem is obliterated, don't drop any loot.
			G.death() // Golem die.

/obj/machinery/shieldwall/ameridian/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	return TRUE // Everything can go through, it's a sound barrier, not a physical thing

/obj/machinery/shieldwall/ameridian/Crossed(atom/movable/O)
	if(istype(O, /obj/item/stack/material/ameridian) || istype(O, /obj/item/projectile/ameridian_shard))
		O.visible_message(SPAN_NOTICE("[O] shatter into dust under the sonic field."))
		qdel(O)
		return

	if(istype(O, /mob/living/carbon/superior_animal/ameridian_golem))
		var/mob/living/carbon/superior_animal/ameridian_golem/G = O
		G.drop_amount = 0 // The crystal golem is obliterated, don't drop any loot.
		G.death() // Golem die.
		return
