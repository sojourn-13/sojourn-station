//Closets full of loot, they should be placed in maints

/obj/structure/closet/random_miscellaneous
	name = "\improper forgotten closet"
	desc = "Old and rusty closet, probably older than you."
	icon_state = "oldstyle"
	old_chance = 50
	chance_old_mobs = 50

/obj/structure/closet/random_miscellaneous/populate_contents()
	new /obj/random/contraband/low_chance(src)
	new /obj/random/contraband/low_chance(src)
	new /obj/random/pack/rare/low_chance(src)
	new /obj/random/junk(src)
	new /obj/random/junk(src)
	new /obj/random/junk(src)
	new /obj/random/lowkeyrandom(src)
	new /obj/random/lowkeyrandom(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/pack/tech_loot/low_chance(src)
	new /obj/random/pack/cloth/low_chance(src)
	new /obj/random/pack/cloth/low_chance(src)
	new /obj/random/pack/gun_loot/low_chance(src)
	new /obj/random/pouch/hardcase_scrap/low_chance(src)
	new /obj/random/gun_parts/low(src)
	if(prob(20))
		new /obj/random/gun_parts/frames(src)

/obj/structure/closet/random_tech
	name = "\improper technical closet"
	desc = "Somewhat old closet with wrench sign on it."
	icon_state = "eng"
	icon_door = "eng_tool"
	old_chance = 10
	chance_old_mobs = 25

/obj/structure/closet/random_tech/populate_contents()
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/pack/tech_loot(src)
	new /obj/random/pack/tech_loot(src)
	new /obj/random/pack/tech_loot(src)
	new /obj/random/pack/tech_loot(src)
	new /obj/random/pouch/hardcase_scrap(src)
	new /obj/random/pack/tech_loot/low_chance(src)
	new /obj/random/pack/tech_loot/low_chance(src)
	if(prob(30))
		new /obj/random/gun_parts/frames(src)

/obj/structure/closet/random_spareparts
	name = "\improper spare parts closet"
	desc = "Somewhat old closet with spare parts in it."
	icon_state = "eng"
	icon_door = "eng_tool"
	old_chance = 10
	chance_old_mobs = 25

/obj/structure/closet/random_tech/populate_contents()
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/techpart(src)
	new /obj/random/techpart(src)
	new /obj/random/techpart(src)
	new /obj/random/techpart(src)
	new /obj/random/techpart(src)
	new /obj/random/techpart(src)
	new /obj/random/tool_upgrade(src)
	new /obj/random/tool_upgrade(src)
	new /obj/random/tool_upgrade(src)
	new /obj/random/lathe_disk(src)
	new /obj/random/lathe_disk/low_chance(src)
	new /obj/random/pouch/hardcase_scrap/low_chance(src)
	new /obj/random/pack/tech_loot/low_chance(src)
	new /obj/random/pack/tech_loot/low_chance(src)
	if(prob(20))
		new /obj/random/gun_parts/frames(src)

/obj/structure/closet/random_milsupply
	name = "\improper military supply closet"
	desc = "Why is this here?"
	icon_state = "syndicate"
	old_chance = 10
	chance_old_mobs = 75

/obj/structure/closet/random_milsupply/populate_contents()
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/pack/rare(src)
	new /obj/random/pack/gun_loot(src)
	new /obj/random/pack/gun_loot(src)
	new /obj/random/pack/gun_loot(src)
	new /obj/random/pack/gun_loot(src)
	new /obj/random/pack/gun_loot(src)
	new /obj/random/pack/gun_loot/low_chance(src)
	new /obj/random/pack/gun_loot/low_chance(src)
	new /obj/random/pack/gun_loot/low_chance(src)
	new /obj/random/pack/gun_loot/low_chance(src)
	new /obj/random/pack/gun_loot/low_chance(src)
	new /obj/random/pack/gun_loot/low_chance(src)
	new /obj/random/pack/gun_loot/low_chance(src)
	new /obj/random/medical/low_chance(src)
	new /obj/random/medical/low_chance(src)
	new /obj/random/medical/low_chance(src)
	new /obj/random/pouch/hardcase_scrap/low_chance(src)
	new /obj/random/gun_parts/low(src)
	new /obj/random/gun_parts/low(src)
	new /obj/random/gun_parts/frames(src)
	new /obj/random/gun_parts/frames(src)
	if(prob(80))
		new /obj/random/gun_parts/frames(src)

/obj/structure/closet/random_medsupply
	name = "\improper medical supply closet"
	desc = "Abandoned medical supply."
	icon_state = "freezer"
	old_chance = 10
	chance_old_mobs = 15

/obj/structure/closet/random_medsupply/populate_contents()
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/medical_lowcost(src)
	new /obj/random/medical_lowcost(src)
	new /obj/random/medical_lowcost(src)
	new /obj/random/medical_lowcost(src)
	new /obj/random/medical(src)
	new /obj/random/medical(src)
	new /obj/random/medical(src)
	new /obj/random/medical/low_chance(src)
	new /obj/random/medical/low_chance(src)
	new /obj/random/pouch/hardcase_scrap/low_chance(src)

/obj/structure/closet/secure_closet/rare_loot
	name = "\improper sealed military supply closet"
	desc = "The access panel looks old. There is probably no ID's around that can open it."
	req_access = list(access_cent_specops) //You are suppose to hack it
	icon_state = "syndicate"
	chance_old_mobs = 75

/obj/structure/closet/secure_closet/rare_loot/populate_contents()
	new /obj/random/pack/rare(src)
	new /obj/random/pack/rare(src)
	new /obj/random/pack/rare(src)
	new /obj/random/pack/rare(src)
	new /obj/random/pack/gun_loot(src)
	new /obj/random/pack/gun_loot(src)
	new /obj/random/pack/gun_loot(src)
	new /obj/random/pack/gun_loot(src)
	new /obj/random/pack/gun_loot(src)
	new /obj/random/pouch/hardcase_scrap/low_chance(src)
	new /obj/random/gun_parts(src)
	new /obj/random/gun_parts(src)
	new /obj/random/gun_parts/low(src)
	new /obj/random/gun_parts/frames(src)
	new /obj/random/gun_parts/frames(src)
	if(prob(80))
		new /obj/random/gun_parts/frames(src)
		new /obj/random/gun_parts/frames(src)


//Closet with unfair bullshit inside
/obj/structure/closet/random_hostilemobs
	name = "\improper forgotten closet"
	desc = "Old and rusty closet, probably older than you."
	icon_state = "oldstyle"
	old_chance = 70
	chance_old_mobs = 95

/obj/structure/closet/random_hostilemobs/populate_contents()
	new /obj/random/pack/rare(src) //To reward players for fighting this bullshit
	new /obj/random/pack/rare(src)
	new /obj/random/gun_parts/low(src)
	new /obj/random/gun_parts/low(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/rations(src)
	new /obj/random/rations(src)
	new /obj/random/rations(src)
	new /obj/random/pouch/hardcase_scrap/low_chance(src)
	if(prob(30))
		new /obj/random/gun_parts/frames(src)

// Used for scrap beacon
/obj/structure/closet/random_hostilemobs/beacon
	mobs_to_spawn = /obj/random/cluster/roaches/beacon
	has_mobs_to_spawn = TRUE //These always have roaches

/obj/structure/closet/random_hostilemobs/beacon/populate_contents()
	new /obj/random/pack/rare(src) //To reward players for fighting this bullshit
	new /obj/random/pack/rare(src)
	new /obj/random/gun_parts/low(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/pouch/hardcase_scrap/low_chance(src)
	new /obj/random/rations(src)
	new /obj/random/rations(src)
	new /obj/random/rations(src)
	if(prob(15))
		new /obj/random/gun_parts/frames(src)
