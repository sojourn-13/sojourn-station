/obj/item/storage/box/syndicate/populate_contents()
	switch (pickweight(list("bloodyspai" = 1, "stealth" = 1, "screwed" = 1, "guns" = 1, "murder" = 1, "freedom" = 1, "hacker" = 1, /*"lordsingulo" = 1,*/ "smoothoperator" = 1)))
		if("bloodyspai")
			new /obj/item/clothing/under/chameleon(src)
			new /obj/item/clothing/mask/chameleon/voice(src)
			new /obj/item/card/id/syndicate(src)
			new /obj/item/clothing/shoes/syndigaloshes(src)
			return

		if("stealth")
			new /obj/item/gun/energy/crossbow(src)
			new /obj/item/pen/reagent/paralysis(src)
			new /obj/item/device/chameleon(src)
			return

		if("screwed")
			new /obj/effect/spawner/newbomb/timer/syndicate(src)
			new /obj/effect/spawner/newbomb/timer/syndicate(src)
			new /obj/item/device/powersink(src)
			new /obj/item/clothing/suit/space/syndicate(src)
			new /obj/item/clothing/head/helmet/space/syndicate(src)
			new /obj/item/clothing/mask/gas/tactical(src)
			new /obj/item/tank/emergency_oxygen/double(src)
			return

		if("guns")
			new /obj/item/gun/projectile/revolver(src)
			new /obj/item/ammo_magazine/speed_loader_magnum_40(src)
			new /obj/item/card/emag(src)
			new /obj/item/plastique(src)
			new /obj/item/plastique(src)
			return

		if("murder")
			new /obj/item/melee/energy/sword(src)
			new /obj/item/clothing/glasses/powered/thermal/syndi(src)
			new /obj/item/card/emag(src)
			new /obj/item/clothing/shoes/syndigaloshes(src)
			return

		if("freedom")
			var/obj/item/implanter/O = new /obj/item/implanter(src)
			O.implant = new /obj/item/implant/freedom(O)
			var/obj/item/implanter/U = new /obj/item/implanter(src)
			U.implant = new /obj/item/implant/uplink(U)
			return

		if("hacker")
			new /obj/item/device/encryptionkey/syndicate(src)
			new /obj/item/aiModule/syndicate(src)
			new /obj/item/card/emag(src)
			new /obj/item/device/encryptionkey/binary(src)
			return

/*			if("lordsingulo")
			new /obj/item/device/radio/beacon/syndicate(src)
			new /obj/item/clothing/suit/space/syndicate(src)
			new /obj/item/clothing/head/helmet/space/syndicate(src)
			new /obj/item/clothing/mask/gas/syndicate(src)
			new /obj/item/tank/emergency_oxygen/double(src)
			new /obj/item/card/emag(src)
			return
*/

		if("smoothoperator")
			new /obj/item/storage/box/syndie_kit/pistol(src)
			new /obj/item/storage/bag/trash(src)
			new /obj/item/soap/syndie(src)
			new /obj/item/bodybag(src)
			new /obj/item/clothing/shoes/reinforced(src)
			return

/obj/item/storage/box/syndie_kit
	name = "box"
	desc = "A sleek, sturdy box. This one is using state of the art folding to hold more inside!"
	max_storage_space = DEFAULT_NORMAL_STORAGE //bigger so they hold their gear!
	icon_state = "box_of_doom"
	illustration = "writing_of_doom"

/obj/item/storage/box/syndie_kit/imp_freedom
	name = "boxed freedom implant (with injector)"
	desc = "A box with freedom implant inside. Install it in your hand or leg, chose emote. You can remove instantly handcuffs or leg cuffs with your emotion. Have a small amount of uses."

/obj/item/storage/box/syndie_kit/imp_freedom/populate_contents()
	new /obj/item/implanter/freedom(src)

/obj/item/storage/box/syndie_kit/imp_compress
	name = "box (C)"
	desc = "A box with compressed implanter inside. Choose an item with this implant, install it inside you and choose emote to activate it. Take your chosen item whenever you want by your chosen emotion. One use."

/obj/item/storage/box/syndie_kit/imp_compress/populate_contents()
	new /obj/item/implanter/compressed(src)

