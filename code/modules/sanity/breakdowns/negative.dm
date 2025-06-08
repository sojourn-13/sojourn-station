

/datum/breakdown/negative/delusion
	name = "Delusion"
	duration = 1 MINUTES
	restore_sanity_post = 50

	start_messages = list(
		"You feel like something is speaking to you from within!",
		"You feel a voice starting to scream in your head!",
		"You feel like your brain decided to scream at you!",
		"You feel like voices are marching in your mind!",
		"You feel sounds warp into cacophony!"
	)
	end_messages = list(
		"You feel silence, again."
	)

/datum/breakdown/negative/delusion/update()
	. = ..()
	if(!.)
		return	FALSE
	if(prob(10))
		var/power = rand(4,9)
		holder.owner.playsound_local(holder.owner, 'sound/effects/explosionfar.ogg', 100, 1, round(power*2,1) )
		holder.owner.playsound_local(holder.owner, "explosion", 100, 1, round(power,1) )
		shake_camera(holder.owner, 1)
	if(prob(10))
		holder.owner.playsound_local(holder.owner, 'sound/effects/alert.ogg')

/datum/breakdown/negative/fabric
	name = "The Fabric"
	duration = 3 MINUTES
	var/list/image/images = list()

	start_messages = list(
		"You feel like you understand something that you shouldn't!",
		"You feel the thoughts crawling in your head!",
		"You feel like your mind is trying to comprehend the secrets of the universe itself!",
		"You feel it. Secrets. They are all around you.",
		"You feel your tower of knowledge on course to reach the stars, with only a single brick missing!"
	)
	end_messages = list(
		"You feel like it is gone. But will it return?"
	)

/datum/breakdown/negative/fabric/occur()
	RegisterSignal(SSdcs, COMSIG_GLOB_FABRIC_NEW, PROC_REF(add_image))
	RegisterSignal(holder.owner, COMSIG_MOB_LOGIN, PROC_REF(update_client_images))
	for(var/datum/component/fabric/F in GLOB.fabric_list)
		if(F.parent == holder.owner)
			continue
		add_image(F.fabric_image)
	++holder.owner.language_blackout
	return ..()

/datum/breakdown/negative/fabric/conclude()
	--holder.owner.language_blackout
	holder.owner.client?.images -= images
	UnregisterSignal(SSdcs, COMSIG_GLOB_FABRIC_NEW)
	UnregisterSignal(holder.owner, COMSIG_MOB_LOGIN)
	images.Cut()
	..()

/datum/breakdown/negative/fabric/proc/add_image(image/I)
	images |= I
	holder.owner.client?.images |= I

/datum/breakdown/negative/fabric/proc/update_client_images()
	holder.owner.client?.images |= images


/datum/breakdown/negative/spiral
	name = "Downward-spiral"
	duration = 0
	restore_sanity_post = 50

	start_messages = list(
		"You feel like there is no point in any of this!",
		"Your brain refuses to comprehend any of this!",
		"You feel like you don't want to continue whatever you're doing!",
		"You feel like your best days are gone forever!",
		"You feel it. You know it. There is no turning back!"
	)

/datum/breakdown/negative/spiral/conclude()
	holder.positive_prob = max(holder.positive_prob - 10, 0)
	holder.negative_prob = min(holder.negative_prob + 20, 100)
	holder.max_level = max(holder.max_level - 20, 0)
	..()

#define ACTVIEW_ONE TRUE
#define ACTVIEW_BOTH 2

/datum/breakdown/negative/glassification
	name = "Glassification"
	duration = 2 MINUTES
	restore_sanity_post = 40
	var/time
	var/cooldown = 20 SECONDS
	var/time_view = 1 SECONDS
	var/active_view = FALSE
	var/mob/living/carbon/human/target
	start_messages = list("You start to see through everything. Your mind expands.")
	end_messages = list("The world has returned to normal ... right?")

/datum/breakdown/negative/glassification/can_occur()
	var/list/candidates = (GLOB.player_list & GLOB.living_mob_list & GLOB.human_mob_list) - holder.owner
	if(candidates.len)
		return TRUE
	return FALSE

/datum/breakdown/negative/glassification/update()
	if(world.time < time)
		return TRUE
	if(active_view) //Just in case the callback doesn't catch
		reset_views()
		return TRUE
	. = ..()
	if(!.)
		return FALSE
	var/list/targets = (GLOB.player_list & GLOB.living_mob_list & GLOB.human_mob_list) - holder.owner
	if(targets.len)
		target = pick(targets)
		holder.owner.remoteviewer = TRUE
		holder.owner.set_remoteview(target)
		to_chat(holder.owner, SPAN_WARNING("It seems as if you are looking through someone else's eyes."))
		active_view = ACTVIEW_ONE
		if(target.sanity.level < 50)
			target.remoteviewer = TRUE
			target.set_remoteview(holder.owner)
			to_chat(target, SPAN_WARNING("It seems as if you are looking through someone else's eyes."))
			active_view = ACTVIEW_BOTH
		target.sanity.changeLevel(-rand(5,10)) //This phenomena will prove taxing on the viewed regardless
		addtimer(CALLBACK(src, PROC_REF(reset_views), TRUE), time_view)
		time = world.time + time_view

