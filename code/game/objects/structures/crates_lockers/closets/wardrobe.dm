/obj/structure/closet/wardrobe
	name = "wardrobe"
	desc = "It's a storage unit for standard-issue attire."
	icon_state = "generic"

/*Colors*/

/obj/structure/closet/wardrobe/color/black
	name = "black wardrobe"
	icon_door = "black"

/obj/structure/closet/wardrobe/color/black/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/clothing/under/color/black(src)
	new /obj/item/clothing/under/color/black(src)
	new /obj/item/clothing/under/colorskirt/black(src)
	new /obj/item/clothing/shoes/color/black(src)
	new /obj/item/clothing/shoes/color/black(src)
	new /obj/item/clothing/shoes/color/black(src)
	new /obj/item/clothing/head/tophat(src)
	new /obj/item/clothing/head/tophat(src)
	new /obj/item/clothing/head/tophat(src)
	new /obj/item/clothing/mask/bandana(src)
	new /obj/item/clothing/mask/bandana(src)
	new /obj/item/clothing/mask/bandana/skull(src)

/obj/structure/closet/wardrobe/color/pink
	name = "pink wardrobe"
	icon_door = "pink"

/obj/structure/closet/wardrobe/color/pink/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/clothing/under/color/pink(src)
	new /obj/item/clothing/under/color/pink(src)
	new /obj/item/clothing/under/colorskirt/pink(src)
	new /obj/item/clothing/shoes/color/pink(src)
	new /obj/item/clothing/shoes/color/pink(src)
	new /obj/item/clothing/shoes/color/pink(src)

/obj/structure/closet/wardrobe/color/green
	name = "green wardrobe"
	icon_door = "green"

/obj/structure/closet/wardrobe/color/green/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/clothing/under/color/green(src)
	new /obj/item/clothing/under/color/green(src)
	new /obj/item/clothing/under/colorskirt/green(src)
	new /obj/item/clothing/shoes/color/black(src)
	new /obj/item/clothing/shoes/color/black(src)
	new /obj/item/clothing/shoes/color/black(src)
	new /obj/item/clothing/mask/bandana/green(src)
	new /obj/item/clothing/mask/bandana/green(src)
	new /obj/item/clothing/mask/bandana/green(src)
	new /obj/item/clothing/head/soft/green(src)
	new /obj/item/clothing/head/soft/green(src)
	new /obj/item/clothing/head/soft/green(src)

/obj/structure/closet/wardrobe/color/yellow
	name = "yellow wardrobe"
	icon_door = "yellow"

/obj/structure/closet/wardrobe/color/yellow/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/clothing/under/color(src)
	new /obj/item/clothing/under/color(src)
	new /obj/item/clothing/under/colorskirt(src)
	new /obj/item/clothing/shoes/color/yellow(src)
	new /obj/item/clothing/shoes/color/yellow(src)
	new /obj/item/clothing/shoes/color/yellow(src)
	new /obj/item/clothing/mask/bandana/yellow(src)
	new /obj/item/clothing/mask/bandana/yellow(src)
	new /obj/item/clothing/mask/bandana/yellow(src)
	new /obj/item/clothing/head/soft(src)
	new /obj/item/clothing/head/soft(src)
	new /obj/item/clothing/head/soft(src)

/obj/structure/closet/wardrobe/color/white
	name = "white wardrobe"
	icon_door = "white"

/obj/structure/closet/wardrobe/color/white/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/clothing/under/color/white(src)
	new /obj/item/clothing/under/color/white(src)
	new /obj/item/clothing/under/colorskirt/white(src)
	new /obj/item/clothing/shoes/color(src)
	new /obj/item/clothing/shoes/color(src)
	new /obj/item/clothing/shoes/color(src)
	new /obj/item/clothing/head/soft/white(src)
	new /obj/item/clothing/head/soft/white(src)
	new /obj/item/clothing/head/soft/white(src)
	new /obj/item/storage/backpack/sport/white(src)

/obj/structure/closet/wardrobe/color/red
	name = "red wardrobe"
	icon_door = "red"

