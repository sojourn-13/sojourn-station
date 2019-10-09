/obj/structure/closet/secure_closet/personal/botanist
	name = "botanist's locker"
	req_access = list(access_hydroponics)
	icon_state = "botanist"

/obj/structure/closet/secure_closet/personal/hydroponics/populate_contents()
	new /obj/item/clothing/suit/rank/botanist(src)
	new /obj/item/weapon/storage/belt/church(src)
	new /obj/item/weapon/storage/bag/plants(src)
	new /obj/item/clothing/under/rank/botanist(src)
	new /obj/item/device/scanner/plant(src)
	new /obj/item/device/radio/headset/church(src)
	new /obj/item/clothing/mask/rank/botanist(src)
	new /obj/item/weapon/material/minihoe(src)
	new /obj/item/weapon/material/hatchet(src)
	new /obj/item/weapon/tool/wirecutters(src)
	new /obj/item/weapon/reagent_containers/spray/plantbgone(src)
	new /obj/item/clothing/suit/armor/vest/botanist(src)
	new /obj/item/clothing/head/helmet/botanist(src)
	if(prob(50))
		new /obj/item/weapon/storage/backpack/church(src)
	else
		new /obj/item/weapon/storage/backpack/satchel/church(src)