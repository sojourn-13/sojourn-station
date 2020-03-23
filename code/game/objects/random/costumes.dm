/*Random Heads & Masks*/
/obj/random/costume/head_animals
	name = "random animal head"
	icon = 'icons/inventory/head/icon.dmi'
	icon_state = "griffinhat"

/obj/random/costume/head_animals/item_to_spawn()
	return pick(/obj/item/clothing/head/costume/animal/bunny,\
				/obj/item/clothing/head/costume/animal/carp,\
				/obj/item/clothing/head/costume/animal/chicken,\
				/obj/item/clothing/head/costume/animal/griffin,\
				/obj/item/clothing/head/costume/animal/ian,\
				/obj/item/clothing/head/costume/animal/kitty,\
				/obj/item/clothing/head/costume/animal/lobster,\
				/obj/item/clothing/head/costume/animal/rabbitears,\
				/obj/item/clothing/head/costume/animal/rooster,\
				/obj/item/clothing/mask/costume/animal/bat,\
				/obj/item/clothing/mask/costume/animal/bear,\
				/obj/item/clothing/mask/costume/animal/bee,\
				/obj/item/clothing/mask/costume/animal/dolphin,\
				/obj/item/clothing/mask/costume/animal/fox,\
				/obj/item/clothing/mask/costume/animal/frog,\
				/obj/item/clothing/mask/costume/animal/horse,\
				/obj/item/clothing/mask/costume/animal/jackal,\
				/obj/item/clothing/mask/costume/animal/monkey,\
				/obj/item/clothing/mask/costume/animal/owl,\
				/obj/item/clothing/mask/costume/animal/pig,\
				/obj/item/clothing/mask/costume/animal/rat,\
				/obj/item/clothing/mask/costume/animal/raven,\
				/obj/item/clothing/mask/costume/animal/shark)

/obj/random/costume/head_rare
	name = "random rare head"
	icon = 'icons/inventory/face/icon.dmi'
	icon_state = "gondola"

/obj/random/costume/head_rare/item_to_spawn()
	return pick(/obj/item/clothing/head/costume/misc/cueball,\
				/obj/item/clothing/head/costume/misc/hastur,\
				/obj/item/clothing/head/costume/misc/petehat,\
				/obj/item/clothing/mask/costume/misc/gondola)

/obj/random/costume/head_generic
	name = "random generic head"
	icon = 'icons/inventory/head/icon.dmi'
	icon_state = "paper"

/obj/random/costume/head_generic/item_to_spawn()
	return pick(/obj/item/clothing/mask/costume/history/plaguedoctor,\
				/obj/item/clothing/mask/costume/job/clown,\
				/obj/item/clothing/mask/costume/job/mime,\
				/obj/item/clothing/mask/costume/job/luchador,\
				/obj/item/clothing/mask/costume/job/luchador/rudos,\
				/obj/item/clothing/mask/costume/job/luchador/tecnicos,\
				/obj/item/clothing/mask/costume/misc/fakemoustache,\
				/obj/item/clothing/mask/costume/misc/guy,\
				/obj/item/clothing/mask/costume/misc/tiki,\
				/obj/item/clothing/mask/costume/misc/tiki/angry,\
				/obj/item/clothing/mask/costume/misc/tiki/confused,\
				/obj/item/clothing/mask/costume/misc/tiki/happy,\
				/obj/item/clothing/mask/costume/kinky/sexy_clown,\
				/obj/item/clothing/mask/costume/kinky/sexy_mime,\
				/obj/item/clothing/mask/costume/misc/rainbowclown,\
				/obj/item/clothing/head/costume/misc/cake,\
				/obj/item/clothing/head/costume/misc/justice,\
				/obj/item/clothing/head/costume/misc/justice/blue,\
				/obj/item/clothing/head/costume/misc/justice/yellow,\
				/obj/item/clothing/head/costume/misc/justice/green,\
				/obj/item/clothing/head/costume/misc/justice/pink,\
				/obj/item/clothing/head/costume/misc/festive,\
				/obj/item/clothing/head/costume/misc/paper,\
				/obj/item/clothing/head/costume/misc/santa,\
				/obj/item/clothing/head/costume/misc/santa/elf,\
				/obj/item/clothing/head/costume/misc/snowman,\
				/obj/item/clothing/head/costume/job/mailman,\
				/obj/item/clothing/head/costume/job/nun,\
				/obj/item/clothing/head/costume/job/nurse,\
				/obj/item/clothing/head/costume/job/police,\
				/obj/item/clothing/head/costume/misc/rainbow,\
				/obj/item/clothing/head/costume/history/jester,\
				/obj/item/clothing/head/costume/history/jester/court,\
				/obj/item/clothing/head/costume/history/pirate,\
				/obj/item/clothing/head/costume/history/piratecap,\
				/obj/item/clothing/head/costume/history/plaguedoctor,\
				/obj/item/clothing/head/costume/history/powdered,\
				/obj/item/clothing/head/costume/history/napoleonic)

