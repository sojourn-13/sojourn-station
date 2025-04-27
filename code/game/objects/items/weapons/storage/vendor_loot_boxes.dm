/obj/item/storage/box/vendor_lootbox
	name = "surprise mechanics box"
	desc = "A prospector branded 'surprise mechanics' box, available at the prospector vending machine. While the practice of loading boxes with random junk and selling it lottery style is questionable, \
	people do what they will with their money. This is the bottom tier box, its unlikely it will have anything worthwhile in it as its entirely random."
	illustration = "prospector"
	icon_state = "box_of_doom"
	item_state = "box_of_doom"

/obj/item/storage/box/vendor_lootbox/populate_contents()
	if(prob(10)) //Small double chance to get a decent theme pack. First pack, colony survival pack.
		if(prob(50))
			new /obj/item/reagent_containers/snacks/openable/mre(src)
		else
			new /obj/item/reagent_containers/snacks/openable/mre/alt(src)
		new /obj/item/tool/knife/dagger(src)
		new /obj/item/stack/medical/bruise_pack/advanced(src)
		new /obj/item/stack/medical/ointment/advanced(src)
	else if(prob(10)) //Welcome to the colony pack, heres yer pda, id, wallet, and a gun.
		new /obj/item/oddity/common/old_pda(src)
		new /obj/item/oddity/common/old_id(src)
		new /obj/item/storage/wallet/random(src)
		new /obj/item/gun/projectile/revolver/detective(src)
		new /obj/item/ammo_magazine/speed_loader_pistol_35(src)
	else
		new /obj/random/lowkeyrandom(src)
		new /obj/random/lowkeyrandom(src)
		new /obj/random/lowkeyrandom(src)
		new /obj/random/lowkeyrandom(src)

/obj/item/storage/box/vendor_lootbox/combat_basic_light
	name = "\"Trash Gremlin\" surprise mechanics box"
	desc = "A prospector branded 'surprise mechanics' box, available at the prospector vending machine. While the practice of loading boxes with random junk and selling it lottery style is questionable, \
	people do what they will with their money. This box is weighted towards getting weaponry, but this is the lowest tier."

/obj/item/storage/box/vendor_lootbox/combat_basic_light/populate_contents()
	if(prob(10)) //Medical man!
		new /obj/item/stack/medical/bruise_pack/advanced(src)
		new /obj/item/stack/medical/bruise_pack/advanced(src)
		new /obj/item/stack/medical/ointment/advanced(src)
		new /obj/item/stack/medical/ointment/advanced(src)
		new /obj/item/storage/pill_bottle/dylovene(src)
	else if(prob(10)) //Time to kick ass!
		new /obj/item/clothing/gloves/thick/combat(src)
		new /obj/item/clothing/shoes/combat(src)
		new /obj/item/reagent_containers/snacks/candy_drop_red(src)
		new /obj/item/gun/projectile/basilisk(src)
		new /obj/item/ammo_magazine/kurz_50/lethal(src)
	else
		new /obj/random/gun_cheap(src)
		new /obj/random/gun_cheap/low_chance(src)
		new /obj/random/ammo_lowcost(src)
		new /obj/random/ammo_lowcost(src)
		new /obj/random/ammo_lowcost(src)

/obj/item/storage/box/vendor_lootbox/combat_basic_medium
	name = "\"Scrapper's Choice\" surprise mechanics box"
	desc = "A prospector branded 'surprise mechanics' box, available at the prospector vending machine. While the practice of loading boxes with random junk and selling it lottery style is questionable, \
	people do what they will with their money. This box is weighted towards getting weaponry, with a decent chance of getting something good."

