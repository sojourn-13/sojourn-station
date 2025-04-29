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
		"9mm Speed Loader",
			list(name="Speed Loader (9mm)", cost=30, path=/obj/item/ammo_magazine/speed_loader_pistol_35),
			list(name="Speed Loader (9mm High Velocity)", cost=50, path=/obj/item/ammo_magazine/speed_loader_pistol_35/hv),
			list(name="Speed Loader (9mm Hollow Point)", cost=30, path=/obj/item/ammo_magazine/speed_loader_pistol_35/lethal),
			list(name="Speed Loader (9mm Rubber)", cost=30, path=/obj/item/ammo_magazine/speed_loader_pistol_35/rubber),
			list(name="Speed Loader (9mm Pepperball)", cost=30, path=/obj/item/ammo_magazine/speed_loader_pistol_35/rubber/pepperball),
			list(name="Speed Loader (9mm Practice)", cost=10, path=/obj/item/ammo_magazine/speed_loader_pistol_35/practice),
		"9mm Standard",
			list(name="Standard Magazine (9mm)", cost=50, path=/obj/item/ammo_magazine/pistol_35),
			list(name="Standard Magazine (9mm High Velocity)", cost=80, path=/obj/item/ammo_magazine/pistol_35/highvelocity),
			list(name="Standard Magazine (9mm Hollow Point)", cost=50, path=/obj/item/ammo_magazine/pistol_35/lethal),
			list(name="Standard Magazine (9mm Rubber)", cost=50, path= /obj/item/ammo_magazine/pistol_35/rubber),
			list(name="Standard Magazine (9mm Pepperball)", cost=50, path= /obj/item/ammo_magazine/pistol_35/rubber/pepperball),
			list(name="Standard Magazine (9mm Practice)", cost=50, path=/obj/item/ammo_magazine/pistol_35/practice),
		"9mm High Capacity",
			list(name="High Capacity Magazine (9mm)", cost=100, path=/obj/item/ammo_magazine/highcap_pistol_35),
			list(name="High Capacity Magazine (9mm High Velocity)", cost=150, path=/obj/item/ammo_magazine/highcap_pistol_35/highvelocity),
			list(name="High Capacity Magazine (9mm Hollow Point)", cost=100, path=/obj/item/ammo_magazine/highcap_pistol_35/lethal),
			list(name="High Capacity Magazine (9mm Rubber)", cost=100, path=/obj/item/ammo_magazine/highcap_pistol_35/rubber),
			list(name="High Capacity Magazine (9mm Pepperball)", cost=100, path=/obj/item/ammo_magazine/highcap_pistol_35/rubber/pepperball),
			list(name="High Capacity Magazine (9mm Practice)", cost=20, path=/obj/item/ammo_magazine/highcap_pistol_35/practice),
		"9mm SMG",
			list(name="SMG Magazine (9mm)", cost=180, path= /obj/item/ammo_magazine/smg_35),
			list(name="SMG Magazine (9mm High Velocity)", cost=250, path= /obj/item/ammo_magazine/smg_35/hv),
			list(name="SMG Magazine (9mm Hollow Point)", cost=180, path= /obj/item/ammo_magazine/smg_35/lethal),
			list(name="SMG Magazine (9mm Rubber)", cost=180, path= /obj/item/ammo_magazine/smg_35/rubber),
			list(name="SMG Magazine (9mm Pepperball)", cost=180, path= /obj/item/ammo_magazine/smg_35/rubber/pepperball),
			list(name="SMG Magazine (9mm Practice)", cost=70, path= /obj/item/ammo_magazine/smg_35/practice),
		"9mm Drum",
			list(name="Standard Drum (9mm)", cost=375, path=/obj/item/ammo_magazine/highcap_pistol_35/drum),
			list(name="Standard Drum (9mm High Velocity)", cost=460, path=/obj/item/ammo_magazine/highcap_pistol_35/drum/hv),
			list(name="Standard Drum (9mm Hollow Point)", cost=375, path=/obj/item/ammo_magazine/highcap_pistol_35/drum/lethal),
			list(name="Standard Drum (9mm Rubber)", cost=375, path=/obj/item/ammo_magazine/highcap_pistol_35/drum/rubber),
			list(name="Standard Drum (9mm Pepperball)", cost=375, path=/obj/item/ammo_magazine/highcap_pistol_35/drum/rubber/pepperball),
			list(name="Standard Drum (9mm Empty)", cost=200, path=/obj/item/ammo_magazine/highcap_pistol_35/drum/empty),
		"9mm Ammo Boxes",
			list(name="Packet (9mm Auto)", cost=165, path=/obj/item/ammo_magazine/ammobox/pistol_35),
			list(name="Packet (9mm Auto High Velocity)", cost=270, path=/obj/item/ammo_magazine/ammobox/pistol_35/hv),
			list(name="Packet (9mm Auto Hollow Point)", cost=165, path=/obj/item/ammo_magazine/ammobox/pistol_35/lethal),
			list(name="Packet (9mm Auto Rubber)", cost=165, path=/obj/item/ammo_magazine/ammobox/pistol_35/rubber),
			list(name="Packet (9mm Auto Pepperball)", cost=165, path=/obj/item/ammo_magazine/ammobox/pistol_35/rubber/pepperball),
			list(name="Packet (9mm Auto Practice)", cost=100, path=/obj/item/ammo_magazine/ammobox/pistol_35/practice),
			list(name="Box    (9mm auto)", cost=1155, path=/obj/item/ammo_magazine/ammobox/pistol_35/large),
			list(name="Box    (9mm auto High Velocity)", cost=1955, path=/obj/item/ammo_magazine/ammobox/pistol_35/large/hv),
			list(name="Box    (9mm auto Hollow Point)", cost=1155, path=/obj/item/ammo_magazine/ammobox/pistol_35/large/lethal),
			list(name="Box    (9mm auto Rubber)", cost=1155, path=/obj/item/ammo_magazine/ammobox/pistol_35/large/rubber),
		"10mm Magnum, Speed Loader",
			list(name="Speed Loader (10mm)", cost=45, path=/obj/item/ammo_magazine/speed_loader_magnum_40),
			list(name="Speed Loader (10mm High velocity)", cost=80, path=/obj/item/ammo_magazine/speed_loader_magnum_40/highvelocity),
			list(name="Speed Loader (10mm Hollow point)", cost=45, path=/obj/item/ammo_magazine/speed_loader_magnum_40/lethal),
			list(name="Speed Loader (10mm Rubber)", cost=45, path=/obj/item/ammo_magazine/speed_loader_magnum_40/rubber),
			list(name="Speed Loader (10mm Pepperball)", cost=45, path=/obj/item/ammo_magazine/speed_loader_magnum_40/rubber/pepperball),
			list(name="Speed Loader (10mm Practice)", cost=25, path=/obj/item/ammo_magazine/speed_loader_magnum_40/practice),
		"10mm Magnum, Pistol",
			list(name="Magnum Magazine (10mm Magnum)", cost=75, path=/obj/item/ammo_magazine/magnum_40),
			list(name="Magnum Magazine (10mm Magnum High Velocity)", cost=130, path=/obj/item/ammo_magazine/magnum_40/hv),
			list(name="Magnum Magazine (10mm Magnum Hollow Point)", cost=75, path=/obj/item/ammo_magazine/magnum_40/lethal),
			list(name="Magnum Magazine (10mm Magnum Rubber)", cost=75, path=/obj/item/ammo_magazine/magnum_40/rubber),
			list(name="Magnum Magazine (10mm Magnum Pepperball)", cost=75, path=/obj/item/ammo_magazine/magnum_40/rubber/pepperball),
			list(name="Magnum Magazine (10mm Magnum Practice)", cost=30, path=/obj/item/ammo_magazine/magnum_40/practice),
		"10mm Magnum, SMG",
			list(name="SMG Magazine (10mm Magnum)", cost=480, path= /obj/item/ammo_magazine/smg_magnum_40),
			list(name="SMG Magazine (10mm Magnum High Velocity)", cost=750, path= /obj/item/ammo_magazine/smg_magnum_40/hv),
			list(name="SMG Magazine (10mm Magnum Hollow Point)", cost=480, path= /obj/item/ammo_magazine/smg_magnum_40/lethal),
			list(name="SMG Magazine (10mm Magnum Rubber)", cost=400, path= /obj/item/ammo_magazine/smg_magnum_40/rubber),
			list(name="SMG Magazine (10mm Magnum Pepperball)", cost=400, path= /obj/item/ammo_magazine/smg_magnum_40/rubber/pepperball),
			list(name="SMG Magazine (10mm Magnum Practice)", cost=300, path= /obj/item/ammo_magazine/smg_magnum_40/practice),
			list(name="SMG Magazine (10mm Magnum Empty)", cost=240, path= /obj/item/ammo_magazine/smg_magnum_40/empty),
		"10mm Ammo Boxes",
			list(name="Packet (10mm Magnum)", cost=250, path=/obj/item/ammo_magazine/ammobox/magnum_40),
			list(name="Packet (10mm Magnum High Velocity)", cost=460, path=/obj/item/ammo_magazine/ammobox/magnum_40/hv),
			list(name="Packet (10mm Magnum Hollow Point)", cost=250, path=/obj/item/ammo_magazine/ammobox/magnum_40/lethal),
			list(name="Packet (10mm Magnum Rubber)", cost=250, path=/obj/item/ammo_magazine/ammobox/magnum_40/rubber),
			list(name="Packet (10mm Magnum Pepperball)", cost=250, path=/obj/item/ammo_magazine/ammobox/magnum_40/rubber/pepperball),
			list(name="Packet (10mm Magnum Practice)", cost=100, path=/obj/item/ammo_magazine/ammobox/magnum_40/practice),
			list(name="Box    (10mm Magnum)", cost=1250, path=/obj/item/ammo_magazine/ammobox/magnum_40/large),
			list(name="Box    (10mm Magnum High Velocity)", cost=1920, path=/obj/item/ammo_magazine/ammobox/magnum_40/large/hv),
			list(name="Box    (10mm Magnum Hollow Point)", cost=1250, path=/obj/item/ammo_magazine/ammobox/magnum_40/large/lethal),
			list(name="Box    (10mm Magnum Rubber)", cost=1250, path=/obj/item/ammo_magazine/ammobox/magnum_40/large/rubber),
		"12mm, Speed Loader",
			list(name="Speed Loader (12mm)", cost=60, path=/obj/item/ammo_magazine/speed_loader_kurtz_50),
			list(name="Speed Loader (12mm High Velocity)", cost=100, path=/obj/item/ammo_magazine/speed_loader_kurtz_50/highvelocity),
			list(name="Speed Loader (12mm Hollow Point)", cost=60, path=/obj/item/ammo_magazine/speed_loader_kurtz_50/lethal),
			list(name="Speed Loader (12mm Rubber)", cost=60, path=/obj/item/ammo_magazine/speed_loader_kurtz_50/rubber),
			list(name="Speed Loader (12mm Pepperball)", cost=60, path=/obj/item/ammo_magazine/speed_loader_kurtz_50/rubber/pepperball),
			list(name="Speed Loader (12mm Practice)", cost=20, path=/obj/item/ammo_magazine/speed_loader_kurtz_50/practice),
		"12mm, Heavy Pistol",
			list(name="Heavy Pistol Magazine (12mm Standard)", cost=100, path=/obj/item/ammo_magazine/kurtz_50),
			list(name="Heavy Pistol Magazine (12mm High velocity)", cost=150, path=/obj/item/ammo_magazine/kurtz_50/hv),
			list(name="Heavy Pistol Magazine (12mm Hollow point)", cost=100, path=/obj/item/ammo_magazine/kurtz_50/lethal),
			list(name="Heavy Pistol Magazine (12mm Rubber)", cost=100, path=/obj/item/ammo_magazine/kurtz_50/rubber),
			list(name="Heavy Pistol Magazine (12mm Pepperball)", cost=100, path=/obj/item/ammo_magazine/kurtz_50/rubber/pepperball),
			list(name="Heavy Pistol Magazine (12mm Practice)", cost=20, path=/obj/item/ammo_magazine/kurtz_50/practice),
		"12mm, Ammo Boxes",
			list(name="Box (12mm Standard)", cost=330, path=/obj/item/ammo_magazine/ammobox/kurtz_50),
			list(name="Box (12mm High Velocity)", cost=480, path=/obj/item/ammo_magazine/ammobox/kurtz_50/hv),
			list(name="Box (12mm Hollow Point)", cost=330, path=/obj/item/ammo_magazine/ammobox/kurtz_50/lethal),
			list(name="Box (12mm Rubber)", cost=330, path=/obj/item/ammo_magazine/ammobox/kurtz_50/rubber),
			list(name="Box (12mm Pepperball)", cost=330, path=/obj/item/ammo_magazine/ammobox/kurtz_50/rubber/pepperball),
			list(name="Box (12mm Practice)", cost=100, path=/obj/item/ammo_magazine/ammobox/kurtz_50/practice),
		"10x24 Caseless",
			list(name="Caseless Light Rifle Magazine (10x24mm)", cost=100, path=/obj/item/ammo_magazine/smg_10x24),
			list(name="Caseless Magazine (10x24mm)", cost=500, path=/obj/item/ammo_magazine/c10x24),
			list(name="Box (10x24mm Caseless)", cost=1650, path=/obj/item/ammo_magazine/ammobox/c10x24),
		"6.5 Carbine, Short",
			list(name="Short Carbine Magazine (6.5)", cost=200, path=/obj/item/ammo_magazine/light_rifle_257_short),
			list(name="Short Carbine Magazine (6.5 High Velocity)", cost=300, path=/obj/item/ammo_magazine/ammobox/light_rifle_257_small/hv),
			list(name="Short Carbine Magazine (6.5 Hollow Point)", cost=200, path=/obj/item/ammo_magazine/light_rifle_257_short/lethal),
			list(name="Short Carbine Magazine (6.5 Rubber)", cost=200, path=/obj/item/ammo_magazine/light_rifle_257_short/rubber),
			list(name="Short Carbine Magazine (6.5 Pepperball)", cost=200, path=/obj/item/ammo_magazine/light_rifle_257_short/rubber/pepperball),
			list(name="Short Carbine Magazine (6.5 Practice)", cost=50, path=/obj/item/ammo_magazine/light_rifle_257_short/practice),
		"6.5 Carbine, Long",
			list(name="Carbine Magazine (6.5)", cost=300, path=/obj/item/ammo_magazine/light_rifle_257),
			list(name="Carbine Magazine (6.5 High Velocity)", cost=450, path=/obj/item/ammo_magazine/light_rifle_257/highvelocity),
			list(name="Carbine Magazine (6.5 Hollow Point)", cost=300, path=/obj/item/ammo_magazine/light_rifle_257/lethal),
			list(name="Carbine Magazine (6.5 Rubber)", cost=300, path=/obj/item/ammo_magazine/light_rifle_257/rubber),
			list(name="Carbine Magazine (6.5 Pepperball)", cost=300, path=/obj/item/ammo_magazine/light_rifle_257/rubber/pepperball),
			list(name="Carbine Magazine (6.5 Practice)", cost=100, path=/obj/item/ammo_magazine/light_rifle_257/practice),
		"6.5 Carbine, Drum",
			list(name="Carbine Drum Magazine (6.5)", cost=1080, path= /obj/item/ammo_magazine/light_rifle_257_drum),
			list(name="Carbine Drum Magazine (6.5 High Velocity)", cost=1620, path= /obj/item/ammo_magazine/light_rifle_257_drum/highvelocity),
			list(name="Carbine Drum Magazine (6.5 Hollow Point)", cost=1080, path= /obj/item/ammo_magazine/light_rifle_257_drum/lethal),
			list(name="Carbine Drum Magazine (6.5 Rubber)", cost=680, path= /obj/item/ammo_magazine/light_rifle_257_drum/rubber),
			list(name="Carbine Drum Magazine (6.5 Pepperball)", cost=680, path= /obj/item/ammo_magazine/light_rifle_257_drum/rubber/pepperball),
			list(name="Carbine Drum Magazine (6.5 Practice)", cost=420, path= /obj/item/ammo_magazine/light_rifle_257_drum/practice),
			list(name="Carbine Drum Magazine (6.5 Empty)", cost=420, path= /obj/item/ammo_magazine/light_rifle_257_drum/empty),
		"6.5, Ammo Box",
			list(name="Packet (6.5)", cost=990, path=/obj/item/ammo_magazine/ammobox/light_rifle_257_small),
			list(name="Packet (6.5 High Velocity)", cost=1485, path=/obj/item/ammo_magazine/ammobox/light_rifle_257_small/hv),
			list(name="Packet (6.5 Hollow Point)", cost=990, path=/obj/item/ammo_magazine/ammobox/light_rifle_257_small/lethal),
			list(name="Packet (6.5 Rubber)", cost=990, path=/obj/item/ammo_magazine/ammobox/light_rifle_257_small/rubber),
			list(name="Packet (6.5 Pepperball)", cost=990, path=/obj/item/ammo_magazine/ammobox/light_rifle_257_small/rubber/pepperball),
			list(name="Packet (6.5 Practice)", cost=850, path=/obj/item/ammo_magazine/ammobox/light_rifle_257_small/practice),
			list(name="Box (6.5)", cost=2800, path=/obj/item/ammo_magazine/ammobox/light_rifle_257),
			list(name="Box (6.5 High Velocity)", cost=4200, path=/obj/item/ammo_magazine/ammobox/light_rifle_257/highvelocity),
			list(name="Box (6.5 Hollow Point)", cost=2800, path=/obj/item/ammo_magazine/ammobox/light_rifle_257/lethal),
			list(name="Box (6.5 Rubber)", cost=2800, path=/obj/item/ammo_magazine/ammobox/light_rifle_257/rubber),
			list(name="Box (6.5 Practice)", cost=200, path=/obj/item/ammo_magazine/ammobox/light_rifle_257/practice),
			list(name="Linked Ammunition Box (6.5)", cost=1000, path=/obj/item/ammo_magazine/rifle_75_linked_box/light_rifle_257),
			list(name="Linked Ammunition Box (6.5 High Velocity)", cost=1500, path=/obj/item/ammo_magazine/rifle_75_linked_box/light_rifle_257/highvelocity),
			list(name="Linked Ammunition Box (6.5 Hollow Point)", cost=1000, path=/obj/item/ammo_magazine/rifle_75_linked_box/light_rifle_257/lethal),
			list(name="Linked Ammunition Box (6.5 Rubber)", cost=675, path=/obj/item/ammo_magazine/rifle_75_linked_box/light_rifle_257/rubber),
			list(name="Linked Ammunition Box (6.5 Empty)", cost=200, path=/obj/item/ammo_magazine/rifle_75_linked_box/light_rifle_257/empty),
		"7.62 Rifle, Short",
			list(name="Short Rifle Magazine (7.62)", cost=300, path=/obj/item/ammo_magazine/rifle_75_short),
			list(name="Short Rifle Magazine (7.62 APDS)", cost=450, path=/obj/item/ammo_magazine/rifle_75_short/highvelocity),
			list(name="Short Rifle Magazine (7.62 Hollow Point)", cost=300, path=/obj/item/ammo_magazine/rifle_75_short/lethal),
			list(name="Short Rifle Magazine (7.62 Rubber)", cost=300, path=/obj/item/ammo_magazine/rifle_75_short/rubber),
			list(name="Short Rifle Magazine (7.62 Practice)", cost=75, path=/obj/item/ammo_magazine/rifle_75_short/practice),
		"7.62 Rifle",
			list(name="Ammo Strip (7.62 Rifle)", cost=400, path=/obj/item/ammo_magazine/speed_loader_rifle_75),
			list(name="Rifle Magazine (7.62)", cost=400, path=/obj/item/ammo_magazine/rifle_75),
			list(name="Rifle Magazine (7.62 APDS)", cost=600, path=/obj/item/ammo_magazine/rifle_75/highvelocity),
			list(name="Rifle Magazine (7.62 Hollow Point)", cost=400, path=/obj/item/ammo_magazine/rifle_75/lethal),
			list(name="Rifle Magazine (7.62 Rubber)", cost=400, path=/obj/item/ammo_magazine/rifle_75/rubber),
			list(name="Rifle Magazine (7.62 Practice)", cost=100, path=/obj/item/ammo_magazine/rifle_75/practice),
		"7.62 Rifle, Drum",
			list(name="Rifle Drum Magazine (7.62)", cost=1080, path=/obj/item/ammo_magazine/rifle_75_drum),
			list(name="Rifle Drum Magazine (7.62 APDS)", cost=1620, path=/obj/item/ammo_magazine/rifle_75_drum/highvelocity),
			list(name="Rifle Drum Magazine (7.62 Hollow Point)", cost=1080, path=/obj/item/ammo_magazine/rifle_75_drum/lethal),
			list(name="Rifle Drum Magazine (7.62 Rubber)", cost=680, path=/obj/item/ammo_magazine/rifle_75_drum/rubber),
			list(name="Rifle Drum Magazine (7.62 Practice)", cost=420, path=/obj/item/ammo_magazine/rifle_75_drum/practice),
			list(name="Rifle Drum Magazine (7.62 Empty)", cost=420, path=/obj/item/ammo_magazine/rifle_75_drum/empty),
			list(name="Rifle Pan (7.62)", cost=1600, path=/obj/item/ammo_magazine/maxim_75),
			list(name="Rifle Pan (7.62 empty)", cost=300, path=/obj/item/ammo_magazine/maxim_75/empty),
		"7.62, Ammo Boxes",
			list(name="Packet (7.62)", cost=990, path=/obj/item/ammo_magazine/ammobox/rifle_75_small),
			list(name="Packet (7.62 APDS)", cost=1485, path=/obj/item/ammo_magazine/ammobox/rifle_75_small/hv),
			list(name="Packet (7.62 Hollow Point)", cost=990, path=/obj/item/ammo_magazine/ammobox/rifle_75_small/lethal),
			list(name="Packet (7.62 Rubber)", cost=990, path=/obj/item/ammo_magazine/ammobox/rifle_75_small/rubber),
			list(name="Packet (7.62 Practice)", cost=850, path=/obj/item/ammo_magazine/ammobox/rifle_75_small/practice),
			list(name="Box (7.62)", cost=3500, path=/obj/item/ammo_magazine/ammobox/rifle_75),
			list(name="Box (7.62 APDS)", cost=5250, path=/obj/item/ammo_magazine/ammobox/rifle_75/hv),
			list(name="Box (7.62 Hollow Point)", cost=3500, path=/obj/item/ammo_magazine/ammobox/rifle_75/lethal),
			list(name="Box (7.62 Rubber)", cost=3500, path=/obj/item/ammo_magazine/ammobox/rifle_75/rubber),
			list(name="Box (7.62 Practice)", cost=200, path=/obj/item/ammo_magazine/ammobox/rifle_75/practice),
			list(name="Linked Ammunition Box (7.62mm Rifle)", cost=1300, path=/obj/item/ammo_magazine/rifle_75_linked_box),
			list(name="Linked Ammunition Box (7.62mm APDS)", cost=1950, path=/obj/item/ammo_magazine/rifle_75_linked_box/highvelocity),
			list(name="Linked Ammunition Box (7.62mm Hollow Point)", cost=1300, path=/obj/item/ammo_magazine/rifle_75_linked_box/lethal),
			list(name="Linked Ammunition Box (7.62mm Rubber)", cost=1100, path=/obj/item/ammo_magazine/rifle_75_linked_box/rubber),
			list(name="Linked Ammunition Box (7.62mm Empty)", cost=500, path=/obj/item/ammo_magazine/rifle_75_linked_box/empty),
		"8.6 Heavy Rifle",
			list(name="Heavy Rifle Stripper Clip (8.6 Rifle)", cost=500, path=/obj/item/ammo_magazine/speed_loader_heavy_rifle_408),
			list(name="Heavy Rifle Magazine (8.6)", cost=500, path=/obj/item/ammo_magazine/heavy_rifle_408),
			list(name="Heavy Rifle Magazine (8.6 SLAP)", cost=750, path=/obj/item/ammo_magazine/heavy_rifle_408/hv),
			list(name="Heavy Rifle Magazine (8.6 Hollow Ooint)", cost=500, path=/obj/item/ammo_magazine/heavy_rifle_408/lethal),
			list(name="Heavy Rifle Magazine (8.6 Rubber)", cost=400, path=/obj/item/ammo_magazine/heavy_rifle_408/rubber),
			list(name="Heavy Rifle Magazine (8.6 Practice)", cost=100, path=/obj/item/ammo_magazine/heavy_rifle_408/practice),
		"8.6 Heavy Rifle, Drum",
			list(name="Heavy Rifle Drum Magazine (8.6mm Ball)", cost=700, path=/obj/item/ammo_magazine/heavy_rifle_408_drum),
			list(name="Heavy Rifle Drum Magazine (8.6mm SLAP)", cost=1080, path=/obj/item/ammo_magazine/heavy_rifle_408_drum/slap),
			list(name="Heavy Rifle Drum Magazine (8.6mm Hollow Point)", cost=700, path=/obj/item/ammo_magazine/heavy_rifle_408_drum/lethal),
			list(name="Heavy Rifle Drum Magazine (8.6mm Baton)", cost=700, path=/obj/item/ammo_magazine/heavy_rifle_408_drum/rubber),
			list(name="Heavy Rifle Drum Magazine (8.6mm Incendiary)", cost=1620, path=/obj/item/ammo_magazine/heavy_rifle_408_drum/incend),
		"8.6, Ammo Packets",
			list(name="Packet (8.6)", cost=1200, path=/obj/item/ammo_magazine/ammobox/heavy_rifle_408_small),
			list(name="Packet (8.6 SLAP)", cost=1480, path=/obj/item/ammo_magazine/ammobox/heavy_rifle_408_small/hv),
			list(name="Packet (8.6 Hollow Point)", cost=1480, path=/obj/item/ammo_magazine/ammobox/heavy_rifle_408_small/lethal),
			list(name="Packet (8.6 Rubber)", cost=1200, path=/obj/item/ammo_magazine/ammobox/heavy_rifle_408_small/rubber),
			list(name="Packet (8.6 Practice)", cost=70, path=/obj/item/ammo_magazine/ammobox/heavy_rifle_408_small/practice),
			list(name="Packet (8.6 Incendiary)", cost=1500, path=/obj/item/ammo_magazine/ammobox/heavy_rifle_408_small/incend),
		"8.6, Ammo Boxes",
			list(name="Box (8.6)", cost=3820, path=/obj/item/ammo_magazine/ammobox/heavy_rifle_408),
			list(name="Box (8.6 SLAP)", cost=5730, path=/obj/item/ammo_magazine/ammobox/heavy_rifle_408/hv),
			list(name="Box (8.6 Hollow Point)", cost=3820, path=/obj/item/ammo_magazine/ammobox/heavy_rifle_408/lethal),
			list(name="Box (8.6 Rubber)", cost=3220, path=/obj/item/ammo_magazine/ammobox/heavy_rifle_408/rubber),
			list(name="Box (8.6 Practice)", cost=200, path=/obj/item/ammo_magazine/ammobox/heavy_rifle_408/practice),
			list(name="Linked Ammunition Box (8.6)", cost=2820, path=/obj/item/ammo_magazine/rifle_75_linked_box/heavy_rifle_408),
			list(name="Linked Ammunition Box (8.6 SLAP)", cost=4230, path=/obj/item/ammo_magazine/rifle_75_linked_box/heavy_rifle_408/highvelocity),
			list(name="Linked Ammunition Box (8.6 Hollow Point)", cost=2820, path=/obj/item/ammo_magazine/rifle_75_linked_box/heavy_rifle_408/lethal),
			list(name="Linked Ammunition Box (8.6 Rubber)", cost=2820, path=/obj/item/ammo_magazine/rifle_75_linked_box/heavy_rifle_408/rubber),
			list(name="Linked Ammunition Box (8.6 Empty)", cost=420, path=/obj/item/ammo_magazine/rifle_75_linked_box/heavy_rifle_408/empty),
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
		"14.5x114mm AP, Anti-Materiel",
			list(name="Box (14.5×114mm AP)", cost=12000, path=/obj/item/ammo_magazine/ammobox/antim),
			list(name="14.5mm Anti-Materiel Red-Nose", cost=2000, path=/obj/item/ammo_casing/antim/lethal/prespawned),
			list(name="14.5mm Anti-Materiel Off-Switch", cost=2000, path=/obj/item/ammo_casing/antim/ion/prespawned),
			list(name="14.5mm Anti-Materiel Willy-Pete", cost=2000, path=/obj/item/ammo_casing/antim/incend/prespawned),
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
		return //Prevents borgs throwing their stuff into it
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
	if (stat) //NOPOWER etc
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
	updateUsrDialog() //maybe we can remove it
	points -= cost
	addtimer(CALLBACK(src, PROC_REF(finish_creating_product), recipe["path"]), cost / eat_eff * 0.1)

/obj/machinery/bulletfabricator/proc/finish_creating_product(path)
	new path(loc)
	menustat = "menu" //complete adds an extra step thats annoying to deal with
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