/obj/structure/closet/wardrobe/color/red/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/clothing/under/color/red(src)
	new /obj/item/clothing/under/color/red(src)
	new /obj/item/clothing/under/colorskirt/red(src)
	new /obj/item/clothing/shoes/color/red(src)
	new /obj/item/clothing/shoes/color/red(src)
	new /obj/item/clothing/shoes/color/red(src)
	new /obj/item/clothing/mask/bandana/red(src)
	new /obj/item/clothing/mask/bandana/red(src)
	new /obj/item/clothing/mask/bandana/red(src)
	new /obj/item/clothing/head/soft/red(src)
	new /obj/item/clothing/head/soft/red(src)
	new /obj/item/clothing/head/soft/red(src)

/obj/structure/closet/wardrobe/color/blue
	name = "blue wardrobe"
	icon_door = "blue"

/obj/structure/closet/wardrobe/color/blue/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/clothing/under/color/blue(src)
	new /obj/item/clothing/under/color/blue(src)
	new /obj/item/clothing/under/colorskirt/blue(src)
	new /obj/item/clothing/shoes/color/blue(src)
	new /obj/item/clothing/shoes/color/blue(src)
	new /obj/item/clothing/shoes/color/blue(src)
	new /obj/item/clothing/mask/bandana/blue(src)
	new /obj/item/clothing/mask/bandana/blue(src)
	new /obj/item/clothing/mask/bandana/blue(src)
	new /obj/item/clothing/head/soft/blue(src)
	new /obj/item/clothing/head/soft/blue(src)
	new /obj/item/clothing/head/soft/blue(src)

/obj/structure/closet/wardrobe/color/grey
	name = "grey wardrobe"
	icon_door = "grey"

/obj/structure/closet/wardrobe/color/grey/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/clothing/under/color(src)
	new /obj/item/clothing/under/color(src)
	new /obj/item/clothing/under/colorskirt/grey(src)
	new /obj/item/clothing/shoes/color/black(src)
	new /obj/item/clothing/shoes/color/black(src)
	new /obj/item/clothing/shoes/color/black(src)
	new /obj/item/clothing/head/soft/grey(src)
	new /obj/item/clothing/head/soft/grey(src)
	new /obj/item/clothing/head/soft/grey(src)
	new /obj/item/storage/backpack/sport(src)

/obj/structure/closet/wardrobe/color/mixed
	name = "mixed wardrobe"
	icon_door = "mixed"

/obj/structure/closet/wardrobe/color/mixed/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/clothing/under/color/blue(src)
	new /obj/item/clothing/under/color(src)
	new /obj/item/clothing/under/color/green(src)
	new /obj/item/clothing/under/orange(src)
	new /obj/item/clothing/under/color/pink(src)
	new /obj/item/clothing/shoes/color/blue(src)
	new /obj/item/clothing/shoes/color/yellow(src)
	new /obj/item/clothing/shoes/color/green(src)
	new /obj/item/clothing/shoes/orange(src)
	new /obj/item/clothing/shoes/color/purple(src)
	new /obj/item/clothing/shoes/color/red(src)
	new /obj/item/clothing/shoes/leather(src)
	new /obj/item/clothing/mask/bandana/orange(src)
	new /obj/item/clothing/mask/bandana/blue(src)
	new /obj/item/clothing/mask/bandana/red(src)
	new /obj/item/clothing/mask/bandana/green(src)
	new /obj/item/clothing/mask/bandana/yellow(src)
	new /obj/item/clothing/mask/bandana/purple(src)
	new /obj/item/clothing/mask/bandana/camo(src)
	new /obj/item/storage/backpack/sport/purple(src)
	new /obj/item/storage/backpack/sport/green(src)
	new /obj/item/storage/backpack/sport/blue(src)
	new /obj/item/storage/backpack/sport/orange(src)

/*Jobs*/

/obj/structure/closet/wardrobe/job/engineering_yellow
	name = "engineering wardrobe"
	icon_door = "yellow"

/obj/structure/closet/wardrobe/job/engineering_yellow/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/clothing/under/rank/engineer(src)
	new /obj/item/clothing/under/rank/engineer(src)
	new /obj/item/clothing/under/rank/engineer(src)
	new /obj/item/clothing/shoes/jackboots(src)
	new /obj/item/clothing/shoes/jackboots(src)
	new /obj/item/clothing/shoes/jackboots(src)
	new /obj/item/clothing/head/hardhat(src)
	new /obj/item/clothing/head/hardhat(src)
	new /obj/item/clothing/head/hardhat(src)
	new /obj/item/clothing/head/rank/engineering(src)
	new /obj/item/clothing/head/rank/engineering(src)
	new /obj/item/clothing/head/rank/engineering(src)

