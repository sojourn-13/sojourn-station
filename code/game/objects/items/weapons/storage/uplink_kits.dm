/obj/item/weapon/storage/box/syndicate/populate_contents()
	switch (pickweight(list("bloodyspai" = 1, "stealth" = 1, "screwed" = 1, "guns" = 1, "murder" = 1, "freedom" = 1, "hacker" = 1, /*"lordsingulo" = 1,*/ "smoothoperator" = 1)))
		if("bloodyspai")
			new /obj/item/clothing/under/admin/chameleon(src)
			new /obj/item/clothing/mask/gas/voice(src)
			new /obj/item/weapon/card/id/syndicate(src)
			new /obj/item/clothing/shoes/syndigaloshes(src)
			return

		if("stealth")
			new /obj/item/weapon/gun/energy/crossbow(src)
			new /obj/item/weapon/pen/reagent/paralysis(src)
			new /obj/item/device/chameleon(src)
			return

		if("screwed")
			new /obj/effect/spawner/newbomb/timer/syndicate(src)
			new /obj/effect/spawner/newbomb/timer/syndicate(src)
			new /obj/item/device/powersink(src)
			new /obj/item/clothing/suit/space/syndicate(src)
			new /obj/item/clothing/head/helmet/space/syndicate(src)
			new /obj/item/clothing/mask/gas/tactical(src)
			new /obj/item/weapon/tank/emergency_oxygen/double(src)
			return

		if("guns")
			new /obj/item/weapon/gun/projectile/revolver(src)
			new /obj/item/ammo_magazine/slmagnum(src)
			new /obj/item/weapon/card/emag(src)
			new /obj/item/weapon/plastique(src)
			new /obj/item/weapon/plastique(src)
			return

		if("murder")
			new /obj/item/weapon/melee/energy/sword(src)
			new /obj/item/clothing/glasses/powered/thermal/syndi(src)
			new /obj/item/weapon/card/emag(src)
			new /obj/item/clothing/shoes/syndigaloshes(src)
			return

		if("freedom")
			var/obj/item/weapon/implanter/O = new /obj/item/weapon/implanter(src)
			O.implant = new /obj/item/weapon/implant/freedom(O)
			var/obj/item/weapon/implanter/U = new /obj/item/weapon/implanter(src)
			U.implant = new /obj/item/weapon/implant/uplink(U)
			return

		if("hacker")
			new /obj/item/device/encryptionkey/syndicate(src)
			new /obj/item/weapon/aiModule/syndicate(src)
			new /obj/item/weapon/card/emag(src)
			new /obj/item/device/encryptionkey/binary(src)
			return

/*			if("lordsingulo")
			new /obj/item/device/radio/beacon/syndicate(src)
			new /obj/item/clothing/suit/space/syndicate(src)
			new /obj/item/clothing/head/helmet/space/syndicate(src)
			new /obj/item/clothing/mask/gas/syndicate(src)
			new /obj/item/weapon/tank/emergency_oxygen/double(src)
			new /obj/item/weapon/card/emag(src)
			return
*/

			if("smoothoperator")
				new /obj/item/weapon/storage/box/syndie_kit/pistol(src)
				new /obj/item/weapon/storage/bag/trash(src)
				new /obj/item/weapon/soap/syndie(src)
				new /obj/item/bodybag(src)
				new /obj/item/clothing/shoes/reinforced(src)
				return

/obj/item/weapon/storage/box/syndie_kit
	name = "box"
	desc = "A sleek, sturdy box. This one is using state of the art folding to hold more inside!"
	max_storage_space = DEFAULT_NORMAL_STORAGE //bigger so they hold their gear!
	icon_state = "box_of_doom"
	illustration = "writing_of_doom"

/obj/item/weapon/storage/box/syndie_kit/imp_freedom
	name = "boxed freedom implant (with injector)"
	desc = "A box with freedom implant inside. Install it in your hand or leg, chose emote. You can remove instantly handcuffs or legcuffs with your emotion. Have a small amount of uses."

/obj/item/weapon/storage/box/syndie_kit/imp_freedom/populate_contents()
	new /obj/item/weapon/implanter/freedom(src)

