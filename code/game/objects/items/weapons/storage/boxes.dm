/*
 *	Everything derived from the common cardboard box.
 *	Basically everything except the original is a kit (starts full).
 *
 *	Contains:
 *		Empty box, starter boxes (survival/engineer),
 *		Latex glove and sterile mask boxes,
 *		Syringe, beaker, dna injector boxes,
 *		Blanks, flashbangs, and EMP grenade boxes,
 *		Tracking and chemical implant boxes,
 *		Prescription glasses and drinking glass boxes,
 *		Condiment bottle and silly cup boxes,
 *		Donkpocket and monkeycube boxes,
 *		ID and security PDA cart boxes,
 *		Handcuff, mousetrap, and pillbottle boxes,
 *		Snap-pops and matchboxes,
 *		Replacement light boxes,
 *		Blackshield uniform boxes.
 *
 *		For syndicate call-ins see uplink_kits.dm
 */

/obj/item/storage/box
	name = "box"
	desc = "It's just an ordinary box."
	icon = 'icons/obj/storage/boxes.dmi'
	icon_state = "box"
	item_state = "box"
	max_w_class = ITEM_SIZE_SMALL
	max_storage_space = DEFAULT_SMALL_STORAGE + 1
	var/foldable = /obj/item/stack/material/cardboard	//If set, can be folded (when empty) into the set object.
	var/illustration = "writing"
	contained_sprite = TRUE
	health = 20

/obj/item/storage/box/Initialize(mapload)
	. = ..()
	update_icon()

/obj/item/storage/box/update_icon()
	. = ..()
	if(illustration)
		cut_overlays()
		add_overlay(illustration)

/obj/item/storage/box/proc/damage(var/severity)
	health -= severity
	check_health()

/obj/item/storage/box/proc/check_health()
	if (health <= 0)
		spill()
		qdel(src)

/obj/item/storage/box/attack_generic(mob/user, damage, attack_message, damagetype = BRUTE, attack_flag = ARMOR_MELEE, sharp = FALSE, edge = FALSE)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN*2)
	if (istype(user, /mob/living))
		var/mob/living/L = user
		var/size_damage = L.mob_size ? L.mob_size : MOB_MINISCULE

		if (!size_damage || size_damage <= 0)
			return

		user.do_attack_animation(src)

		var/toplay = pick(list('sound/effects/creatures/nibble1.ogg','sound/effects/creatures/nibble2.ogg'))
		playsound(loc, toplay, 50, 1, 2)
		shake_animation()
		spawn(5)
			if ((health-damage) <= 0)
				L.visible_message("<span class='danger'>[L] tears open \the [src], spilling its contents everywhere!</span>", "<span class='danger'>You tear open the [src], spilling its contents everywhere!</span>")
			damage(damage)
		..()

/obj/item/storage/box/attack_self(mob/user)
	if(..()) return

	//try to fold it.
	if(contents.len)
		to_chat(user, "<span class='warning'>You can't fold this box with items still inside!</span>")
		return

	if(!ispath(src.foldable))
		return

	// Close any open UI windows first
	close_all()

	// Now make the cardboard
	to_chat(user, SPAN_NOTICE("You fold [src] flat."))
	new src.foldable(get_turf(src))
	qdel(src)

/obj/item/storage/box/survival/populate_contents()
	new /obj/item/stack/medical/bruise_pack(src)
	new /obj/item/reagent_containers/hypospray/autoinjector(src)
	new /obj/item/device/lighting/toggleable/flashlight(src)
	new /obj/item/cell/small(src)
	if(prob(50))
		new /obj/item/reagent_containers/snacks/openable/mre(src)
	else
		new /obj/item/reagent_containers/snacks/openable/mre/alt(src)

/obj/item/storage/box/survival/extended/populate_contents()
	new /obj/item/clothing/mask/breath(src)
	new /obj/item/tank/emergency_oxygen/engi(src)
	new /obj/item/reagent_containers/hypospray/autoinjector(src)
	if(prob(50))
		new /obj/item/reagent_containers/snacks/openable/mre(src)
	else
		new /obj/item/reagent_containers/snacks/openable/mre/alt(src)
	new /obj/item/stack/medical/bruise_pack(src)
	new /obj/item/device/lighting/toggleable/flashlight(src)
	new /obj/item/cell/small(src)

/obj/item/storage/box/gloves
	name = "box of latex gloves"
	desc = "Contains white gloves."
	illustration = "latex"

