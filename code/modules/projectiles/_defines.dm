//Caliber Defines
#define CAL_LRIFLE "6.5mm"
#define CAL_SRIFLE ".208"
#define CAL_PISTOL ".35"
#define CAL_35A ".35 auto"
#define CAL_10PISTOL "10mm"
#define CAL_OMNI	"10mm Omni"
#define CAL_HRIFLE "7.62mm"
#define CAL_MAGNUM ".40 magnum"
#define CAL_ANTIM ".60-06 Anti Material"
#define CAL_SHOTGUN "Shotgun Shell"
#define CAL_50	".50 kurtz"
#define CAL_70 ".70"
#define CAL_CAP "plastic cap"
#define CAL_ROCKET "rocket propelled grenade"
#define CAL_DART "chemical dart"

//Gun loading types
#define SINGLE_CASING 	1	//The gun only accepts ammo_casings. ammo_magazines should never have this as their mag_type.
#define SPEEDLOADER 	2	//Transfers casings from the mag to the gun when used.
#define MAGAZINE 		4	//The magazine item itself goes inside the gun

#define MAG_WELL_GENERIC	0	//Guns without special magwells
#define MAG_WELL_L_PISTOL	1	//Pistols
#define MAG_WELL_PISTOL		2
#define MAG_WELL_H_PISTOL	4	//High cap Pistols
#define MAG_WELL_SMG		8	//smgs
#define MAG_WELL_ROCKIN		16	//AK style magazines
#define MAG_WELL_STANMAG	32	//.208 standard
#define MAG_WELL_BOX		64	//Lmgs with box mags
#define MAG_WELL_PAN		128	//Lmgs with pan mags
#define MAG_WELL_DART       256 //Dartgun mag
#define MAG_WELL_OMNI		512 //10mm rifle mags
#define MAG_WELL_DRUM		1024 //Drum-fed i.e. shotguns
