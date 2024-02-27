/datum/design/bioprinter
	build_type = BIOPRINTER
	materials = list(MATERIAL_BIOMATTER = 6)

/datum/design/bioprinter/meat
	name = "Meat"
	build_path = /obj/item/reagent_containers/food/snacks/meat
	materials = list(MATERIAL_BIOMATTER = 5)

/datum/design/bioprinter/milk
	name = "Milk"
	build_path = /obj/item/reagent_containers/food/drinks/milk

/datum/design/bioprinter/soap
	name = "Soap"
	build_path = /obj/item/soap/church

//[NUTRIMENTS]
/datum/design/bioprinter/ez
	name = "EZ-Nutrient"
	build_path = /obj/item/reagent_containers/glass/fertilizer/ez
	materials = list(MATERIAL_BIOMATTER = 3)

/datum/design/bioprinter/l4z
	name = "Left4Zed"
	build_path = /obj/item/reagent_containers/glass/fertilizer/l4z

/datum/design/bioprinter/rh
	name = "Robust Harvest"
	build_path = /obj/item/reagent_containers/glass/fertilizer/rh
	materials = list(MATERIAL_BIOMATTER = 7.5)
//[/NUTRIMENTS]

//[CLOTHES, ARMOR AND ACCESORIES]
/*  //Commented out because broke.
/datum/design/bioprinter/cardboard
	name = "Cardboard"
	build_path = /obj/item/stack/material/cardboard/random // I guess it depends on the protein content.
*/
/datum/design/bioprinter/leather/holster/saber/greatsword/churchprint
	name = "Absolutist Sword Scabbard"
	build_path = /obj/item/clothing/accessory/holster/saber/greatsword/churchprint

/datum/design/bioprinter/wallet
	name = "Wallet"
	build_path = /obj/item/storage/wallet

/datum/design/bioprinter/botanic_leather
	name = "Botanical gloves"
	build_path = /obj/item/clothing/gloves/botanic_leather
	materials = list(MATERIAL_BIOMATTER = 10)

/datum/design/bioprinter/leather
	materials = list(MATERIAL_BIOMATTER = 15)

/datum/design/bioprinter/leather/satchel
	name = "Leather Satchel"
	build_path = /obj/item/storage/backpack/satchel

/datum/design/bioprinter/leather/storage/backpack/satchel/neotheology
	name = "Cruciform  Satchel"
	build_path = /obj/item/storage/backpack/satchel/neotheology

/datum/design/bioprinter/leather/storage/backpack/neotheology
	name = "Cruciform Backpack"
	build_path = /obj/item/storage/backpack/neotheology

/datum/design/bioprinter/leather/storage/backpack/sport/neotheology
	name = "Cruciform Sport Backpack"
	build_path = /obj/item/storage/backpack/sport/neotheology

/datum/design/bioprinter/leather/leather_jacket
	name = "Leather jacket"
	build_path = /obj/item/clothing/suit/storage/toggle/leather

/datum/design/bioprinter/leather/cash_bag
	name = "Cash Bag"
	build_path = /obj/item/storage/bag/money

/datum/design/bioprinter/leather/holster
	name = "shoulder holster"
	build_path = /obj/item/clothing/accessory/holster

/datum/design/bioprinter/leather/holster/armpit
	name = "armpit holster"
	build_path = /obj/item/clothing/accessory/holster/armpit

/datum/design/bioprinter/leather/holster/waist
	name = "waist holster"
	build_path = /obj/item/clothing/accessory/holster/waist

/datum/design/bioprinter/leather/holster/hip
	name = "hip holster"
	build_path = /obj/item/clothing/accessory/holster/hip

/datum/design/bioprinter/leather/holster/leg
	name = "leg holster"
	build_path = /obj/item/clothing/accessory/holster/leg

/datum/design/bioprinter/belt
	materials = list(MATERIAL_BIOMATTER = 10)

/datum/design/bioprinter/belt/utility
	name = "Utility belt"
	build_path = /obj/item/storage/belt/utility

/datum/design/bioprinter/belt/utility/neotheology
	name = "Absolutism utility belt"
	build_path = /obj/item/storage/belt/utility/neotheology

/datum/design/bioprinter/belt/medical
	name = "Medical belt"
	build_path = /obj/item/storage/belt/medical

/datum/design/bioprinter/belt/security
	name = "Tactical belt"
	build_path = /obj/item/storage/belt/security

/datum/design/bioprinter/belt/security/neotheology
	name = "Absolutism tactical belt"
	build_path = /obj/item/storage/belt/security/neotheology

/datum/design/bioprinter/belt/medical/emt
	name = "EMT belt"
	build_path = /obj/item/storage/belt/medical/emt