/obj/item/storage/box/gloves/populate_contents()
	for(var/i in 1 to 7)
		new /obj/item/clothing/gloves/latex(src)

/obj/item/storage/box/masks
	name = "box of sterile masks"
	desc = "This box contains masks of sterility."
	illustration = "sterile"

/obj/item/storage/box/masks/populate_contents()
	for(var/i in 1 to 7)
		new /obj/item/clothing/mask/surgical(src)

/obj/item/storage/box/syringes
	name = "box of syringes"
	desc = "A box full of syringes."
	illustration = "syringe"
	use_to_pickup = TRUE // So we can pick up syringes quickly

/obj/item/storage/box/syringes/empty/populate_contents()
	return

/obj/item/storage/box/syringes/populate_contents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/syringe(src)

/obj/item/storage/box/syringegun
	name = "box of syringe gun cartridges"
	desc = "A box full of compressed gas cartridges."
	illustration = "syringe"

/obj/item/storage/box/syringegun/populate_contents()
	for(var/i in 1 to 7)
		new /obj/item/syringe_cartridge(src)

/obj/item/storage/box/beakers
	name = "box of beakers"
	illustration = "beaker"

/obj/item/storage/box/beakers/populate_contents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/glass/beaker(src)

/obj/item/storage/box/bottles
	name = "box of bottles"
	illustration = "beaker"

/obj/item/storage/box/bottles/populate_contents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/glass/bottle(src)

/obj/item/storage/box/bodybags
	name = "body bags"
	desc = "This box contains a number of body bags."
	illustration = "bodybags"

/obj/item/storage/box/bodybags/empty/populate_contents()
	return

/obj/item/storage/box/bodybags/populate_contents()
	for(var/i in 1 to 7)
		new /obj/item/bodybag(src)

/obj/item/storage/box/injectors
	name = "box of DNA injectors"
	desc = "This box contains injectors it seems."

/obj/item/storage/box/injectors/populate_contents()
	new /obj/item/dnainjector/h2m(src)
	new /obj/item/dnainjector/h2m(src)
	new /obj/item/dnainjector/h2m(src)
	new /obj/item/dnainjector/m2h(src)
	new /obj/item/dnainjector/m2h(src)
	new /obj/item/dnainjector/m2h(src)

//Begining of all the stupid boxes for the biogenerator.
/obj/item/storage/box/advancedtraumakit
	name = "box of ATKs"
	desc = "A box containing five advanced trauma kits."
	w_class = ITEM_SIZE_NORMAL
	cant_hold = list(/obj/item)

/obj/item/storage/box/advancedtraumakit/populate_contents()
	for(var/i in 1 to 5)
		new /obj/item/stack/medical/bruise_pack/advanced (src)

/obj/item/storage/box/advancedburnkit
	name = "box of ABKs"
	desc = "A box containing five advanced burn kits."
	w_class = ITEM_SIZE_NORMAL
	cant_hold = list(/obj/item)

/obj/item/storage/box/advancedburnkit/populate_contents()
	for(var/i in 1 to 5)
		new /obj/item/stack/medical/ointment/advanced (src)

/obj/item/storage/box/gauzebulk
	name = "box of gauze"
	desc = "A box containing five rolls of gauze."
	w_class = ITEM_SIZE_NORMAL
	cant_hold = list(/obj/item)

/obj/item/storage/box/gauzebulk/populate_contents()
	for(var/i in 1 to 5)
		new /obj/item/stack/medical/bruise_pack (src)

/obj/item/storage/box/ointmentbulk
	name = "box of ointment"
	desc = "A box containing five bottles of ointment."
	w_class = ITEM_SIZE_NORMAL
	cant_hold = list(/obj/item)

/obj/item/storage/box/ointmentbulk/populate_contents()
	for(var/i in 1 to 5)
		new /obj/item/stack/medical/ointment (src)

/obj/item/storage/box/leatherbulk
	name = "Box of leather"
	desc = "A box containing five workable sheets of leather."
	w_class = ITEM_SIZE_NORMAL
	cant_hold = list(/obj/item)

/obj/item/storage/box/leatherbulk/populate_contents()
	for(var/i in 1 to 5)
		new /obj/item/stack/material/leather (src)

/obj/item/storage/box/clothbulk
	name = "Box of cloth"
	desc = "A box containing five bolts of cloth."
	w_class = ITEM_SIZE_NORMAL
	cant_hold = list(/obj/item)

/obj/item/storage/box/clothbulk/populate_contents()
	for(var/i in 1 to 5)
		new /obj/item/stack/material/cloth (src)

