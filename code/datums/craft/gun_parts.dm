/obj/item/part/gun/frame
	name = "gun frame"
	desc = "a generic gun frame. consider debug"
	icon_state = "frame_olivaw"
	generic = FALSE
	matter = list(MATERIAL_PLASTEEL = 4)

	// What gun the frame makes when it only accepts one grip
	var/result = /obj/item/gun/projectile

	// Currently installed grip
	var/obj/item/part/gun/grip/InstalledGrip

	// Which grips does the frame accept?
	var/list/gripvars = list(/obj/item/part/gun/grip/wood, /obj/item/part/gun/grip/black)
	// What are the results (in order relative to gripvars)?
	var/list/resultvars = list(/obj/item/gun/projectile, /obj/item/gun/energy)

	// Currently installed mechanism
	var/obj/item/part/gun/grip/InstalledMechanism
	// Which mechanism the frame accepts?
	var/list/mechanismvar = /obj/item/part/gun/mechanism

	// Currently installed barrel
	var/obj/item/part/gun/barrel/InstalledBarrel
	// Which barrels does the frame accept?
	var/list/barrelvars = list(/obj/item/part/gun/barrel)

	var/serial_type = ""

	//Cares about having modular gun parts or not (i.e can take different barrels to make same gun ect)
	var/nra = TRUE

/obj/item/part/gun/frame/New(loc, ...)
	. = ..()
	var/obj/item/gun/G = new result(null)
	if(G.serial_type)
		serial_type = G.serial_type


/obj/item/part/gun/frame/New(loc)
	..()
	var/spawn_with_preinstalled_parts = FALSE
	//if(istype(loc, /obj/structure/scrap_spawner))
		//spawn_with_preinstalled_parts = TRUE
	if(in_maintenance())
		var/turf/T = get_turf(src)
		for(var/atom/A in T.contents)
			if(istype(A, /obj/random))
				spawn_with_preinstalled_parts = TRUE

	if(spawn_with_preinstalled_parts)
		var/list/parts_list = list("mechanism", "barrel", "grip")

		pick_n_take(parts_list)
		if(prob(50))
			pick_n_take(parts_list)

		for(var/part in parts_list)
			switch(part)
				if("mechanism")
					InstalledMechanism = new mechanismvar(src)
				if("barrel")
					var/select = pick(barrelvars)
					InstalledBarrel = new select(src)
				if("grip")
					var/select = pick(gripvars)
					InstalledGrip = new select(src)
					var/variantnum = gripvars.Find(select)
					result = resultvars[variantnum]

/obj/item/part/gun/frame/attackby(obj/item/I, mob/living/user, params)
	if(istype(I, /obj/item/part/gun/grip))
		if(InstalledGrip)
			to_chat(user, SPAN_WARNING("[src] already has a grip attached!"))
			return
		else
			handle_gripvar(I, user)

	if(istype(I, /obj/item/part/gun/mechanism))
		if(InstalledMechanism)
			to_chat(user, SPAN_WARNING("[src] already has a mechanism attached!"))
			return
		else
			handle_mechanismvar(I, user)

	if(istype(I, /obj/item/part/gun/barrel))
		if(InstalledBarrel)
			to_chat(user, SPAN_WARNING("[src] already has a barrel attached!"))
			return
		else
			handle_barrelvar(I, user)

	var/tool_type = I.get_tool_type(user, list(QUALITY_SCREW_DRIVING, serial_type ? QUALITY_HAMMERING : null), src)
	switch(tool_type)
		if(QUALITY_HAMMERING)
			user.visible_message(SPAN_NOTICE("[user] begins scribbling \the [name]'s gun serial number away."), SPAN_NOTICE("You begin removing the serial number from \the [name]."))
			if(I.use_tool(user, src, WORKTIME_SLOW, QUALITY_HAMMERING, FAILCHANCE_EASY, required_stat = STAT_MEC))
				user.visible_message(SPAN_DANGER("[user] removes \the [name]'s gun serial number."), SPAN_NOTICE("You successfully remove the serial number from \the [name]."))
				serial_type = "INDEX"
				serial_type += "-[generate_gun_serial(pick(3,4,5,6,7,8))]"
				return

		if(QUALITY_SCREW_DRIVING)
			var/list/possibles = contents.Copy()
			var/obj/item/part/gun/toremove = input("Which part would you like to remove?","Removing parts") in possibles
			if(!toremove)
				return
			if(I.use_tool(user, src, WORKTIME_INSTANT, QUALITY_SCREW_DRIVING, FAILCHANCE_ZERO, required_stat = STAT_MEC))
				eject_item(toremove, user)
				if(istype(toremove, /obj/item/part/gun/grip))
					InstalledGrip = null
				else if(istype(toremove, /obj/item/part/gun/barrel))
					InstalledBarrel = FALSE
				else if(istype(toremove, /obj/item/part/gun/mechanism))
					InstalledMechanism = FALSE

	return ..()