/obj/random/costume/head_halloween
	name = "random halloween head"
	icon = 'icons/inventory/head/icon.dmi'
	icon_state = "hardhat0_pumpkin"

/obj/random/costume/head_halloween/item_to_spawn()
	return pick(/obj/item/clothing/mask/costume/halloween/demon,\
				/obj/item/clothing/mask/costume/halloween/goblin,\
				/obj/item/clothing/mask/costume/halloween/mummy,\
				/obj/item/clothing/mask/costume/halloween/scarecrow,\
				/obj/item/clothing/head/costume/halloween/cardborg,\
				/obj/item/clothing/head/costume/halloween/deathofficer,\
				/obj/item/clothing/head/costume/halloween/flash,\
				/obj/item/clothing/head/costume/halloween/mad,\
				/obj/item/clothing/head/costume/halloween/mummy,\
				/obj/item/clothing/head/costume/halloween/pumpkin,\
				/obj/item/clothing/head/costume/halloween/scarecrow,\
				/obj/item/clothing/head/costume/halloween/skeleton,\
				/obj/item/clothing/head/costume/halloween/syndicate,\
				/obj/item/clothing/head/costume/halloween/witch,\
				/obj/item/clothing/head/costume/halloween/xenos)

/*Random Suits, Uniforms, and Shoes*/

/obj/random/costume/body_animals
	name = "random animal body"
	icon = 'icons/inventory/uniform/icon.dmi'
	icon_state = "griffin"

/obj/random/costume/body_animals/item_to_spawn()
	return pick(/obj/item/clothing/shoes/costume/animal/griffin,\
				/obj/item/clothing/suit/costume/animal/bunny,\
				/obj/item/clothing/suit/costume/animal/carp,\
				/obj/item/clothing/suit/costume/animal/chicken,\
				/obj/item/clothing/suit/costume/animal/ian,\
				/obj/item/clothing/suit/costume/animal/monkey,\
				/obj/item/clothing/under/costume/animal/griffin,\
				/obj/item/clothing/under/costume/animal/lobster,\
				/obj/item/clothing/under/costume/animal/owl)


/obj/random/costume/body_generic
	name = "random generic body"
	icon = 'icons/inventory/uniform/icon.dmi'
	icon_state = "clown"

/obj/random/costume/body_generic/item_to_spawn()
	return pick(/obj/item/clothing/shoes/costume/history/centurion,\
				/obj/item/clothing/shoes/costume/history/jester,\
				/obj/item/clothing/shoes/costume/history/knight,\
				/obj/item/clothing/shoes/costume/job/clown,\
				/obj/item/clothing/shoes/costume/job/mime,\
				/obj/item/clothing/shoes/costume/misc/rainbow,\
				/obj/item/clothing/suit/costume/history/plaguedoctor,\
				/obj/item/clothing/suit/costume/history/pirate,\
				/obj/item/clothing/suit/costume/job/judge,\
				/obj/item/clothing/suit/costume/job/nun,\
				/obj/item/clothing/suit/costume/misc/santa,\
				/obj/item/clothing/suit/costume/misc/snowman,\
				//obj/item/clothing/suit/costume/misc/rainbowovercloak,
				/obj/item/clothing/under/costume/history/centurion,\
				/obj/item/clothing/under/costume/history/geisha,\
				/obj/item/clothing/under/costume/history/gladiator,\
				/obj/item/clothing/under/costume/history/jester,\
				/obj/item/clothing/under/costume/history/jester/court,\
				/obj/item/clothing/under/costume/history/napoleonic,\
				/obj/item/clothing/under/costume/history/pirate,\
				/obj/item/clothing/under/costume/history/sailor,\
				/obj/item/clothing/under/costume/history/soviet,\
				/obj/item/clothing/under/costume/job/clown,\
				/obj/item/clothing/under/costume/job/clown/blue,\
				/obj/item/clothing/under/costume/job/clown/green,\
				/obj/item/clothing/under/costume/job/clown/orange,\
				/obj/item/clothing/under/costume/job/clown/purple,\
				/obj/item/clothing/under/costume/job/clown/yellow,\
				/obj/item/clothing/under/costume/job/mailman,\
				/obj/item/clothing/under/costume/job/mime,\
				/obj/item/clothing/under/costume/job/nurse,\
				/obj/item/clothing/under/costume/job/police,\
				/obj/item/clothing/under/costume/job/waiter,\
				/obj/item/clothing/under/costume/misc/rainbowclown,\
				/obj/item/clothing/under/costume/misc/rainbowjumpsuit,\
				/obj/item/clothing/under/costume/misc/rainbowskirt,\
				//obj/item/clothing/under/costume/misc/rainbowundercloak
				)