/obj/item/storage/box/carpetbulk
	name = "Box of red carpet"
	desc = "A box containing fifteen cubic meters of red carpet, tightly vacuum compresed."
	w_class = ITEM_SIZE_NORMAL
	cant_hold = list(/obj/item)

/obj/item/storage/box/carpetbulk/populate_contents()
	for(var/i in 1 to 15)
		new /obj/item/stack/tile/carpet(src)

/obj/item/storage/box/bcarpetbulk
	name = "Box of black carpet"
	desc = "A box containing fifteen cubic meters of black carpet, tightly vacuum compresed."
	w_class = ITEM_SIZE_NORMAL
	cant_hold = list(/obj/item)

/obj/item/storage/box/bcarpetbulk/populate_contents()
	for(var/i in 1 to 15)
		new /obj/item/stack/tile/carpet/bcarpet(src)

/obj/item/storage/box/bluecarpetbulk
	name = "Box of blue carpet"
	desc = "A box containing fifteen cubic meters of blue carpet, tightly vacuum compresed."
	w_class = ITEM_SIZE_NORMAL
	cant_hold = list(/obj/item)

/obj/item/storage/box/bluecarpetbulk/populate_contents()
	for(var/i in 1 to 15)
		new /obj/item/stack/tile/carpet/blucarpet(src)

/obj/item/storage/box/turcarpetbulk
	name = "Box of turqoise carpet"
	desc = "A box containing fifteen cubic meters of turqoise carpet, tightly vacuum compresed."
	w_class = ITEM_SIZE_NORMAL
	cant_hold = list(/obj/item)

/obj/item/storage/box/turcarpetbulk/populate_contents()
	for(var/i in 1 to 15)
		new /obj/item/stack/tile/carpet/turcarpet(src)

/obj/item/storage/box/sbluecarpetbulk
	name = "Box of silver carpet"
	desc = "A box containing fifteen cubic meters of silver carpet, tightly vacuum compresed."
	w_class = ITEM_SIZE_NORMAL
	cant_hold = list(/obj/item)

/obj/item/storage/box/sbluecarpetbulk/populate_contents()
	for(var/i in 1 to 15)
		new /obj/item/stack/tile/carpet/sblucarpet(src)

/obj/item/storage/box/purcarpetbulk
	name = "Box of purple carpet"
	desc = "A box containing fifteen cubic meters of purple carpet, tightly vacuum compresed."
	w_class = ITEM_SIZE_NORMAL
	cant_hold = list(/obj/item)

/obj/item/storage/box/purcarpetbulk/populate_contents()
	for(var/i in 1 to 15)
		new /obj/item/stack/tile/carpet/purcarpet(src)

/obj/item/storage/box/oracarpetbulk
	name = "Box of orange carpet"
	desc = "A box containing fifteen cubic meters of orange carpet, tightly vacuum compresed."
	w_class = ITEM_SIZE_NORMAL
	cant_hold = list(/obj/item)

/obj/item/storage/box/oracarpetbulk/populate_contents()
	for(var/i in 1 to 15)
		new /obj/item/stack/tile/carpet/oracarpet(src)

/obj/item/storage/box/cardboardbulk
	name = "Box of cardboard"
	desc = "A box containing five tightly packed flats of cardboard. "
	w_class = ITEM_SIZE_NORMAL
	cant_hold = list(/obj/item)

/obj/item/storage/box/cardboardbulk/populate_contents()
	for(var/i in 1 to 5)
		new /obj/item/stack/material/cardboard(src)

//End of hydro boxes

/obj/item/storage/box/flashbangs
	name = "box of flashbangs"
	desc = "A box containing seven antipersonnel flashbang grenades.<br> WARNING: These devices are extremely dangerous and can cause blindness or deafness in repeated use."
	icon_state = "box_security"
	illustration = "flashbang"

/obj/item/storage/box/flashbangs/populate_contents()
	for(var/i in 1 to 7)
		new /obj/item/grenade/flashbang(src)

/obj/item/storage/box/teargas
	name = "box of pepper spray grenades"
	desc = "A box containing six tear gas grenades. A gas mask is printed on the label.<br> WARNING: Exposure carries risk of serious injury or death. Keep away from persons with lung conditions."
	icon_state = "box_security"
	illustration = "gas"

/obj/item/storage/box/teargas/populate_contents()
	for(var/i in 1 to 6)
		new /obj/item/grenade/chem_grenade/teargas(src)