/obj/item/part/gun/frame/proc/handle_gripvar(obj/item/I, mob/living/user)
	if(I.type in gripvars)
		if(insert_item(I, user))
			var/variantnum = gripvars.Find(I.type)
			result = resultvars[variantnum]
			InstalledGrip = I
			to_chat(user, SPAN_NOTICE("You have attached the grip to \the [src]."))
			return
	else
		to_chat(user, SPAN_WARNING("This grip does not fit!"))
		return

/obj/item/part/gun/frame/proc/handle_mechanismvar(obj/item/I, mob/living/user)
	if(I.type == mechanismvar)
		if(insert_item(I, user))
			InstalledMechanism = I
			to_chat(user, SPAN_NOTICE("You have attached the mechanism to \the [src]."))
			return
	else
		to_chat(user, SPAN_WARNING("This mechanism does not fit!"))
		return

/obj/item/part/gun/frame/proc/handle_barrelvar(obj/item/I, mob/living/user)
	if(I.type in barrelvars)
		if(insert_item(I, user))
			InstalledBarrel = I
			to_chat(user, SPAN_NOTICE("You have attached the barrel to \the [src]."))
			return
	else
		to_chat(user, SPAN_WARNING("This barrel does not fit!"))
		return

/obj/item/part/gun/frame/attack_self(mob/user)
	. = ..()
	var/turf/T = get_turf(src)
	if(!InstalledGrip)
		to_chat(user, SPAN_WARNING("\the [src] does not have a grip!"))
		return
	if(!InstalledMechanism)
		to_chat(user, SPAN_WARNING("\the [src] does not have a mechanism!"))
		return
	if(!InstalledBarrel)
		to_chat(user, SPAN_WARNING("\the [src] does not have a barrel!"))
		return
	if(nra)
		if(check_legal(user))
			return
	var/obj/item/gun/G = new result(T)
	G.serial_type = serial_type
	if(barrelvars.len > 1 && istype(G, /obj/item/gun/projectile))
		var/obj/item/gun/projectile/P = G
		P.caliber = InstalledBarrel.caliber
		G.gun_parts = list(src.type = 1, InstalledGrip.type = 1, InstalledMechanism.type = 1, InstalledBarrel.type = 1)
	qdel(src)
	return

// The way this system works is checking if a guns barrel is 'legal' to install into a gun. Basically Soj's jank solution to making guns take the correct barrel to make certain guns.
// Snowflake code per-gun can prevent this check, allowing you to mix-and-match calibers as wanted.
/obj/item/part/gun/frame/proc/check_legal(mob/user)
	var/illegal = FALSE
	log_debug("Check Legal Marker 0, I have started")
	if(result)
		var/obj/item/gun/projectile/legal = new result(null)
		var/obj/item/part/gun/grip/frame_to_grip
		var/obj/item/part/gun/mechanism/frame_to_mechanism
		var/obj/item/part/gun/barrel/frame_to_barrel

		for(var/target_item in legal.gun_parts)
			var/amount = legal.gun_parts[target_item]
			while(amount)
				if(ispath(target_item, /obj/item/part/gun/grip))
					var/obj/item/part/gun/grip/G = new target_item(null)
					frame_to_grip = G.refence_for_legal
					qdel(G)

				if(ispath(target_item, /obj/item/part/gun/mechanism))
					var/obj/item/part/gun/mechanism/M = new target_item(null)
					frame_to_mechanism = M.refence_for_legal
					qdel(M)

				if(ispath(target_item, /obj/item/part/gun/barrel))
					var/obj/item/part/gun/barrel/B = new target_item(null)
					frame_to_barrel = B.refence_for_legal
					qdel(B)
				amount--


		var/legal_grip = InstalledGrip.refence_for_legal
		var/legal_mechanism = InstalledMechanism.refence_for_legal
		var/legal_barrel = InstalledBarrel.refence_for_legal

		log_debug("Check Legal Marker 1")

		log_debug("frame_to_grip == [frame_to_grip]")
		log_debug("frame_to_mechanism == [frame_to_mechanism]")
		log_debug("frame_to_barrel == [frame_to_barrel]")


		log_debug("legal_grip refence == [legal_grip]")
		log_debug("legal_mechanism refence == [legal_mechanism]")
		log_debug("legal_barrel refence == [legal_barrel]")

		if(legal_grip != frame_to_grip) // ATF check
			to_chat(user, SPAN_WARNING("\the [src] doesn't have a proper grip for the components!"))
			illegal = TRUE

		if(legal_mechanism != frame_to_mechanism)
			to_chat(user, SPAN_WARNING("\the [src] doesn't have a proper mechanism for the components!"))
			illegal = TRUE

		if(legal_barrel != frame_to_barrel)
			to_chat(user, SPAN_WARNING("\the [src] doesn't have a proper barrel for the components!"))
			illegal = TRUE

		log_debug("Check Legal Marker 2")
		qdel(legal)
		log_debug("Check Legal Marker 3, I have ended")
		return illegal

