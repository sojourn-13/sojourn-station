// Gun Calibers
#define CAL_PISTOL ".35"
#define CAL_MAGNUM ".40 magnum"
#define CAL_LRIFLE ".257 carbine"
#define CAL_RIFLE "7.5mm rifle"
#define CAL_HRIFLE ".408 heavy rifle"
#define CAL_ANTIM ".60-06 Anti-Materiel"
#define CAL_BALL "30mm rolled shot"
#define CAL_SHOTGUN "Shotgun Shell"
#define CAL_50	".50 kurz"
#define CAL_70 ".70"
#define CAL_CAP "plastic cap"
#define CAL_ROCKET "rocket propelled grenade"
#define CAL_DART "chemical dart"
#define CAL_SCI "laser casings"
#define CAL_GRENADE "grenade"
#define CAL_FLARE "flare shell"
#define CAL_CROSSBOW "bolt"
#define CAL_RXBOW "flashforged bolt"
#define CAL_ARROW "arrow"

// Mech Calibers
#define CAL_MECH_MACHINEGUN 	"25mm"
#define CAL_MECH_AUTOCANNON		"60mm HEAD"
#define CAL_MECH_ULTRACANNON	"30mm HEAD"
#define CAL_MECH_SHOTGUN		"50mm HEAD"
#define CAL_MECH_MISSILE		"6.2 Missile"

// Gun Loading Types
#define SINGLE_CASING 	1			// The gun only accepts ammo_casings. ammo_magazines should never have this as their mag_type.
#define SPEEDLOADER 	2			// Transfers casings from the mag to the gun when used.
#define MAGAZINE 		4			// The magazine item itself goes inside the gun

// Magwells
#define MAG_WELL_GENERIC	0		// Guns without special magwells
#define MAG_WELL_L_PISTOL	1		// Pistols
#define MAG_WELL_PISTOL		2
#define MAG_WELL_H_PISTOL	4		// High cap Pistols
#define MAG_WELL_SMG		8		// SMGs
#define MAG_WELL_RIFLE		16		// .257 & 7.5mm mags / SBAW (essentially shotgun rifle magazine)
#define MAG_WELL_BOX		32		// LMGs with box mags
#define MAG_WELL_PAN		64		// LMGs with pan mags
#define MAG_WELL_DART       128		// Dartgun mag
#define MAG_WELL_HRIFLE		256		// .408 heavy rifle mags
#define MAG_WELL_DRUM		512		// Drum-fed i.e. shotguns
#define MAG_WELL_PULSE		1024	// Mary sue ammo for the pulse rifle
#define MAG_WELL_LSRIFLE	2048	// Mary sue ammo for the laser AK
#define MAG_WELL_LINKED_BOX	4096	// Linked ammo boxes, for LMGs

// Slots
#define SLOT_BARREL "barrel"
#define SLOT_GRIP "grip"
#define SLOT_TRIGGER "trigger"
#define SLOT_MUZZLE "muzzle"
#define SLOT_SCOPE "scope"
#define SLOT_UNDERBARREL "underbarrel"
#define SLOT_MECHANICS "mechanics"
#define SLOT_MAGWELL "magwell"
