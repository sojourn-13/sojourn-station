/*Random Action Figures*/

/obj/random/toy/action_figure
	name = "random action figure"
	icon = 'icons/obj/toy.dmi'
	icon_state = "bartender"

/obj/random/toy/action_figure/item_to_spawn()
	return pick(/obj/item/toy/figure/character/civilian/assistant,\
				/obj/item/toy/figure/character/civilian/bartender,\
				/obj/item/toy/figure/character/civilian/janitor,\
				/obj/item/toy/figure/character/civilian/gardener,\
				/obj/item/toy/figure/character/civilian/chaplain,\
				/obj/item/toy/figure/character/civilian/entertainer,\
				/obj/item/toy/figure/character/civilian/chef,\
				/obj/item/toy/figure/character/command/ai,\
				/obj/item/toy/figure/character/command/corgi,\
				/obj/item/toy/figure/character/command/firstofficer,\
				/obj/item/toy/figure/character/command/captain,\
				/obj/item/toy/figure/character/villains/ninja,\
				/obj/item/toy/figure/character/villains/wizard,\
				/obj/item/toy/figure/character/villains/syndie,\
				/obj/item/toy/figure/character/technomancer/ce,\
				/obj/item/toy/figure/character/technomancer/engineer,\
				/obj/item/toy/figure/character/ironhammer/detective,\
				/obj/item/toy/figure/character/ironhammer/warden,\
				/obj/item/toy/figure/character/ironhammer/secofficer,\
				/obj/item/toy/figure/character/ironhammer/hos,\
				/obj/item/toy/figure/character/guild/qm,\
				/obj/item/toy/figure/character/guild/cargotech,\
				/obj/item/toy/figure/character/guild/miner,\
				/obj/item/toy/figure/character/moebius/cmo,\
				/obj/item/toy/figure/character/moebius/rd,\
				/obj/item/toy/figure/character/moebius/md,\
				/obj/item/toy/figure/character/moebius/roboticist,\
				/obj/item/toy/figure/character/moebius/scientist,\
				/obj/item/toy/figure/character/moebius/chemist,\
				/obj/item/toy/figure/character/moebius/borg,\
				/obj/item/toy/figure/character/moebius/psychologist,\
				/obj/item/toy/figure/character/moebius/paramedic,\
				/obj/item/toy/figure/character/bobblehead/excelsior,\
				/obj/item/toy/figure/character/bobblehead/serbian,\
				/obj/item/toy/figure/character/bobblehead/acolyte,\
				/obj/item/toy/figure/character/bobblehead/carrion,\
				/obj/item/toy/figure/character/bobblehead/roach,\
				/obj/item/toy/figure/character/bobblehead/vagabond,\
				/obj/item/toy/figure/character/bobblehead/rooster,\
				/obj/item/toy/figure/character/bobblehead/barking_dog,\
				/obj/item/toy/figure/character/bobblehead/red_soldier,\
				/obj/item/toy/figure/character/bobblehead/metacat,\
				/obj/item/toy/figure/character/bobblehead/shitcurity,\
				/obj/item/toy/figure/character/bobblehead/metro_patrolman,\
				)


/obj/random/toy/action_figure_onlycivilian
	name = "random civilian figure"
	icon = 'icons/obj/toy.dmi'
	icon_state = "assistant"

/obj/random/toy/action_figure_onlycivilian/item_to_spawn()
	return pick(/obj/item/toy/figure/character/civilian/assistant,\
				/obj/item/toy/figure/character/civilian/bartender,\
				/obj/item/toy/figure/character/civilian/janitor,\
				/obj/item/toy/figure/character/civilian/gardener,\
				/obj/item/toy/figure/character/civilian/chaplain,\
				/obj/item/toy/figure/character/civilian/entertainer,\
				/obj/item/toy/figure/character/civilian/chef)

/obj/random/toy/action_figure_onlycommand
	name = "random command figure"
	icon = 'icons/obj/toy.dmi'
	icon_state = "captain"

/obj/random/toy/action_figure_onlycommand/item_to_spawn()
	return pick(/obj/item/toy/figure/character/command/ai,\
				/obj/item/toy/figure/character/command/corgi,\
				/obj/item/toy/figure/character/command/firstofficer,\
				/obj/item/toy/figure/character/command/captain)

/obj/random/toy/action_figure_onlydiscontinued
	name = "random discontinued figure"
	icon = 'icons/obj/toy.dmi'
	icon_state = "mime"