/datum/design/bioprinter/belt/misc/champion
	name = "Champion belt"
	build_path = /obj/item/storage/belt/champion
	materials = list(MATERIAL_BIOMATTER = 25)

// This separates regular clothes designs from NT clothes designs //
/datum/design/bioprinter/nt_clothes/armor_kit
	name = "Armor Bundle"
	build_path = /obj/item/gunbox/church
	materials = list(MATERIAL_BIOMATTER = 20)

/datum/design/bioprinter/nt_clothes/acolyte_armor
	name = "Vector Armor"
	build_path = /obj/item/clothing/suit/armor/vest/acolyte

/datum/design/bioprinter/nt_clothes/agrolyte_armor
	name = "Agrolyte Armor"
	build_path = /obj/item/clothing/suit/armor/vest/botanist

/datum/design/bioprinter/nt_clothes/custodian_armor
	name = "Custodian Armor"
	build_path = /obj/item/clothing/suit/armor/vest/custodian

/datum/design/bioprinter/nt_clothes/rosaria_armor
	name = "Rosaria Armor"
	build_path = /obj/item/clothing/suit/armor/vest/rosaria

/datum/design/bioprinter/nt_clothes/acolyte_armor_helm
	name = "Vector Helmet"
	build_path = /obj/item/clothing/head/helmet/acolyte

/datum/design/bioprinter/nt_clothes/agrolyte_armor_helm
	name = "Agrolyte Helmet"
	build_path = /obj/item/clothing/head/helmet/botanist

/datum/design/bioprinter/nt_clothes/custodian_armor_helm
	name = "Custodian Helmet"
	build_path = /obj/item/clothing/head/helmet/custodian

/datum/design/bioprinter/nt_clothes/rosaria_armor_helm
	name = "Rosaria Helmet"
	build_path = /obj/item/clothing/head/helmet/rosaria

/datum/design/bioprinter/nt_clothes/sports_jacket
	name = "Sports Jacket"
	build_path = /obj/item/clothing/suit/storage/neotheosports

/datum/design/bioprinter/nt_clothes/acolyte_uniform
	name = "Vector Garment"
	build_path = /obj/item/clothing/under/rank/acolyte

/datum/design/bioprinter/nt_clothes/church_uniform
	name = "Church Garment"
	build_path = /obj/item/clothing/under/rank/church

/datum/design/bioprinter/nt_clothes/rosary
	name = "Fractal Rosary"
	build_path = /obj/item/clothing/accessory/necklace/fractalrosary

/datum/design/bioprinter/nt_clothes/hermes_shoes
	name = "Hermes Boots"
	build_path = /obj/item/clothing/shoes/hermes_shoes

/datum/design/bioprinter/nt_clothes/NTvoid
	name = "Angel Voidsuit"
	build_path = /obj/item/clothing/suit/space/void/NTvoid

/datum/design/bioprinter/nt_clothes/knight_rig
	name = "Knight Hardsuit Module"
	materials = list(MATERIAL_BIOMATTER = 70, MATERIAL_GOLD = 7, MATERIAL_SILVER = 7, MATERIAL_PLASTEEL = 70)
	build_path = /obj/item/rig/combat/knight

//[MELEE]
/datum/design/autolathe/sword/nt_sword
	name = "NT Short Sword"
	build_path = /obj/item/tool/sword/nt/shortsword

/datum/design/autolathe/sword/nt_longsword
	name = "NT Longsword"
	build_path = /obj/item/tool/sword/nt/longsword

/datum/design/autolathe/sword/nt_dagger
	name = "NT Dagger"
	build_path = /obj/item/tool/knife/dagger/nt

/datum/design/autolathe/sword/nt_halberd
	name = "NT Halberd"
	build_path = /obj/item/tool/spear/halberd

/datum/design/autolathe/sword/nt_spear
	name = "NT Spear"
	build_path = /obj/item/tool/sword/nt/spear

/datum/design/autolathe/sword/nt_scourge
	name = "NT Scourge"
	build_path = /obj/item/tool/sword/nt/scourge

/datum/design/autolathe/shield/nt_shield
	name = "NT Shield"
	build_path = /obj/item/shield/riot/nt

/datum/design/autolathe/nt/shield/nt_buckler
	name = "NT Buckler"
	build_path = /obj/item/shield/buckler/nt

/datum/design/autolathe/nt/sword/nt_verutum
	name = "OT Javelin"
	build_path = /obj/item/stack/thrown/nt/verutum

/datum/design/autolathe/tool_upgrade/sanctifier
	name = "NT Sanctifier"
	build_path = /obj/item/tool_upgrade/augment/sanctifier

/datum/design/autolathe/sword/nt_warhammer
	name = "NT Warhammer"
	build_path = /obj/item/tool/sword/nt/warhammer