/obj/item/weapon/storage/box/syndie_kit/imp_compress
	name = "box (C)"
	desc = "A box with compressed implanter inside. Choose an item with this implant, install it inside you and choose emote to activate it. Take your chosen item whenever you want by your chosen emotion. One use."

/obj/item/weapon/storage/box/syndie_kit/imp_compress/populate_contents()
	new /obj/item/weapon/implanter/compressed(src)

/obj/item/weapon/storage/box/syndie_kit/imp_explosive
	name = "box (E)"
	desc = "A box with explosive implant inside. When you use it on yours enemy, you can choose three ways to use it: destroy limb, destroy your enemy or make a small explosion. Activation by phrase you choose too. One use."

/obj/item/weapon/storage/box/syndie_kit/imp_explosive/populate_contents()
	new /obj/item/weapon/implanter/explosive(src)

/obj/item/weapon/storage/box/syndie_kit/imp_spying
	name = "box (S)"
	desc = "A box with spying implanter inside. Implant your contract target with it and wait 1 minute for the confirmation."

/obj/item/weapon/storage/box/syndie_kit/imp_spying/populate_contents()
	new /obj/item/weapon/implanter/spying(src)

/obj/item/weapon/storage/box/syndie_kit/imp_uplink
	name = "boxed uplink implant (with injector)"
	desc = "Uplink inside your head."

/obj/item/weapon/storage/box/syndie_kit/imp_uplink/populate_contents()
	//Turn off passive gain for boxed implant uplinks. To prevent exploits of gathering tons of free TC
	var/obj/item/weapon/implanter/uplink/U1 = new /obj/item/weapon/implanter/uplink(src)
	var/obj/item/weapon/implant/uplink/U2 = locate(/obj/item/weapon/implant/uplink) in U1
	var/obj/item/device/uplink/hidden/U3 = locate(/obj/item/device/uplink/hidden) in U2
	U3.passive_gain = 0

/obj/item/weapon/storage/box/syndie_kit/space
	name = "boxed voidsuit"

/obj/item/weapon/storage/box/syndie_kit/space/populate_contents()
	new /obj/item/clothing/suit/space/void/merc/boxed(src)
	new /obj/item/clothing/mask/gas/tactical(src)

/obj/item/weapon/storage/box/syndie_kit/chameleon
	name = "chameleon kit"
	desc = "Comes with all the clothes you need to impersonate most people.  Acting lessons sold seperately. The box itself is made of plasteel."
	matter = list(MATERIAL_PLASTEEL = 1)

/obj/item/weapon/storage/box/syndie_kit/chameleon/populate_contents()
	new /obj/item/clothing/under/admin/chameleon(src)
	new /obj/item/clothing/head/admin/chameleon(src)
	new /obj/item/clothing/suit/admin/chameleon(src)
	new /obj/item/clothing/shoes/admin/chameleon(src)
	new /obj/item/weapon/storage/backpack/chameleon(src)
	new /obj/item/clothing/gloves/admin/chameleon(src)
	new /obj/item/clothing/mask/admin/chameleon(src)
	new /obj/item/clothing/glasses/admin/chameleon(src)
	new /obj/item/weapon/gun/energy/chameleon(src)

/obj/item/weapon/storage/box/syndie_kit/clerical
	name = "clerical kit"
	desc = "Comes with all you need to fake paperwork. Assumes you have passed basic writing lessons."

/obj/item/weapon/storage/box/syndie_kit/clerical/populate_contents()
	new /obj/item/weapon/stamp/chameleon(src)
	new /obj/item/weapon/pen/chameleon(src)
	new /obj/item/device/destTagger(src)
	new /obj/item/weapon/packageWrap(src)
	new /obj/item/weapon/hand_labeler(src)

/obj/item/weapon/storage/box/syndie_kit/spy
	name = "spy kit"
	desc = "For when you want to conduct voyeurism from afar."

/obj/item/weapon/storage/box/syndie_kit/spy/populate_contents()
	new /obj/item/device/spy_bug(src)
	new /obj/item/device/spy_bug(src)
	new /obj/item/device/spy_bug(src)
	new /obj/item/device/spy_bug(src)
	new /obj/item/device/spy_bug(src)
	new /obj/item/device/spy_bug(src)
	new /obj/item/device/spy_monitor(src)

