/obj/machinery/bulletfabricator
	name = "Bullet Fabricator"
	desc = "A machine for producing ammo magazines, speed loaders, ammo boxes, and exotic munitions using any type of materials converted into an unknown state, \
	with rare or valuable materials having greater point values. Originally a scavenged design from the Greyson Positronics repurposed by the Artificer's Guild. \
	How it works? Nobody is quite sure. The time it takes to fabricate munitions varies by cost and the machine parts used."
	icon = 'icons/obj/machines/autolathe.dmi'
	icon_state = "ammolathe"
	density = TRUE
	anchored = TRUE
	layer = BELOW_OBJ_LAYER
	use_power = IDLE_POWER_USE
	idle_power_usage = 40
	circuit = /obj/item/circuitboard/bullet_fab
	var/processing = FALSE
	var/points = 0
	var/menustat = "menu"
	var/build_eff = 1
	var/eat_eff = 1

	var/list/recipes = list(
		".35 Speed Loader",
			list(name="Speed Loader (.35)", cost=30, path=/obj/item/ammo_magazine/speed_loader_pistol_35),
			list(name="Speed Loader (.35 High-Velocity)", cost=50, path=/obj/item/ammo_magazine/speed_loader_pistol_35/hv),
			list(name="Speed Loader (.35 Hollow-Point)", cost=30, path=/obj/item/ammo_magazine/speed_loader_pistol_35/lethal),
			list(name="Speed Loader (.35 Rubber)", cost=30, path=/obj/item/ammo_magazine/speed_loader_pistol_35/rubber),
			list(name="Speed Loader (.35 Pepperball)", cost=30, path=/obj/item/ammo_magazine/speed_loader_pistol_35/rubber/pepperball),
			list(name="Speed Loader (.35 Practice)", cost=10, path=/obj/item/ammo_magazine/speed_loader_pistol_35/practice),
		".35 Standard",
			list(name="Standard Magazine (.35)", cost=50, path=/obj/item/ammo_magazine/pistol_35),
			list(name="Standard Magazine (.35 High-Velocity)", cost=80, path=/obj/item/ammo_magazine/pistol_35/highvelocity),
			list(name="Standard Magazine (.35 Hollow-Point)", cost=50, path=/obj/item/ammo_magazine/pistol_35/lethal),
			list(name="Standard Magazine (.35 Rubber)", cost=50, path= /obj/item/ammo_magazine/pistol_35/rubber),
			list(name="Standard Magazine (.35 Pepperball)", cost=50, path= /obj/item/ammo_magazine/pistol_35/rubber/pepperball),
			list(name="Standard Magazine (.35 Practice)", cost=50, path=/obj/item/ammo_magazine/pistol_35/practice),
			list(name="Standard Magazine (.35 LASER)", cost=10, path=/obj/item/ammo_magazine/pistol_35/laser/empty),
		".35 High Capacity",
			list(name="High Capacity Magazine (.35)", cost=100, path=/obj/item/ammo_magazine/highcap_pistol_35),
			list(name="High Capacity Magazine (.35 High-Velocity)", cost=150, path=/obj/item/ammo_magazine/highcap_pistol_35/highvelocity),
			list(name="High Capacity Magazine (.35 Hollow-Point)", cost=100, path=/obj/item/ammo_magazine/highcap_pistol_35/lethal),
			list(name="High Capacity Magazine (.35 Rubber)", cost=100, path=/obj/item/ammo_magazine/highcap_pistol_35/rubber),
			list(name="High Capacity Magazine (.35 Pepperball)", cost=100, path=/obj/item/ammo_magazine/highcap_pistol_35/rubber/pepperball),
			list(name="High Capacity Magazine (.35 Practice)", cost=20, path=/obj/item/ammo_magazine/highcap_pistol_35/practice),
			list(name="High Capacity Magazine (.35 LASER)", cost=15, /obj/item/ammo_magazine/highcap_pistol_35/laser/empty),
		".35 SMG",
			list(name="SMG Magazine (.35)", cost=180, path= /obj/item/ammo_magazine/smg_35),
			list(name="SMG Magazine (.35 High-Velocity)", cost=250, path= /obj/item/ammo_magazine/smg_35/hv),
			list(name="SMG Magazine (.35 Hollow-Point)", cost=180, path= /obj/item/ammo_magazine/smg_35/lethal),
			list(name="SMG Magazine (.35 Rubber)", cost=180, path= /obj/item/ammo_magazine/smg_35/rubber),
			list(name="SMG Magazine (.35 Pepperball)", cost=180, path= /obj/item/ammo_magazine/smg_35/rubber/pepperball),
			list(name="SMG Magazine (.35 Practice)", cost=70, path= /obj/item/ammo_magazine/smg_35/practice),
			list(name="SMG Magazine (.35 LASER)", cost=20, path= /obj/item/ammo_magazine/smg_35/laser/empty),
		".35 Drum",
			list(name="Standard Drum (.35)", cost=375, path=/obj/item/ammo_magazine/highcap_pistol_35/drum),
			list(name="Standard Drum (.35 High-Velocity)", cost=460, path=/obj/item/ammo_magazine/highcap_pistol_35/drum/hv),
			list(name="Standard Drum (.35 Hollow-Point)", cost=375, path=/obj/item/ammo_magazine/highcap_pistol_35/drum/lethal),
			list(name="Standard Drum (.35 Rubber)", cost=375, path=/obj/item/ammo_magazine/highcap_pistol_35/drum/rubber),
			list(name="Standard Drum (.35 Pepperball)", cost=375, path=/obj/item/ammo_magazine/highcap_pistol_35/drum/rubber/pepperball),
			list(name="Standard Drum (.35 Empty)", cost=200, path=/obj/item/ammo_magazine/highcap_pistol_35/drum/empty),
			list(name="Standard Drum (.35 LASER)", cost=200, path=/obj/item/ammo_magazine/highcap_pistol_35/drum/laser/empty),
		".35 Ammo Boxes",
			list(name="Packet (.35 Auto)", cost=165, path=/obj/item/ammo_magazine/ammobox/pistol_35),
			list(name="Packet (.35 Auto High-Velocity)", cost=270, path=/obj/item/ammo_magazine/ammobox/pistol_35/hv),
			list(name="Packet (.35 Auto Hollow-Point)", cost=165, path=/obj/item/ammo_magazine/ammobox/pistol_35/lethal),
			list(name="Packet (.35 Auto Rubber)", cost=165, path=/obj/item/ammo_magazine/ammobox/pistol_35/rubber),
			list(name="Packet (.35 Auto Pepperball)", cost=165, path=/obj/item/ammo_magazine/ammobox/pistol_35/rubber/pepperball),
			list(name="Packet (.35 Auto Practice)", cost=100, path=/obj/item/ammo_magazine/ammobox/pistol_35/practice),
			list(name="Box    (.35 Auto)", cost=1155, path=/obj/item/ammo_magazine/ammobox/pistol_35/large),
			list(name="Box    (.35 Auto High-Velocity)", cost=1955, path=/obj/item/ammo_magazine/ammobox/pistol_35/large/hv),
			list(name="Box    (.35 Auto Hollow-Point)", cost=1155, path=/obj/item/ammo_magazine/ammobox/pistol_35/large/lethal),
			list(name="Box    (.35 Auto Rubber)", cost=1155, path=/obj/item/ammo_magazine/ammobox/pistol_35/large/rubber),
		".40 Magnum, Speed Loader",
			list(name="Speed Loader (.40)", cost=45, path=/obj/item/ammo_magazine/speed_loader_magnum_40),
			list(name="Speed Loader (.40 High-Velocity)", cost=80, path=/obj/item/ammo_magazine/speed_loader_magnum_40/highvelocity),
			list(name="Speed Loader (.40 Hollow-Point)", cost=45, path=/obj/item/ammo_magazine/speed_loader_magnum_40/lethal),
			list(name="Speed Loader (.40 Rubber)", cost=45, path=/obj/item/ammo_magazine/speed_loader_magnum_40/rubber),
			list(name="Speed Loader (.40 Pepperball)", cost=45, path=/obj/item/ammo_magazine/speed_loader_magnum_40/rubber/pepperball),
			list(name="Speed Loader (.40 Practice)", cost=25, path=/obj/item/ammo_magazine/speed_loader_magnum_40/practice),
		".40 Magnum, Pistol",
			list(name="Magnum Magazine (.40 Magnum)", cost=75, path=/obj/item/ammo_magazine/magnum_40),
			list(name="Magnum Magazine (.40 Magnum High-Velocity)", cost=130, path=/obj/item/ammo_magazine/magnum_40/hv),
			list(name="Magnum Magazine (.40 Magnum Hollow-Point)", cost=75, path=/obj/item/ammo_magazine/magnum_40/lethal),
			list(name="Magnum Magazine (.40 Magnum Rubber)", cost=75, path=/obj/item/ammo_magazine/magnum_40/rubber),
			list(name="Magnum Magazine (.40 Magnum Pepperball)", cost=75, path=/obj/item/ammo_magazine/magnum_40/rubber/pepperball),
			list(name="Magnum Magazine (.40 Magnum Practice)", cost=30, path=/obj/item/ammo_magazine/magnum_40/practice),
			list(name="Magnum Magazine (.40 Magnum LASER)", cost=25, path=/obj/item/ammo_magazine/magnum_40/laser/empty),
		".40 Magnum, SMG",
			list(name="SMG Magazine (.40 Magnum)", cost=480, path= /obj/item/ammo_magazine/smg_magnum_40),
			list(name="SMG Magazine (.40 Magnum High-Velocity)", cost=750, path= /obj/item/ammo_magazine/smg_magnum_40/hv),
			list(name="SMG Magazine (.40 Magnum Hollow-Point)", cost=480, path= /obj/item/ammo_magazine/smg_magnum_40/lethal),
			list(name="SMG Magazine (.40 Magnum Rubber)", cost=400, path= /obj/item/ammo_magazine/smg_magnum_40/rubber),
			list(name="SMG Magazine (.40 Magnum Pepperball)", cost=400, path= /obj/item/ammo_magazine/smg_magnum_40/rubber/pepperball),
			list(name="SMG Magazine (.40 Magnum Practice)", cost=300, path= /obj/item/ammo_magazine/smg_magnum_40/practice),
			list(name="SMG Magazine (.40 Magnum Empty)", cost=240, path= /obj/item/ammo_magazine/smg_magnum_40/empty),
		".40 Ammo Boxes",
			list(name="Packet (.40 Magnum)", cost=250, path=/obj/item/ammo_magazine/ammobox/magnum_40),
			list(name="Packet (.40 Magnum High-Velocity)", cost=460, path=/obj/item/ammo_magazine/ammobox/magnum_40/hv),
			list(name="Packet (.40 Magnum Hollow-Point)", cost=250, path=/obj/item/ammo_magazine/ammobox/magnum_40/lethal),
			list(name="Packet (.40 Magnum Rubber)", cost=250, path=/obj/item/ammo_magazine/ammobox/magnum_40/rubber),
			list(name="Packet (.40 Magnum Pepperball)", cost=250, path=/obj/item/ammo_magazine/ammobox/magnum_40/rubber/pepperball),
			list(name="Packet (.40 Magnum Practice)", cost=100, path=/obj/item/ammo_magazine/ammobox/magnum_40/practice),
			list(name="Box    (.40 Magnum)", cost=1250, path=/obj/item/ammo_magazine/ammobox/magnum_40/large),
			list(name="Box    (.40 Magnum High-Velocity)", cost=1920, path=/obj/item/ammo_magazine/ammobox/magnum_40/large/hv),
			list(name="Box    (.40 Magnum Hollow-Point)", cost=1250, path=/obj/item/ammo_magazine/ammobox/magnum_40/large/lethal),
			list(name="Box    (.40 Magnum Rubber)", cost=1250, path=/obj/item/ammo_magazine/ammobox/magnum_40/large/rubber),
		".50 Kurz, Speed Loader",
			list(name="Speed Loader (.50)", cost=60, path=/obj/item/ammo_magazine/speed_loader_kurz_50),
			list(name="Speed Loader (.50 High-Velocity)", cost=100, path=/obj/item/ammo_magazine/speed_loader_kurz_50/highvelocity),
			list(name="Speed Loader (.50 Hollow-Point)", cost=60, path=/obj/item/ammo_magazine/speed_loader_kurz_50/lethal),
			list(name="Speed Loader (.50 Rubber)", cost=60, path=/obj/item/ammo_magazine/speed_loader_kurz_50/rubber),
			list(name="Speed Loader (.50 Pepperball)", cost=60, path=/obj/item/ammo_magazine/speed_loader_kurz_50/rubber/pepperball),
			list(name="Speed Loader (.50 Practice)", cost=20, path=/obj/item/ammo_magazine/speed_loader_kurz_50/practice),
		".50 Kurz, Heavy Pistol",
			list(name="Heavy Pistol Magazine (.50 Standard)", cost=100, path=/obj/item/ammo_magazine/kurz_50),
			list(name="Heavy Pistol Magazine (.50 High-Velocity)", cost=150, path=/obj/item/ammo_magazine/kurz_50/hv),
			list(name="Heavy Pistol Magazine (.50 Hollow-Point)", cost=100, path=/obj/item/ammo_magazine/kurz_50/lethal),
			list(name="Heavy Pistol Magazine (.50 Rubber)", cost=100, path=/obj/item/ammo_magazine/kurz_50/rubber),
			list(name="Heavy Pistol Magazine (.50 Pepperball)", cost=100, path=/obj/item/ammo_magazine/kurz_50/rubber/pepperball),
			list(name="Heavy Pistol Magazine (.50 Practice)", cost=20, path=/obj/item/ammo_magazine/kurz_50/practice),
			list(name="Heavy Pistol Magazine (.50 LASER)", cost=15, path=/obj/item/ammo_magazine/kurz_50/laser/empty),
		".50 Kurz, Ammo Boxes",
			list(name="Box (.50 Standard)", cost=330, path=/obj/item/ammo_magazine/ammobox/kurz_50),
			list(name="Box (.50 High-Velocity)", cost=480, path=/obj/item/ammo_magazine/ammobox/kurz_50/hv),
			list(name="Box (.50 Hollow-Point)", cost=330, path=/obj/item/ammo_magazine/ammobox/kurz_50/lethal),
			list(name="Box (.50 Rubber)", cost=330, path=/obj/item/ammo_magazine/ammobox/kurz_50/rubber),
			list(name="Box (.50 Pepperball)", cost=330, path=/obj/item/ammo_magazine/ammobox/kurz_50/rubber/pepperball),
			list(name="Box (.50 Practice)", cost=100, path=/obj/item/ammo_magazine/ammobox/kurz_50/practice),
		"10x24 Caseless",
			list(name="Caseless Light Rifle Magazine (10x24mm)", cost=100, path=/obj/item/ammo_magazine/smg_10x24),
			list(name="Caseless Magazine (10x24mm)", cost=500, path=/obj/item/ammo_magazine/c10x24),
			list(name="Box (10x24mm Caseless)", cost=1650, path=/obj/item/ammo_magazine/ammobox/c10x24),
		".257 Carbine, Short",
			list(name="Short Carbine Magazine (.257)", cost=200, path=/obj/item/ammo_magazine/light_rifle_257_short),
			list(name="Short Carbine Magazine (.257 High-Velocity)", cost=300, path=/obj/item/ammo_magazine/ammobox/light_rifle_257_small/hv),
			list(name="Short Carbine Magazine (.257 Hollow-Point)", cost=200, path=/obj/item/ammo_magazine/light_rifle_257_short/lethal),
			list(name="Short Carbine Magazine (.257 Rubber)", cost=200, path=/obj/item/ammo_magazine/light_rifle_257_short/rubber),
			list(name="Short Carbine Magazine (.257 Pepperball)", cost=200, path=/obj/item/ammo_magazine/light_rifle_257_short/rubber/pepperball),
			list(name="Short Carbine Magazine (.257 Practice)", cost=50, path=/obj/item/ammo_magazine/light_rifle_257_short/practice),
		".257 Carbine, Long",
			list(name="Carbine Magazine (.257)", cost=300, path=/obj/item/ammo_magazine/light_rifle_257),
			list(name="Carbine Magazine (.257 High-Velocity)", cost=450, path=/obj/item/ammo_magazine/light_rifle_257/highvelocity),
			list(name="Carbine Magazine (.257 Hollow-Point)", cost=300, path=/obj/item/ammo_magazine/light_rifle_257/lethal),
			list(name="Carbine Magazine (.257 Rubber)", cost=300, path=/obj/item/ammo_magazine/light_rifle_257/rubber),
			list(name="Carbine Magazine (.257 Pepperball)", cost=300, path=/obj/item/ammo_magazine/light_rifle_257/rubber/pepperball),
			list(name="Carbine Magazine (.257 Practice)", cost=100, path=/obj/item/ammo_magazine/light_rifle_257/practice),
			list(name="Carbine Magazine (.257 LASER)", cost=80, path=/obj/item/ammo_magazine/light_rifle_257/laser/empty),
		".257 Carbine, Drum",
			list(name="Carbine Drum Magazine (.257)", cost=1080, path= /obj/item/ammo_magazine/light_rifle_257_drum),
			list(name="Carbine Drum Magazine (.257 High-Velocity)", cost=1620, path= /obj/item/ammo_magazine/light_rifle_257_drum/highvelocity),
			list(name="Carbine Drum Magazine (.257 Hollow-Point)", cost=1080, path= /obj/item/ammo_magazine/light_rifle_257_drum/lethal),
			list(name="Carbine Drum Magazine (.257 Rubber)", cost=680, path= /obj/item/ammo_magazine/light_rifle_257_drum/rubber),
			list(name="Carbine Drum Magazine (.257 Pepperball)", cost=680, path= /obj/item/ammo_magazine/light_rifle_257_drum/rubber/pepperball),
			list(name="Carbine Drum Magazine (.257 Practice)", cost=420, path= /obj/item/ammo_magazine/light_rifle_257_drum/practice),
			list(name="Carbine Drum Magazine (.257 Empty)", cost=420, path= /obj/item/ammo_magazine/light_rifle_257_drum/empty),
		".257, Ammo Box",
			list(name="Packet (.257)", cost=990, path=/obj/item/ammo_magazine/ammobox/light_rifle_257_small),
			list(name="Packet (.257 High-Velocity)", cost=1485, path=/obj/item/ammo_magazine/ammobox/light_rifle_257_small/hv),
			list(name="Packet (.257 Hollow-Point)", cost=990, path=/obj/item/ammo_magazine/ammobox/light_rifle_257_small/lethal),
			list(name="Packet (.257 Rubber)", cost=990, path=/obj/item/ammo_magazine/ammobox/light_rifle_257_small/rubber),
			list(name="Packet (.257 Pepperball)", cost=990, path=/obj/item/ammo_magazine/ammobox/light_rifle_257_small/rubber/pepperball),
			list(name="Packet (.257 Practice)", cost=850, path=/obj/item/ammo_magazine/ammobox/light_rifle_257_small/practice),
			list(name="Box (.257)", cost=2800, path=/obj/item/ammo_magazine/ammobox/light_rifle_257),
			list(name="Box (.257 High-Velocity)", cost=4200, path=/obj/item/ammo_magazine/ammobox/light_rifle_257/highvelocity),
			list(name="Box (.257 Hollow-Point)", cost=2800, path=/obj/item/ammo_magazine/ammobox/light_rifle_257/lethal),
			list(name="Box (.257 Rubber)", cost=2800, path=/obj/item/ammo_magazine/ammobox/light_rifle_257/rubber),
			list(name="Box (.257 Practice)", cost=200, path=/obj/item/ammo_magazine/ammobox/light_rifle_257/practice),
			list(name="Linked Ammunition Box (.257)", cost=1000, path=/obj/item/ammo_magazine/rifle_75_linked_box/light_rifle_257),
			list(name="Linked Ammunition Box (.257 High-Velocity)", cost=1500, path=/obj/item/ammo_magazine/rifle_75_linked_box/light_rifle_257/highvelocity),
			list(name="Linked Ammunition Box (.257 Hollow-Point)", cost=1000, path=/obj/item/ammo_magazine/rifle_75_linked_box/light_rifle_257/lethal),
			list(name="Linked Ammunition Box (.257 Rubber)", cost=675, path=/obj/item/ammo_magazine/rifle_75_linked_box/light_rifle_257/rubber),
			list(name="Linked Ammunition Box (.257 Empty)", cost=200, path=/obj/item/ammo_magazine/rifle_75_linked_box/light_rifle_257/empty),
		"7.5mm Rifle, Short",
			list(name="Short Rifle Magazine (7.5mm)", cost=300, path=/obj/item/ammo_magazine/rifle_75_short),
			list(name="Short Rifle Magazine (7.5mm APDS)", cost=450, path=/obj/item/ammo_magazine/rifle_75_short/highvelocity),
			list(name="Short Rifle Magazine (7.5mm Hollow-Point)", cost=300, path=/obj/item/ammo_magazine/rifle_75_short/lethal),
			list(name="Short Rifle Magazine (7.5mm Rubber)", cost=300, path=/obj/item/ammo_magazine/rifle_75_short/rubber),
			list(name="Short Rifle Magazine (7.5mm Practice)", cost=75, path=/obj/item/ammo_magazine/rifle_75_short/practice),
		"7.5mm Rifle",
			list(name="Ammo Strip (7.5mm Rifle)", cost=400, path=/obj/item/ammo_magazine/speed_loader_rifle_75),
			list(name="Rifle Magazine (7.5mm)", cost=400, path=/obj/item/ammo_magazine/rifle_75),
			list(name="Rifle Magazine (7.5mm APDS)", cost=600, path=/obj/item/ammo_magazine/rifle_75/highvelocity),
			list(name="Rifle Magazine (7.5mm Hollow-Point)", cost=400, path=/obj/item/ammo_magazine/rifle_75/lethal),
			list(name="Rifle Magazine (7.5mm Rubber)", cost=400, path=/obj/item/ammo_magazine/rifle_75/rubber),
			list(name="Rifle Magazine (7.5mm Practice)", cost=100, path=/obj/item/ammo_magazine/rifle_75/practice),
			list(name="Rifle Magazine (7.5mm LASER)", cost=80, path=/obj/item/ammo_magazine/rifle_75/laser/empty),
		"7.5mm Rifle, Drum",
			list(name="Rifle Drum Magazine (7.5mm)", cost=1080, path=/obj/item/ammo_magazine/rifle_75_drum),
			list(name="Rifle Drum Magazine (7.5mm APDS)", cost=1620, path=/obj/item/ammo_magazine/rifle_75_drum/highvelocity),
			list(name="Rifle Drum Magazine (7.5mm Hollow-Point)", cost=1080, path=/obj/item/ammo_magazine/rifle_75_drum/lethal),
			list(name="Rifle Drum Magazine (7.5mm Rubber)", cost=680, path=/obj/item/ammo_magazine/rifle_75_drum/rubber),
			list(name="Rifle Drum Magazine (7.5mm Practice)", cost=420, path=/obj/item/ammo_magazine/rifle_75_drum/practice),
			list(name="Rifle Drum Magazine (7.5mm Empty)", cost=420, path=/obj/item/ammo_magazine/rifle_75_drum/empty),
			list(name="Rifle Pan (7.5mm)", cost=1600, path=/obj/item/ammo_magazine/maxim_75),
			list(name="Rifle Pan (7.5mm Empty)", cost=300, path=/obj/item/ammo_magazine/maxim_75/empty),
		"7.5mm, Ammo Boxes",
			list(name="Packet (7.5mm)", cost=990, path=/obj/item/ammo_magazine/ammobox/rifle_75_small),
			list(name="Packet (7.5mm APDS)", cost=1485, path=/obj/item/ammo_magazine/ammobox/rifle_75_small/hv),
			list(name="Packet (7.5mm Hollow-Point)", cost=990, path=/obj/item/ammo_magazine/ammobox/rifle_75_small/lethal),
			list(name="Packet (7.5mm Rubber)", cost=990, path=/obj/item/ammo_magazine/ammobox/rifle_75_small/rubber),
			list(name="Packet (7.5mm Practice)", cost=850, path=/obj/item/ammo_magazine/ammobox/rifle_75_small/practice),
			list(name="Box (7.5mm)", cost=3500, path=/obj/item/ammo_magazine/ammobox/rifle_75),
			list(name="Box (7.5mm APDS)", cost=5250, path=/obj/item/ammo_magazine/ammobox/rifle_75/hv),
			list(name="Box (7.5mm Hollow-Point)", cost=3500, path=/obj/item/ammo_magazine/ammobox/rifle_75/lethal),
			list(name="Box (7.5mm Rubber)", cost=3500, path=/obj/item/ammo_magazine/ammobox/rifle_75/rubber),
			list(name="Box (7.5mm Practice)", cost=200, path=/obj/item/ammo_magazine/ammobox/rifle_75/practice),
			list(name="Linked Ammunition Box (7.5mm Rifle)", cost=1300, path=/obj/item/ammo_magazine/rifle_75_linked_box),
			list(name="Linked Ammunition Box (7.5mm APDS)", cost=1950, path=/obj/item/ammo_magazine/rifle_75_linked_box/highvelocity),
			list(name="Linked Ammunition Box (7.5mm Hollow-Point)", cost=1300, path=/obj/item/ammo_magazine/rifle_75_linked_box/lethal),
			list(name="Linked Ammunition Box (7.5mm Rubber)", cost=1100, path=/obj/item/ammo_magazine/rifle_75_linked_box/rubber),
			list(name="Linked Ammunition Box (7.5mm Empty)", cost=500, path=/obj/item/ammo_magazine/rifle_75_linked_box/empty),
		".408 Heavy Rifle",
			list(name="Heavy Rifle Stripper Clip (.408 Rifle)", cost=500, path=/obj/item/ammo_magazine/speed_loader_heavy_rifle_408),
			list(name="Heavy Rifle Magazine (.408)", cost=500, path=/obj/item/ammo_magazine/heavy_rifle_408),
			list(name="Heavy Rifle Magazine (.408 SLAP)", cost=750, path=/obj/item/ammo_magazine/heavy_rifle_408/hv),
			list(name="Heavy Rifle Magazine (.408 Hollow-Point)", cost=500, path=/obj/item/ammo_magazine/heavy_rifle_408/lethal),
			list(name="Heavy Rifle Magazine (.408 Rubber)", cost=400, path=/obj/item/ammo_magazine/heavy_rifle_408/rubber),
			list(name="Heavy Rifle Magazine (.408 Practice)", cost=100, path=/obj/item/ammo_magazine/heavy_rifle_408/practice),
			list(name="Heavy Rifle Magazine (.408 LASER)", cost=80, path=/obj/item/ammo_magazine/heavy_rifle_408/laser/empty),
		".408 Heavy Rifle, Drum",
			list(name="Heavy Rifle Drum Magazine (.408 Ball)", cost=700, path=/obj/item/ammo_magazine/heavy_rifle_408_drum),
			list(name="Heavy Rifle Drum Magazine (.408 SLAP)", cost=1080, path=/obj/item/ammo_magazine/heavy_rifle_408_drum/slap),
			list(name="Heavy Rifle Drum Magazine (.408 Hollow-Point)", cost=700, path=/obj/item/ammo_magazine/heavy_rifle_408_drum/lethal),
			list(name="Heavy Rifle Drum Magazine (.408 Baton)", cost=700, path=/obj/item/ammo_magazine/heavy_rifle_408_drum/rubber),
			list(name="Heavy Rifle Drum Magazine (.408 Incendiary)", cost=1620, path=/obj/item/ammo_magazine/heavy_rifle_408_drum/incend),
		".408, Ammo Packets",
			list(name="Packet (.408)", cost=1200, path=/obj/item/ammo_magazine/ammobox/heavy_rifle_408_small),
			list(name="Packet (.408 SLAP)", cost=1480, path=/obj/item/ammo_magazine/ammobox/heavy_rifle_408_small/hv),
			list(name="Packet (.408 Hollow-Point)", cost=1480, path=/obj/item/ammo_magazine/ammobox/heavy_rifle_408_small/lethal),
			list(name="Packet (.408 Rubber)", cost=1200, path=/obj/item/ammo_magazine/ammobox/heavy_rifle_408_small/rubber),
			list(name="Packet (.408 Practice)", cost=70, path=/obj/item/ammo_magazine/ammobox/heavy_rifle_408_small/practice),
			list(name="Packet (.408 Incendiary)", cost=1500, path=/obj/item/ammo_magazine/ammobox/heavy_rifle_408_small/incend),
		".408, Ammo Boxes",
			list(name="Box (.408)", cost=3820, path=/obj/item/ammo_magazine/ammobox/heavy_rifle_408),
			list(name="Box (.408 SLAP)", cost=5730, path=/obj/item/ammo_magazine/ammobox/heavy_rifle_408/hv),
			list(name="Box (.408 Hollow-Point)", cost=3820, path=/obj/item/ammo_magazine/ammobox/heavy_rifle_408/lethal),
			list(name="Box (.408 Rubber)", cost=3220, path=/obj/item/ammo_magazine/ammobox/heavy_rifle_408/rubber),
			list(name="Box (.408 Practice)", cost=200, path=/obj/item/ammo_magazine/ammobox/heavy_rifle_408/practice),
			list(name="Linked Ammunition Box (.408)", cost=2820, path=/obj/item/ammo_magazine/rifle_75_linked_box/heavy_rifle_408),
			list(name="Linked Ammunition Box (.408 SLAP)", cost=4230, path=/obj/item/ammo_magazine/rifle_75_linked_box/heavy_rifle_408/highvelocity),
			list(name="Linked Ammunition Box (.408 Hollow-Point)", cost=2820, path=/obj/item/ammo_magazine/rifle_75_linked_box/heavy_rifle_408/lethal),
			list(name="Linked Ammunition Box (.408 Rubber)", cost=2820, path=/obj/item/ammo_magazine/rifle_75_linked_box/heavy_rifle_408/rubber),
			list(name="Linked Ammunition Box (.408 Empty)", cost=420, path=/obj/item/ammo_magazine/rifle_75_linked_box/heavy_rifle_408/empty),
		"20mm Shotgun shells, loose",
			list(name="Shells (20mm Slug)", cost=100, path=/obj/item/ammo_casing/shotgun/prespawned),
			list(name="Shells (20mm Buckshot)", cost=100, path=/obj/item/ammo_casing/shotgun/pellet/prespawned),
			list(name="Shells (20mm Beanbag)", cost=50, path=/obj/item/ammo_casing/shotgun/beanbag/prespawned),
			list(name="Shells (20mm Pepperball)", cost=50, path=/obj/item/ammo_casing/shotgun/beanbag/pepperball/prespawned),
			list(name="Shells (20mm Stun)", cost=100, path=/obj/item/ammo_casing/shotgun/stunshell/prespawned),
			list(name="Shells (20mm Illumination)", cost=50, path=/obj/item/ammo_casing/shotgun/illumination/prespawned),
			list(name="Shells (20mm Blank)", cost=50, path=/obj/item/ammo_casing/shotgun/blank/prespawned),
			list(name="Shells (20mm Practice)", cost=50, path=/obj/item/ammo_casing/shotgun/practice/prespawned),
			//list(name="Shells (20mm Payload)", cost=500, path=/obj/item/ammo_casing/shotgun/payload/prespawned),
		"20mm Shotgun shells, magazines",
			list(name="Loader Tube (20mm Slug)", cost = 400, path=/obj/item/ammo_magazine/speed_loader_shotgun),
			list(name="Loader Tube (20mm Buckshot)", cost = 400, path=/obj/item/ammo_magazine/speed_loader_shotgun/pellet),
			list(name="Loader Tube (20mm Beanbag)", cost = 400, path=/obj/item/ammo_magazine/speed_loader_shotgun/beanbag),
			list(name="Loader Tube (20mm Pepperball)", cost = 300, path=/obj/item/ammo_magazine/speed_loader_shotgun/beanbag/pepperball),
			list(name="Loader Tube (20mm Empty)", cost = 250, path=/obj/item/ammo_magazine/speed_loader_shotgun/empty),
			list(name="SBAW Magazine (20mm Sabot Slug)", cost=600, path=/obj/item/ammo_magazine/sbaw),
			list(name="SBAW Magazine (20mm Buckshot)", cost=600, path=/obj/item/ammo_magazine/sbaw/pellet),
			list(name="SBAW Magazine (20mm Beanbag)", cost=500, path=/obj/item/ammo_magazine/sbaw/beanbag),
			//list(name="SBAW Magazine (20mm HEFI)", cost=2600, path=/obj/item/ammo_magazine/sbaw/he),
			list(name="SBAW Magazine (20mm Empty)", cost=400, path=/obj/item/ammo_magazine/sbaw/empty),
			list(name="Ammo Drum (20mm Sabot Slug)", cost=850, path=/obj/item/ammo_magazine/m12),
			list(name="Ammo Drum (20mm Buckshot)", cost=850, path=/obj/item/ammo_magazine/m12/pellet),
			list(name="Ammo Drum (20mm Beanbag)", cost=650, path=/obj/item/ammo_magazine/m12/beanbag),
			list(name="Ammo Drum (20mm Empty)", cost=500, path=/obj/item/ammo_magazine/m12/empty),
		"20mm Shotgun, Boxes",
			list(name="Box (20mm Slug)", cost=2500, path=/obj/item/ammo_magazine/ammobox/shotgun),
			list(name="Box (20mm Buckshot)", cost=2500, path=/obj/item/ammo_magazine/ammobox/shotgun/buckshot),
			list(name="Box (20mm Beanbag)", cost=2000, path=/obj/item/ammo_magazine/ammobox/shotgun/beanbags),
			list(name="Box (20mm Pepperball)", cost=2000, path=/obj/item/ammo_magazine/ammobox/shotgun/beanbags/pepperball),
			list(name="Box (20mm Stun)", cost=2500, path=/obj/item/ammo_magazine/ammobox/shotgun/stunshells),
			list(name="Box (20mm Illumination)", cost=500, path=/obj/item/ammo_magazine/ammobox/shotgun/flash),
			list(name="Box (20mm Blank)", cost=500, path=/obj/item/ammo_magazine/ammobox/shotgun/blanks),
			list(name="Box (20mm Practice)", cost=500, path=/obj/item/ammo_magazine/ammobox/shotgun/practiceshells),
			list(name="Box (20mm Incendiary)", cost=4500, path=/obj/item/ammo_magazine/ammobox/shotgun/incendiary),
			//list(name="Box (20mm Payload)", cost=7500, path=/obj/item/ammo_magazine/ammobox/shotgun/payload),
		"40mm Grenade",
			list(name="Grenade Shell Baton", cost=250, path=/obj/item/ammo_casing/grenade),
			list(name="Grenade Shell Flash", cost=250, path=/obj/item/ammo_casing/grenade/flash),
			list(name="Grenade Shell Blast", cost=900, path=/obj/item/ammo_casing/grenade/blast),
			list(name="Grenade Shell Frag", cost=900, path=/obj/item/ammo_casing/grenade/frag),
			list(name="Grenade Shell Stinger", cost=300, path=/obj/item/ammo_casing/grenade/frag/stinger),
			list(name="Grenade Shell EMP", cost=900, path=/obj/item/ammo_casing/grenade/emp),
		"40mm Grenade Boxes",
			list(name="Grenade Box (Baton)", cost=1500, path=/obj/item/storage/box/baton_rounds),
			list(name="Grenade Box (Flash)", cost=1500, path=/obj/item/storage/box/flash_grenade_shells),
			list(name="Grenade Box (Blast)", cost=5400, path=/obj/item/storage/box/blast_grenade_shells),
			list(name="Grenade Box (Frag)", cost=5400, path=/obj/item/storage/box/frag_grenade_shells),
			list(name="Grenade Box (EMP)", cost=5400, path=/obj/item/storage/box/emp_grenade_shells),
		".60-06 AP, Anti-Materiel",
			list(name="Box (.60-06 AP)", cost=12000, path=/obj/item/ammo_magazine/ammobox/antim),
			list(name=".60-06 Anti-Materiel Red-Nose", cost=2000, path=/obj/item/ammo_casing/antim/lethal/prespawned),
			list(name=".60-06 Anti-Materiel Off-Switch", cost=2000, path=/obj/item/ammo_casing/antim/ion/prespawned),
			list(name=".60-06 Anti-Materiel Willy-Pete", cost=2000, path=/obj/item/ammo_casing/antim/incend/prespawned),
		"Mech Caliber Munitions",
			list(name="60mm HEAD ammunition box", cost=1500, path=/obj/item/mech_ammo_box/cannon),
			list(name="30mm HEAD ammunition box", cost=1000, path=/obj/item/mech_ammo_box/ultracannon),
			list(name="50mm HEAD ammunition box", cost=1250, path=/obj/item/mech_ammo_box/scattershot),
	)