/obj/structure/closet/wardrobe/job/sec
	name = "security wardrobe"
	icon_door = "blue"

/obj/structure/closet/wardrobe/job/sec/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/clothing/under/rank/security(src)
	new /obj/item/clothing/under/rank/security(src)
	new /obj/item/clothing/head/seccap(src)
	new /obj/item/clothing/head/seccap(src)
	new /obj/item/clothing/shoes/jackboots(src)
	new /obj/item/clothing/shoes/jackboots(src)
	new /obj/item/clothing/head/rank/ironhammer(src)
	new /obj/item/clothing/head/rank/ironhammer(src)
	new /obj/item/clothing/under/rank/bdu/marshal(src)
	new /obj/item/clothing/under/rank/bdu/marshal(src)
	new /obj/item/clothing/mask/balaclava(src)
	new /obj/item/clothing/mask/balaclava(src)
	new /obj/item/clothing/suit/storage/armor/marshal_coat(src)
	new /obj/item/clothing/suit/storage/armor/marshal_coat(src)
	new /obj/item/clothing/accessory/armband(src)
	new /obj/item/clothing/accessory/armband(src)

/obj/structure/closet/wardrobe/militia
	name = "blackshield wardrobe"
	icon_door = "militia"

/obj/structure/closet/wardrobe/militia/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/clothing/under/rank/trooper/gorka(src)
	new /obj/item/clothing/under/rank/trooper/gorka(src)
	new /obj/item/clothing/under/rank/trooper/cadet(src)
	new /obj/item/clothing/under/rank/trooper/cadet(src)
	new /obj/item/clothing/under/rank/fatigues(src)
	new /obj/item/clothing/under/rank/fatigues(src)
	new /obj/item/clothing/under/rank/fatigues/grey(src)
	new /obj/item/clothing/under/rank/fatigues/grey(src)
	new /obj/item/clothing/under/rank/fatigues/navy(src)
	new /obj/item/clothing/under/rank/fatigues/navy(src)
	new /obj/item/clothing/under/rank/fatigues/tan(src)
	new /obj/item/clothing/under/rank/fatigues/tan(src)
	new /obj/item/clothing/under/rank/fatigues/camo(src)
	new /obj/item/clothing/under/rank/fatigues/camo(src)
	new /obj/item/clothing/under/rank/fatigues/kav(src)
	new /obj/item/clothing/under/rank/fatigues/kav(src)
	new /obj/item/clothing/under/rank/fatigues/kav/green(src)
	new /obj/item/clothing/under/rank/fatigues/kav/green(src)
	new /obj/item/clothing/under/rank/fatigues/kav/tan(src)
	new /obj/item/clothing/under/rank/fatigues/kav/tan(src)
	new /obj/item/clothing/under/rank/fatigues/kav/jungle(src)
	new /obj/item/clothing/under/rank/fatigues/kav/jungle(src)

/obj/structure/closet/wardrobe/militia/accessory
	name = "blackshield accessory wardrobe"
	icon_door = "militia"