/obj/random/toy/action_figure_onlydiscontinued/item_to_spawn()
	return pick(/obj/item/toy/figure/character/discontinued/agent,\
				/obj/item/toy/figure/character/discontinued/librarian,\
				/obj/item/toy/figure/character/discontinued/mime,\
				/obj/item/toy/figure/character/discontinued/geneticist,\
				/obj/item/toy/figure/character/discontinued/atmos,\
				/obj/item/toy/figure/character/discontinued/dsquad)

/obj/random/toy/action_figure_onlyvillains
	name = "random villain figure"
	icon = 'icons/obj/toy.dmi'
	icon_state = "mime"

/obj/random/toy/action_figure_onlyvillains/item_to_spawn()
	return pick(/obj/item/toy/figure/character/villains/ninja,\
				/obj/item/toy/figure/character/villains/wizard,\
				/obj/item/toy/figure/character/villains/syndie)

/obj/random/toy/action_figure_onlytechnomancer
	name = "random technomancer figure"
	icon = 'icons/obj/toy.dmi'
	icon_state = "engineer"

/obj/random/toy/action_figure_onlytechnomancer/item_to_spawn()
	return pick(/obj/item/toy/figure/character/technomancer/ce,\
				/obj/item/toy/figure/character/technomancer/engineer)

/obj/random/toy/action_figure_onlyironhammer
	name = "random ironhammer figure"
	icon = 'icons/obj/toy.dmi'
	icon_state = "secofficer"

/obj/random/toy/action_figure_onlyironhammer/item_to_spawn()
	return pick(/obj/item/toy/figure/character/ironhammer/detective,\
				/obj/item/toy/figure/character/ironhammer/warden,\
				/obj/item/toy/figure/character/ironhammer/secofficer,\
				/obj/item/toy/figure/character/ironhammer/hos)

/obj/random/toy/action_figure_onlyguild
	name = "random guild figure"
	icon = 'icons/obj/toy.dmi'
	icon_state = "cargotech"

/obj/random/toy/action_figure_onlyguild/item_to_spawn()
	return pick(/obj/item/toy/figure/character/guild/qm,\
				/obj/item/toy/figure/character/guild/cargotech,\
				/obj/item/toy/figure/character/guild/miner)

/obj/random/toy/action_figure_onlymoebius
	name = "random moebius figure"
	icon = 'icons/obj/toy.dmi'
	icon_state = "md"

/obj/random/toy/action_figure_onlymoebius/item_to_spawn()
	return pick(/obj/item/toy/figure/character/moebius/cmo,\
				/obj/item/toy/figure/character/moebius/rd,\
				/obj/item/toy/figure/character/moebius/md,\
				/obj/item/toy/figure/character/moebius/roboticist,\
				/obj/item/toy/figure/character/moebius/scientist,\
				/obj/item/toy/figure/character/moebius/chemist,\
				/obj/item/toy/figure/character/moebius/borg,\
				/obj/item/toy/figure/character/moebius/psychologist,\
				/obj/item/toy/figure/character/moebius/paramedic)

/obj/random/toy/mecha
	name = "random mecha figure"
	icon = 'icons/obj/toy.dmi'
	icon_state = "ripleytoy"

/obj/random/toy/mecha/item_to_spawn()
	return pick(/obj/item/toy/figure/mecha/ripley,\
				/obj/item/toy/figure/mecha/fireripley,\
				/obj/item/toy/figure/mecha/deathripley,\
				/obj/item/toy/figure/mecha/gygax,\
				/obj/item/toy/figure/mecha/durand,\
				/obj/item/toy/figure/mecha/honk,\
				/obj/item/toy/figure/mecha/marauder,\
				/obj/item/toy/figure/mecha/seraph,\
				/obj/item/toy/figure/mecha/mauler,\
				/obj/item/toy/figure/mecha/odysseus,\
				/obj/item/toy/figure/mecha/phazon)

/*Random Plushies*/

/obj/random/toy/plushie_onlylarge
	name = "random big plushie"
	icon = 'icons/obj/toy.dmi'
	icon_state = "droneplushie"

/obj/random/toy/plushie_onlylarge/item_to_spawn()
	return pick(/obj/structure/plushie/ian,\
				/obj/structure/plushie/drone,\
				/obj/structure/plushie/carp,\
				/obj/structure/plushie/beepsky,\
				/obj/item/toy/plushie/fumo/arcueid,\
				/obj/item/toy/plushie/fumo/necochaos) // Not a dense structure like the rest, but it's actually life sized.

