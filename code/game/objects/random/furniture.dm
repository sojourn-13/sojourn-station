/obj/random/furniture/bedsheet /*Ignores the silly looking mime, clown, ian, captain, and medical bedsheets.*/
	name = "random bedsheet"
	icon = 'icons/obj/bedsheets.dmi'
	icon_state = "sheet"

/obj/random/furniture/bedsheet/item_to_spawn()
	return pick(/obj/item/bedsheet,\
				/obj/item/bedsheet/blue,\
				/obj/item/bedsheet/green,\
				/obj/item/bedsheet/orange,\
				/obj/item/bedsheet/purple,\
				/obj/item/bedsheet/rainbow,\
				/obj/item/bedsheet/red,\
				/obj/item/bedsheet/yellow,\
				/obj/item/bedsheet/rd,\
				/obj/item/bedsheet/hos,\
				/obj/item/bedsheet/hop,\
				/obj/item/bedsheet/ce,\
				/obj/item/bedsheet/brown)

/obj/random/furniture/bedsheetdouble
	name = "random double bedsheet"
	icon = 'icons/obj/bedsheets.dmi'
	icon_state = "doublesheet"

/obj/random/furniture/bedsheetdouble/item_to_spawn()
	return pick(/obj/item/bedsheet/double,\
				/obj/item/bedsheet/bluedouble,\
				/obj/item/bedsheet/greendouble,\
				/obj/item/bedsheet/orangedouble,\
				/obj/item/bedsheet/purpledouble,\
				/obj/item/bedsheet/rainbowdouble,\
				/obj/item/bedsheet/reddouble,\
				/obj/item/bedsheet/yellowdouble,\
				/obj/item/bedsheet/rddouble,\
				/obj/item/bedsheet/hosdouble,\
				/obj/item/bedsheet/hopdouble,\
				/obj/item/bedsheet/cedouble,\
				/obj/item/bedsheet/browndouble)

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
				/obj/structure/flora/pottedplant,\
				/obj/structure/flora/pottedplant/bamboo,\
				/obj/structure/flora/pottedplant/bamboo_red,\
				/obj/structure/flora/pottedplant/redshoot,\
				/obj/structure/flora/pottedplant/rotwood,\
				/obj/structure/flora/pottedplant/rotwood_green,\
				/obj/structure/flora/pottedplant/rotwood_blue,\
				/obj/structure/flora/pottedplant/bush_buds,\
				/obj/structure/flora/pottedplant/bush_buds_yellow,\
				/obj/structure/flora/pottedplant/grave_poppers,\
				/obj/structure/flora/pottedplant/bush_buds_red,\
				/obj/structure/flora/pottedplant/grave_poppers_blue,\
				/obj/structure/flora/pottedplant/grave_poppers_red,\
				/obj/structure/flora/pottedplant/barrel_cactus,\
				/obj/structure/flora/pottedplant/clockcult,\
				/obj/structure/flora/pottedplant/bush_ball,\
				/obj/structure/flora/pottedplant/bush_tall,\
				/obj/structure/flora/pottedplant/bush_bullet,\
				/obj/structure/flora/pottedplant/star_root,\
				/obj/structure/flora/pottedplant/water_root,\
				/obj/structure/flora/pottedplant/green_rock)

