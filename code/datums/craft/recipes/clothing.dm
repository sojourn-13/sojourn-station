/datum/craft_recipe/clothing
	category = "Clothing"
	icon_state = "armor_part"
	time = 50
	related_stats = list(STAT_COG)

/datum/craft_recipe/clothing/armorvest
	name = "handmade armor vest"
	result = /obj/item/clothing/suit/armor/vest/handmade
	steps = list(
		list(/obj/item/clothing/suit/storage/hazardvest, 1, "time" = 30),
		list(CRAFT_MATERIAL, 4, MATERIAL_STEEL),
		list(/obj/item/stack/cable_coil, 4)
	)

/datum/craft_recipe/clothing/armorvest/full
	name = "handmade full armor vest"
	result = /obj/item/clothing/suit/armor/vest/handmade/full
	steps = list(
		list(/obj/item/clothing/suit/armor/vest/handmade, 1, "time" = 30),
		list(/obj/item/clothing/under, 1),
		list(QUALITY_CUTTING, 15, 30),
		list(CRAFT_MATERIAL, 4, MATERIAL_STEEL), // One metal per limb
		list(QUALITY_ADHESIVE, 15, 30)
	)

/datum/craft_recipe/clothing/balaclava
	name = "balaclava"
	result = /obj/item/clothing/mask/balaclava
	steps = list(
		list(/obj/item/stack/material/cloth, 10, time = 15),
		list(QUALITY_CUTTING, 10, 60)
	)

/datum/craft_recipe/clothing/handmadebelt
	name = "hand-made tool belt"
	result = /obj/item/storage/belt/utility/handmade
	icon_state = "clothing"
	steps = list(
		list(/obj/item/stack/cable_coil, 30, time = 15),
		list(QUALITY_CUTTING, 10, 60)
	)

/datum/craft_recipe/clothing/blindfold
	name = "blindfold"
	result = /obj/item/clothing/glasses/blindfold
	icon_state = "clothing"
	steps = list(
		list(/obj/item/stack/material/cloth, 5, time = 15),
		list(QUALITY_CUTTING, 10, 60)
	)

// Masacre poor bucket, but gain some better protection. Cut bigger holes for eyes, drill small ones for some air.
/datum/craft_recipe/clothing/cheap_greathelm
	name = "bucket-helm"
	result = /obj/item/clothing/head/helmet/handmade/greathelm
	steps = list(
		list(/obj/item/reagent_containers/glass/bucket, 1, "time" = 30),
		list(QUALITY_CUTTING, 15, 120),
		list(QUALITY_DRILLING, 10, 60),
		list(CRAFT_MATERIAL, 6, MATERIAL_STEEL),
		list(/obj/item/stack/cable_coil, 4)
	)

/datum/craft_recipe/clothing/cardborg_helmet
	name = "cardborg helmet"
	result = /obj/item/clothing/head/costume/halloween/cardborg
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD)
	)

/datum/craft_recipe/clothing/cardborg_suit
	name = "cardborg suit"
	result = /obj/item/clothing/suit/costume/halloween/cardborg
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_CARDBOARD)
	)

// Add some steel to gloves. Simple.
/datum/craft_recipe/clothing/combat_gloves
	name = "combat gloves"
	result = /obj/item/clothing/gloves/thick/handmade
	icon_state = "clothing"
	steps = list(
		list(/obj/item/clothing/gloves/thick, 1, "time" = 15),
		list(CRAFT_MATERIAL, 2, MATERIAL_STEEL),
		list(/obj/item/stack/cable_coil, 2)
	)

/datum/craft_recipe/clothing/scav_gloves
	name = "scavenger gloves"
	result = /obj/item/clothing/gloves/dusters/scav_gloves
	icon_state = "armor_part"
	steps = list(
		list(/obj/item/clothing/gloves/thick/handmade, 1, "time" = 15), // Grab combat gloves
		list(/obj/item/clothing/gloves/dusters/plasteel, 1, "time" = 15), // Attach knuckle dusters
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTEEL), // Plate the armguards with extra plasteel...
		list(QUALITY_WELDING, 10, 20) // ...And weld it in place!
	)

/datum/craft_recipe/clothing/combat_helmet
	name = "combat helmet"
	result = /obj/item/clothing/head/helmet/handmade
	steps = list(
		list(/obj/item/reagent_containers/glass/bucket, 1, "time" = 30),
		list(CRAFT_MATERIAL, 4, MATERIAL_STEEL),
		list(/obj/item/stack/cable_coil, 2)
	)

