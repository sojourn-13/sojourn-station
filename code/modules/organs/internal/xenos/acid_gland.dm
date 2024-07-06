/obj/item/organ/internal/xenos/acidgland
	name = "acid gland"
	parent_organ = BP_HEAD
	icon_state = "xgibtorso"
	organ_tag = BP_ACID
	owner_verbs = list(
		/mob/living/carbon/human/proc/neurotoxin,
		/mob/living/carbon/human/proc/corrosive_acid
	)

/obj/item/organ/internal/xenos/acidgland/drone
	owner_verbs = list(
		/mob/living/carbon/human/proc/corrosive_acid
	)


/mob/living/carbon/human/proc/neurotoxin(mob/target as mob in oview(world.view, src))
	set name = "Spit Neurotoxin (50)"
	set desc = "Spits neurotoxin at someone, paralyzing them for a short time if they are not wearing protective gear."
	set category = "Abilities"

	var/obj/item/organ/internal/xenos/acidgland/organ = first_organ_by_type(/obj/item/organ/internal/xenos/acidgland)
	if(!organ)
		return

	if(!organ.check_alien_ability(50))
		return

	if(stat || paralysis || stunned || weakened || lying || restrained() || buckled)
		to_chat(src, "You cannot spit neurotoxin in your current state.")
		return

	visible_message(
		SPAN_WARNING("[src] spits neurotoxin at [target]!"),
		"<span class='alium'>You spit neurotoxin at [target].</span>"
	)

	//I'm not motivated enough to revise this. Prjectile code in general needs update.
	// Maybe change this to use throw_at? ~ Z
	var/turf/T = get_turf(loc)
	var/turf/U = get_turf(target)

	if(!U || !T)
		return
	if(target == src)
		bullet_act(new /obj/item/projectile/energy/neurotoxin(loc), src.get_organ_target())
		return

	var/obj/item/projectile/energy/neurotoxin/A = new /obj/item/projectile/energy/neurotoxin(loc)
	A.current = U
	A.yo = U.y - T.y
	A.xo = U.x - T.x
	A.Process()

//If they right click to corrode, an error will flash if its an invalid target./N
/mob/living/carbon/human/proc/corrosive_acid(O as obj|turf in oview(1, src))
	set name = "Corrosive Acid (200)"
	set desc = "Drench an object in acid, destroying it over time."
	set category = "Abilities"

	var/obj/item/organ/internal/xenos/acidgland/organ = first_organ_by_type(/obj/item/organ/internal/xenos/acidgland)
	if(!organ)
		return

	if(!(O in oview(1, src)))
		to_chat(src, "<span class='alium'>[O] is too far away.</span>")
		return

	// OBJ CHECK
	var/cannot_melt
	if(isobj(O))
		var/obj/I = O
		if(I.unacidable)
			cannot_melt = TRUE
	else
		if(istype(O, /turf/simulated/wall))
			var/turf/simulated/wall/W = O
			if(W.material.flags & MATERIAL_UNMELTABLE)
				cannot_melt = TRUE
		else if(istype(O, /turf/simulated/floor))
			var/turf/simulated/floor/F = O
			if(F.flooring && (F.flooring.flags & TURF_ACID_IMMUNE))
				cannot_melt = TRUE

	if(cannot_melt)
		to_chat(src, "<span class='alium'>You cannot dissolve this object.</span>")
		return

	if(organ.check_alien_ability(200))
		new /obj/effect/acid(get_turf(O), O)
		visible_message(
			"<span class='alium'><B>[src] vomits globs of vile stuff all over [O]. It begins to sizzle and melt under the bubbling mess of acid!</B></span>"
		)