/datum/design/autolathe/sword/nt_flanged
	name = "NT Flanged Mace"
	build_path = /obj/item/tool/sword/nt/flanged

/datum/design/autolathe/sword/nt_power
	name = "NT Forceblade"
	build_path = /obj/item/tool/sword/nt/power

//[GRENADES]
/datum/design/autolathe/grenade/nt_heatwave
	name = "NT HG \"Inferno\""
	build_path = /obj/item/grenade/heatwave/nt

/datum/design/autolathe/grenade/nt_smokebomb
	name = "NT SG \"Holy Fog\""
	build_path = /obj/item/grenade/smokebomb/nt

/datum/design/autolathe/grenade/nt_frag
	name = "NT DFG \"Holy Thunder\""
	build_path = /obj/item/grenade/frag/nt

/datum/design/autolathe/grenade/nt_flashbang
	name = "NT FBG \"Holy Light\""
	build_path = /obj/item/grenade/flashbang/nt

/datum/design/autolathe/grenade/nt_explosive
	name = "NT OBG \"Holy Grail\""
	build_path = /obj/item/grenade/explosive/nt

//[MED]
/datum/design/bioprinter/medical
	materials = list(MATERIAL_BIOMATTER = 2)

/datum/design/bioprinter/medical/bruise
	name = "Roll of gauze"
	build_path = /obj/item/stack/medical/bruise_pack

/datum/design/bioprinter/medical/splints
	name = "Medical splints"
	build_path = /obj/item/stack/medical/splint

/datum/design/bioprinter/medical/ointment
	name = "Ointment"
	build_path = /obj/item/stack/medical/ointment

/datum/design/bioprinter/medical/advanced
	materials = list("biomatter" = 2)

/datum/design/bioprinter/medical/advanced/bruise
	name = "Advanced trauma kit"
	build_path = /obj/item/stack/medical/bruise_pack/advanced

/datum/design/bioprinter/medical/advanced/ointment
	name = "Advanced burn kit"
	build_path = /obj/item/stack/medical/ointment/advanced

/datum/design/bioprinter/medical/advanced/bruise/nt
	name = "Absolutist trauma kit"
	build_path = /obj/item/stack/medical/bruise_pack/advanced/nt

/datum/design/bioprinter/medical/advanced/ointment/nt
	name = "Absolutist burn kit"
	build_path = /obj/item/stack/medical/ointment/advanced/nt

/datum/design/autolathe/firstaid/nt
	name = "Absolutism Medkit"
	build_path = /obj/item/storage/firstaid/nt

//[/IMPLANTS]

/datum/design/bioprinter/bioimplant
	materials = list(MATERIAL_BIOMATTER = 50)

/datum/design/bioprinter/bioimplant/oscythe
	name = "Organic arm scythe implant"
	build_path = /obj/item/biogoop/armscythe

/datum/design/bioprinter/bioimplant/osurgical
	name = "Organic surgery omnitool implant"
	build_path = /obj/item/biogoop/surgical

/datum/design/bioprinter/bioimplant/oengineering
	name = "Organic engineering omnitool implant"
	build_path = /obj/item/biogoop/engineer

/datum/design/bioprinter/bioimplant/oarmor
	name = "Organic exoskeleton implant"
	build_path = /obj/item/biogoop/armor

/datum/design/bioprinter/bioimplant/omuscle
	name = "Organic muscle implant"
	build_path = /obj/item/biogoop/muscle

//[/CRUCIFORM UPGRAED]

/datum/design/autolathe/cruciform_upgrade
	build_path = /obj/item/cruciform_upgrade

/datum/design/autolathe/cruciform_upgrade/natures_blessing
	name = "Natures blessing"
	build_path = /obj/item/cruciform_upgrade/natures_blessing

/datum/design/autolathe/cruciform_upgrade/faiths_shield
	name = "Faiths shield"
	build_path = /obj/item/cruciform_upgrade/faiths_shield

/datum/design/autolathe/cruciform_upgrade/cleansing_presence
	name = "Cleansing presence"
	build_path = /obj/item/cruciform_upgrade/cleansing_presence

/datum/design/autolathe/cruciform_upgrade/martyr_gift
	name = "Martyr gift"
	build_path = /obj/item/cruciform_upgrade/martyr_gift

/datum/design/autolathe/cruciform_upgrade/wrath_of_god
	name = "Wrath of god"
	build_path = /obj/item/cruciform_upgrade/wrath_of_god

/datum/design/autolathe/cruciform_upgrade/speed_of_the_chosen
	name = "Speed of the chosen"
	build_path = /obj/item/cruciform_upgrade/speed_of_the_chosen

//[/POUCHES]
/datum/design/bioprinter/pouch/ammo
	name = "Ammo pouch"
	build_path = /obj/item/storage/pouch/ammo

