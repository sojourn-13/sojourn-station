#define REPAIR_DOOR_AMOUNT 10

/datum/ritual/cruciform/machines
	name = "machines"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform
	fail_message = "The Cruciform feels cold against your chest."
	category = "Machinery"


//Airlocks

/datum/ritual/cruciform/machines/lock_door
	name = "Activate Hatchway"
	phrase = "Aod autem clausis diligentissime ostiis coenaculi, et obfirmatis sera." //"Then Ehud went out to the porch; he shut the doors of the upper room behind him and locked them."
	desc = "Commands a nearby hatchway to be locked or unlocked."
	power = 5

/datum/ritual/cruciform/machines/lock_door/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/list/O = get_front(user)

	var/obj/machinery/door/holy/door = locate(/obj/machinery/door/holy) in O

	if(!door)
		fail("You fail to find a compatible door here.", user, C)
		return FALSE

	if(door.stat & (BROKEN))
		fail("[door] is off.", user, C)
		return FALSE

	door.locked ? door.unlock() : door.lock()
	return TRUE

/datum/ritual/cruciform/machines/repair_door
	name = "Repair Hatchway"
	phrase = "Lateres ceciderunt, sed quadris lapidibus aedificabimus." //"The bricks have fallen down, but we will rebuild with dressed stone;"
	desc = "Repairs a nearby hatchway at the cost of some biomatter."
	power = 5

/datum/ritual/cruciform/machines/repair_door/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/list/O = get_front(user)

	var/obj/machinery/door/holy/door = locate(/obj/machinery/door/holy) in O
	var/obj/item/stack/material/biomatter/consumable

	if(!door)
		fail("You fail to find a compatible hatchway here.", user, C)
		return FALSE

	if(door.health == door.maxHealth)
		fail("This hatchway doesn\'t need repair.", user, C)
		return FALSE

	var/turf/target_turf = get_step(user, user.dir)
	var/turf/user_turf = get_turf(user)

	for(var/obj/item/stack/material/biomatter/B in target_turf.contents)
		if(B.amount >= REPAIR_DOOR_AMOUNT)
			consumable = B
			break

	if(!consumable)
		for(var/obj/item/stack/material/biomatter/B in user_turf.contents)
			if(B.amount >= REPAIR_DOOR_AMOUNT)
				consumable = B
				break

	if(consumable)
		consumable.use(REPAIR_DOOR_AMOUNT)
		var/obj/effect/overlay/nt_construction/effect = new(target_turf, 50)
		sleep(50)
		door.stat -= BROKEN
		door.health = door.maxHealth
		door.unlock()
		door.close()
		effect.success()
		return TRUE
	else
		fail("Not enough biomatter found to repair the hatchway, you need at least [REPAIR_DOOR_AMOUNT].", user, C)
		return FALSE

////////////////////////BIOMATTER MANIPULATION MULTI MACHINES RITUALS

///////////////>Biogenerator manipulation rite</////////////////
/datum/ritual/cruciform/machines/power_biogen_awake
	name = "Power Biogenerator"
	phrase = "In ipso vita erat, et vita erat lux hominum: et lux in tenebris lucet, et tenebrae eam non comprehenderunt." //"In him was life, and that life was the light of all mankind. The light shines in the darkness, and the darkness has not overcome it."
	desc = "A ritual to activate or deactivate power biogenerator machine. You should be nearby its metrics screen."
	power = 10

/datum/ritual/cruciform/machines/power_biogen_awake/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/C)
	var/obj/machinery/multistructure/biogenerator_part/console/biogen_screen = locate() in range(4, H)
	if(biogen_screen && biogen_screen.MS)
		var/datum/multistructure/biogenerator/biogenerator = biogen_screen.MS
		if(biogenerator.working)
			biogenerator.deactivate()
		else
			biogenerator.activate()
		return TRUE

	fail("There is no power biogenerator screen near you.", H, C)
	return FALSE


////////////////Bioreactor commands

/datum/ritual/cruciform/machines/bioreactor
	name = "Bioreactor command"
	power = 10


/datum/ritual/cruciform/machines/bioreactor/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/C)
	var/obj/machinery/multistructure/bioreactor_part/console/bioreactor_screen = locate() in range(4, H)
	if(bioreactor_screen && bioreactor_screen.MS)
		var/datum/multistructure/bioreactor/bioreactor = bioreactor_screen.MS
		//to prevent any copypaste
		//let's make it a bit better
		var/success = perform_command(bioreactor)
		return success

	fail("You should be near the bioreactor metrics screen.", H, C)
	return FALSE

//There we perform any manipulations with our bioreactor
//Since console finder code is similar for both rituals
/datum/ritual/cruciform/machines/bioreactor/proc/perform_command(datum/multistructure/bioreactor/bioreactor)
	return

///////////////>Bioreactor pump solution ritual<//////////////////

/datum/ritual/cruciform/machines/bioreactor/solution
	name = "Bioreactor Solution Pump Toggle"
	phrase = "Et fluvius egrediebatur de loco voluptatis ad irrigandum paradisum, qui inde dividitur in quatuor capita." //"A river watering the garden flowed from Eden; from there it was separated into four headwaters."
	desc = "This ritual pumps the solution in or out of a closed bioreactor chamber. You must be near the screen."

/datum/ritual/cruciform/machines/bioreactor/solution/perform_command(datum/multistructure/bioreactor/bioreactor)
	var/obj/machinery/multistructure/bioreactor_part/console/bioreactor_console = bioreactor.metrics_screen
	if(!bioreactor.chamber_closed)
		bioreactor_console.visible_message("You cannot pump in solution while the door is open!")
		return FALSE
	bioreactor.pump_solution()
	bioreactor_console.ping()
	bioreactor_console.visible_message("Bioreactor produces an echoing click. The platforms pumps start buzzing.")
	return TRUE



///////////////>Bioreactor chamber opening song<////////////////

/datum/ritual/cruciform/machines/bioreactor/chamber_doors
	name = "Bioreactor Chamber's Doors"
	phrase = "Constituit quoque ianitores in portis domus Domini ut non ingrederetur eam inmundus in omni." //"He also stationed gatekeepers at the gates of the Lord’s temple so that no one who was in any way unclean might enter."
	desc = "This ritual opens or closes the bioreactor chamber. You must be near the screen."
/datum/ritual/cruciform/machines/bioreactor/chamber_doors/perform_command(datum/multistructure/bioreactor/bioreactor)
	var/obj/machinery/multistructure/bioreactor_part/console/bioreactor_console = bioreactor.metrics_screen
	if(bioreactor.chamber_solution)
		bioreactor_console.visible_message("You cannot open the door while there is solution inside!")
		return FALSE
	bioreactor.toggle_platform_door()
	bioreactor_console.ping()
	bioreactor_console.visible_message("You hear a loud BANG. Then a pause... The chamber's door mechanism moves its position with a quiet grace.")
