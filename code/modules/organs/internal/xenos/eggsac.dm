/obj/item/organ/internal/xenos/eggsac
	name = "egg sac"
	parent_organ = BP_GROIN
	icon_state = "xgibmid1"
	organ_tag = BP_EGG
	owner_verbs = list(
		/mob/living/carbon/human/proc/lay_egg,
		/mob/living/carbon/human/proc/xeno_infest
	)

/mob/living/carbon/human/proc/lay_egg()
	set name = "Lay Egg (75)"
	set desc = "Lay an egg to produce huggers to impregnate prey with."
	set category = "Abilities"

	var/obj/item/organ/internal/xenos/eggsac/organ = first_organ_by_type(/obj/item/organ/internal/xenos/eggsac)
	if(!organ)
		return

	if(!config.aliens_allowed)
		to_chat(src, "You begin to lay an egg, but hesitate. You suspect it isn't allowed.")
		//verbs -= /mob/living/carbon/human/proc/lay_egg
		return

	var/turf/target = get_turf(src)
	if(locate(/obj/structure/alien/egg) in target)
		to_chat(src, "There's already an egg here.")
		return

	if(organ.check_alien_ability(75, TRUE))
		visible_message("<span class='alium'><B>[src] has laid an egg!</B></span>")
		new /obj/structure/alien/egg(target)

/mob/living/carbon/human/proc/xeno_infest(mob/living/carbon/human/M as mob in oview(1, src))
	set name = "Infest (500)"
	set desc = "Link a victim to the hivemind."
	set category = "Abilities"

	var/obj/item/organ/internal/xenos/eggsac/organ = first_organ_by_type(/obj/item/organ/internal/xenos/eggsac)
	if(!organ)
		return

	if(!M.Adjacent(src))
		to_chat(src, SPAN_WARNING("They are too far away."))
		return

	if(!M.mind)
		to_chat(src, SPAN_WARNING("This mindless flesh adds nothing to the hive."))
		return

	if(M.species.get_bodytype() == "Xenomorph" || !isnull(M.internal_organs_by_name[BP_HIVE]))
		to_chat(src, SPAN_WARNING("They are already part of the hive."))
		return

	var/obj/item/organ/affecting = M.get_organ(BP_CHEST)
	if(!affecting || BP_IS_ROBOTIC(affecting))
		to_chat(src, SPAN_WARNING("This form is not compatible with our physiology."))
		return

	visible_message(
		SPAN_DANGER("\The [src] crouches over \the [M], extending a hideous protuberance from its head!")
	)

	if(!do_mob(src, M, 150))
		return

	//TODO: instead affecting.robotic use M.isSyntetic()
	if(M.species.get_bodytype() == "Xenomorph" || !isnull(M.internal_organs_by_name[BP_HIVE]) || !affecting || BP_IS_ROBOTIC(affecting))
		return

	if(!organ.check_alien_ability(500, TRUE))
		return

	M.visible_message(
		SPAN_DANGER("\The [src] regurgitates something into \the [M]'s torso!"),
		SPAN_DANGER("A hideous lump of alien mass strains your ribcage as it settles within!")
	)
	var/obj/item/organ/internal/xenos/hivenode/node = new
	node.replaced(affecting)