/obj/item/part/gun/frame/examine(user, distance)
	. = ..()
	if(.)
		if(InstalledGrip)
			to_chat(user, SPAN_NOTICE("\the [src] has \a [InstalledGrip] installed."))
		else
			to_chat(user, SPAN_NOTICE("\the [src] does not have a grip installed."))
		if(InstalledMechanism)
			to_chat(user, SPAN_NOTICE("\the [src] has \a [InstalledMechanism] installed."))
		else
			to_chat(user, SPAN_NOTICE("\the [src] does not have a mechanism installed."))
		if(InstalledBarrel)
			to_chat(user, SPAN_NOTICE("\the [src] has \a [InstalledBarrel] installed."))
		else
			to_chat(user, SPAN_NOTICE("\the [src] does not have a barrel installed."))
		if(in_range(user, src) || isghost(user))
			if(serial_type)
				to_chat(user, SPAN_WARNING("There is a serial number on the frame, it reads [serial_type]."))
			else if(isnull(serial_type))
				to_chat(user, SPAN_DANGER("The serial is scribbled away."))

///////////////////////
// Gun parts section //
///////////////////////
/*
These are the individual parts that fit into a gun. If you make any unique gun parts, such as a new caliber or mechanism for.. whatever reason, it needs to go here.
Steel parts are for bootleg firearms, such as handmade firearms, low-tier / trash guns, and the like. Plasteel parts are for normal firearms.

Possible TO:DO for future coding:
Make it so steel parts fit into any gun you want but can 'break', or cause jams. Allows bootleg high-quality firearms but comes with downsides to cheapness.
*/

//Grips
/obj/item/part/gun/grip
	name = "generic grip"
	desc = "A generic firearm grip, unattached from a firearm."
	icon_state = "grip_wood"
	generic = FALSE
	matter = list(MATERIAL_PLASTIC = 6)
	price_tag = 100
	var/refence_for_legal = "baseline"

/obj/item/part/gun/grip/wood
	name = "wood grip"
	desc = "A wood firearm grip, unattached from a firearm."
	icon_state = "grip_wood"
	matter = list(MATERIAL_WOOD = 6)
	refence_for_legal = "wooden"

/obj/item/part/gun/grip/black //Nanotrasen, Moebius, Syndicate, Oberth, Blackshield, etc
	name = "plastic grip"
	desc = "A black plastic firearm grip, unattached from a firearm. For sleekness and decorum."
	icon_state = "grip_black"
	refence_for_legal = "black"

/obj/item/part/gun/grip/rubber //Marshals, high-end guns
	name = "rubber grip"
	desc = "A rubber firearm grip, unattached from a firearm. For professionalism and violence of action."
	icon_state = "grip_rubber"
	refence_for_legal = "rubber"

/obj/item/part/gun/grip/excel
	name = "Excelsior plastic grip"
	desc = "A tan plastic firearm grip, unattached from a firearm. To fight for Haven and to spread the unified revolution!"
	icon_state = "grip_excel"
	refence_for_legal = "excel"

/obj/item/part/gun/grip/serb
	name = "bakelite plastic grip"
	desc = "A brown plastic firearm grip, unattached from a firearm. Classics never go out of style."
	icon_state = "grip_serb"
	refence_for_legal = "serb"

//Mechanisms
/obj/item/part/gun/mechanism
	name = "generic mechanism"
	desc = "All the bits that makes the bullet go bang."
	icon_state = "mechanism_pistol"
	generic = FALSE
	matter = list(MATERIAL_PLASTEEL = 4)
	price_tag = 100
	var/refence_for_legal = "baseline"

