/obj/random/common_oddities
	name = "random common odities"
	icon_state = "techloot-grey"

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
				/obj/item/oddity/common/book_omega = 2,
				/obj/item/oddity/common/book_bible = 3,
				/obj/item/oddity/common/old_money = 3,
				/obj/item/oddity/common/healthscanner = 2,
				/obj/item/oddity/common/old_pda = 3,
				/obj/item/oddity/common/teddy = 2,
				/obj/item/oddity/common/old_knife = 2,
				/obj/item/oddity/common/old_id = 1,
				/obj/item/oddity/common/old_radio = 1,
				/obj/item/oddity/common/paper_bundle = 2,
				/obj/item/oddity/common/towel = 3,
				/obj/item/oddity/common/photo_crime = 1,
				/obj/item/oddity/common/book_log = 1,
				/obj/item/oddity/common/broken_glass = 0.5,
				/obj/item/oddity/common/broken_key = 0.5,
				/obj/item/oddity/common/rusted_sword = 0.1,
				/obj/item/oddity/common/book_unholy = 0.5,
				/obj/item/oddity/common/device = 2,
				/obj/item/oddity/common/lighter = 3,
				/obj/item/oddity/common/mirror = 3,
				/obj/item/oddity/common/disk = 2,
				/obj/item/oddity/rare/eldritch_tie = 0.01 //SO RARE
				))

/obj/random/common_oddities/low_chance
	name = "low chance random common odities"
	icon_state = "techloot-grey-low"
	spawn_nothing_percentage = 60

/obj/random/oddity_guns
	name = "random gun oddities"
	icon_state = "techloot-grey"

/obj/random/oddity_guns/item_to_spawn()
	return pickweight(list(
				//Bullet
				/obj/item/gun/projectile/handmade_pistol/anti_material/reliable = 1,
				/obj/item/gun/projectile/deaglebolt = 1,
				/obj/item/gun/projectile/automatic/lmg/saw/unicorn = 1,
				/obj/item/gun/projectile/revolver/mistral/elite = 1,
				/obj/item/gun/projectile/shotgun/pump/obrez/thunderlord = 1,
				/obj/item/gun/projectile/automatic/pulse_rifle = 1,
				/obj/item/gun/projectile/silenced/rat = 1,
				/obj/item/gun/projectile/automatic/maxim/replica = 1,
				/obj/item/gun/projectile/revolver/deacon = 1,
				/obj/item/gun/projectile/clarissa/devil_eye = 1,
				/obj/item/gun/projectile/automatic/slaught_o_matic/lockpickomatic = 1,
				/obj/item/gun/projectile/boltgun/bluecross = 1,
				/obj/item/gun/projectile/that_gun = 1,
				/obj/item/gun/projectile/colt/cult = 1,
				//Energy
				/obj/item/gun/energy/sniperrifle/saint = 1,
				/obj/item/gun/energy/lasersmg/inferno = 1,
				/obj/item/gun/energy/ntpistol/mana = 1,
				/obj/item/gun/energy/captain/zapper = 1,
				/obj/item/gun/energy/xray/psychic_cannon = 1,
				/obj/item/gun/energy/lasersmg/chaos_engine = 1,
				//Hydrogen
				/obj/item/gun/hydrogen/incinerator = 1,
				//Tools / Melee
				/obj/item/tool/nailstick/ogre = 1,
				/obj/item/tool/wrench/big_wrench/freedom = 1,
				/obj/item/tool/saw/hyper/doombringer = 1,
				/obj/item/material/butterfly/frenchman = 1,
				//Gun/Tool Mods
				/obj/item/gun_upgrade/mechanism/brass_kit = 1,
				//Misc - things that are not a "gun" but still good for this
				/obj/item/oddity/nt/seal = 1,
				/obj/item/soap/bluespase = 0.5))

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