/obj/item/storage/box/emps
	name = "box of EMP grenades"
	desc = "A box containing five military grade EMP grenades.<br> WARNING: Do not use near unshielded electronics or biomechanical augmentations, death or permanent paralysis may occur."
	icon_state = "box_security"
	illustration = "flashbang"

/obj/item/storage/box/emps/populate_contents()
	for(var/i in 1 to 5)
		new /obj/item/grenade/empgrenade(src)

/obj/item/storage/box/frag
	name = "box of fragmentation grenades"
	desc = "A box containing four fragmentation grenades. Designed for use on enemies in the open."
	icon_state = "box_security"
	illustration = "frag"

/obj/item/storage/box/frag/populate_contents()
	for(var/i in 1 to 4)
		new /obj/item/grenade/frag(src)

/obj/item/storage/box/incendiary
	name = "box of incendiary grenades"
	desc = "A box containing five incendiary grenades."
	icon_state = "box_security"
	illustration = "flashbang"

/obj/item/storage/box/incendiary/populate_contents()
	for(var/i in 1 to 5)
		new /obj/item/grenade/chem_grenade/incendiary(src)

/obj/item/storage/box/explosive
	name = "box of blast grenades"
	desc = "A box containing four blast grenades. Designed for assaulting strongpoints."
	icon_state = "box_security"
	illustration = "blast"

/obj/item/storage/box/explosive/populate_contents()
	for(var/i in 1 to 4)
		new /obj/item/grenade/explosive(src)


/obj/item/storage/box/smokes
	name = "box of smoke bombs"
	desc = "A box containing five smoke bombs."
	illustration = "flashbang"

/obj/item/storage/box/smokes/populate_contents()
	for(var/i in 1 to 5)
		new /obj/item/grenade/smokebomb(src)

/obj/item/storage/box/phosphorous
	name = "box of white phosphorous grenades"
	desc = "A box containing 7 antipersonnel incendiary  grenades.<br> WARNING: These devices are extremely dangerous and can cause severe burns and fires."
	icon_state = "box_security"
	illustration = "flashbang"

/obj/item/storage/box/phosphorous/populate_contents()
	for(var/i in 1 to 5)
		new /obj/item/grenade/frag/white_phosphorous(src)

/obj/item/storage/box/anti_photons
	name = "box of anti-photon grenades"
	desc = "A box containing five experimental photon disruption grenades."
	illustration = "flashbang"

/obj/item/storage/box/anti_photons/populate_contents()
	for(var/i in 1 to 5)
		new /obj/item/grenade/anti_photon(src)

/obj/item/storage/box/baton_rounds
	name = "box of baton rounds"
	desc = "A box containing six baton rounds. Designed to be fired from a grenade launcher."
	illustration = "flashbang"

/obj/item/storage/box/baton_rounds/populate_contents()
	for(var/i in 1 to 6)
		new  /obj/item/ammo_casing/grenade(src)

/obj/item/storage/box/flash_grenade_shells
	name = "box of flash grenade shells"
	desc = "A box containing six flash grenade shells. Designed to be fired from a grenade launcher."
	illustration = "flashbag"

/obj/item/storage/box/flash_grenade_shells/populate_contents()
	for(var/i in 1 to 6)
		new  /obj/item/ammo_casing/grenade/flash(src)

/obj/item/storage/box/emp_grenade_shells
	name = "box of EMP grenade shells"
	desc = "A box containing six EMP grenade shells. Designed to be fired from a grenade launcher."
	illustration = "flashbang"

/obj/item/storage/box/emp_grenade_shells/populate_contents()
	for(var/i in 1 to 6)
		new  /obj/item/ammo_casing/grenade/emp(src)

/obj/item/storage/box/frag_grenade_shells
	name = "box of frag grenade shells"
	desc = "A box containing six frag grenade shells. Designed to be fired from a grenade launcher."
	illustration = "flashbang"

/obj/item/storage/box/frag_grenade_shells/populate_contents()
	for(var/i in 1 to 6)
		new  /obj/item/ammo_casing/grenade/frag(src)

/obj/item/storage/box/blast_grenade_shells
	name = "box of blast grenade shells"
	desc = "A box containing six blast grenade shells. Designed to be fired from a grenade launcher."
	illustration = "flashbang"

/obj/item/storage/box/blast_grenade_shells/populate_contents()
	for(var/i in 1 to 6)
		new  /obj/item/ammo_casing/grenade/blast(src)

/obj/item/storage/box/trackimp
	name = "boxed tracking implant kit"
	desc = "Box full of tracking utensils."
	illustration = "implant"

