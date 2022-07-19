/obj/item/mech_equipment/sleeper
	name = "exosuit sleeper"
	desc = "An exosuit-mounted sleeper designed to mantain patients stabilized on their way to medical facilities."
	icon_state = "mech_sleeper"
	restricted_hardpoints = list(HARDPOINT_BACK)
	restricted_software = list(MECH_SOFTWARE_MEDICAL)
	equipment_delay = 30 //don't spam it on people pls
	active_power_use = 0 //Usage doesn't really require power. We don't want people stuck inside
	origin_tech = list(TECH_DATA = 2, TECH_BIO = 3)
	passive_power_use = 1.5 KILOWATTS
	var/obj/machinery/sleeper/mounted/sleeper = null

/obj/item/mech_equipment/sleeper/Initialize()
	. = ..()
	sleeper = new /obj/machinery/sleeper/mounted(src)
	sleeper.forceMove(src)

/obj/item/mech_equipment/sleeper/Destroy()
	sleeper.go_out() //If for any reason you weren't outside already.
	QDEL_NULL(sleeper)
	. = ..()

/obj/item/mech_equipment/sleeper/uninstalled()
	. = ..()
	sleeper.go_out()

/obj/item/mech_equipment/sleeper/attack_self(var/mob/user)
	. = ..()
	if(.)
		sleeper.ui_interact(user)

/obj/item/mech_equipment/sleeper/attackby(var/obj/item/I, var/mob/user)
	if(istype(I, /obj/item/reagent_containers/glass))
		sleeper.attackby(I, user)
	else return ..()

/obj/item/mech_equipment/sleeper/afterattack(atom/target, mob/living/user, inrange, params)
	if(!inrange) return
	. = ..()
	if(.)
		if(ishuman(target) && !sleeper.occupant)
			owner.visible_message(SPAN_NOTICE("\The [src] is lowered down to load [target]"))
			sleeper.go_in(target, user)
		else to_chat(user, SPAN_WARNING("You cannot load that in!"))

/obj/item/mech_equipment/sleeper/get_hardpoint_maptext()
	if(sleeper && sleeper.occupant)
		return "[sleeper.occupant]"

/obj/machinery/sleeper/mounted
	name = "\improper mounted sleeper"
	density = FALSE
	anchored = FALSE
	idle_power_usage = 0
	active_power_usage = 0 //It'd be hard to handle, so for now all power is consumed by mech sleeper object
	interact_offline = TRUE
	use_power = NO_POWER_USE

/obj/machinery/sleeper/mounted/ui_interact(mob/user, ui_key = "main", datum/nanoui/ui = null, force_open = NANOUI_FOCUS, datum/topic_state/state = GLOB.mech_state)
	. = ..()

/obj/machinery/sleeper/mounted/nano_host()
	var/obj/item/mech_equipment/sleeper/S = loc
	if(istype(S))
		return S.owner
	return null

//You cannot modify these, it'd probably end with something in nullspace. In any case basic meds are plenty for an ambulance
/obj/machinery/sleeper/mounted/attackby(var/obj/item/I, var/mob/user)
	if(istype(I, /obj/item/reagent_containers/glass))
		if(!user.unEquip(I, src))
			return

		if(beaker)
			beaker.forceMove(get_turf(src))
			user.visible_message("<span class='notice'>\The [user] removes \the [beaker] from \the [src].</span>", "<span class='notice'>You remove \the [beaker] from \the [src].</span>")
		beaker = I
		user.visible_message("<span class='notice'>\The [user] adds \a [I] to \the [src].</span>", "<span class='notice'>You add \a [I] to \the [src].</span>")