/obj/item/storage/box/syndie_kit/imp_explosive
	name = "box (E)"
	desc = "A box with explosive implant inside. When you use it on yours enemy, you can choose three ways to use it: destroy limb, destroy your enemy or make a small explosion. Activation by phrase you choose too. One use."

/obj/item/storage/box/syndie_kit/imp_explosive/populate_contents()
	new /obj/item/implanter/explosive(src)

/obj/item/storage/box/syndie_kit/imp_spying
	name = "box (S)"
	desc = "A box with spying implanter inside. Implant your contract target with it and wait 1 minute for the confirmation."

/obj/item/storage/box/syndie_kit/imp_spying/populate_contents()
	new /obj/item/implanter/spying(src)

/obj/item/storage/box/syndie_kit/imp_uplink
	name = "boxed uplink implant (with injector)"
	desc = "Uplink inside your head."

/obj/item/storage/box/syndie_kit/imp_uplink/populate_contents()
	//Turn off passive gain for boxed implant uplinks. To prevent exploits of gathering tons of free TC
	var/obj/item/implanter/uplink/U1 = new /obj/item/implanter/uplink(src)
	var/obj/item/implant/uplink/U2 = locate(/obj/item/implant/uplink) in U1
	var/obj/item/device/uplink/hidden/U3 = locate(/obj/item/device/uplink/hidden) in U2
	U3.passive_gain = 0

/obj/item/storage/box/syndie_kit/space
	name = "boxed voidsuit"

/obj/item/storage/box/syndie_kit/space/populate_contents()
	new /obj/item/clothing/suit/space/void/merc/boxed(src)
	new /obj/item/clothing/mask/gas/tactical(src)

/obj/item/storage/box/syndie_kit/chameleon
	name = "chameleon kit"
	desc = "Comes with all the clothes you need to impersonate most people. Acting lessons sold seperately. Wearing the uniform will allow fot quick switching between appearances."

/obj/item/storage/box/syndie_kit/chameleon/populate_contents()
	new /obj/item/clothing/under/chameleon(src)
	new /obj/item/clothing/head/chameleon(src)
	new /obj/item/clothing/suit/chameleon(src)
	new /obj/item/clothing/shoes/chameleon(src)
	new /obj/item/storage/backpack/chameleon(src)
	new /obj/item/clothing/gloves/chameleon(src)
	new /obj/item/clothing/mask/chameleon(src)
	new /obj/item/clothing/glasses/chameleon(src)
	new /obj/item/device/radio/headset/chameleon(src)
	new /obj/item/gun/energy/chameleon(src)
	new /obj/item/clothing/accessory/chameleon(src)

/obj/item/storage/box/syndie_kit/clerical
	name = "clerical kit"
	desc = "Comes with all you need to fake paperwork. Assumes you have passed basic writing lessons."

/obj/item/storage/box/syndie_kit/clerical/populate_contents()
	new /obj/item/stamp/chameleon(src)
	new /obj/item/pen/chameleon(src)
	new /obj/item/device/destTagger(src)
	new /obj/item/packageWrap(src)
	new /obj/item/hand_labeler(src)

/obj/item/storage/box/syndie_kit/spy
	name = "spy kit"
	desc = "For when you want to conduct voyeurism from afar."

/obj/item/storage/box/syndie_kit/spy/populate_contents()
	new /obj/item/device/spy_bug(src)
	new /obj/item/device/spy_bug(src)
	new /obj/item/device/spy_bug(src)
	new /obj/item/device/spy_bug(src)
	new /obj/item/device/spy_bug(src)
	new /obj/item/device/spy_bug(src)
	new /obj/item/device/spy_monitor(src)

/obj/item/storage/box/syndie_kit/dartgun
	name = "dart gun kit"
	desc = "Just like a mosquito bite."

/obj/item/storage/box/syndie_kit/dartgun/populate_contents()
	new /obj/item/gun/projectile/dartgun(src)
	new /obj/item/ammo_magazine/chemdart(src)

/obj/item/storage/box/syndie_kit/pistol
	name = "\improper smooth operator kit"
	desc = ".40 suppressed handgun and its kit."

/obj/item/storage/box/syndie_kit/pistol/populate_contents()
	new /obj/item/gun/projectile/silenced(src)
	new /obj/item/ammo_magazine/magnum_40/hv(src)
	new /obj/item/ammo_magazine/magnum_40/hv(src)
	new /obj/item/clothing/glasses/sunglasses(src)
	new /obj/item/clothing/mask/balaclava(src)


