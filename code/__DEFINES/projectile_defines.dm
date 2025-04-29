//Caliber Defines
#define CAL_PISTOL "9mm"
#define CAL_MAGNUM "10mm magnum"
#define CAL_LRIFLE "6.5mm carbine"
#define CAL_RIFLE "7.62mm rifle"
#define CAL_HRIFLE "8.6mm heavy rifle"
#define CAL_ANTIM "14.5mm Anti-Materiel"
#define CAL_BALL "17mm rolled shot"
#define CAL_SHOTGUN "Shotgun Shell"
#define CAL_50	"12mm heavy pistol"
#define CAL_70 "19mm explosive"
#define CAL_CAP "plastic cap"
#define CAL_ROCKET "rocket propelled grenade"
#define CAL_DART "chemical dart"
#define CAL_SCI "laser casings"
#define CAL_GRENADE "grenade"
#define CAL_FLARE "flare shell"
#define CAL_CROSSBOW "bolt"
#define CAL_RXBOW "flashforged bolt"
#define CAL_ARROW "arrow"

//Mech Caliber Defines
#define CAL_MECH_MACHINEGUN 	"25mm"
#define CAL_MECH_AUTOCANNON		"60mm HEAD"
#define CAL_MECH_ULTRACANNON	"30mm HEAD"
#define CAL_MECH_SHOTGUN		"50mm HEAD"
#define CAL_MECH_MISSILE		"6.2 Missile"

//Gun loading types
#define SINGLE_CASING 	1	//The gun only accepts ammo_casings. ammo_magazines should never have this as their mag_type.
#define SPEEDLOADER 	2	//Transfers casings from the mag to the gun when used.
#define MAGAZINE 		4	//The magazine item itself goes inside the gun

#define MAG_WELL_GENERIC	0	//Guns without special magwells
#define MAG_WELL_L_PISTOL	1	//Pistols
#define MAG_WELL_PISTOL		2
#define MAG_WELL_H_PISTOL	4	//High cap Pistols
#define MAG_WELL_SMG		8	//smgs
#define MAG_WELL_RIFLE		16	// 6.5mm & 7.62mm mags / SBAW (essentially shotgun rifle magazine)
#define MAG_WELL_BOX		32	//Lmgs with box mags
#define MAG_WELL_PAN		64	//Lmgs with pan mags
#define MAG_WELL_DART       128 //Dartgun mag
#define MAG_WELL_HRIFLE		256 //8.6mm heavy rifle mags
#define MAG_WELL_DRUM		512 //Drum-fed i.e. shotguns
#define MAG_WELL_PULSE		1024 //Mary sue ammo for the pulse rifle
#define MAG_WELL_LSRIFLE	2048 //Mary sue ammo for the laser AK
#define MAG_WELL_LINKED_BOX	4096 //Linked ammo boxes, for lmgs

#define SLOT_BARREL "barrel"
#define SLOT_GRIP "grip"
#define SLOT_TRIGGER "trigger"
#define SLOT_MUZZLE "muzzle"
#define SLOT_SCOPE "scope"
#define SLOT_UNDERBARREL "underbarrel"
#define SLOT_MECHANICS "mechanics"
#define SLOT_MAGWELL "magwell"