/obj/item/storage/box/vendor_lootbox/combat_basic_medium/populate_contents()
	if(prob(10))
		new /obj/item/stack/medical/bruise_pack/advanced(src)
		new /obj/item/stack/medical/bruise_pack/advanced(src)
		new /obj/item/stack/medical/ointment/advanced(src)
		new /obj/item/stack/medical/ointment/advanced(src)
		new /obj/item/storage/pill_bottle/dylovene(src)
	else if(prob(10))
		new /obj/item/clothing/gloves/thick/combat(src)
		new /obj/item/clothing/shoes/combat(src)
		new /obj/item/reagent_containers/snacks/candy_drop_red(src)
		new /obj/item/gun/projectile/basilisk(src)
		new /obj/item/ammo_magazine/kurz_50/lethal(src)
	else
		new /obj/random/gun_normal(src)
		new /obj/random/gun_normal/low_chance(src)
		new /obj/random/ammo_fancy(src)
		new /obj/random/ammo_fancy(src)
		new /obj/random/ammo_lowcost(src)

/obj/item/storage/box/vendor_lootbox/combat_basic_high
	name = "\"Junk King\" surprise mechanics box"
	desc = "A prospector branded 'surprise mechanics' box, available at the prospector vending machine. While the practice of loading boxes with random junk and selling it lottery style is questionable, \
	people do what they will with their money. This box is weighted towards getting weaponry, the best available."

/obj/item/storage/box/vendor_lootbox/combat_basic_high/populate_contents()
	if(prob(10))
		new /obj/item/stack/medical/bruise_pack/advanced(src)
		new /obj/item/stack/medical/bruise_pack/advanced(src)
		new /obj/item/stack/medical/ointment/advanced(src)
		new /obj/item/stack/medical/ointment/advanced(src)
		new /obj/item/storage/pill_bottle/dylovene(src)
	else if(prob(10))
		new /obj/item/clothing/gloves/thick/combat(src)
		new /obj/item/clothing/shoes/combat(src)
		new /obj/item/reagent_containers/snacks/candy_drop_red(src)
		new /obj/item/gun/projectile/basilisk(src)
		new /obj/item/ammo_magazine/kurz_50/lethal(src)
	else
		new /obj/random/gun_combat(src)
		new /obj/random/gun_combat/low_chance(src)
		new /obj/random/ammo_fancy(src)
		new /obj/random/ammo_fancy(src)
		new /obj/random/ammo_fancy(src)

/obj/item/storage/box/vendor_lootbox/medicine_basic
	name = "\"Tokers\" surprise mechanics box"
	desc = "A prospector branded 'surprise mechanics' box, available at the prospector vending machine. While the practice of loading boxes with random junk and selling it lottery style is questionable, \
	people do what they will with their money. This box is weighted towards getting medical supplies, but its the bottom tier."

/obj/item/storage/box/vendor_lootbox/medicine_basic/populate_contents()
	if(prob(10)) //Lucky!
		new /obj/item/storage/firstaid/regular(src)
		new /obj/item/storage/firstaid/fire(src)
		new /obj/item/storage/firstaid/toxin(src)
		new /obj/item/storage/firstaid/o2(src)
	else if(prob(10)) //Surgeons kit!
		new /obj/item/storage/deferred/surgery(src)
		new /obj/item/reagent_containers/syringe/stim/ultra_surgeon(src)
		new /obj/item/storage/deferred/meds(src)
	else
		new /obj/random/medical_lowcost(src)
		new /obj/random/medical_lowcost(src)
		new /obj/random/medical_lowcost(src)
		new /obj/random/medical_lowcost(src)
		new /obj/random/medical_lowcost(src)
		new /obj/random/medical_lowcost(src)

/obj/item/storage/box/vendor_lootbox/medicine_moderate
	name = "\"Stoners\" surprise mechanics box"
	desc = "A prospector branded 'surprise mechanics' box, available at the prospector vending machine. While the practice of loading boxes with random junk and selling it lottery style is questionable, \
	people do what they will with their money. This box is weighted towards getting medical supplies, with a good chance to get something decent. Maybe."