/obj/item/part/gun/mechanism/pistol
	name = "pistol mechanism"
	desc = "All the bits that makes the bullet go bang, all in a small, convenient frame."
	icon_state = "mechanism_pistol"
	refence_for_legal = "pistol"

/obj/item/part/gun/mechanism/revolver
	name = "revolver mechanism"
	desc = "All the bits that makes the bullet go bang, rolling round and round."
	icon_state = "mechanism_revolver"
	refence_for_legal = "revolver"

/obj/item/part/gun/mechanism/shotgun
	name = "shotgun mechanism"
	desc = "All the bits that makes the bullet go bang, perfect for long shells."
	icon_state = "mechanism_shotgun"
	refence_for_legal = "shotgun"

/obj/item/part/gun/mechanism/smg
	name = "SMG mechanism"
	desc = "All the bits that makes the bullet go bang, in a speedy package."
	icon_state = "mechanism_smg"
	refence_for_legal = "smg"

/obj/item/part/gun/mechanism/autorifle
	name = "self-loading mechanism"
	desc = "All the bits that makes the bullet go bang, for all the military hardware you know and love."
	icon_state = "mechanism_autorifle"
	refence_for_legal = "autorifle"

/obj/item/part/gun/mechanism/machinegun
	name = "machine gun mechanism"
	desc = "All the bits that makes the bullet go bang. Now I have a machine gun, Ho, Ho, Ho."
	icon_state = "mechanism_machinegun"
	refence_for_legal = "machinegun"

// steel mechanisms
/obj/item/part/gun/mechanism/pistol/steel
	name = "cheap pistol mechanism"
	desc = "All the bits that makes the bullet go bang, all in a small, convenient frame. \
			This one does not look as high quality."
	matter = list(MATERIAL_STEEL = 3)

/obj/item/part/gun/mechanism/revolver/steel
	name = "cheap revolver mechanism"
	desc = "All the bits that makes the bullet go bang, rolling round and round. \
			This one does not look as high quality."
	matter = list(MATERIAL_STEEL = 3)

/obj/item/part/gun/mechanism/shotgun/steel
	name = "cheap shotgun mechanism"
	desc = "All the bits that makes the bullet go bang, perfect for long shells.  \
			This one does not look as high quality."
	matter = list(MATERIAL_STEEL = 3)

/obj/item/part/gun/mechanism/smg/steel
	name = "cheap SMG mechanism"
	desc = "All the bits that makes the bullet go bang, in a speedy package. \
			This one does not look as high quality."
	matter = list(MATERIAL_STEEL = 3)

/obj/item/part/gun/mechanism/boltgun // fits better in this category despite not being a steel variant
	name = "bolt-action mechanism"
	desc = "All the bits that makes the bullet go bang, slow and methodical."
	icon_state = "mechanism_boltaction"
	matter = list(MATERIAL_STEEL = 3)
	refence_for_legal = "boltaction"

/obj/item/part/gun/mechanism/autorifle/steel
	name = "cheap self-loading mechanism"
	desc = "All the bits that makes the bullet go bang, for all the military hardware you know and love. \
			This one does not look as high quality."
	matter = list(MATERIAL_STEEL = 10)

//Barrels
/obj/item/part/gun/barrel
	name = "generic barrel"
	desc = "A gun barrel, which keeps the bullet going in the right direction."
	icon_state = "barrel_.35"
	generic = FALSE
	matter = list(MATERIAL_PLASTEEL = 4)
	price_tag = 200
	var/caliber = CAL_PISTOL
	var/refence_for_legal = "baseline"

/obj/item/part/gun/barrel/pistol
	name = ".35 pistol barrel"
	desc = "A gun barrel, which keeps the bullet going in the right direction. Chambered for .35."
	icon_state = "barrel_.35"
	price_tag = 100
	caliber = CAL_PISTOL
	refence_for_legal = "pistol"

/obj/item/part/gun/barrel/magnum
	name = ".40 pistol barrel"
	desc = "A gun barrel, which keeps the bullet going in the right direction. Chambered for .40."
	icon_state = "barrel_10mm"
	price_tag = 125
	caliber = CAL_MAGNUM
	refence_for_legal = "magnum"

/obj/item/part/gun/barrel/kurz
	name = ".50 Kurz pistol barrel"
	desc = "A gun barrel, which keeps the bullet going in the right direction. Chambered for .50 Kurz."
	icon_state = "barrel_12mm"
	price_tag = 150
	caliber = CAL_50
	refence_for_legal = "kurz"

