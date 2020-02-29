/mob/living/carbon/slime/regenerate_icons()
	if (stat == DEAD)
		icon_state = "[colour] baby slime dead"
	else
		icon_state = "[colour] [is_adult ? "adult" : "baby"] slime[Victim ? "" : " eat"]"
	cut_overlays()
	if (mood)
		add_overlay(image('icons/mob/slimes.dmi', icon_state = "aslime-[mood]"))
	..()