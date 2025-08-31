/obj/random/common_oddities
	name = "random common odities"
	icon_state = "techloot-grey"
	spawn_nothing_percentage = 20

/obj/random/common_oddities/item_to_spawn()
	return pickweight(list(
				/obj/item/oddity/common/blueprint = 3,
				/obj/item/oddity/common/coin = 3,
				/obj/item/oddity/common/photo_landscape = 2,
				/obj/item/oddity/common/photo_coridor = 2,
				/obj/item/oddity/common/photo_eyes = 1,
				/obj/item/oddity/common/old_newspaper = 3,
				/obj/item/oddity/common/paper_crumpled = 2,
				/obj/item/oddity/common/paper_omega = 1,
				/obj/item/oddity/common/book_eyes = 1,
				/obj/item/oddity/common/book_omega/closed = 2,
				/obj/item/oddity/common/book_bible = 3,
				/obj/item/oddity/common/old_money = 3,
				/obj/item/oddity/common/healthscanner = 2,
				/obj/item/oddity/common/old_pda = 3,
				/obj/item/oddity/common/teddy = 2,
				/obj/item/oddity/common/tattoo = 2,
				/obj/item/oddity/common/old_knife = 2,
				/obj/item/oddity/common/old_id = 1,
				/obj/item/oddity/common/old_radio = 1,
				/obj/item/oddity/common/paper_bundle = 2,
				/obj/item/oddity/common/towel = 3,
				/obj/item/oddity/common/photo_crime = 1,
				/obj/item/oddity/common/book_log = 1,
				/obj/item/oddity/common/instructional_bio = 1,
				/obj/item/oddity/common/instructional_cog_python = 1,
				/obj/item/oddity/common/broken_glass = 0.5,
				/obj/item/oddity/common/broken_key = 0.5,
				/obj/item/oddity/common/rusted_sword = 0.1,
				/obj/item/oddity/common/book_unholy/closed = 0.5,
				/obj/item/oddity/common/device = 2,
				/obj/item/oddity/common/lighter = 3,
				/obj/item/oddity/common/mirror = 3,
				/obj/item/oddity/common/disk = 2,
				/obj/item/oddity/common/redbrick = 2,
				/obj/item/oddity/rare/eldritch_tie = 0.01 //SO RARE
				))

/obj/random/common_oddities/always_spawn
	name = "random always spawn common odities"
	icon_state = "techloot-black"
	spawn_nothing_percentage = 0

/obj/random/common_oddities/low_chance
	name = "low chance random common odities"
	icon_state = "techloot-grey-low"
	spawn_nothing_percentage = 60

/obj/random/oddity_guns
	name = "Unstable cross rift"
	desc = "A rift that has eaten a cross weapon. The rift seems to be only able to reseave rather then send."
	icon = 'icons/obj/objects.dmi'
	icon_state = "wormhole_unstable"
	has_postspawn = TRUE
	late_handling = TRUE
	anchored = TRUE
	var/anticheat = TRUE
	alpha = 255
	invisibility = 0
	layer = SIGN_LAYER

/obj/random/oddity_guns/propis_box
	has_postspawn = TRUE
	late_handling = FALSE

/obj/random/oddity_guns/attack_hand(mob/user as mob)
	if(anticheat)
		to_chat(user, SPAN_NOTICE("The rift drops a rare cross item before you even lift a hand to it."))
		late_handling()
		anticheat = FALSE
		qdel(src)
	to_chat(user, SPAN_NOTICE("The rift is eating itself far to much to get any more out of it."))

/obj/random/oddity_guns/item_to_spawn()
	var/item_to_spawn = random_grabber()
	var/doup_found = FALSE
	var/doup_found_2 = FALSE
	for(var/doup in GLOB.reapeat_odditie_weapon_spawn)
		if(item_to_spawn in GLOB.reapeat_odditie_weapon_spawn)
			item_to_spawn = random_grabber() //Roll again
			doup_found = TRUE
			break

	if(doup_found)
		//Run it again to make sure are second pull isnt a doup, but only for adding to the list
		for(var/doup_2 in GLOB.reapeat_odditie_weapon_spawn)
			if(item_to_spawn in GLOB.reapeat_odditie_weapon_spawn)
				doup_found_2 = TRUE
				break

	if(!doup_found_2)
		GLOB.reapeat_odditie_weapon_spawn += item_to_spawn

	return item_to_spawn

/obj/random/oddity_guns/post_spawn(var/list/spawns)
	for(var/picked_spawn in spawns)

		//The gimmic of this gun is that you can duel wield 2 of them.
		if(istype(picked_spawn, /obj/item/gun/projectile/clarissa/devil_eye))
			new /obj/item/gun/projectile/clarissa/devil_eye(src.loc)

		//The gimmic of the of the revolver is that it has a lot of ammo it *can* store, so we give starting ammo
		if(istype(picked_spawn, /obj/item/gun/projectile/revolver/mistral/elite))
			new /obj/item/ammo_magazine/ammobox/magnum_40/large(src.loc)

		//The gimmic of the maxim was that its non-exl and powerful, do to powercreep of non-exl maxims we give starting ammo
		if(istype(picked_spawn, /obj/item/gun/projectile/automatic/maxim/replica))
			new /obj/item/ammo_magazine/maxim_75(src.loc)

		//Just one of the weakest of the spawns, so we give extra ammo
		if(istype(picked_spawn, /obj/item/gun/projectile/that_gun))
			new /obj/item/ammo_magazine/highcap_pistol_35/drum(src.loc)
	return