/obj/item/part/gun/barrel/srifle
	name = ".257 carbine barrel"
	desc = "A gun barrel, which keeps the bullet going in the right direction. Chambered for .257 carbine."
	icon_state = "barrel_carbine"
	matter = list(MATERIAL_PLASTEEL = 8)
	caliber = CAL_LRIFLE
	refence_for_legal = "srifle"

/obj/item/part/gun/barrel/clrifle
	name = "10x24mm caseless barrel"
	desc = "A gun barrel, which keeps the bullet going in the right direction. Chambered for 10x24mm caseless."
	icon_state = "barrel_caseless"
	matter = list(MATERIAL_PLASTEEL = 8)
	caliber = "10x24"
	refence_for_legal = "clrifle"

/obj/item/part/gun/barrel/lrifle
	name = "7.5mm rifle barrel"
	desc = "A gun barrel, which keeps the bullet going in the right direction. Chambered for 7.5mm rifle."
	icon_state = "barrel_rifle"
	matter = list(MATERIAL_PLASTEEL = 8)
	caliber = CAL_RIFLE
	refence_for_legal = "lrifle"

/obj/item/part/gun/barrel/hrifle
	name = ".408 heavy rifle barrel"
	desc = "A gun barrel, which keeps the bullet going in the right direction. Chambered for .408 heavy rifle."
	icon_state = "barrel_heavy"
	matter = list(MATERIAL_PLASTEEL = 10)
	caliber = CAL_HRIFLE
	refence_for_legal = "hrifle"

/obj/item/part/gun/barrel/shotgun
	name = "shotgun barrel"
	desc = "A gun barrel, which keeps the bullet (or bullets) going in the right direction. Chambered for 20mm cartridges."
	icon_state = "barrel_shotgun"
	matter = list(MATERIAL_PLASTEEL = 8)
	caliber = CAL_SHOTGUN
	refence_for_legal = "shotgun"

/obj/item/part/gun/barrel/antim
	name = ".60-06 AMR barrel"
	desc = "A gun barrel, which keeps the bullet going in the right direction. Chambered in .60-06 AMR."
	icon_state = "barrel_amr"
	matter = list(MATERIAL_PLASTEEL = 16)
	caliber = CAL_ANTIM
	refence_for_legal = "antim"

// steel barrels
/obj/item/part/gun/barrel/pistol/steel
	name = "cheap .35 barrel"
	desc = "A gun barrel, which keeps the bullet going in the right direction. Chambered for .35. \
			This one does not look as high quality."
	matter = list(MATERIAL_STEEL = 2)

/obj/item/part/gun/barrel/magnum/steel
	name = "cheap .40 barrel"
	desc = "A gun barrel, which keeps the bullet going in the right direction. Chambered for .40. \
			This one does not look as high quality."
	matter = list(MATERIAL_STEEL = 2)

/obj/item/part/gun/barrel/kurz/steel
	name = "cheap .50 Kurz barrel"
	desc = "A gun barrel, which keeps the bullet going in the right direction. Chambered for .50 Kurz. \
			This one does not look as high quality."
	matter = list(MATERIAL_STEEL = 5)

/obj/item/part/gun/barrel/srifle/steel
	name = "cheap .257 barrel"
	desc = "A gun barrel, which keeps the bullet going in the right direction. Chambered for .257 carbine. \
			 This one does not look as high quality."
	matter = list(MATERIAL_STEEL = 5)

/obj/item/part/gun/barrel/clrifle/steel
	name = "cheap caseless barrel"
	desc = "A gun barrel, which keeps the bullet going in the right direction. Chambered for 10x24mm caseless. \
			This one does not look as high quality."
	matter = list(MATERIAL_STEEL = 5)

/obj/item/part/gun/barrel/lrifle/steel
	name = "cheap 7.5 barrel"
	desc = "A gun barrel, which keeps the bullet going in the right direction. Chambered for 7.5mm rifle. \
			This one does not look as high quality."
	matter = list(MATERIAL_STEEL = 5)

/obj/item/part/gun/barrel/hrifle/steel
	name = "cheap .408 heavy rifle barrel"
	desc = "A gun barrel, which keeps the bullet going in the right direction. Chambered for 8.6mm heavy rifle. \
			This one does not look as high quality."
	icon_state = "barrel_heavy"
	matter = list(MATERIAL_STEEL = 14)

/obj/item/part/gun/barrel/shotgun/steel
	name = "cheap shotgun barrel"
	desc = "A gun barrel, which keeps the bullet (or bullets) going in the right direction. Chambered for 20mm cartridges. \
			This one does not look as high quality."
	matter = list(MATERIAL_STEEL = 2)