/obj/item/storage/box/trackimp/populate_contents()
	new /obj/item/implantcase/tracking(src)
	new /obj/item/implantcase/tracking(src)
	new /obj/item/implantcase/tracking(src)
	new /obj/item/implantcase/tracking(src)
	new /obj/item/implanter(src)
	new /obj/item/implantpad(src)
	new /obj/item/locator(src)

/obj/item/storage/box/chemimp
	name = "boxed chemical implant kit"
	desc = "Box of stuff used to implant chemicals."
	illustration = "implant"

/obj/item/storage/box/chemimp/populate_contents()
	new /obj/item/implantcase/chem(src)
	new /obj/item/implantcase/chem(src)
	new /obj/item/implantcase/chem(src)
	new /obj/item/implantcase/chem(src)
	new /obj/item/implantcase/chem(src)
	new /obj/item/implanter(src)
	new /obj/item/implantpad(src)



/obj/item/storage/box/rxglasses
	name = "box of prescription glasses"
	desc = "This box contains nerd glasses."
	illustration = "glasses"

/obj/item/storage/box/rxglasses/populate_contents()
	for(var/i in 1 to 7)
		new /obj/item/clothing/glasses/regular(src)

/obj/item/storage/box/drinkingglasses
	name = "box of drinking glasses"
	desc = "It has a picture of drinking glasses on it."

/obj/item/storage/box/drinkingglasses/populate_contents()
	for(var/i in 1 to 6)
		new /obj/item/reagent_containers/drinks/drinkingglass(src)

/obj/item/storage/box/cdeathalarm_kit
	name = "death alarm kit"
	desc = "Box of stuff used to implant death alarms."
	illustration = "implant"
	item_state = "syringe_kit"

/obj/item/storage/box/cdeathalarm_kit/populate_contents()
	new /obj/item/implanter(src)
	new /obj/item/implantcase/death_alarm(src)
	new /obj/item/implantcase/death_alarm(src)
	new /obj/item/implantcase/death_alarm(src)
	new /obj/item/implantcase/death_alarm(src)
	new /obj/item/implantcase/death_alarm(src)
	new /obj/item/implantcase/death_alarm(src)

/obj/item/storage/box/flares
	name = "box of flares"
	desc = "Box that contains some flares."
	icon_state = "box"
	illustration = "flare"

	New()
		..()
		new /obj/item/device/lighting/glowstick/flare(src)
		new /obj/item/device/lighting/glowstick/flare(src)
		new /obj/item/device/lighting/glowstick/flare(src)
		new /obj/item/device/lighting/glowstick/flare(src)
		new /obj/item/device/lighting/glowstick/flare(src)
		new /obj/item/device/lighting/glowstick/flare(src)
		new /obj/item/device/lighting/glowstick/flare(src)

/obj/item/storage/box/condimentbottles
	name = "box of condiment bottles"
	desc = "It has a large ketchup smear on it."

/obj/item/storage/box/condimentbottles/empty/populate_contents()
	return

/obj/item/storage/box/condimentbottles/populate_contents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/condiment(src)

/obj/item/storage/box/cups
	name = "box of paper cups"
	desc = "It has pictures of paper cups on the front."

/obj/item/storage/box/cups/populate_contents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/drinks/sillycup(src)

/obj/item/storage/box/donkpockets
	name = "box of donk-pockets"
	desc = "<B>Instructions:</B> <I>Heat in microwave. Product will cool if not eaten within seven minutes.</I>"
	icon_state = "box_donk_pocket"
	illustration = null

/obj/item/storage/box/donkpockets/populate_contents()
	for(var/i in 1 to 6)
		new /obj/item/reagent_containers/snacks/donkpocket(src)

/obj/item/storage/box/sinpockets
	name = "box of sin-pockets"
	desc = "<B>Instructions:</B> <I>Crush bottom of package to initiate chemical heating. Wait for 20 seconds before consumption. Product will cool if not eaten within seven minutes.</I>"
	icon_state = "box_donk_pocket"
	illustration = null

/obj/item/storage/box/sinpockets/populate_contents()
	for(var/i in 1 to 6)
		new /obj/item/reagent_containers/snacks/donkpocket/sinpocket(src)

/obj/item/storage/box/monkeycubes
	name = "monkey cube box"
	desc = "Drymate brand monkey cubes. Just add water!"
	icon = 'icons/obj/food.dmi'
	icon_state = "monkeycubebox"
	illustration = null
	can_hold = list(/obj/item/reagent_containers/snacks/monkeycube)