/obj/item/storage/box/syndie_kit/hpistol
	name = "\improper gunfighter kit"
	desc = ".50 Kurz suppressed handgun and its kit."

/obj/item/storage/box/syndie_kit/hpistol/populate_contents()
	new /obj/item/gun/projectile/lamia/socom(src)
	new /obj/item/ammo_magazine/kurz_50/hv(src)
	new /obj/item/ammo_magazine/kurz_50/hv(src)
	new /obj/item/clothing/glasses/sunglasses(src)
	new /obj/item/clothing/mask/balaclava(src)

/obj/item/storage/box/syndie_kit/painrevolver
	name = "\improper vigilante revolver kit"
	desc = ".50 Kurz revolver and its kit."

/obj/item/storage/box/syndie_kit/painrevolver/populate_contents()
	new /obj/item/gun/projectile/revolver/hornet(src)
	new /obj/item/ammo_magazine/speed_loader_kurz_50/rubber(src)
	new /obj/item/ammo_magazine/speed_loader_kurz_50/lethal(src)
	new /obj/item/ammo_magazine/speed_loader_kurz_50/highvelocity(src)
	new /obj/item/clothing/glasses/sunglasses(src)
	new /obj/item/clothing/mask/balaclava(src)

/obj/item/storage/box/syndie_kit/c20r
	name = "C-20r box"
	desc = "C-20r kit"

/obj/item/storage/box/syndie_kit/c20r/populate_contents()
	new /obj/item/gun/projectile/automatic/c20r(src)
	new /obj/item/ammo_magazine/smg_35(src)

/obj/item/storage/box/syndie_kit/revolver
	name = "revolver box"
	desc = "Revolver kit"

/obj/item/storage/box/syndie_kit/revolver/populate_contents()
	new /obj/item/gun/projectile/revolver/mistral(src)
	new /obj/item/ammo_magazine/speed_loader_magnum_40(src)

/obj/item/storage/box/syndie_kit/sts
	name = "assault rifle box"
	desc = "Assault rifle kit"
	icon_state = "box_of_doom_big"
	w_class = ITEM_SIZE_HUGE

/obj/item/storage/box/syndie_kit/sts/populate_contents()
	new /obj/item/gun/projectile/automatic/sts/rifle(src)
	new /obj/item/ammo_magazine/rifle_75(src)
	new /obj/item/ammo_magazine/rifle_75_short(src)
	new /obj/item/clothing/suit/storage/toggle/leather/blackjacket(src)

/obj/item/storage/box/syndie_kit/pug
	name = "Pug box"
	desc = "Pug kit with one M12 buckshot mag"
	icon_state = "box_of_doom_big"
	w_class = ITEM_SIZE_HUGE

/obj/item/storage/box/syndie_kit/pug/populate_contents()
	new /obj/item/gun/projectile/shotgun/pug(src)
	new /obj/item/ammo_magazine/m12/pellet(src)

/obj/item/storage/box/syndie_kit/antimateriel_rifle
	name = "sniper rifle box"
	desc = "Sniper rifle kit. One shot for real men."
	icon_state = "box_of_doom_big"
	w_class = ITEM_SIZE_HUGE

/obj/item/storage/box/syndie_kit/antimateriel_rifle/populate_contents()
	new /obj/item/part/gun/frame/heavysniper(src)
	new /obj/item/part/gun/grip/serb(src)
	new /obj/item/part/gun/mechanism/boltgun(src)
	new /obj/item/part/gun/barrel/antim(src)

/obj/item/storage/box/syndie_kit/toxin
	name = "toxin kit"
	desc = "An apple will not be enough to keep the doctor away after this."

/obj/item/storage/box/syndie_kit/toxin/populate_contents()
	new /obj/item/reagent_containers/glass/beaker/vial/random/toxin(src)
	new /obj/item/reagent_containers/syringe(src)

/obj/item/storage/box/syndie_kit/cigarette
	name = "\improper tricky smokes"
	desc = "Comes with the following brands of cigarettes, in this order: 2xFlash, 2xSmoke, 1xAntitoxin, 1xMindBreaker, 1xTricordrazine. Avoid mixing them up."