/obj/item/storage/box/vendor_lootbox/medicine_moderate/populate_contents()
	if(prob(10)) //Lucky!
		new /obj/item/storage/firstaid/regular(src)
		new /obj/item/storage/firstaid/fire(src)
		new /obj/item/storage/firstaid/toxin(src)
		new /obj/item/storage/firstaid/o2(src)
	else if(prob(10)) //Surgeons kit!
		new /obj/item/storage/deferred/surgery(src)
		new /obj/item/reagent_containers/syringe/stim/ultra_surgeon(src)
		new /obj/item/storage/deferred/meds(src)
	else
		new /obj/random/medical(src)
		new /obj/random/medical(src)
		new /obj/random/medical(src)
		new /obj/random/medical(src)
		new /obj/random/medical(src)
		new /obj/random/medical(src)

/obj/item/storage/box/vendor_lootbox/medicine_high
	name = "\"420 Blaze\" surprise mechanics box"
	desc = "A prospector branded 'surprise mechanics' box, available at the prospector vending machine. While the practice of loading boxes with random junk and selling it lottery style is questionable, \
	people do what they will with their money. This box is weighted towards getting medical supplies, this box is the highest tier, meaning you will always (likely) get something good."

/obj/item/storage/box/vendor_lootbox/medicine_high/populate_contents()
	if(prob(10)) //Lucky!
		new /obj/item/storage/firstaid/regular(src)
		new /obj/item/storage/firstaid/fire(src)
		new /obj/item/storage/firstaid/toxin(src)
		new /obj/item/storage/firstaid/o2(src)
	else if(prob(10)) //Surgeons kit!
		new /obj/item/storage/deferred/surgery(src)
		new /obj/item/reagent_containers/syringe/stim/ultra_surgeon(src)
		new /obj/item/storage/deferred/meds(src)
	else
		new /obj/random/medical(src)
		new /obj/random/medical(src)
		new /obj/random/firstaid(src)
		new /obj/random/firstaid(src)
		new /obj/random/firstaid(src)
		new /obj/random/firstaid(src)

/obj/item/storage/box/vendor_lootbox/oddity_low
	name = "\"Kinda Strange\" surprise mechanics box"
	desc = "A prospector branded 'surprise mechanics' box, available at the prospector vending machine. While the practice of loading boxes with random junk and selling it lottery style is questionable, \
	people do what they will with their money. It contains a single oddity or a bluecross item!"

/obj/item/storage/box/vendor_lootbox/oddity_low/populate_contents()
	if(prob(1)) //Lucky!
		new /obj/random/oddity_guns/propis_box(src)
	else
		new /obj/random/common_oddities/always_spawn(src)

/obj/item/storage/box/vendor_lootbox/oddity_moderate
	name = "\"Really Weird\" surprise mechanics box"
	desc = "A prospector branded 'surprise mechanics' box, available at the prospector vending machine. While the practice of loading boxes with random junk and selling it lottery style is questionable, \
	people do what they will with their money. This box has two oddities or a bluecross item!"

/obj/item/storage/box/vendor_lootbox/oddity_moderate/populate_contents()
	if(prob(5)) //Lucky!
		new /obj/random/oddity_guns/propis_box(src)
	else
		new /obj/random/common_oddities/always_spawn(src)
		new /obj/random/common_oddities/always_spawn(src)

/obj/item/storage/box/vendor_lootbox/oddity_high
	name = "\"Impossible\" surprise mechanics box"
	desc = "A prospector branded 'surprise mechanics' box, available at the prospector vending machine. While the practice of loading boxes with random junk and selling it lottery style is questionable, \
	people do what they will with their money. Triple oddities in this one or a bluecross item! Weird!"

/obj/item/storage/box/vendor_lootbox/oddity_high/populate_contents()
	if(prob(10)) //Lucky!
		new /obj/random/oddity_guns/propis_box(src)
	else
		new /obj/random/common_oddities/always_spawn(src)
		new /obj/random/common_oddities/always_spawn(src)
		new /obj/random/common_oddities/always_spawn(src)
