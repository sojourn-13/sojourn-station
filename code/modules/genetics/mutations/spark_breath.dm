//Macro: MUTATION_SPARK_BREATH
//adds the ability to light cigs with your breath.
/datum/genetics/mutation/spark_breath
	name = "Spark Breath"
	key = "MUTATION_SPARK_BREATH"
	desc = "Allows the affected to breath a tiny flame from their maw."
	gain_text = "You can breath the smallest of flames! Cute."
	instability = 5 //literally is used to light cigs and smokables
	exclusive_type = MUT_TYPE_MOUTH

/datum/genetics/mutation/spark_breath/onMobImplant()
	add_verb(container.holder, /mob/living/proc/mutation_spark_breath)


/datum/genetics/mutation/spark_breath/onMobRemove()
	remove_verb(container.holder, /mob/living/proc/mutation_spark_breath)

/mob/living/proc/mutation_spark_breath()
	set name = "Spark Breath"
	set category = "Mutation"

	if(stat!=CONSCIOUS)
		usr.show_message("\blue You must be conscious to perform this ability!")
		return

	//safty check to remove the verb if the mutation isn't there.
	var/datum/genetics/mutation/spark_breath/spk = src.unnatural_mutations.getMutation("MUTATION_SPARK_BREATH", TRUE)
	if(!spk)
		remove_verb(src, /mob/living/proc/mutation_spark_breath)
		return

	//Check if we have a smokeable in our hand.
	if (istype(usr.get_active_hand(), /obj/item/clothing/mask/smokable))
		var/obj/item/clothing/mask/smokable/ciggy = usr.get_active_hand()
		usr.visible_message("[usr] lights \the [ciggy] with their breath.")
		ciggy.light()
		return
	if (istype(usr.get_active_hand(), /obj/item/paper))
		var/obj/item/paper/burn_me = usr.get_active_hand()
		usr.visible_message("[usr] burns right through \the [burn_me], turning it to ash. It flutters through the air before settling on the floor in a heap.")
		usr.drop_from_inventory(burn_me)
		new /obj/effect/decal/cleanable/ash(burn_me.loc)
		qdel(burn_me)
		return
	to_chat(usr, "There isn't anything you could hope to light in your hand.")