/datum/craft_recipe/clothing/chest_rig
	name = "chest rig"
	result = /obj/item/clothing/suit/storage/vest/chestrig
	steps = list(
		list(/obj/item/stack/medical/bruise_pack/handmade, 3, "time" = 10),
		list(/obj/item/stack/rods, 2, "time" = 10),
		list(/obj/item/stack/cable_coil, 2)
	)

/datum/craft_recipe/clothing/riggedvoidsuit_helmet
	name = "makeshift armored void suit helmet"
	result = /obj/item/clothing/head/space/void/riggedvoidsuit
	steps = list(
		list(/obj/item/clothing, 1, time = 30),
		list(CRAFT_MATERIAL, 6, MATERIAL_STEEL),
		list(CRAFT_MATERIAL, 4, MATERIAL_PLASTIC),
		list(CRAFT_MATERIAL, 3, MATERIAL_GLASS),
		list(/obj/item/stack/cable_coil, 2),
		list(QUALITY_ADHESIVE, 15, "time" = 60)
	)

/datum/craft_recipe/clothing/riggedvoidsuit
	name = "makeshift armored void suit"
	result = /obj/item/clothing/suit/space/void/riggedvoidsuit
	steps = list(
		list(/obj/item/clothing/under, 1),
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTEEL),
		list(CRAFT_MATERIAL, 20, MATERIAL_PLASTIC),
		list(QUALITY_ADHESIVE, 15, "time" = 60),
		list(CRAFT_MATERIAL, 10, MATERIAL_GLASS),
		list(QUALITY_WELDING, 10, 20)
	)

/datum/craft_recipe/clothing/scavengerarmor
	name = "scavenger armor"
	result = /obj/item/clothing/suit/storage/scavengerarmor
	steps = list(
		list(/obj/item/clothing/under, 1),
		list(CRAFT_MATERIAL, 10, MATERIAL_STEEL), // Melee
		list(CRAFT_MATERIAL, 5, MATERIAL_PLASTEEL), // Bullets
		list(QUALITY_WELDING, 10, 20),
		list(CRAFT_MATERIAL, 10, MATERIAL_GLASS), // Reflective plating?
		list(QUALITY_ADHESIVE, 15, "time" = 60)
	)

/datum/craft_recipe/clothing/scavengerhelmet
	name = "Scavenger Helmet"
	result = /obj/item/clothing/head/helmet/handmade/scavengerhelmet
	steps = list(
		list(/obj/item/clothing/head/helmet/handmade, 1), // Take your average combat helm
		list(CRAFT_MATERIAL, 2, MATERIAL_STEEL), // More internal padding
		list(QUALITY_HAMMERING, 10, 15), // Hammer it into place...
		list(QUALITY_ADHESIVE, 15, 15), // Make sure it sticks!
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTEEL), // Prepare the additional external plates...
		list(QUALITY_WELDING, 10, 20), // ...and weld them into place, tadah!
	)

/datum/craft_recipe/clothing/heavy_scav
	name = "scavenger plate armor"
	result = /obj/item/clothing/suit/storage/scav_heavy
	steps = list(
		list(/obj/item/clothing/suit/storage/scavengerarmor, 1),
		list(QUALITY_CUTTING, 15, 15), //Cut apart the armour to be remade
		list(CRAFT_MATERIAL, 8, MATERIAL_PLASTEEL), //Insert plasteel plates
		list(QUALITY_HAMMERING, 20, 15), //Hammer sheets into place
		list(QUALITY_WELDING, 30, 15), //Weld the sheets in
		list(CRAFT_MATERIAL, 6, MATERIAL_CLOTH), //Extra padding
		list(/obj/item/stack/cable_coil, 4), //Secure the padding
		list(QUALITY_ADHESIVE, 20, 15) //And seal it!
	)

/datum/craft_recipe/clothing/heavy_scav_helm
	name = "scavenger plate helm"
	result = /obj/item/clothing/head/helmet/scav_heavy
	steps = list(
		list(/obj/item/clothing/head/helmet/handmade/scavengerhelmet, 1),
		list(QUALITY_CUTTING, 15, 15), //Cut apart the helmet to be remade
		list(CRAFT_MATERIAL, 6, MATERIAL_PLASTEEL), //Insert plasteel plates
		list(QUALITY_HAMMERING, 20, 15), //Hammer sheets into place
		list(QUALITY_WELDING, 30, 15), //Weld the sheets in
		list(CRAFT_MATERIAL, 4, MATERIAL_RGLASS), //Welding shield
		list(/obj/item/stack/cable_coil, 6), //Secure the padding
		list(QUALITY_ADHESIVE, 20, 15) //And seal it!
	)