/obj/item/storage/box/syndie_kit/cigarette/populate_contents()
	var/obj/item/storage/fancy/cigarettes/pack
//Flash
	pack = new /obj/item/storage/fancy/cigarettes(src)
	fill_cigarre_package(pack, list("aluminum" = 4, "potassium" = 4, "sulfur" = 4))
	pack.desc += " 'F' has been scribbled on it."

	pack = new /obj/item/storage/fancy/cigarettes(src)
	fill_cigarre_package(pack, list("aluminum" = 4, "potassium" = 4, "sulfur" = 4))
	pack.desc += " 'F' has been scribbled on it."
//Smoke
	pack = new /obj/item/storage/fancy/cigarettes(src)
	fill_cigarre_package(pack, list("potassium" = 4, "sugar" = 4, "phosphorus" = 4))
	pack.desc += " 'S' has been scribbled on it."

	pack = new /obj/item/storage/fancy/cigarettes(src)
	fill_cigarre_package(pack, list("potassium" = 4, "sugar" = 4, "phosphorus" = 4))
	pack.desc += " 'S' has been scribbled on it."

// Dylovene
	pack = new /obj/item/storage/fancy/cigarettes(src)
	pack.reagents.add_reagent("anti_toxin", 15 * pack.storage_slots)
	pack.desc += " 'DY' has been scribbled on it."


// Mindbreaker

	pack = new /obj/item/storage/fancy/cigarettes(src)
	pack.reagents.add_reagent("mindbreaker", 15 * pack.storage_slots)
	pack.desc += " 'MB' has been scribbled on it."

// Tricord
	pack = new /obj/item/storage/fancy/cigarettes(src)
	pack.reagents.add_reagent("tricordrazine", 15 * pack.storage_slots)
	pack.desc += " 'T' has been scribbled on it."

	new /obj/item/flame/lighter/zippo/black(src)

/proc/fill_cigarre_package(var/obj/item/storage/fancy/cigarettes/C, var/list/reagents)
	for(var/reagent in reagents)
		C.reagents.add_reagent(reagent, reagents[reagent] * C.storage_slots)

/obj/item/storage/box/syndie_kit/ewar_voice
	name = "Electro-Warfare and Voice Synthesizer kit"
	desc = "Kit for confounding organic and synthetic entities alike."

/obj/item/storage/box/syndie_kit/ewar_voice/populate_contents()
	new /obj/item/rig_module/electrowarfare_suite(src)
	new /obj/item/rig_module/voice(src)

/obj/item/storage/box/syndie_kit/spy_sensor
	name = "sensor kit"

/obj/item/storage/box/syndie_kit/spy_sensor/populate_contents()
	new /obj/item/device/spy_sensor(src)
	new /obj/item/device/spy_sensor(src)
	new /obj/item/device/spy_sensor(src)
	new /obj/item/device/spy_sensor(src)


/obj/item/storage/box/syndie_kit/exl_revolver
	name = "\"Wayfarer\" caseless revolver kit"
	desc = "A well made 10x24 claseless revolver and some ammo."

/obj/item/storage/box/syndie_kit/exl_revolver/populate_contents()
	new /obj/item/gun/projectile/revolver/wayfarer(src)
	new /obj/item/ammo_magazine/ammobox/c10x24_small(src)
	new /obj/item/ammo_magazine/ammobox/c10x24_small(src)

/obj/item/storage/secure/briefcase/money
	name = "suspicious briefcase"
	desc = "An ominous briefcase that has the unmistakeable smell of old, stale cigarette smoke, and gives those who look at it a bad feeling."

/obj/item/storage/secure/briefcase/money/populate_contents()
	new /obj/item/spacecash/bundle/c1000(src)
	new /obj/item/spacecash/bundle/c1000(src)
	new /obj/item/spacecash/bundle/c1000(src)
	new /obj/item/spacecash/bundle/c1000(src)
	new /obj/item/spacecash/bundle/c1000(src)
	new /obj/item/spacecash/bundle/c1000(src)
	new /obj/item/spacecash/bundle/c1000(src)
	new /obj/item/spacecash/bundle/c1000(src)
	new /obj/item/spacecash/bundle/c1000(src)
	new /obj/item/spacecash/bundle/c1000(src)
