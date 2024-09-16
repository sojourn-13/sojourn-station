/obj/item/circuitboard/rdconsole_unlicensed
	build_name = "unlicensed R&D control console"
	build_path = /obj/machinery/computer/rdconsole/unlicensed

/obj/item/circuitboard/rdconsole
	build_name = "R&D control console"
	build_path = /obj/machinery/computer/rdconsole/core

/obj/item/circuitboard/rdconsole/attackby(obj/item/I as obj, mob/user as mob)
	if(istype(I,/obj/item/tool/screwdriver))
		user.visible_message(
			SPAN_NOTICE("\The [user] adjusts the jumper on \the [src]'s access protocol pins."),
			SPAN_NOTICE("You adjust the jumper on the access protocol pins.")
		)
		if(src.build_path == /obj/machinery/computer/rdconsole/core)
			src.build_name = "RD Console - Robotics"
			src.build_path = /obj/machinery/computer/rdconsole/robotics
			to_chat(user, SPAN_NOTICE("Access protocols set to robotics."))
		else
			src.build_name = "RD Console"
			src.build_path = /obj/machinery/computer/rdconsole/core
			to_chat(user, SPAN_NOTICE("Access protocols set to default."))
	return