/datum/craft_recipe/clothing/muzzle
	name = "muzzle"
	result = /obj/item/clothing/mask/muzzle
	icon_state = "clothing"
	steps = list(
		list(/obj/item/stack/material/cloth, 5, time = 15),
		list(CRAFT_MATERIAL, 1, MATERIAL_STEEL),
		list(QUALITY_CUTTING, 10, 60)
	)

// Butcher some clothes into rags to make some cloak
/datum/craft_recipe/clothing/cloak
	name = "ragged cloak"
	result = /obj/item/clothing/suit/hooded/cloak/simple
	icon_state = "clothing"
	steps = list(
		list(/obj/item/clothing, 1, time = 30),
		list(/obj/item/clothing, 1, time = 30),
		list(QUALITY_CUTTING, 10, 60)
	)

/datum/craft_recipe/clothing/sandals
	name = "wooden sandals"
	result = /obj/item/clothing/shoes/sandal
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_WOOD)
	)

/****************************
* 	Full body armor vests
****************************/

/datum/craft_recipe/clothing/fullbodyarmor
	name = "full body armor"
	result = /obj/item/clothing/suit/armor/vest/full
	steps = list(
		list(/obj/item/clothing/suit/armor/vest, 1, "time" = 30), //TODO: a better way to do this, every children of armor/vest will be eligible for crafting this one...
		list(/obj/item/clothing/under, 1),
		list(QUALITY_CUTTING, 15, 30),
		list(CRAFT_MATERIAL, 4, MATERIAL_STEEL), // One sheet per limb
		list(CRAFT_MATERIAL, 4, MATERIAL_PLASTIC),
		list(QUALITY_ADHESIVE, 15, 30)
	)

/datum/craft_recipe/clothing/mtua
	name = "marshal tactical unit armor"
	result = /obj/item/clothing/suit/armor/vest/ironhammer/full
	steps = list(
		list(/obj/item/clothing/suit/armor/vest/ironhammer, 1, "time" = 30),
		list(/obj/item/clothing/under, 1),
		list(QUALITY_CUTTING, 15, 30),
		list(CRAFT_MATERIAL, 4, MATERIAL_STEEL), // One metal per limb
		list(QUALITY_ADHESIVE, 15, 30)
	)

/datum/craft_recipe/clothing/platecarrier
	name = "full body plate carrier"
	result = /obj/item/clothing/suit/armor/platecarrier/full
	steps = list(
		list(/obj/item/clothing/suit/armor/platecarrier, 1, "time" = 30),
		list(/obj/item/clothing/under, 1),
		list(QUALITY_CUTTING, 15, 30),
		list(CRAFT_MATERIAL, 4, MATERIAL_STEEL), // One metal per limb
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTEEL),
		list(QUALITY_WELDING, 15, 30),
		list(QUALITY_ADHESIVE, 15, 30)
	)

/datum/craft_recipe/clothing/platecarrier_bs
	name = "blackshield full body plate carrier"
	result = /obj/item/clothing/suit/armor/platecarrier/militia/full
	steps = list(
		list(/obj/item/clothing/suit/armor/platecarrier/militia, 1, "time" = 30),
		list(/obj/item/clothing/under, 1),
		list(QUALITY_CUTTING, 15, 30),
		list(CRAFT_MATERIAL, 4, MATERIAL_STEEL), // One metal per limb
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTEEL),
		list(QUALITY_WELDING, 15, 30),
		list(QUALITY_ADHESIVE, 15, 30)
	)

/datum/craft_recipe/clothing/corpsmenplate
	name = "corpsman full body plate carrier"
	result = /obj/item/clothing/suit/armor/platecarrier/corpsman/full
	steps = list(
		list(/obj/item/clothing/suit/armor/platecarrier/corpsman, 1, "time" = 30),
		list(/obj/item/clothing/under, 1),
		list(QUALITY_CUTTING, 15, 30),
		list(CRAFT_MATERIAL, 4, MATERIAL_STEEL), // One metal per limb
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTEEL),
		list(QUALITY_WELDING, 15, 30),
		list(QUALITY_ADHESIVE, 15, 30)
	)

/datum/craft_recipe/clothing/iambulletproof
	name = "bulletproof suit"
	result = /obj/item/clothing/suit/armor/bulletproof/full
	steps = list(
		list(/obj/item/clothing/suit/armor/bulletproof/, 1, "time" = 30),
		list(/obj/item/clothing/under, 1),
		list(QUALITY_CUTTING, 15, 30),
		list(CRAFT_MATERIAL, 4, MATERIAL_STEEL), // One metal per limb
		list(CRAFT_MATERIAL, 4, MATERIAL_PLASTEEL),
		list(QUALITY_WELDING, 15, 30),
		list(QUALITY_ADHESIVE, 15, 30)
	)