/obj/random/toy/plushie_onlycarp
	name = "random carp plushie"
	icon = 'icons/obj/toy.dmi'
	icon_state = "basecarp"

/obj/random/toy/plushie_onlycarp/item_to_spawn()
	return pick(/obj/item/toy/plushie/carp,\
				/obj/item/toy/plushie/carp/ice,\
				/obj/item/toy/plushie/carp/silent,\
				/obj/item/toy/plushie/carp/electric,\
				/obj/item/toy/plushie/carp/gold,\
				/obj/item/toy/plushie/carp/toxin,\
				/obj/item/toy/plushie/carp/dragon,\
				/obj/item/toy/plushie/carp/pink,\
				/obj/item/toy/plushie/carp/candy,\
				/obj/item/toy/plushie/carp/nebula,\
				/obj/item/toy/plushie/carp/void)

/obj/random/toy/plushie_onlysquid
	name = "random squid plushie"
	icon = 'icons/obj/toy.dmi'
	icon_state = "greensquid"

/obj/random/toy/plushie_onlysquid/item_to_spawn()
	return pick(/obj/item/toy/plushie/squid,\
				/obj/item/toy/plushie/squid/mint,\
				/obj/item/toy/plushie/squid/blue,\
				/obj/item/toy/plushie/squid/orange,\
				/obj/item/toy/plushie/squid/yellow,\
				/obj/item/toy/plushie/squid/pink)

/obj/random/toy/therapydoll
	name = "random therapy doll"
	icon = 'icons/obj/toy.dmi'
	icon_state = "therapyred"

/obj/random/toy/therapydoll/item_to_spawn()
	return pick(/obj/item/toy/plushie/therapy,\
				/obj/item/toy/plushie/therapy/purple,\
				/obj/item/toy/plushie/therapy/blue,\
				/obj/item/toy/plushie/therapy/yellow,\
				/obj/item/toy/plushie/therapy/orange,\
				/obj/item/toy/plushie/therapy/green)

/obj/random/toy/plushie_onlycat
	name = "random cat plushie"
	icon = 'icons/obj/toy.dmi'
	icon_state = "tuxedocat"

/obj/random/toy/plushie_onlycat/item_to_spawn()
	return pick(/obj/item/toy/plushie/cat,\
				/obj/item/toy/plushie/cat/grey,\
				/obj/item/toy/plushie/cat/white,\
				/obj/item/toy/plushie/cat/orange,\
				/obj/item/toy/plushie/cat/siamese,\
				/obj/item/toy/plushie/cat/tabby,\
				/obj/item/toy/plushie/cat/tuxedo)

/obj/random/toy/plushie_onlycorgi
	name = "random corgi plushie"
	icon = 'icons/obj/toy.dmi'
	icon_state = "corgi"

/obj/random/toy/plushie_onlycorgi/item_to_spawn()
	return pick(/obj/item/toy/plushie/corgi,\
				/obj/item/toy/plushie/corgi/girly,\
				/obj/item/toy/plushie/corgi/robo)

/obj/random/toy/plushie_onlyfox
	name = "random fox plushie"
	icon = 'icons/obj/toy.dmi'
	icon_state = "orangefox"

/obj/random/toy/plushie_onlyfox/item_to_spawn()
	return pick(/obj/item/toy/plushie/fox,\
				/obj/item/toy/plushie/fox/black,\
				/obj/item/toy/plushie/fox/marble,\
				/obj/item/toy/plushie/fox/blue,\
				/obj/item/toy/plushie/fox/orange,\
				/obj/item/toy/plushie/fox/coffee,\
				/obj/item/toy/plushie/fox/pink,\
				/obj/item/toy/plushie/fox/purple,\
				/obj/item/toy/plushie/fox/crimson)

/obj/random/toy/plushie_onlymisc
	name = "random misc plushie"
	icon = 'icons/obj/toy.dmi'
	icon_state = "deer"

/obj/random/toy/plushie_onlymisc/item_to_spawn()
	return pick(/obj/item/toy/plushie/deer,\
				/obj/item/toy/plushie/face_hugger,\
				/obj/item/toy/plushie/farwa,\
				/obj/item/toy/plushie/kitten,\
				/obj/item/toy/plushie,\
				/obj/item/toy/plushie/lizard,\
				/obj/item/toy/plushie/mouse,\
				/obj/item/toy/plushie/octopus,\
				/obj/item/toy/plushie/spider,\
				/obj/item/toy/plushie/fumo/arcueid,\
				/obj/item/toy/plushie/fumo/necochaos)