/obj/structure/closet/wardrobe/militia/accessory/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/clothing/accessory/holster/leg(src)
	new /obj/item/clothing/accessory/holster/leg(src)
	new /obj/item/clothing/accessory/holster/leg(src)
	new /obj/item/clothing/accessory/holster/leg(src)
	new /obj/item/clothing/shoes/jackboots(src)
	new /obj/item/clothing/shoes/jackboots(src)
	new /obj/item/clothing/shoes/jackboots(src)
	new /obj/item/clothing/shoes/jackboots(src)
	new /obj/item/clothing/mask/balaclava/tactical(src)
	new /obj/item/clothing/mask/balaclava/tactical(src)
	new /obj/item/clothing/mask/balaclava/tactical(src)
	new /obj/item/clothing/mask/balaclava/tactical(src)
	new /obj/item/clothing/accessory/bscloak(src)
	new /obj/item/clothing/accessory/bscloak(src)
	new /obj/item/clothing/accessory/bscloak/tan(src)
	new /obj/item/clothing/accessory/bscloak/tan(src)
	new /obj/item/clothing/accessory/bscloak/olive(src)
	new /obj/item/clothing/accessory/bscloak/olive(src)
	new /obj/item/clothing/accessory/job/cape/blackshield(src)
	new /obj/item/clothing/accessory/job/cape/blackshield(src)
	new /obj/item/clothing/accessory/job/cape/blackshield/green(src)
	new /obj/item/clothing/accessory/job/cape/blackshield/green(src)
	new /obj/item/clothing/accessory/job/cape/blackshield/tan(src)
	new /obj/item/clothing/accessory/job/cape/blackshield/tan(src)
	new /obj/item/clothing/accessory/job/cape/blackshield/camo(src)
	new /obj/item/clothing/accessory/job/cape/blackshield/camo(src)
	new /obj/item/clothing/accessory/job/cape/blackshield/whitecamo(src)
	new /obj/item/clothing/accessory/job/cape/blackshield/whitecamo(src)
	new /obj/item/clothing/mask/balaclava(src)
	new /obj/item/clothing/mask/balaclava(src)
	new /obj/item/clothing/mask/balaclava(src)
	new /obj/item/clothing/glasses/ballistic(src)
	new /obj/item/clothing/glasses/ballistic(src)
	new /obj/item/clothing/glasses/ballistic(src)
	new /obj/item/clothing/glasses/ballistic(src)
	new /obj/item/clothing/accessory/armband/militia(src)
	new /obj/item/clothing/accessory/armband/militia(src)
	new /obj/item/clothing/accessory/armband/militia(src)
	new /obj/item/clothing/accessory/armband/corpsman(src)
	new /obj/item/clothing/accessory/armband/corpsman(src)

/obj/structure/closet/wardrobe/job/science_white
	name = "science wardrobe"
	icon_door = "white"

/obj/structure/closet/wardrobe/job/science_white/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/clothing/under/rank/scientist(src)
	new /obj/item/clothing/under/rank/scientist(src)
	new /obj/item/clothing/under/rank/scientist(src)
	new /obj/item/clothing/suit/storage/toggle/labcoat(src)
	new /obj/item/clothing/suit/storage/toggle/labcoat(src)
	new /obj/item/clothing/suit/storage/toggle/labcoat(src)
	new /obj/item/clothing/shoes/color(src)
	new /obj/item/clothing/shoes/color(src)
	new /obj/item/clothing/shoes/color(src)
	new /obj/item/clothing/shoes/slippers(src)
	new /obj/item/clothing/shoes/slippers(src)
	new /obj/item/clothing/shoes/slippers(src)
	new /obj/item/clothing/gloves/membrane(src)
	new /obj/item/clothing/gloves/membrane(src)
	new /obj/item/clothing/gloves/membrane(src)

/obj/structure/closet/wardrobe/job/robotics_black
	name = "robotics wardrobe"
	icon_door = "black"

/obj/structure/closet/wardrobe/job/robotics_black/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/clothing/under/rank/roboticist(src)
	new /obj/item/clothing/under/rank/roboticist(src)
	new /obj/item/clothing/suit/storage/rank/robotech_jacket(src)
	new /obj/item/clothing/suit/storage/rank/robotech_jacket(src)
	new /obj/item/clothing/shoes/color/black(src)
	new /obj/item/clothing/shoes/color/black(src)
	new /obj/item/clothing/gloves/membrane(src)
	new /obj/item/clothing/gloves/membrane(src)

/obj/structure/closet/wardrobe/job/chemistry_white
	name = "chemistry wardrobe"
	icon_door = "white"

/obj/structure/closet/wardrobe/job/chemistry_white/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/clothing/under/rank/chemist(src)
	new /obj/item/clothing/under/rank/chemist(src)
	new /obj/item/clothing/shoes/color(src)
	new /obj/item/clothing/shoes/color(src)
	new /obj/item/clothing/suit/storage/toggle/labcoat/chemist(src)
	new /obj/item/clothing/suit/storage/toggle/labcoat/chemist(src)

/obj/structure/closet/wardrobe/job/virology_white
	name = "virology wardrobe"
	icon_door = "white"

