
// Powers that teleport the user or others around

/mob/living/carbon/human/proc/journey_to_nowhere()
	set category = "Psionic powers.Summoning"
	set name = "Journey to Nowhere (5)"
	set desc = "Spend five psi points to transport yourself, whatever you are carrying, and anyone you are grabbing to the nightmare realm known as deep maintenance. You will land somewhere in the \
	tunnels, but you are not assured safety or that you will be alone once on the other side. Using this power strains the body and will weaken you for a short time."
	var/psi_point_cost = 5
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(alert(usr, "Are you sure you want to do this?", "Journey to Nowhere", "Yes", "No") == "Yes")
		if(PT && PT.pay_power_cost(psi_point_cost))
			var/mob/living/L = get_grabbed_mob(user)		//Grab anyone we have grabbed
			var/turf/simulated/floor/target					//this is where we are teleporting
			var/list/validtargets = list()					//list of valid tiles to teleport to
			var/mob/living/carbon/human/H

			if(ishuman(L))
				H = L

			if(H) //If H was assigned, we need to check if we can teleport them
				if(!PT.check_possibility(TRUE, H))
					return
			else //If H wasn't assigned, just need the normal check_possibility
				if(!PT.check_possibility())
					return

			for(var/area/deepmaint/A in world)				//Clumbsy, but less intensive than iterating every tile
				if(istype(A, /area/deepmaint))				//First find our deepmaint areas
					A.Entered(user)
					for(var/turf/simulated/floor/T in A)	//Pull a list of valid floor tiles from deepmaint
						validtargets += T					//Add them to the list
			target = pick(validtargets)						//Now we pick a target

			do_sparks(1, 0, user.loc)						//Visual feedback before the teleport
			user.forceMove(target)							//Moves the caster
			if(L)											//If we have a grabbed target
				do_sparks(1, 0, target.loc)					//Visual feeback before the teleport
				L.forceMove(target)							//Moves the target
				do_sparks(1, 0, target.loc)					//Visual feedback after the teleport
			do_sparks(1, 0, user.loc)						//Visual feedback after the teleport
			user.weakened += 10								//Moving like this is stressful and stuns you for a time.