/datum/craft_recipe/clothing/fullmetalflaket
	name = "full body flak vest"
	result = /obj/item/clothing/suit/armor/flakvest/full
	steps = list(
		list(/obj/item/clothing/suit/armor/flakvest, 1, "time" = 30),
		list(/obj/item/clothing/under, 1),
		list(QUALITY_CUTTING, 15, 30),
		list(CRAFT_MATERIAL, 4, MATERIAL_STEEL), // One metal per limb
		list(CRAFT_MATERIAL, 4, MATERIAL_STEEL), // One metal per limb
		list(CRAFT_MATERIAL, 4, MATERIAL_PLASTEEL),
		list(QUALITY_WELDING, 15, 30),
		list(QUALITY_ADHESIVE, 15, 30)
	)

/datum/craft_recipe/clothing/flak_bs
	name = "blackshield full flak vest"
	result = /obj/item/clothing/suit/armor/flakvest/militia/full
	steps = list(
		list(/obj/item/clothing/suit/armor/flakvest/militia, 1, "time" = 30),
		list(/obj/item/clothing/under, 1),
		list(QUALITY_CUTTING, 15, 30),
		list(CRAFT_MATERIAL, 4, MATERIAL_STEEL), // One metal per limb
		list(CRAFT_MATERIAL, 4, MATERIAL_PLASTEEL),
		list(QUALITY_WELDING, 15, 30),
		list(QUALITY_ADHESIVE, 15, 30)
	)

/datum/craft_recipe/clothing/commanderflak
	name = "blackshield commander's full flak vest"
	result = /obj/item/clothing/suit/armor/flakvest/commander/full
	steps = list(
		list(/obj/item/clothing/suit/armor/flakvest/commander, 1, "time" = 30),
		list(/obj/item/clothing/under, 1),
		list(QUALITY_CUTTING, 15, 30),
		list(CRAFT_MATERIAL, 4, MATERIAL_STEEL),
		list(CRAFT_MATERIAL, 4, MATERIAL_PLASTEEL), // In accordance to flak vests
		list(QUALITY_WELDING, 15, 30),
		list(QUALITY_ADHESIVE, 15, 30)
	)
/datum/craft_recipe/clothing/woplate
	name = "warrant officer's full advanced plate carrier"
	result =  /obj/item/clothing/suit/armor/platecarrier/hos/full
	steps = list(
		list(/obj/item/clothing/suit/armor/platecarrier/hos, 1, "time" = 30),
		list(/obj/item/clothing/under, 1),
		list(QUALITY_CUTTING, 15, 30),
		list(CRAFT_MATERIAL, 4, MATERIAL_STEEL),
		list(CRAFT_MATERIAL, 4, MATERIAL_PLASTEEL), // In accordance to flak vests
		list(QUALITY_WELDING, 15, 30),
		list(QUALITY_ADHESIVE, 15, 30)
	)

/***********************
* 	Outsider crafts
************************/

/datum/craft_recipe/clothing/woodenarmor
	name = "wooden armor"
	result = /obj/item/clothing/suit/armor/vest/handmadewooden
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_WOOD),
		list(QUALITY_SAWING, 10, 60),
		list(CRAFT_MATERIAL, 2, MATERIAL_STEEL),
		list(/obj/item/stack/material/cloth, 2, time = 30),
		list(QUALITY_CUTTING, 10, 30)
	)

/datum/craft_recipe/clothing/tac_clothes
	name = "tactical baggy rags"
	result = /obj/item/clothing/under/outcast
	icon_state = "clothing"
	steps = list(
		list(/obj/item/clothing, 1, time = 30),
		list(/obj/item/clothing, 1, time = 30),
		list(QUALITY_CUTTING, 15, 30),
		list(CRAFT_MATERIAL, 5, MATERIAL_LEATHER, "time" = 60),
		list(QUALITY_SAWING, 15, 30)
		)

/datum/craft_recipe/clothing/outsider_cloak
	name = "outcast's cloak"
	result = /obj/item/clothing/suit/storage/raggedcape
	icon_state = "clothing"
	steps = list(
		list(/obj/item/clothing, 1, time = 30),
		list(/obj/item/clothing, 1, time = 30),
		list(QUALITY_CUTTING, 15, 30),
		list(CRAFT_MATERIAL, 5, MATERIAL_LEATHER, "time" = 60),
		list(QUALITY_SAWING, 15, 30)
		)