/obj/structure/closet/wardrobe/job/virology_white/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/clothing/under/rank/virologist(src)
	new /obj/item/clothing/under/rank/virologist(src)
	new /obj/item/clothing/shoes/color(src)
	new /obj/item/clothing/shoes/color(src)
	new /obj/item/clothing/suit/storage/toggle/labcoat/virologist(src)
	new /obj/item/clothing/suit/storage/toggle/labcoat/virologist(src)
	new /obj/item/clothing/mask/surgical(src)
	new /obj/item/clothing/mask/surgical(src)

/obj/structure/closet/wardrobe/job/medic_white
	name = "medical wardrobe"
	icon_door = "white"

/obj/structure/closet/wardrobe/job/medic_white/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/clothing/under/rank/medical(src)
	new /obj/item/clothing/under/rank/medical(src)
	new /obj/item/clothing/under/scrubs(src)
	new /obj/item/clothing/under/scrubs/green(src)
	new /obj/item/clothing/under/scrubs/purple(src)
	new /obj/item/clothing/shoes/color(src)
	new /obj/item/clothing/shoes/color(src)
	new /obj/item/clothing/shoes/reinforced(src)
	new /obj/item/clothing/shoes/reinforced(src)
	new /obj/item/clothing/suit/storage/toggle/labcoat(src)
	new /obj/item/clothing/suit/storage/toggle/labcoat(src)
	new /obj/item/clothing/mask/surgical(src)
	new /obj/item/clothing/mask/surgical(src)

/obj/structure/closet/wardrobe/job/chaplain_black
	name = "chapel wardrobe"
	desc = "It's a storage unit for approved religious attire."
	icon_door = "black"

/obj/structure/closet/wardrobe/job/chaplain_black/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/clothing/under/rank/preacher(src)
	new /obj/item/clothing/shoes/color/black(src)
	new /obj/item/clothing/suit/costume/job/nun(src)
	new /obj/item/clothing/head/costume/job/nun(src)
	new /obj/item/clothing/suit/storage/chaplain(src)
	new /obj/item/clothing/head/rank/chaplain(src)
	new /obj/item/clothing/under/bride_white(src)
	new /obj/item/storage/fancy/candle_box(src)
	new /obj/item/storage/fancy/candle_box(src)
	new /obj/item/deck/tarot(src)
	new /obj/item/talkingcrystal(src)

/*Other*/

/obj/structure/closet/wardrobe/misc/pjs
	name = "pajama wardrobe"
	icon_door = "white"

/obj/structure/closet/wardrobe/misc/pjs/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/clothing/under/pj(src)
	new /obj/item/clothing/under/pj(src)
	new /obj/item/clothing/under/pj/blue(src)
	new /obj/item/clothing/under/pj/blue(src)
	new /obj/item/clothing/shoes/color(src)
	new /obj/item/clothing/shoes/color(src)
	new /obj/item/clothing/shoes/slippers(src)
	new /obj/item/clothing/shoes/slippers(src)

/obj/structure/closet/wardrobe/misc/tactical
	name = "tactical equipment"
	icon_door = "black"
	desc = "A dingey old locker full of old SolFed SWAT gear."

/obj/structure/closet/wardrobe/misc/tactical/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/clothing/under/turtleneck/tacticalgreen(src)
	new /obj/item/clothing/suit/storage/vest/swat(src)
	new /obj/item/clothing/head/helmet/swat(src)
	new /obj/item/clothing/mask/balaclava/tactical(src)
	new /obj/item/clothing/glasses/sechud/tactical(src)
	new /obj/item/storage/belt/security/tactical(src)
	new /obj/item/clothing/shoes/swat(src)
	new /obj/item/clothing/gloves/thick/swat(src)

/obj/structure/closet/wardrobe/misc/prison
	name = "prison wardrobe"
	desc = "It's a storage unit for regulation prisoner attire."
	icon_door = "orange"

/obj/structure/closet/wardrobe/misc/prison/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/clothing/under/orange(src)
	new /obj/item/clothing/under/orange(src)
	new /obj/item/clothing/under/orange(src)
	new /obj/item/clothing/shoes/orange(src)
	new /obj/item/clothing/shoes/orange(src)
	new /obj/item/clothing/shoes/orange(src)
