//Farwa, funny lil monkey-cats. Sprite from Bay
/mob/living/carbon/superior/farwa
	name = "farwa"
	desc = "A small exotic creature. Often described as somewhere between a cat and a monkey, these playful little beasts are loved by the wealthy as exotic pets and detested by wildlife \
	and conservation specialists the galaxy over for their propensity to escape, breed - and muck up any ecostystem they're involved in. Despite their seemingly clumsy and cute behavior \
	they share in common with house-cats a predatory drive and surprisingly high effective kill-rate when on the hunt. "
	icon = 'icons/mob/mobs-domestic.dmi'
	icon_state = "farwa"
	icon_living = "farwa"
	icon_dead = "farwa_dead"
	speak_emote = list("purrs", "meows", "mrrrps")
	emote_see = list("falls over, rolling around", "raises their paws with claws extended before pouncing", "flicks their tail sideways")
	move_to_delay = 2 //we're fast lil guys
	maxHealth = 100 //but fragile
	health = 100
	melee_damage_lower = 5 //clumsy
	melee_damage_upper = 25 //but sharp claws
	attacktext = "clawed"
	list/attack_sound = 'sound/weapons/bladeslice.ogg'
	meat_type = /obj/item/reagent_containers/snacks/meat
	meat_amount = 2
	leather_amount = 1 //very small little guys
	bones_amount = 1
	has_special_parts = FALSE //var for checking during the butcher process.
	mob_size = MOB_SMALL
	colony_friend = TRUE
	friendly_to_colony = TRUE

/mob/living/carbon/superior/farwa/Life()
	..()
	if(prob(2)) //spooky
		var/mob/observer/ghost/spook = locate() in range(src,5)
		if(spook)
			var/turf/T = spook.loc
			var/list/visible = list()
			for(var/obj/O in T.contents)
				if(!O.invisibility && O.name)
					visible += O
			if(visible.len)
				var/atom/A = pick(visible)
				visible_emote("suddenly stops and stares at something unseen[istype(A) ? " near [A]":""].")
				visible_emote("hisses as their fur stands on edge!") // GHOST DETECTED. CATTO NO LIKE.
				playsound(loc, 'sound/effects/creatures/cat_hiss.ogg', 50, 1, -1)

/mob/living/carbon/superior/farwa/proc/beg(var/atom/thing, var/atom/holder)
	visible_emote("licks [get_gender() == MALE ? "his" : get_gender() == FEMALE ? "her" : "their"] lips and looks pleadingly at [holder]'s [thing.name]")

/mob/living/carbon/superior/farwa/kitter
	name = "Sgt Kitters"
	desc = "A Farwa, a small exotic creature often described as being somewhere between a cat and a monkey. This one appears to have a collar with a silver dog-tag attached that reads 'Staff Sgt Kitters'. "
	icon_state = "sgt_kitter"
	icon_living = "sgt_kitter"
	icon_dead = "sgt_kitter_dead"