/datum/craft_recipe/clothing/outsider_hood
	name = "outcast's hood"
	result = /obj/item/clothing/head/outcasthood
	icon_state = "clothing"
	steps = list(
		list(/obj/item/clothing, 1, time = 30),
		list(/obj/item/clothing, 1, time = 30),
		list(QUALITY_CUTTING, 15, 30),
		list(CRAFT_MATERIAL, 1, MATERIAL_LEATHER, "time" = 60),
		list(QUALITY_SAWING, 15, 30)
		)

/datum/craft_recipe/clothing/outsider_cape
	name = "outcast's cape"
	result = /obj/item/clothing/accessory/cape/outsider
	icon_state = "clothing"
	steps = list(
		list(/obj/item/clothing/suit/storage/raggedcape, 1, "time" = 30),
		list(QUALITY_CUTTING, 15, 30)
	)
/datum/craft_recipe/clothing/tribalhide
	name = "Tribal Hides"
	result =  /obj/item/clothing/under/tribalhide
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_LEATHER, "time" = 60),
		list(QUALITY_CUTTING, 15, 30),
	)

/datum/craft_recipe/clothing/swat_yellow
	name = "insulated combat gloves"
	result = /obj/item/clothing/gloves/thick/swat/insulated
	steps = list(
		list(/obj/item/clothing/gloves/thick/swat, 1, "time" = 30),
		list(QUALITY_CUTTING, 15, 30),
		list(/obj/item/clothing/gloves/insulated, 1, "time" = 30),
		list(QUALITY_CUTTING, 15, 30),
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTIC), //So if we use buget we have a reason to think its really shock proof
		list(QUALITY_WELDING, 10, "time" = 30), //melt down things
		list(QUALITY_HAMMERING, 15, 10) //Harden into shape
	)

// Nuckle Dusters and melee based things

/datum/craft_recipe/clothing/dusters
	name = "steel knuckle dusters"
	result = /obj/item/clothing/gloves/dusters
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_STEEL), //Grab some steel
		list(QUALITY_WELDING, 10, "time" = 30), //Weld it into basic form
		list(QUALITY_HAMMERING, 15, 10) //Harden into shape
	)

/datum/craft_recipe/clothing/dusters/silver
	name = "silver knuckle dusters"
	result = /obj/item/clothing/gloves/dusters/silver
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_SILVER), //Grab some silver
		list(QUALITY_WELDING, 10, "time" = 30), //Weld it into basic form
		list(QUALITY_HAMMERING, 15, 10) //Harden into shape
	)

/datum/craft_recipe/clothing/dusters/plasteel
	name = "plasteel knuckle dusters"
	result = /obj/item/clothing/gloves/dusters/plasteel
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTEEL), //Grab some plasteel
		list(QUALITY_WELDING, 10, "time" = 30), //Weld it into basic form
		list(QUALITY_HAMMERING, 15, 10) //Harden into shape
	)

/datum/craft_recipe/clothing/dusters/gold
	name = "golden knuckle dusters"
	result = /obj/item/clothing/gloves/dusters/gold
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_GOLD), //Grab some gold
		list(CRAFT_MATERIAL, 3, MATERIAL_PLATINUM), //Grab some platinum as well
		list(QUALITY_WELDING, 10, "time" = 30), //Weld it into basic form
		list(QUALITY_HAMMERING, 15, 10) //Harden into shape
	)

/datum/craft_recipe/clothing/dusters/platinum
	name = "spiked platinum knuckle dusters"
	result = /obj/item/clothing/gloves/dusters/platinum
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_PLATINUM), //Grab some platinum
		list(QUALITY_WELDING, 10, "time" = 30), //Weld it into basic form
		list(QUALITY_HAMMERING, 15, 10), //Harden into shape
		list(/obj/item/tool_upgrade/augment/spikes, 1, "time" = 10) //Put 'spiked' in the name
	)

/datum/craft_recipe/clothing/dusters/gloves
	name = "weighted knuckle gloves"
	result = /obj/item/clothing/gloves/dusters/gloves
	steps = list(
		list(/obj/item/clothing/gloves/dusters, 1, "time" = 5), //Tear up the gloves
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTEEL), //Grab some plasteel
		list(QUALITY_HAMMERING, 15, 10), //Harden into powder
		list(QUALITY_HAMMERING, 15, 10), //Harden into FINE powder
		list(/obj/item/stack/medical/bruise_pack/handmade, 2, "time" = 10) //Cover the holes up
	)
