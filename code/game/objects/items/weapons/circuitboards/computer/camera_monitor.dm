/obj/item/circuitboard/security
	build_name = "security camera monitor"
	build_path = /obj/machinery/computer/security
	req_access = list(access_security)
	var/list/network
	var/locked = 1
	var/emagged = 0

/obj/item/circuitboard/security/New()
	..()
	network = station_networks

/obj/item/circuitboard/security/engineering
	build_name = "engineering camera monitor"
	build_path = /obj/machinery/computer/security/engineering
	req_access = list()

/obj/item/circuitboard/security/engineering/New()
	..()
	network = engineering_networks

/obj/item/circuitboard/security/mining
	build_name = "mining camera monitor"
	build_path = /obj/machinery/computer/security/mining
	network = list("MINE")
	req_access = list()

/obj/item/circuitboard/security/construct(var/obj/machinery/computer/security/C)
	if (..(C))
		C.network = network.Copy()

/obj/item/circuitboard/security/deconstruct(var/obj/machinery/computer/security/C)
	if (..(C))
		network = C.network.Copy()

/obj/item/circuitboard/security/emag_act(var/remaining_charges, var/mob/user)
	if(emagged)
		user << "Circuit lock is already removed."
		return
	user << SPAN_NOTICE("You override the circuit lock and open controls.")
	emagged = 1
	locked = 0
	return 1

/obj/item/circuitboard/security/attackby(obj/item/I as obj, mob/user as mob)
	if(istype(I,/obj/item/card/id))
		if(emagged)
			user << SPAN_WARNING("Circuit lock does not respond.")
			return
		if(check_access(I))
			locked = !locked
			user << "<span class='notice'>You [locked ? "" : "un"]lock the circuit controls.</span>"
		else
			user << SPAN_WARNING("Access denied.")
	else if(istype(I,/obj/item/tool/multitool))
		if(locked)
			user << SPAN_WARNING("Circuit controls are locked.")
			return
		var/existing_networks = jointext(network,",")
		var/input = sanitize(input(usr, "Which networks would you like to connect this camera console circuit to? Seperate networks with a comma. No Spaces!\nFor example: SS13,Security,Secret ", "Multitool-Circuitboard interface", existing_networks))
		if(!input)
			usr << "No input found please hang up and try your call again."
			return
		var/list/tempnetwork = splittext(input, ",")
		tempnetwork = difflist(tempnetwork,restricted_camera_networks,1)
		if(tempnetwork.len < 1)
			usr << "No network found please hang up and try your call again."
			return
		network = tempnetwork
	return