/obj/item/weapon/storage/box/syndie_kit/dartgun
	name  = "dartgun kit"
	desc = "Just like a mosquito bite."

/obj/item/weapon/storage/box/syndie_kit/dartgun/populate_contents()
	new /obj/item/weapon/gun/projectile/dartgun(src)
	new /obj/item/ammo_magazine/chemdart(src)

/obj/item/weapon/storage/box/syndie_kit/pistol
	name = "\improper smooth operator kit"
	desc = ".40 suppressed handgun and its kit."

/obj/item/weapon/storage/box/syndie_kit/pistol/populate_contents()
	new /obj/item/weapon/gun/projectile/silenced(src)
	new /obj/item/ammo_magazine/magnum/hv(src)
	new /obj/item/ammo_magazine/magnum/hv(src)
	new /obj/item/clothing/glasses/sunglasses(src)
	new /obj/item/clothing/mask/balaclava(src)


/obj/item/weapon/storage/box/syndie_kit/hpistol
	name = "\improper gunfighter kit"
	desc = ".50 suppressed handgun and its kit."

/obj/item/weapon/storage/box/syndie_kit/hpistol/populate_contents()
	new /obj/item/weapon/gun/projectile/lamia/akurra(src)
	new /obj/item/ammo_magazine/kurtz/hv(src)
	new /obj/item/ammo_magazine/kurtz/hv(src)
	new /obj/item/clothing/glasses/sunglasses(src)
	new /obj/item/clothing/mask/balaclava(src)

/obj/item/weapon/storage/box/syndie_kit/c20r
	name = "C-20r box"
	desc = "C-20r kit"

/obj/item/weapon/storage/box/syndie_kit/c20r/populate_contents()
	new /obj/item/weapon/gun/projectile/automatic/c20r(src)
	new /obj/item/ammo_magazine/smg(src)

/obj/item/weapon/storage/box/syndie_kit/revolver
	name = "revolver box"
	desc = "Revolver kit"

/obj/item/weapon/storage/box/syndie_kit/revolver/populate_contents()
	new /obj/item/weapon/gun/projectile/revolver/mistral(src)
	new /obj/item/ammo_magazine/slmagnum(src)

/obj/item/weapon/storage/box/syndie_kit/sts
	name = "assault rifle box"
	desc = "Assault rifle kit"
	icon_state = "box_of_doom_big"
	w_class = ITEM_SIZE_HUGE

/obj/item/weapon/storage/box/syndie_kit/sts/populate_contents()
	new /obj/item/weapon/gun/projectile/automatic/sts(src)
	new /obj/item/ammo_magazine/lrifle(src)
	new /obj/item/ammo_magazine/lrifle_short(src)
	new /obj/item/clothing/suit/storage/toggle/leather/blackjacket(src)

/obj/item/weapon/storage/box/syndie_kit/pug
	name = "Pug box"
	desc = "Pug kit with one M12 buckshot mag"
	icon_state = "box_of_doom_big"
	w_class = ITEM_SIZE_HUGE

/obj/item/weapon/storage/box/syndie_kit/pug/populate_contents()
	new /obj/item/weapon/gun/projectile/shotgun/pug(src)
	new /obj/item/ammo_magazine/m12/pellet(src)

/obj/item/weapon/storage/box/syndie_kit/antimaterial_rifle
	name = "sniper rifle box"
	desc = "Sniper rifle kit. One shot for real men."
	icon_state = "box_of_doom_big"
	w_class = ITEM_SIZE_HUGE

/obj/item/weapon/storage/box/syndie_kit/antimaterial_rifle/populate_contents()
	new /obj/item/ammo_casing/antim(src)
	new /obj/item/weapon/weaponparts/heavysniper/stock(src)
	new /obj/item/weapon/weaponparts/heavysniper/reciever(src)
	new /obj/item/weapon/weaponparts/heavysniper/barrel(src)

/obj/item/weapon/storage/box/syndie_kit/toxin
	name = "toxin kit"
	desc = "An apple will not be enough to keep the doctor away after this."

/obj/item/weapon/storage/box/syndie_kit/toxin/populate_contents()
	new /obj/item/weapon/reagent_containers/glass/beaker/vial/random/toxin(src)
	new /obj/item/weapon/reagent_containers/syringe(src)

