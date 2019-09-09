/obj/random/action_figure
	name = "random action figure"
	icon_state = "box-grey"

/obj/random/action_figure/item_to_spawn()
	return pick(/obj/item/toy/figure/character/moebius/cmo,\
				/obj/item/toy/figure/character/civilian/assistant,\
				/obj/item/toy/figure/character/discontinued/atmos,\
				/obj/item/toy/figure/character/civilian/bartender,\
				/obj/item/toy/figure/character/moebius/borg,\
				/obj/item/toy/figure/character/civilian/gardener,\
				/obj/item/toy/figure/character/command/captain,\
				/obj/item/toy/figure/character/guild/cargotech,\
				/obj/item/toy/figure/character/technomancer/ce,\
				/obj/item/toy/figure/character/civilian/chaplain,\
				/obj/item/toy/figure/character/civilian/chef,\
				/obj/item/toy/figure/character/moebius/chemist,\
				/obj/item/toy/figure/character/civilian/entertainer,\
				/obj/item/toy/figure/character/command/corgi,\
				/obj/item/toy/figure/character/ironhammer/detective,\
				/obj/item/toy/figure/character/discontinued/dsquad,\
				/obj/item/toy/figure/character/technomancer/engineer,\
				/obj/item/toy/figure/character/discontinued/geneticist,\
				/obj/item/toy/figure/character/command/firstofficer,\
				/obj/item/toy/figure/character/ironhammer/hos,\
				/obj/item/toy/figure/character/guild/qm,\
				/obj/item/toy/figure/character/civilian/janitor,\
				/obj/item/toy/figure/character/discontinued/agent,\
				/obj/item/toy/figure/character/discontinued/librarian,\
				/obj/item/toy/figure/character/moebius/md,\
				/obj/item/toy/figure/character/discontinued/mime,\
				/obj/item/toy/figure/character/guild/miner,\
				/obj/item/toy/figure/character/villains/ninja,\
				/obj/item/toy/figure/character/villains/wizard,\
				/obj/item/toy/figure/character/moebius/rd,\
				/obj/item/toy/figure/character/moebius/roboticist,\
				/obj/item/toy/figure/character/moebius/scientist,\
				/obj/item/toy/figure/character/villains/syndie,\
				/obj/item/toy/figure/character/ironhammer/secofficer,\
				/obj/item/toy/figure/character/ironhammer/warden,\
				/obj/item/toy/figure/character/moebius/psychologist,\
				/obj/item/toy/figure/character/moebius/paramedic)


/obj/random/plushie
	name = "random plushie"
	icon_state = "box-grey"

/obj/random/plushie/item_to_spawn()
	return pick(/obj/structure/plushie/ian,\
				/obj/structure/plushie/drone,\
				/obj/structure/plushie/carp,\
				/obj/structure/plushie/beepsky,\
				/obj/item/toy/plushie/mouse,\
				/obj/item/toy/plushie/kitten,\
				/obj/item/toy/plushie/lizard)
