/obj/random/furniture/bedsheet /*Ignores the silly looking mime, clown, ian, captain, and medical bedsheets.*/
	name = "random bedsheet"
	icon = 'icons/obj/bedsheets.dmi'
	icon_state = "sheet"

/obj/random/furniture/bedsheet/item_to_spawn()
	return pick(/obj/item/weapon/bedsheet,\
				/obj/item/weapon/bedsheet/blue,\
				/obj/item/weapon/bedsheet/green,\
				/obj/item/weapon/bedsheet/orange,\
				/obj/item/weapon/bedsheet/purple,\
				/obj/item/weapon/bedsheet/rainbow,\
				/obj/item/weapon/bedsheet/red,\
				/obj/item/weapon/bedsheet/yellow,\
				/obj/item/weapon/bedsheet/rd,\
				/obj/item/weapon/bedsheet/hos,\
				/obj/item/weapon/bedsheet/hop,\
				/obj/item/weapon/bedsheet/ce,\
				/obj/item/weapon/bedsheet/brown)

/obj/random/furniture/bedsheetdouble
	name = "random double bedsheet"
	icon = 'icons/obj/bedsheets.dmi'
	icon_state = "doublesheet"

/obj/random/furniture/bedsheetdouble/item_to_spawn()
	return pick(/obj/item/weapon/bedsheet/double,\
				/obj/item/weapon/bedsheet/bluedouble,\
				/obj/item/weapon/bedsheet/greendouble,\
				/obj/item/weapon/bedsheet/orangedouble,\
				/obj/item/weapon/bedsheet/purpledouble,\
				/obj/item/weapon/bedsheet/rainbowdouble,\
				/obj/item/weapon/bedsheet/reddouble,\
				/obj/item/weapon/bedsheet/yellowdouble,\
				/obj/item/weapon/bedsheet/rddouble,\
				/obj/item/weapon/bedsheet/hosdouble,\
				/obj/item/weapon/bedsheet/hopdouble,\
				/obj/item/weapon/bedsheet/cedouble,\
				/obj/item/weapon/bedsheet/browndouble)

/obj/random/furniture/painting /*Ignores monkey painting and the communist portraits*/
	name = "random painting"
	icon = 'icons/obj/decals-painting.dmi'
	icon_state = "painting3"

/obj/random/furniture/painting/item_to_spawn()
	return pick(/obj/structure/sign/painting/paintingwaves,\
				/obj/structure/sign/painting/paintingstreet,\
				/obj/structure/sign/painting/paintingsunset,\
				/obj/structure/sign/painting/paintingvalley,\
				/obj/structure/sign/painting/paintingtable,\
				/obj/structure/sign/painting/paintingbird,\
				/obj/structure/sign/painting/paintingsnow,\
				/obj/structure/sign/painting/paintingtemple,\
				/obj/structure/sign/painting/paintingdesert,\
				/obj/structure/sign/painting/paintingsea)

/obj/random/furniture/pottedplant /*Ignores the xmas tree and the dead one*/
	name = "random potted plant"
	icon = 'icons/obj/plants.dmi'
	icon_state = "plant-26"

/obj/random/furniture/pottedplant/item_to_spawn()
	return pick(/obj/structure/flora/pottedplant/decorative,\
				/obj/structure/flora/pottedplant/tropical,\
				/obj/structure/flora/pottedplant/drooping,\
				/obj/structure/flora/pottedplant/stoutbush,\
				/obj/structure/flora/pottedplant/minitree,\
				/obj/structure/flora/pottedplant/subterranean,\
				/obj/structure/flora/pottedplant/crystal,\
				/obj/structure/flora/pottedplant/flower,\
				/obj/structure/flora/pottedplant/shoot,\
				/obj/structure/flora/pottedplant/aquatic,\
				/obj/structure/flora/pottedplant/small,\
				/obj/structure/flora/pottedplant/smelly,\
				/obj/structure/flora/pottedplant/sticky,\
				/obj/structure/flora/pottedplant/tall,\
				/obj/structure/flora/pottedplant/smallcactus,\
				/obj/structure/flora/pottedplant/orientaltree,\
				/obj/structure/flora/pottedplant/unusual,\
				/obj/structure/flora/pottedplant/smalltree,\
				/obj/structure/flora/pottedplant/mysterious,\
				/obj/structure/flora/pottedplant/thinbush,\
				/obj/structure/flora/pottedplant/largebush,\
				/obj/structure/flora/pottedplant/bamboo,\
				/obj/structure/flora/pottedplant/overgrown,\
				/obj/structure/flora/pottedplant/fern,\
				/obj/structure/flora/pottedplant/large,\
				/obj/structure/flora/pottedplant)