/datum/breakdown/negative/glassification/proc/reset_views()
	holder.owner.set_remoteview()
	holder.owner.remoteviewer = FALSE
	if(active_view == ACTVIEW_BOTH)
		target.set_remoteview()
		target.remoteviewer = FALSE
	target = null
	active_view = FALSE
	time = world.time + cooldown

//Disabled bad ones

/* - Shit breakdown - disabled until it is reworked to be in specific circumstances.
/datum/breakdown/negative/selfharm
	name = "Self-harm"
	duration = 1 MINUTES
	delay = 30 SECONDS
	restore_sanity_post = 70

	start_messages = list(
		"You can't take it anymore! You completely lose control!",
		"Make it stop, make it stop! You'd do anything to make it stop!",
		"Your mind cracks under the weight of the things you've seen and felt!",
		"Your brain screams for mercy! It's time to end it all!",
		"You can't handle the pressure anymore! Your head runs wild with thoughts of suicide!"
	)
	end_messages = list(
		"You feel the panic subside. Perhaps it's alright to live, after all?"
	)

/datum/breakdown/negative/selfharm/update()
	. = ..()
	if(!.)
		return
	if(init_update())
		var/datum/gender/G = holder.owner.get_gender()
		if(prob(50))
			var/emote = pick(list(
				"screams incoherently!",
				"bites [G.his] tongue and mutters under [G.his] breath.",
				"utters muffled curses.",
				"grumbles.",
				"screams with soulful agony!",
				"stares at the floor."
			))
			holder.owner.custom_emote(message=emote)
		else if(!holder.owner.incapacitated())
			var/obj/item/W = holder.owner.get_active_hand()
			if(W)
				W.attack(holder.owner, holder.owner, ran_zone())
			else
				var/damage_eyes = prob(40)
				if(damage_eyes)
					for(var/obj/item/protection in list(holder.owner.head, holder.owner.wear_mask, holder.owner.glasses))
						if(protection && (protection.body_parts_covered & EYES))
							damage_eyes = FALSE
							break
				if(damage_eyes)
					holder.owner.visible_message(SPAN_DANGER("[holder.owner] scratches at [G.his] eyes!"))
					var/obj/item/organ/internal/eyes/eyes = holder.owner.random_organ_by_process(OP_EYES)
					eyes.take_damage(rand(1,10), TRUE, BRUTE, TRUE, TRUE)
				else
					holder.owner.visible_message(SPAN_DANGER(pick(list(
						"[holder.owner] tries to end [G.his] misery!",
						"[holder.owner] tries to peel [G.his] own skin off!",
						"[holder.owner] bites [G.his] own limbs uncontrollably!"
					))))
					var/list/obj/item/organ/external/parts = holder.owner.get_damageable_organs()
					if(parts.len)
						holder.owner.damage_through_armor(rand(2,4), def_zone = pick(parts))

/datum/breakdown/negative/selfharm/occur()
	spawn(delay)
		++holder.owner.suppress_communication
	return ..()

/datum/breakdown/negative/selfharm/conclude()
	--holder.owner.suppress_communication
	..()
*/

/*/datum/breakdown/negative/hysteric //Very VERY bad breakdown that essentially makes you not be able to control yourself
	name = "Hysteric"
	duration = 1.5 MINUTES
	delay = 60 SECONDS
	restore_sanity_post = 50

	start_messages = list(
		"You get overwhelmed and start to panic!",
		"You're inconsolably terrified!",
		"You can't choke back the tears anymore!",
		"It's too much! You freak out and lose control!"
	)
	end_messages = list(
		"You calm down as your feelings subside. You feel horribly embarrassed!"
	)

/datum/breakdown/negative/hysteric/update()
	. = ..()
	if(!.)
		return FALSE
	if(init_update())
		holder.owner.Weaken(3)
		holder.owner.Stun(3)
		if(prob(50))
			holder.owner.emote("scream")
		else
			holder.owner.emote("cry")

/datum/breakdown/negative/hysteric/occur()
	spawn(delay)
		holder.owner.SetWeakened(4)
		holder.owner.SetStunned(4)
		++holder.owner.suppress_communication
	return ..()

/datum/breakdown/negative/hysteric/conclude()
	holder.owner.SetWeakened(0)
	holder.owner.SetStunned(0)
	--holder.owner.suppress_communication
	..()

*/
