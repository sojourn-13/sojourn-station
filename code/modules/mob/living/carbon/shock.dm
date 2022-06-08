/mob/living/var/traumatic_shock = 0
/mob/living/carbon/var/shock_stage = 0

// proc to find out in how much pain the mob is at the moment
/mob/living/carbon/proc/updateshock()
	if (species && (species.flags & NO_PAIN))
		src.shock_stage = 0
		src.traumatic_shock = 0
		return 0

	src.traumatic_shock = 			\
	1.5	* src.getOxyLoss() + 		\
	0.5	* src.getToxLoss() + 		\
	0.8	* src.getFireLoss() + 		\
	1	* src.getBruteLoss() + 		\
	1.8	* src.getCloneLoss() + 		\
	1.5	* src.halloss + 			\
	-1	* src.analgesic

	if(src.slurring)
		src.traumatic_shock -= 30 //being drunk or on some types of drugs will allow you to withstand more

	if(src.traumatic_shock < 0)
		src.traumatic_shock = 0

	return src.traumatic_shock

// broken or ripped off organs will add quite a bit of pain
/mob/living/carbon/human/updateshock()
	..()
	for(var/obj/item/organ/external/organ in organs)
		if(organ && (organ.is_broken() || organ.open))
			traumatic_shock += 20 //Broken bones are painful but not something to criple someone in pain

	return traumatic_shock


/mob/living/carbon/proc/handle_shock()
	updateshock()