/obj/random/toy/plushie
	name = "random plushie"
	icon = 'icons/obj/toy.dmi'
	icon_state = "ianplushie"

/obj/random/toy/plushie/item_to_spawn()
	return pick(/obj/item/toy/plushie/deer,\
				/obj/item/toy/plushie/face_hugger,\
				/obj/item/toy/plushie/farwa,\
				/obj/item/toy/plushie/kitten,\
				/obj/item/toy/plushie/lizard,\
				/obj/item/toy/plushie/mouse,\
				/obj/item/toy/plushie/octopus,\
				/obj/item/toy/plushie/spider,\
				/obj/item/toy/plushie,\
				/obj/item/toy/plushie/fox,\
				/obj/item/toy/plushie/fox/black,\
				/obj/item/toy/plushie/fox/marble,\
				/obj/item/toy/plushie/fox/blue,\
				/obj/item/toy/plushie/fox/orange,\
				/obj/item/toy/plushie/fox/coffee,\
				/obj/item/toy/plushie/fox/pink,\
				/obj/item/toy/plushie/fox/purple,\
				/obj/item/toy/plushie/fox/crimson,\
				/obj/item/toy/plushie/corgi,\
				/obj/item/toy/plushie/corgi/girly,\
				/obj/item/toy/plushie/corgi/robo,\
				/obj/item/toy/plushie/cat,\
				/obj/item/toy/plushie/cat/grey,\
				/obj/item/toy/plushie/cat/white,\
				/obj/item/toy/plushie/cat/orange,\
				/obj/item/toy/plushie/cat/siamese,\
				/obj/item/toy/plushie/cat/tabby,\
				/obj/item/toy/plushie/cat/tuxedo,\
				/obj/item/toy/plushie/squid,\
				/obj/item/toy/plushie/squid/mint,\
				/obj/item/toy/plushie/squid/blue,\
				/obj/item/toy/plushie/squid/orange,\
				/obj/item/toy/plushie/squid/yellow,\
				/obj/item/toy/plushie/squid/pink,\
				/obj/item/toy/plushie/carp,\
				/obj/item/toy/plushie/carp/ice,\
				/obj/item/toy/plushie/carp/silent,\
				/obj/item/toy/plushie/carp/electric,\
				/obj/item/toy/plushie/carp/gold,\
				/obj/item/toy/plushie/carp/toxin,\
				/obj/item/toy/plushie/carp/dragon,\
				/obj/item/toy/plushie/carp/pink,\
				/obj/item/toy/plushie/carp/candy,\
				/obj/item/toy/plushie/carp/nebula,\
				/obj/item/toy/plushie/carp/void,\
				/obj/structure/plushie/ian,\
				/obj/structure/plushie/drone,\
				/obj/structure/plushie/carp,\
				/obj/structure/plushie/beepsky,\
				/obj/item/toy/plushie/fumo/arcueid,\
				/obj/item/toy/plushie/fumo/necochaos)

/*Arcade Junk*/

/obj/random/toy/arcadejunk
	name = "random toy"
	icon = 'icons/obj/toy.dmi'
	icon_state = "eight-ball"

/obj/random/toy/arcadejunk/item_to_spawn()
	return pick(/obj/item/toy/junk/balloon,\
				/obj/item/toy/junk/blink,\
				/obj/item/toy/junk/bosunwhistle,\
				/obj/item/toy/junk/eight_ball,\
				/obj/item/toy/junk/eight_ball/conch,\
				/obj/item/toy/junk/snappop,\
				/obj/item/toy/junk/spinningtoy,\
				/obj/item/toy/junk/stickhorse,\
				/obj/item/toy/junk/xmas_cracker,\
				/obj/item/toy/junk/xmas_tree,\
				/obj/item/toy/weapon/crossbow,\
				/obj/item/toy/weapon/cultsword,\
				/obj/item/toy/weapon/katana,\
				/obj/item/toy/weapon/waterflower,\
				/obj/item/toy/desk/newtoncradle,\
				/obj/item/toy/desk/dippingbird,\
				/obj/item/toy/junk/inflatable_duck,\
				/obj/item/toy/weapon/sword)