/obj/random/oddity_guns/proc/random_grabber()
	return pickweight(list(
				//Bullet
				/obj/item/gun/projectile/deaglebolt = 1,
				/obj/item/gun/projectile/revolver/mistral/elite = 1,
				/obj/item/gun/projectile/shotgun/doublebarrel/bluecross_shotgun = 1,
				/obj/item/gun/projectile/silenced/rat = 1,
				/obj/item/gun/projectile/automatic/maxim/replica = 1,
				/obj/item/gun/projectile/revolver/deacon = 1,
				/obj/item/gun/projectile/clarissa/devil_eye = 1,
				/obj/item/clothing/accessory/holster/bluecross = 1,
				/obj/item/gun/projectile/boltgun/bluecross = 1,
				/obj/item/gun/projectile/that_gun = 1,
				/obj/item/gun/projectile/colt/cult = 1,
				/obj/item/gun/projectile/cane_pistol_bluecross = 1,
				//Energy
				/obj/item/gun/energy/sniperrifle/saint = 1,
				//obj/item/gun/energy/lasersmg/inferno = 1,
				/obj/item/gun/energy/ntpistol/mana = 1,
				/obj/item/gun/energy/captain/zapper = 1,
				/obj/item/gun/energy/xray/psychic_cannon = 1,
				/obj/item/gun/energy/lasersmg/chaos_engine = 1,
				/obj/item/gun/energy/painted_flaregun = 1,
				//Hydrogen
				/obj/item/gun/hydrogen/incinerator = 1,
				//Tools / Melee
				/obj/item/tool/nailstick/ogre = 1,
				/obj/item/tool/wrench/big_wrench/freedom = 1,
				/obj/item/tool/saw/hyper/doombringer = 1,
				/obj/item/tool/sword/katana/crimson_arc = 1,
				/obj/item/tool/scythe/spectral_harvester = 1,
				/obj/item/tool/knife/dagger/vail_render = 1,
				/obj/item/shield/riot/mass_grave = 1,
				/obj/item/tool/sword/saber/nightmare_saber = 1,
				/obj/item/tool/crit_pipe_bluecross = 1,
				//obj/item/material/butterfly/frenchman = 1,
				//Gun/Tool Mods
				/obj/item/gun_upgrade/mechanism/brass_kit = 1,
				//Armor
				///obj/item/clothing/suit/crimsoncross_regaloutfit = 0.1, //Little rarer then even soap
				/obj/item/clothing/shoes/crimsoncross_warp = 1,
				//Misc - things that are not a "gun" but still good for this
				/obj/item/oddity/nt/seal = 0.5,
				/obj/item/soap/bluespase = 0.5,
				/obj/item/oddity/rare/moon_fragment = 0.2))

/obj/random/uplink/low_chance
	name = "really really really low chance random uplink"
	icon_state = "techloot-grey-low"
	spawn_nothing_percentage = 95

/obj/random/uplink
	name = "random uplink"
	icon_state = "techloot-grey"

/obj/random/uplink/item_to_spawn()
	return pickweight(list(
				/obj/item/device/radio/uplink = 1,
				/obj/item/tool/multitool/uplink = 1,
				/obj/item/implant/uplink = 1,
				/obj/item/device/radio/headset/uplink = 1))

/obj/random/lonestar_oddities
	name = "lonestar curios"
	icon_state = "techloot-grey"
	spawn_nothing_percentage = 0

/obj/random/lonestar_oddities/item_to_spawn()
	return pickweight(list(
				/obj/item/oddity/ls/collector_coin = 2,
				/obj/item/oddity/ls/pamphlet = 2,
				/obj/item/oddity/ls/rod_figure = 2,
				/obj/item/oddity/ls/chess_set = 2,
				/obj/item/oddity/ls/starscope = 1,
				/obj/item/oddity/ls/flashdrive = 2,
				/obj/item/oddity/ls/mutant_tooth = 1,
				/obj/item/oddity/ls/manual = 1,
				/obj/item/oddity/ls/bouquet = 2,
				/obj/item/oddity/ls/magazine = 2,
				/obj/item/oddity/ls/dogtags = 2,
				/obj/item/oddity/ls/silk_cloak = 2,
				/obj/item/oddity/ls/kriosan_sword = 1,
				/obj/item/oddity/ls/newton_odd = 2,
				/obj/item/oddity/ls/puzzlebox = 0.5,
				/obj/item/oddity/ls/starprojector = 0.5,
				/obj/item/oddity/ls/inertdetonator = 0.5))
