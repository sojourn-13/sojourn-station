/datum/craft_recipe/armor
	category = "Armor"
	time = 60
	related_stats = list(STAT_COG)
	icon_state = "armor_part"

// Actual armor recipes

/datum/craft_recipe/armor/juggernaut_helm
	name = "Juggernaut bomb helmet"
	result = /obj/item/clothing/head/helmet/space/bomb/security
	steps = list(
		list(/obj/item/clothing/head/helmet/space/bomb, 1, "time" = 60),
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTIC),
		list(/obj/item/tool_upgrade/armor/melee, 1, "time" = 60),
		list(CRAFT_MATERIAL, 10, MATERIAL_STEEL),
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTEEL),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(/obj/item/tool_upgrade/armor/bullet, 1, "time" = 60),
		list(CRAFT_MATERIAL, 10, MATERIAL_SILK),
		list(QUALITY_HAMMERING, 30, "time" = 60),
		list(/obj/item/tool_upgrade/reinforcement/rubbermesh, 1, "time" = 60),
		list(QUALITY_WELDING, 30, "time" = 60)
	)

/datum/craft_recipe/armor/juggernaut_suit
	name = "Juggernaut bomb suit"
	result = /obj/item/clothing/suit/space/bomb/security
	steps = list(
		list(/obj/item/clothing/suit/space/bomb, 1, "time" = 60),
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTIC),
		list(/obj/item/tool_upgrade/armor/melee, 1, "time" = 60),
		list(CRAFT_MATERIAL, 10, MATERIAL_STEEL),
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTEEL),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(/obj/item/tool_upgrade/armor/bullet, 1, "time" = 60),
		list(CRAFT_MATERIAL, 10, MATERIAL_SILK),
		list(QUALITY_HAMMERING, 30, "time" = 60),
		list(/obj/item/tool_upgrade/reinforcement/rubbermesh, 1, "time" = 60),
		list(QUALITY_WELDING, 30, "time" = 60)
	)

// Masacre poor bucket, but gain some better protection. Cut bigger holes for eyes, drill small ones for some air.
/datum/craft_recipe/armor/cheap_greathelm
	name = "bucket-helm"
	result = /obj/item/clothing/head/helmet/handmade/greathelm
	steps = list(
		list(/obj/item/reagent_containers/glass/bucket, 1, "time" = 30),
		list(QUALITY_CUTTING, 15, 120),
		list(QUALITY_DRILLING, 10, 60),
		list(CRAFT_MATERIAL, 6, MATERIAL_STEEL),
		list(/obj/item/stack/cable_coil, 4)
	)

/datum/craft_recipe/armor/armorvest
	name = "handmade armor vest"
	result = /obj/item/clothing/suit/armor/vest/handmade
	steps = list(
		list(/obj/item/clothing/suit/storage/hazardvest, 1, "time" = 30),
		list(CRAFT_MATERIAL, 4, MATERIAL_STEEL),
		list(/obj/item/stack/cable_coil, 4)
	)

/datum/craft_recipe/armor/woodenarmor
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

// Add some steel to gloves. Simple.
/datum/craft_recipe/armor/combat_gloves
	name = "combat gloves"
	result = /obj/item/clothing/gloves/thick/handmade
	icon_state = "clothing"
	steps = list(
		list(/obj/item/clothing/gloves/thick, 1, "time" = 15),
		list(CRAFT_MATERIAL, 2, MATERIAL_STEEL),
		list(/obj/item/stack/cable_coil, 2)
	)

/datum/craft_recipe/armor/scav_gloves
	name = "scavenger gloves"
	result = /obj/item/clothing/gloves/dusters/scav_gloves
	icon_state = "armor_part"
	steps = list(
		list(/obj/item/clothing/gloves/thick/handmade, 1, "time" = 15), // Grab combat gloves
		list(/obj/item/clothing/gloves/dusters/plasteel, 1, "time" = 15), // Attach knuckle dusters
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTEEL), // Plate the armguards with extra plasteel...
		list(QUALITY_WELDING, 10, 20) // ...And weld it in place!
	)

/datum/craft_recipe/armor/combat_helmet
	name = "combat helmet"
	result = /obj/item/clothing/head/helmet/handmade
	steps = list(
		list(/obj/item/reagent_containers/glass/bucket, 1, "time" = 30),
		list(CRAFT_MATERIAL, 4, MATERIAL_STEEL),
		list(/obj/item/stack/cable_coil, 2)
	)

/datum/craft_recipe/armor/riggedvoidsuit_helmet
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

/datum/craft_recipe/armor/riggedvoidsuit
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

/datum/craft_recipe/armor/scavengerarmor
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

/datum/craft_recipe/armor/scavengerhelmet
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

/datum/craft_recipe/armor/heavy_scav
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

/datum/craft_recipe/armor/heavy_scav_helm
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

/****************************
* 	Full body armor vests
****************************/

/datum/craft_recipe/armor/armorvest/full
	name = "handmade full armor vest"
	result = /obj/item/clothing/suit/armor/vest/handmade/full
	steps = list(
		list(/obj/item/clothing/suit/armor/vest/handmade, 1, "time" = 30),
		list(/obj/item/clothing/under, 1),
		list(QUALITY_CUTTING, 15, 30),
		list(CRAFT_MATERIAL, 4, MATERIAL_STEEL), // One metal per limb
		list(QUALITY_ADHESIVE, 15, 30)
	)

/datum/craft_recipe/armor/fullbodyarmor
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

/datum/craft_recipe/armor/mtua
	name = "marshal tactical unit armor"
	result = /obj/item/clothing/suit/armor/vest/ironhammer/full
	steps = list(
		list(/obj/item/clothing/suit/armor/vest/ironhammer, 1, "time" = 30),
		list(/obj/item/clothing/under, 1),
		list(QUALITY_CUTTING, 15, 30),
		list(CRAFT_MATERIAL, 4, MATERIAL_STEEL), // One metal per limb
		list(QUALITY_ADHESIVE, 15, 30)
	)

/datum/craft_recipe/armor/platecarrier
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

/datum/craft_recipe/armor/platecarrier_bs
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

/datum/craft_recipe/armor/corpsmenplate
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

/datum/craft_recipe/armor/iambulletproof
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

/datum/craft_recipe/armor/fullmetalflaket
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

/datum/craft_recipe/armor/flak_bs
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

/datum/craft_recipe/armor/commanderflak
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
/datum/craft_recipe/armor/woplate
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

/datum/craft_recipe/armor/breach2
	name = "chemical breacher vest"
	result =  /obj/item/clothing/suit/storage/vest/breach2
	steps = list(
		list(/obj/item/clothing/suit/armor/vest/breach1, 1, "time" = 30),
		list(/obj/item/clothing/suit/storage/vest/chestrig, 1),
		list(QUALITY_ADHESIVE, 15, 30),
		list(QUALITY_CUTTING, 30, 30)
	)