/obj/item/storage/box/monkeycubes/populate_contents()
	for(var/i in 1 to 5)
		new /obj/item/reagent_containers/snacks/monkeycube/wrapped(src)

/obj/item/storage/box/ids
	name = "box of spare IDs"
	desc = "Has so many empty IDs."
	icon_state = "box_id"
	illustration = null

/obj/item/storage/box/ids/populate_contents()
	for(var/i in 1 to 7)
		new /obj/item/card/id(src)

/obj/item/storage/box/handcuffs
	name = "box of spare handcuffs"
	desc = "A box full of handcuffs."
	icon_state = "box_security"
	illustration = "handcuff"

/obj/item/storage/box/handcuffs/populate_contents()
	for(var/i in 1 to 7)
		new /obj/item/handcuffs(src)


/obj/item/storage/box/mousetraps
	name = "box of Pest-B-Gone mousetraps"
	desc = "<B><FONT color='red'>WARNING:</FONT></B> <I>Keep out of reach of children</I>."
	illustration = "mousetraps"

/obj/item/storage/box/mousetraps/populate_contents()
	for(var/i in 1 to 7)
		new /obj/item/device/assembly/mousetrap(src)

/obj/item/storage/box/pillbottles
	name = "box of pill bottles"
	desc = "It has pictures of pill bottles on its front."

/obj/item/storage/box/pillbottles/empty/populate_contents()
	return

/obj/item/storage/box/pillbottles/populate_contents()
	for(var/i in 1 to 7)
		new /obj/item/storage/pill_bottle(src)

/obj/item/storage/box/snappops
	name = "snap pop box"
	desc = "Eight wrappers of fun! Ages 8 and up. Not suitable for children."
	icon = 'icons/obj/toy.dmi'
	icon_state = "spbox"

/obj/item/storage/box/snappops/populate_contents()
	for(var/i in 1 to 8)
		new /obj/item/toy/junk/snappop(src)

/obj/item/storage/box/matches
	name = "matchbox"
	desc = "A small box of 'Space-Proof' premium matches."
	icon = 'icons/obj/cigarettes.dmi'
	icon_state = "matchbox"
	item_state = "zippo"
	illustration = null
	w_class = ITEM_SIZE_TINY
	slot_flags = SLOT_BELT

/obj/item/storage/box/matches/populate_contents()
	for(var/i in 1 to 14)
		new /obj/item/flame/match(src)
	make_exact_fit()

/obj/item/storage/box/matches/attackby(obj/item/flame/match/W, mob/user)
	if(istype(W) && !W.lit && !W.burnt)
		playsound(src, 'sound/items/matchstrike.ogg', 20, 1, 1)
		W.lit = 1
		W.damtype = BURN
		W.icon_state = "match_lit"
		W.tool_qualities = list(QUALITY_CAUTERIZING = 10)
		START_PROCESSING(SSobj, W)
	W.update_icon()
	return

/obj/item/storage/box/autoinjectors
	name = "box of emergency sugar injectors"
	desc = "Contains auto-injectors meant for usage in an uncontrolled borer infection."
	illustration = "syringe"

/obj/item/storage/box/autoinjectors/populate_contents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/hypospray/autoinjector/sugar(src)

/obj/item/storage/box/lights
	name = "box of replacement bulbs"
	illustration = "light"
	desc = "This box is shaped on the inside so that only light tubes and bulbs fit."
	use_to_pickup = TRUE // for picking up broken bulbs, not that most people will try

/obj/item/storage/box/lights/bulbs/populate_contents()
	for(var/i in 1 to 21)
		new /obj/item/light/bulb(src)
	make_exact_fit()

/obj/item/storage/box/lights/tubes
	name = "box of replacement tubes"
	illustration = "lighttube"

/obj/item/storage/box/lights/tubes/populate_contents()
	for(var/i in 1 to 21)
		new /obj/item/light/tube(src)
	make_exact_fit()


/obj/item/storage/box/lights/mixed
	name = "box of replacement lights"
	illustration = "lightmixed"

/obj/item/storage/box/lights/mixed/empty/populate_contents()
	return

/obj/item/storage/box/lights/mixed/populate_contents()
	for(var/i in 1 to 14)
		new /obj/item/light/tube(src)
	for(var/i in 1 to 7)
		new /obj/item/light/bulb(src)
	make_exact_fit()

/obj/item/storage/box/data_disk
	name = "data disk box"
	illustration = "disk"

