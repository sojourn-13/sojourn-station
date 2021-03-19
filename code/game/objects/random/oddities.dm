/obj/random/common_oddities
	name = "random common odities"
	icon_state = "techloot-grey"

/obj/random/common_oddities/item_to_spawn()
	return pickweight(list(
				/obj/item/weapon/oddity/common/blueprint = 3,
				/obj/item/weapon/oddity/common/coin = 3,
				/obj/item/weapon/oddity/common/photo_landscape = 2,
				/obj/item/weapon/oddity/common/photo_coridor = 2,
				/obj/item/weapon/oddity/common/photo_eyes = 1,
				/obj/item/weapon/oddity/common/old_newspaper = 3,
				/obj/item/weapon/oddity/common/paper_crumpled = 2,
				/obj/item/weapon/oddity/common/paper_omega = 1,
				/obj/item/weapon/oddity/common/book_eyes = 1,
				/obj/item/weapon/oddity/common/book_omega = 2,
				/obj/item/weapon/oddity/common/book_bible = 3,
				/obj/item/weapon/oddity/common/old_money = 3,
				/obj/item/weapon/oddity/common/healthscanner = 2,
				/obj/item/weapon/oddity/common/old_pda = 3,
				/obj/item/weapon/oddity/common/teddy = 2,
				/obj/item/weapon/oddity/common/old_knife = 2,
				/obj/item/weapon/oddity/common/old_id = 1,
				/obj/item/weapon/oddity/common/old_radio = 1,
				/obj/item/weapon/oddity/common/paper_bundle = 2,
				/obj/item/weapon/oddity/common/towel = 3,
				/obj/item/weapon/oddity/common/photo_crime = 1,
				/obj/item/weapon/oddity/common/book_log = 1,
				/obj/item/weapon/oddity/common/broken_glass = 0.5,
				/obj/item/weapon/oddity/common/broken_key = 0.5,
				/obj/item/weapon/oddity/common/rusted_sword = 0.1,
				/obj/item/weapon/oddity/common/book_unholy = 0.5,
				/obj/item/weapon/oddity/common/device = 2,
				/obj/item/weapon/oddity/common/lighter = 3,
				/obj/item/weapon/oddity/common/mirror = 3,
				/obj/item/weapon/oddity/common/disk = 2
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
				/obj/item/weapon/gun/projectile/handmade_pistol/anti_material/reliable = 1,
				/obj/item/weapon/gun/energy/sniperrifle/saint = 1,
				/obj/item/weapon/gun/projectile/deaglebolt = 1,
				/obj/item/weapon/gun/projectile/automatic/lmg/saw/unicorn = 1,
				/obj/item/weapon/gun/projectile/revolver/mistral/elite = 1,
				/obj/item/weapon/gun/energy/lasersmg/inferno = 1,
				/obj/item/weapon/gun/projectile/shotgun/pump/obrez/thunderlord = 1,
				/obj/item/weapon/gun/projectile/automatic/pulse_rifle = 1,
				/obj/item/weapon/gun/projectile/silenced/rat = 1,
				/obj/item/weapon/gun/energy/ntpistol/mana = 1,
				/obj/item/weapon/gun/projectile/automatic/maxim/replica = 1,
				/obj/item/weapon/oddity/nt/seal = 1,
				/obj/item/weapon/soap/bluespase = 0.5)) //Ye not a "gun" but still good for this