/obj/structure/churn
	name = "Churn"
	desc = "A small barrel with a long stick out of it, used to make butter."
	icon = 'icons/obj/objects.dmi'
	icon_state = "churn"
	density = FALSE //Small stucture you can walk around or over it basically
	throwpass = TRUE //Dont block thorwing we are smoll
	reagent_flags = OPENCONTAINER //At any point in time you can just open the lid and look inside
	price_tag = 30 //12 wood + crafting time, shouldnt be to good for exports

	var/churns_needed = 30 //How many times we need to loop a churn action
	var/churn_delay = 6 //do_after timer used to slow down the proccess per churn
	var/churns_done = 0 //a simple progress var, when reaching churns needed will be set back to zero, does not decay

	var/milk_requirement = 30 //How many u of milk needed
	var/salt_needed = 1 //how many u of salt needed

/obj/structure/churn/Initialize()
	. = ..()
	create_reagents(250) //on batch making

/obj/structure/churn/attack_hand(mob/user as mob)
	if(churn(user))
		churn_loop(user)
	..()

/obj/structure/churn/examine(mob/user)
	..()

	var/message = "Currently making: Butter.\n"

	if(milk_requirement)
		message += "Milk needed: [milk_requirement]u.\n"

	if(salt_needed)
		message += "Salt needed: [salt_needed]u.\n"

	if(churns_needed)
		message += "Churn Cycles: [churns_done] out of [churns_needed].\n"


	to_chat(user, "<span class='info'>[message]</span>")

/obj/structure/churn/proc/churn(mob/user)
	if(salt_needed<=reagents.get_reagent_amount("sodiumchloride") && milk_requirement<=reagents.get_reagent_amount("milk"))
		return TRUE
	to_chat(user, SPAN_NOTICE("The churn unable to churn due to lacking milk or salt!"))
	return FALSE


/obj/structure/churn/proc/churn_loop(mob/user)
	while(churns_done < churns_needed)
		if(do_after(user, churn_delay))
			churns_done += 1
		else
			break
	if(churns_done >= churns_needed)
		cycle_completed()


/obj/structure/churn/proc/cycle_completed()
	churns_done = 0
	reagents.remove_reagent("milk", milk_requirement, 1)
	reagents.remove_reagent("sodiumchloride", salt_needed, 1)
	new /obj/item/reagent_containers/snacks/butterstick(src.loc)

//Remove and reset
/obj/structure/churn/proc/clear_out()
	if(reagents)
		reagents.clear_reagents()
	churns_done = 0
	return

/obj/structure/churn/verb/reset_keg()
	set name = "Clear Churn (Completely Resets)"
	set category = "Object"
	set src in range(1)

	if(!isghost(usr))
		clear_out()
	else
		to_chat(usr, SPAN_NOTICE("Sadly this Churn isn't for mixing the dead!"))