/datum/design/bioprinter/pouch/baton_holster
	name = "Baton holster"
	build_path = /obj/item/storage/pouch/baton_holster

/datum/design/bioprinter/pouch/pistol_holster
	name = "Pistol holster"
	build_path = /obj/item/storage/pouch/pistol_holster

/datum/design/bioprinter/pouch/pistol_double
	name = "Belt pistol holster"
	build_path = /obj/item/storage/pouch/pistol_holster/cowboy

/datum/design/bioprinter/pouch/kniferig
	name = "Throwing knives scabbard"
	build_path = /obj/item/storage/pouch/kniferig

/datum/design/bioprinter/pouch/quiver
	name = "arrows quiver"
	build_path = /obj/item/storage/pouch/quiver

/datum/design/bioprinter/pouch/xbowquiver
	name = "crossbow bolts quiver"
	build_path = /obj/item/storage/pouch/bolts

/datum/design/bioprinter/pouch/engineering_supply
	name = "Engineering supplies pouch"
	build_path = /obj/item/storage/pouch/engineering_supply

/datum/design/bioprinter/pouch/engineering_tools
	name = "Engineering tools pouch"
	build_path = /obj/item/storage/pouch/engineering_tools

/datum/design/bioprinter/pouch/janitor_supply
	name = "Janitor supplies pouch"
	build_path = /obj/item/storage/pouch/janitor_supply

/datum/design/bioprinter/pouch/small_generic/purple
	name = "Small generic purple pouch"
	build_path = /obj/item/storage/pouch/small_generic/purple

/datum/design/bioprinter/pouch/small_generic
	name = "Small generic pouch"
	build_path = /obj/item/storage/pouch/small_generic

/datum/design/bioprinter/pouch/medium_generic
	name = "Medium generic pouch"
	build_path = /obj/item/storage/pouch/medium_generic

/datum/design/bioprinter/pouch/large_generic
	name = "Large generic pouch"
	build_path = /obj/item/storage/pouch/large_generic

/datum/design/bioprinter/pouch/tubular
	name = "Tubular pouch"
	build_path = /obj/item/storage/pouch/tubular

/datum/design/bioprinter/pouch/tubular/vial
	name = "Tubular vial pouch"
	build_path = /obj/item/storage/pouch/tubular/vial

/datum/design/bioprinter/sling
	name = "Universal sling"
	build_path = /obj/item/clothing/suit/sling

//[Gun/Mods form the bioprinter]
/datum/design/autolathe/gun/plasma/martyr
	name = "NT PR \"Martyr\""
	build_path = /obj/item/gun/energy/plasma/martyr

/datum/design/autolathe/gun_upgrade/barrel/excruciator
	name = "New Testament \"EXCRUCIATOR\" giga lens"
	build_path = /obj/item/gun_upgrade/barrel/excruciator

/datum/design/bioprinter/holyvacuum
	name = "\"Tersus\" Vacuum Cleaner"
	build_path = /obj/item/holyvacuum

//[CELLS]
/datum/design/bioprinter/nt_cells/large
	name = "NT \"Spark 13000L\""
	build_path = /obj/item/cell/large/neotheology
	materials = list(MATERIAL_STEEL = 3, MATERIAL_BIOMATTER = 15)

/datum/design/bioprinter/nt_cells/large/plasma
	name = "NT \"Radiance 20000L\""
	build_path = /obj/item/cell/large/neotheology/plasma
	materials = list(MATERIAL_STEEL = 3, MATERIAL_BIOMATTER = 15, MATERIAL_PLASMA = 1)

/datum/design/bioprinter/nt_cells/medium
	name = "NT \"Spark 1000M\""
	build_path = /obj/item/cell/medium/neotheology/
	materials = list(MATERIAL_STEEL = 2, MATERIAL_BIOMATTER = 10)

/datum/design/bioprinter/nt_cells/medium/plasma
	name = "NT \"Radiance 1500M\""
	build_path = /obj/item/cell/medium/neotheology/plasma
	materials = list(MATERIAL_STEEL = 2, MATERIAL_BIOMATTER = 10, MATERIAL_PLASMA = 0.6) //This is to keep things in 5s or

/datum/design/bioprinter/nt_cells/small
	name = "NT \"Spark 300S\""
	build_path = /obj/item/cell/small/neotheology/
	materials = list(MATERIAL_STEEL = 1, MATERIAL_BIOMATTER = 5)

/datum/design/bioprinter/nt_cells/small/plasma
	name = "NT \"Radiance 500S\""
	build_path = /obj/item/cell/small/neotheology/plasma
	materials = list(MATERIAL_STEEL = 1, MATERIAL_BIOMATTER = 5, MATERIAL_PLASMA = 0.2)