/obj/item/storage/box/data_disk/populate_contents()
	for(var/i in 1 to 7)
		new /obj/item/pc_part/drive/disk(src)

/obj/item/storage/box/data_disk/basic
	name = "basic data disk box"
	illustration = "disk"

/obj/item/storage/box/data_disk/basic/populate_contents()
	for(var/i in 1 to 7)
		new /obj/item/pc_part/drive/disk/basic(src)

/obj/item/storage/box/data_disk/basic/empty/populate_contents()
	return

/*
Boxes with clothing on them, unable to put them back if taken out because...
...well, boxes can't normally fit clothes on them!
*/

/obj/item/storage/box/trooperuniform
	name = "Trooper/Corpsman Service and Dress Kit"
	desc = "Box that contained a bluespace sealed Blackshield Service Uniform and Dress Uniform. Once items are removed, they won't fit again."
	icon_state = "box"

	New()
		..()
		new /obj/item/clothing/under/rank/trooper/service(src)
		new /obj/item/clothing/suit/rank/trooper/service(src)
		new /obj/item/clothing/suit/rank/trooper/dress(src)
		new /obj/item/clothing/head/rank/trooperdress(src)
		new /obj/item/clothing/accessory/tie/navy(src)
		new /obj/item/clothing/shoes/laceup(src)
		new /obj/item/clothing/accessory/armband/militia(src)
		new /obj/item/clothing/accessory/armband/corpsman(src)

/obj/item/storage/box/sergeantuniform
	name = "Sergeant Service and Dress Kit"
	desc = "Box that contained a bluespace sealed Blackshield Service Uniform and Dress Uniform. Once items are removed, they won't fit again."
	icon_state = "box"

	New()
		..()
		new /obj/item/clothing/under/rank/armorer/service(src)
		new /obj/item/clothing/suit/rank/armorer/service(src)
		new /obj/item/clothing/suit/rank/armorer/dress(src)
		new /obj/item/clothing/head/rank/trooperdress(src)
		new /obj/item/clothing/accessory/tie/navy(src)
		new /obj/item/clothing/shoes/laceup(src)

/obj/item/storage/box/commanderuniform
	name = "Commander Service and Dress Kit"
	desc = "Box that contained a bluespace sealed Blackshield Service Uniform and Dress Uniform. Once items are removed, they won't fit again."
	icon_state = "box"

	New()
		..()
		new /obj/item/clothing/under/rank/commander_service(src)
		new /obj/item/clothing/suit/rank/commander_service(src)
		new /obj/item/clothing/head/rank/commanderdress(src)
		new /obj/item/clothing/accessory/tie/navy(src)
		new /obj/item/clothing/shoes/laceup(src)

/obj/item/storage/box/blankranks
	name = "Box of Blank Ranks"
	desc = "A box full of solid red, ''blank'' Blackshield ranks, for distribution to volunteers and cadets."
	icon_state = "box"

	New()
		..()
		new /obj/item/clothing/accessory/ranks/blank(src)
		new /obj/item/clothing/accessory/ranks/blank(src)
		new /obj/item/clothing/accessory/ranks/blank(src)
		new /obj/item/clothing/accessory/ranks/blank(src)
		new /obj/item/clothing/accessory/ranks/blank(src)
		new /obj/item/clothing/accessory/ranks/blank(src)
		new /obj/item/clothing/accessory/ranks/blank(src)

/obj/item/storage/box/team_support
	name = "Box of Team Support"
	desc = "A box filled with everything needed to support the team, flag not included."
	icon_state = "box"

	New()
		..()
		new /obj/item/reagent_containers/snacks/popcorn(src)
		new /obj/item/toy/junk/bosunwhistle(src)
		new /obj/random/toy/plushie_onlysquid(src)
		new /obj/item/device/binoculars(src)


// Guild boxes, exclusively used to mass craft guild parts.
/obj/item/storage/box/guild_manip
	name = "box of forged manipulators"
	desc = "A box containing four forged manipulators, the best that Nadezhda can produce."
	icon_state = "box_of_doom"
	illustration = "guild"

/obj/item/storage/box/guild_manip/populate_contents()
	for(var/i in 1 to 4)
		new /obj/item/stock_parts/manipulator/handmade(src)

/obj/item/storage/box/guild_bin
	name = "box of cast matter bins"
	desc = "A box containing four cast matter bins, the best that Nadezhda can produce."
	icon_state = "box_of_doom"
	illustration = "guild"