/obj/random/costume/body_kinky
	name = "random kinky body"
	icon = 'icons/inventory/uniform/icon.dmi'
	icon_state = "latexmaid"

/obj/random/costume/body_kinky/item_to_spawn()
	return pick(/obj/item/clothing/suit/costume/kinky/sexy_engineer,\
				/obj/item/clothing/suit/costume/kinky/sexy_internalaffairs,\
				/obj/item/clothing/suit/costume/kinky/sexy_lumberjack,\
				/obj/item/clothing/suit/costume/kinky/sexy_miner,\
				/obj/item/clothing/suit/costume/kinky/sexy_scientist,\
				/obj/item/clothing/under/costume/kinky/latex_maid,\
				/obj/item/clothing/under/costume/kinky/leather,\
				/obj/item/clothing/under/costume/kinky/sexy_clown,\
				/obj/item/clothing/under/costume/kinky/sexy_mime,\
				/obj/item/clothing/under/costume/kinky/stripper_green,\
				/obj/item/clothing/under/costume/kinky/stripper_pink)

/obj/random/costume/body_halloween
	name = "random halloween body"
	icon = 'icons/inventory/uniform/icon.dmi'
	icon_state = "skeleton"

/obj/random/costume/body_halloween/item_to_spawn()
	return pick(/obj/item/clothing/suit/costume/halloween/cardborg,\
				/obj/item/clothing/suit/costume/halloween/flash,\
				/obj/item/clothing/suit/costume/halloween/madscientist,\
				/obj/item/clothing/suit/costume/halloween/mummy,\
				/obj/item/clothing/suit/costume/halloween/skeleton,\
				/obj/item/clothing/suit/costume/halloween/syndicate,\
				/obj/item/clothing/suit/costume/halloween/vampire,\
				/obj/item/clothing/suit/costume/halloween/web_bindings,\
				/obj/item/clothing/suit/costume/halloween/xenos,\
				/obj/item/clothing/under/costume/halloween/apocalypse,\
				/obj/item/clothing/under/costume/halloween/deathofficer,\
				/obj/item/clothing/under/costume/halloween/femvampire,\
				/obj/item/clothing/under/costume/halloween/mummy,\
				/obj/item/clothing/under/costume/halloween/ragged,\
				/obj/item/clothing/under/costume/halloween/scarecrow,\
				/obj/item/clothing/under/costume/halloween/skeleton,\
				/obj/item/clothing/under/costume/halloween/villain)

/obj/random/costume/body_rare
	name = "random rare body"
	icon = 'icons/inventory/uniform/icon.dmi'
	icon_state = "gondola"

/obj/random/costume/body_rare/item_to_spawn()
	return pick(/obj/item/clothing/suit/costume/job/imperium_monk,\
				/obj/item/clothing/suit/costume/job/sumo,\
				/obj/item/clothing/suit/costume/misc/hacker,\
				/obj/item/clothing/suit/costume/misc/hastur,\
				/obj/item/clothing/under/costume/misc/gondola,\
				/obj/item/clothing/under/costume/misc/psyche)