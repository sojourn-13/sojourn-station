#define REQ_FUEL 1
#define REQ_CELL 2
#define REQ_FUEL_OR_CELL 4

//Aspect defines
#define UPGRADE_PRECISION "precision"
#define UPGRADE_WORKSPEED "workspeed"
#define UPGRADE_DEGRADATION_MULT "degradation_mult"
#define UPGRADE_FORCE_MULT "force_mult"
#define UPGRADE_FORCE_MOD "force_mod"
#define UPGRADE_FUELCOST_MULT "fuelcost_mult"
#define UPGRADE_POWERCOST_MULT "powercost_mult"
#define UPGRADE_MELEE_ARMOR "melee"
#define UPGRADE_BALLISTIC_ARMOR "bullet"
#define UPGRADE_ENERGY_ARMOR "energy"
#define UPGRADE_BOMB_ARMOR "bomb"

#define UPGRADE_BULK "bulk_mod"

#define UPGRADE_HEALTH_THRESHOLD "health_threshold_modifier"

#define UPGRADE_MAXFUEL "max_fuel"

#define UPGRADE_MAXUPGRADES "max_upgrades"

#define UPGRADE_SHARP "sharp"

#define UPGRADE_COLOR "color"

#define UPGRADE_ITEMFLAGPLUS "item_flag_add"

#define UPGRADE_CELLPLUS "cell_hold_upgrade"

#define RANDOM_RARE_ITEM list(\
					/obj/random/common_oddities = 8,\
					/obj/random/material_rare = 3,\
					/obj/random/tool/advanced = 5,\
					/obj/random/gun_normal = 3,\
					/obj/random/lathe_disk/advanced = 2,\
					/obj/item/weapon/cell/small/moebius/nuclear = 1,\
					/obj/item/weapon/cell/medium/moebius/hyper = 1,\
					/obj/random/rig = 1.5,\
					/obj/random/rig/damaged = 1.5,\
					/obj/random/voidsuit = 4,\
					/obj/random/pouch = 2,\
					/obj/random/tool_upgrade/rare = 4,\
					/obj/random/rig_module/rare = 4,\
					/obj/random/credits/c1000 = 3,\
					/obj/item/stash_spawner = 1)