/obj/item/storage/box/guild_bin/populate_contents()
	for(var/i in 1 to 4)
		new /obj/item/stock_parts/matter_bin/handmade(src)

/obj/item/storage/box/guild_laser
	name = "box of perfected micro-lasers"
	desc = "A box containing four perfected micro-lasers, the best that Nadezhda can produce."
	icon_state = "box_of_doom"
	illustration = "guild"

/obj/item/storage/box/guild_laser/populate_contents()
	for(var/i in 1 to 4)
		new /obj/item/stock_parts/micro_laser/handmade(src)

/obj/item/storage/box/guild_scanner
	name = "box of perfected scanning modules"
	desc = "A box containing four perfected scanning modules, the best that Nadezhda can produce."
	icon_state = "box_of_doom"
	illustration = "guild"

/obj/item/storage/box/guild_scanner/populate_contents()
	for(var/i in 1 to 4)
		new /obj/item/stock_parts/scanning_module/handmade(src)

/obj/item/storage/box/guild_capacitor
	name = "box of ultra capacitors"
	desc = "A box containing four ultra capacitors, the best that Nadezhda can produce."
	icon_state = "box_of_doom"
	illustration = "guild"

/obj/item/storage/box/guild_capacitor/populate_contents()
	for(var/i in 1 to 4)
		new /obj/item/stock_parts/capacitor/handmade(src)


/obj/item/storage/box/njoy
	name = "mix Njoy packet"
	desc = "Packet full of red njoy pills."
	illustration = null
	icon_state = "packet_njoy_mix"
	item_state = "packet_njoy_mix"

/obj/item/storage/box/njoy/red/New()
	. = ..()

/obj/item/storage/box/njoy/red/populate_contents()
	new /obj/item/storage/pill_bottle/njoy/red(src)
	new /obj/item/storage/pill_bottle/njoy/blue(src)
	new /obj/item/storage/pill_bottle/njoy/green(src)


/obj/item/storage/box/njoy/red
	name = "red Njoy packet"
	desc = "Packet full of red njoy pills."
	illustration = null
	icon_state = "packet_njoy_red"
	item_state = "packet_njoy_red"

/obj/item/storage/box/njoy/red/New()
	. = ..()

/obj/item/storage/box/njoy/red/populate_contents()
	for(var/i in 1 to 3)
		new /obj/item/storage/pill_bottle/njoy/red(src)


/obj/item/storage/box/njoy/blue
	name = "blue Njoy packet"
	desc = "Packet full of blue njoy pills."
	illustration = null
	icon_state = "packet_njoy_blue"
	item_state = "packet_njoy_blue"

/obj/item/storage/box/njoy/blue/New()
	. = ..()

/obj/item/storage/box/njoy/blue/populate_contents()
	for(var/i in 1 to 3)
		new /obj/item/storage/pill_bottle/njoy/blue(src)


/obj/item/storage/box/njoy/green
	name = "green Njoy packet"
	desc = "Packet full of green njoy pills."
	illustration = null
	icon_state = "packet_njoy_green"
	item_state = "packet_njoy_green"

/obj/item/storage/box/njoy/green/New()
	. = ..()

/obj/item/storage/box/njoy/green/populate_contents()
	for(var/i in 1 to 3)
		new /obj/item/storage/pill_bottle/njoy/green(src)

/obj/item/storage/box/headsets
	name = "spare headsets box"
	desc = "A box full of unkeyed headsets for new colonists."
	illustration = "headset"

/obj/item/storage/box/headsets/populate_contents()
	new /obj/item/device/radio/headset(src)
	new /obj/item/device/radio/headset(src)
	new /obj/item/device/radio/headset(src)
	new /obj/item/device/radio/headset(src)
	new /obj/item/device/radio/headset(src)
	new /obj/item/device/radio/headset(src)
	new /obj/item/device/radio/headset(src)
	new /obj/item/device/radio/headset(src)

/obj/item/storage/box/ccstamps
	name = "official stamps box"
	desc = "A box full of assorted stamps from various high ranking officials in the lower colony. What're these all doing together?"
	illustration = "stamps"

/obj/item/storage/box/ccstamps/populate_contents()
	new /obj/item/stamp/cc(src)
	new /obj/item/stamp/cc/nm(src)
	new /obj/item/stamp/cc/bs(src)
	new /obj/item/stamp/cc/chunch(src)
	new /obj/item/stamp/cc/prosp(src)
	new /obj/item/stamp/cc/si(src)
	new /obj/item/stamp/cc/ls(src)
	new /obj/item/stamp/cc/guilg(src)