/obj/item/mecha_parts/mecha_equipment/tool/cable_layer
	name = "Cable Layer"
	icon_state = "mecha_wire"
	var/datum/event/event
	var/turf/old_turf
	var/obj/structure/cable/last_piece
	var/obj/item/stack/cable_coil/cable
	var/max_cable = 1000
	required_type = /obj/mecha/working

	New()
		cable = new(src)
		cable.amount = 0
		..()

	attach()
		..()
		event = chassis.events.addEvent("onMove",src,"layCable")
		return

	detach()
		chassis.events.clearEvent("onMove",event)
		return ..()

	destroy()
		chassis.events.clearEvent("onMove",event)
		return ..()

	action(var/obj/item/stack/cable_coil/target)
		if(!action_checks(target))
			return
		var/result = load_cable(target)
		var/message
		if(isnull(result))
			message = "<font color='red'>Unable to load [target] - no cable found.</font>"
		else if(!result)
			message = "Reel is full."
		else
			message = "[result] meters of cable successfully loaded."
			send_byjax(chassis.occupant,"exosuit.browser","\ref[src]",src.get_equip_info())
		occupant_message(message)
		return

	Topic(href,href_list)
		..()
		if(href_list["toggle"])
			set_ready_state(!equip_ready)
			occupant_message("[src] [equip_ready?"dea":"a"]ctivated.")
			log_message("[equip_ready?"Dea":"A"]ctivated.")
			return
		if(href_list["cut"])
			if(cable && cable.amount)
				var/m = round(input(chassis.occupant,"Please specify the length of cable to cut","Cut cable",min(cable.amount,30)) as num, 1)
				m = min(m, cable.amount)
				if(m)
					use_cable(m)
					var/obj/item/stack/cable_coil/CC = new (get_turf(chassis))
					CC.amount = m
			else
				occupant_message("There's no more cable on the reel.")
		return

	get_equip_info()
		var/output = ..()
		if(output)
			return "[output] \[Cable: [cable ? cable.amount : 0] m\][(cable && cable.amount) ? "- <a href='?src=\ref[src];toggle=1'>[!equip_ready?"Dea":"A"]ctivate</a>|<a href='?src=\ref[src];cut=1'>Cut</a>" : null]"
		return

	proc/load_cable(var/obj/item/stack/cable_coil/CC)
		if(istype(CC) && CC.amount)
			var/cur_amount = cable? cable.amount : 0
			var/to_load = max(max_cable - cur_amount,0)
			if(to_load)
				to_load = min(CC.amount, to_load)
				if(!cable)
					cable = new(src)
					cable.amount = 0
				cable.amount += to_load
				CC.use(to_load)
				return to_load
			else
				return 0
		return

	proc/use_cable(amount)
		if(!cable || cable.amount<1)
			set_ready_state(1)
			occupant_message("Cable depleted, [src] deactivated.")
			log_message("Cable depleted, [src] deactivated.")
			return
		if(cable.amount < amount)
			occupant_message("No enough cable to finish the task.")
			return
		cable.use(amount)
		update_equip_info()
		return 1

	proc/reset()
		last_piece = null

	proc/dismantleFloor(var/turf/new_turf)
		if(istype(new_turf, /turf/simulated/floor))
			var/turf/simulated/floor/T = new_turf
			if(!T.is_plating())
				T.make_plating(!(T.broken || T.burnt))
		return new_turf.is_plating()

	proc/layCable(var/turf/new_turf)
		if(equip_ready || !istype(new_turf) || !dismantleFloor(new_turf))
			return reset()
		var/fdirn = turn(chassis.dir,180)
		for(var/obj/structure/cable/LC in new_turf)		// check to make sure there's not a cable there already
			if(LC.d1 == fdirn || LC.d2 == fdirn)
				return reset()
		if(!use_cable(1))
			return reset()
		var/obj/structure/cable/NC = new(new_turf)
		NC.cableColor("red")
		NC.d1 = 0
		NC.d2 = fdirn
		NC.updateicon()

		var/datum/powernet/PN
		if(last_piece && last_piece.d2 != chassis.dir)
			last_piece.d1 = min(last_piece.d2, chassis.dir)
			last_piece.d2 = max(last_piece.d2, chassis.dir)
			last_piece.updateicon()
			PN = last_piece.powernet

		if(!PN)
			PN = new()
		PN.add_cable(NC)
		NC.mergeConnectedNetworks(NC.d2)

		//NC.mergeConnectedNetworksOnTurf()
		last_piece = NC
		return 1