/obj/machinery/bulletfabricator/update_icon()
	if(!processing)
		icon_state = "ammolathe"
	else
		icon_state = "ammolathe_work"
	return

/obj/machinery/bulletfabricator/attackby(var/obj/item/I, var/mob/user)
	if(!check_user(user))
		return
	if(istype(I, /obj/item/stack/material/cyborg))
		return // Prevents borgs throwing their stuff into it
	if(default_deconstruction(I, user))
		return
	if(default_part_replacement(I, user))
		return

	if(processing)
		to_chat(user, SPAN_NOTICE("[src] is currently processing."))
	else if(!istype(I, /obj/item/stack/material) && !istype(I, /obj/item/stack/material/refined_scrap))
		to_chat(user, SPAN_NOTICE("You cannot put this in [src]."))
	else
		var/i = 0
		for(var/obj/item/stack/material/G in contents)
			i++
		if(i >= 120)
			to_chat(user, SPAN_NOTICE("[src] is full! Activate it."))
		else
			user.remove_from_mob(I)
			I.forceMove(src)
			to_chat(user, SPAN_NOTICE("You put [I] in [src]"))

	update_icon()

/obj/machinery/bulletfabricator/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "BulletFabricator", name)
		ui.open()

/obj/machinery/bulletfabricator/ui_static_data(mob/user)
	var/list/data = list()

	var/list/recipes_data = list()

	for(var/id in recipes)
		if(istext(id))
			recipes_data += list(list(
				"is_category" = TRUE,
				"name" = id,
			))
		else
			recipes_data += list(list(
				"is_category" = FALSE,
				"name" = id["name"],
				"cost" = round(id["cost"] / build_eff)
			))

	data["recipes"] = recipes_data

	return data

