
// Powers that teleport the user or others around

/obj/item/organ/internal/psionic_tumor/proc/journey_to_nowhere()
	set category = "Psionic powers"
	set name = "Journey to Nowhere (5)"
	set desc = "Expend five psi points to transport yourself, whatever you are carrying, and anyone you are grabbing to the nightmare realm known as deep maintenance. You will land somewhere in the \
	tunnels, but you are not assured safety or that you will be alone once on the other side. Using this power strains the body and will weaken you for a short time."
	psi_point_cost = 5

	if(alert(usr, "Are you sure you want to do this?", "Journey to Nowhere", "Yes", "No") == "Yes")
		if(pay_power_cost(psi_point_cost))
			var/mob/living/L = get_grabbed_mob(owner)		//Grab anyone we have grabbed
			var/turf/simulated/floor/target					//this is where we are teleporting
			var/list/validtargets = list()					//list of valid tiles to teleport to

			if(ishuman(L))
				var/mob/living/carbon/human/H = L

				if(H.psi_blocking >= 10)
					owner.stun_effect_act(0, H.psi_blocking * 5, BP_HEAD)
					owner.weakened = H.psi_blocking
					usr.show_message(SPAN_DANGER("Your head pulsates with pain as your mind bashes against an unbreakable barrier!"))
					return

			for(var/area/A in world)						//Clumbsy, but less intensive than iterating every tile
				if(istype(A, /area/deepmaint))				//First find our deepmaint areas
					for(var/turf/simulated/floor/T in A)	//Pull a list of valid floor tiles from deepmaint
						validtargets += T					//Add them to the list
			target = pick(validtargets)						//Now we pick a target

			do_sparks(1, 0, owner.loc)							//Visual feedback before the teleport
			owner.forceMove(target)							//Moves the caster
			if(L)											//If we have a grabbed target
				do_sparks(1, 0, target.loc)						//Visual feeback before the teleport
				L.forceMove(target)							//Moves the target
				do_sparks(1, 0, target.loc)						//Visual feedback after the teleport
			do_sparks(1, 0, owner.loc)							//Visual feedback after the teleport
			owner.weakened += 10								//Moving like this is stressful and stuns you for a time.