/obj/item/weapon/storage/box/syndie_kit/cigarette
	name = "\improper tricky smokes"
	desc = "Comes with the following brands of cigarettes, in this order: 2xFlash, 2xSmoke, 1xMindBreaker, 1xTricordrazine. Avoid mixing them up."

/obj/item/weapon/storage/box/syndie_kit/cigarette/populate_contents()
	var/obj/item/weapon/storage/fancy/cigarettes/pack
	pack = new /obj/item/weapon/storage/fancy/cigarettes(src)
	fill_cigarre_package(pack, list("aluminum" = 6, "potassium" = 6, "sulfur" = 6))
	pack.desc += " 'F' has been scribbled on it."

	pack = new /obj/item/weapon/storage/fancy/cigarettes(src)
	fill_cigarre_package(pack, list("aluminum" = 6, "potassium" = 6, "sulfur" = 6))
	pack.desc += " 'F' has been scribbled on it."

	pack = new /obj/item/weapon/storage/fancy/cigarettes(src)
	fill_cigarre_package(pack, list("potassium" = 6, "sugar" = 6, "phosphorus" = 6))
	pack.desc += " 'S' has been scribbled on it."

	pack = new /obj/item/weapon/storage/fancy/cigarettes(src)
	fill_cigarre_package(pack, list("potassium" = 6, "sugar" = 6, "phosphorus" = 6))
	pack.desc += " 'S' has been scribbled on it."

	pack = new /obj/item/weapon/storage/fancy/cigarettes(src)
	// Dylovene. Going with 1.5 rather than 1.6666666...
	fill_cigarre_package(pack, list("potassium" = 1.5, "nitrogen" = 1.5, "silicon" = 1.5))
	// Mindbreaker
	fill_cigarre_package(pack, list("silicon" = 4.5, "hydrogen" = 4.5))

	pack.desc += " 'MB' has been scribbled on it."

	pack = new /obj/item/weapon/storage/fancy/cigarettes(src)
	pack.reagents.add_reagent("tricordrazine", 15 * pack.storage_slots)
	pack.desc += " 'T' has been scribbled on it."

	new /obj/item/weapon/flame/lighter/zippo(src)

/proc/fill_cigarre_package(var/obj/item/weapon/storage/fancy/cigarettes/C, var/list/reagents)
	for(var/reagent in reagents)
		C.reagents.add_reagent(reagent, reagents[reagent] * C.storage_slots)

/obj/item/weapon/storage/box/syndie_kit/ewar_voice
	name = "Electrowarfare and Voice Synthesiser kit"
	desc = "Kit for confounding organic and synthetic entities alike."

/obj/item/weapon/storage/box/syndie_kit/ewar_voice/populate_contents()
	new /obj/item/rig_module/electrowarfare_suite(src)
	new /obj/item/rig_module/voice(src)

/obj/item/weapon/storage/box/syndie_kit/spy_sensor
	name = "sensor kit"

/obj/item/weapon/storage/box/syndie_kit/spy_sensor/populate_contents()
	new /obj/item/device/spy_sensor(src)
	new /obj/item/device/spy_sensor(src)
	new /obj/item/device/spy_sensor(src)
	new /obj/item/device/spy_sensor(src)


/obj/item/weapon/storage/secure/briefcase/money
	name = "suspicious briefcase"
	desc = "An ominous briefcase that has the unmistakeable smell of old, stale cigarette smoke, and gives those who look at it a bad feeling."

/obj/item/weapon/storage/secure/briefcase/money/populate_contents()
	new /obj/item/weapon/spacecash/bundle/c1000(src)
	new /obj/item/weapon/spacecash/bundle/c1000(src)
	new /obj/item/weapon/spacecash/bundle/c1000(src)
	new /obj/item/weapon/spacecash/bundle/c1000(src)
	new /obj/item/weapon/spacecash/bundle/c1000(src)
	new /obj/item/weapon/spacecash/bundle/c1000(src)
	new /obj/item/weapon/spacecash/bundle/c1000(src)
	new /obj/item/weapon/spacecash/bundle/c1000(src)
	new /obj/item/weapon/spacecash/bundle/c1000(src)
	new /obj/item/weapon/spacecash/bundle/c1000(src)