/obj/machinery/bulletfabricator/ui_data(mob/user)
	var/list/data = list()

	data["points"] = points
	data["menustate"] = menustat
	data["processing"] = processing

	return data

/obj/machinery/bulletfabricator/attack_hand(mob/user as mob)
	if(..())
		return TRUE

	ui_interact(user)

/obj/machinery/bulletfabricator/proc/activate()
	if (usr.stat)
		return
	if (stat) // NOPOWER etc
		return
	if(processing)
		to_chat(usr, SPAN_NOTICE("The bullet fabricator is in the process of working."))
		return
	var/S = 0
	for(var/obj/item/stack/I in contents)
		S += 5
		points += I.amount * I.price_tag * 5
		qdel(I)
	if(S)
		processing = TRUE
		update_icon()
		playsound(loc, 'sound/sanity/hydraulic.ogg', 50, 1)
		use_power(S * 30)
		addtimer(CALLBACK(src, PROC_REF(finish_processing)), (1 + S * 0.5) / eat_eff)
	else
		menustat = "void"

/obj/machinery/bulletfabricator/proc/finish_processing()
	processing = FALSE
	update_icon()

/obj/machinery/bulletfabricator/proc/create_product(item)
	var/list/recipe = null
	if(processing)
		return

	for(var/list/R in recipes)
		if(R["name"] == item)
			recipe = R
			break
	if(!recipe)
		return

	var/cost = recipe["cost"] / build_eff

	if(cost > points)
		menustat = "nopoints"
		return FALSE

	processing = TRUE
	update_icon()
	updateUsrDialog() // Maybe we can remove it
	points -= cost
	addtimer(CALLBACK(src, PROC_REF(finish_creating_product), recipe["path"]), cost / eat_eff * 0.1)

/obj/machinery/bulletfabricator/proc/finish_creating_product(path)
	new path(loc)
	menustat = "menu" // Complete adds an extra step thats annoying to deal with
	finish_processing()

/obj/machinery/bulletfabricator/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	switch(action)
		if("activate")
			activate()
			. = TRUE
		if("create")
			create_product(params["item"])
			. = TRUE
		if("reset_menu")
			menustat = "menu"
			. = TRUE

/obj/machinery/bulletfabricator/RefreshParts()
	..()
	var/man_rating = 0
	var/bin_rating = 0

	for(var/obj/item/stock_parts/P in component_parts)
		if(istype(P, /obj/item/stock_parts/matter_bin))
			bin_rating += P.rating
		if(istype(P, /obj/item/stock_parts/manipulator))
			man_rating += P.rating

	build_eff = man_rating
	eat_eff = bin_rating

/obj/machinery/bulletfabricator/proc/check_user(mob/user)
	if(user.stats?.getPerk(PERK_HANDYMAN) || user.stats?.getPerk(PERK_GUNSMITH) || user.stat_check(STAT_MEC, STAT_LEVEL_ADEPT) || user.stat_check(STAT_VIG, STAT_LEVEL_EXPERT))
		return TRUE
	to_chat(user, SPAN_NOTICE("You don't know how to make the [src] work, you lack the training or mechanical skill."))
	return FALSE
