// The files that contains all transform flags and priorities.
// Lower priority flags will be applied before higher priority.
// Remember, the priority only matters in relation to other transformations that will be added.

// note: timsort is a stable algorithm, meaning 2 adjacent values with the same value will be kept in order
// ex: a list of (a = 200, b = 250, c = 250, d = 150). this will be sorted into (d, a, b, c). note that b and c's position doesnt actually really change,
// and their order relative to eachother is preserved

#define PRONE_MATRIX_ROTATE 90

#define TRANSFORM_PRIORITY_DEFAULT 4500 //arbitrary

// BASE TYPES, USED ONLY IN BASETYPES
#define AMERIDIAN_TRANSFORM "ameridian_transform"
#define AMERIDIAN_TRANSFORM_PRIORITY INFINITY // do not use
#define MODULAR_BASE_TRANSFORM_DO_NOT_USE "DO_NOT_USE_transform"
#define MODULAR_BASE_TRANSFORM_DO_NOT_USE_PRIORITY INFINITY //PLEASE DONT USE THIS

// INITIAL

// SCALES, SHOULD PROBABLY BE APPLIED FIRST
#define AMERIDIAN_TENDER_INITIAL_SCALE_TRANSFORM "ameridian_tender_initial_scale_transform"
#define AMERIDIAN_TENDER_INITIAL_SCALE_TRANSFORM_PRIORITY 2000
#define AMERIDIAN_GOLEM_INITIAL_SCALE_TRANSFORM "ameridian_golem_initial_scale_transform"
#define AMERIDIAN_GOLEM_INITIAL_SCALE_TRANSFORM_PRIORITY 2001
#define AMERIDIAN_SPIRE_INITIAL_SCALE_TRANSFORM "ameridian_spire_initial_scale_transform"
#define AMERIDIAN_SPIRE_INITIAL_SCALE_TRANSFORM_PRIORITY 2002

#define SCARAB_INITIAL_SCALE_TRANSFORM "scarab_initial_scale_transform"
#define SCARAB_INITIAL_SCALE_TRANSFORM_PRIORITY 2000

#define CASING_INITIAL_SCALE_TRANSFORM "casing_initial_scale_transform"
#define CASING_INITIAL_SCALE_TRANSFORM_PRIORITY 2000

#define SPATIALCUT_INITIAL_SCALE_TRANSFORM "spatialcut_initial_scale_transform"
#define SPATIALCUT_INITIAL_SCALE_TRANSFORM_PRIORITY 2003

#define BABY_CERBERUS_INITIAL_SCALE_TRANSFORM "baby_cerberus_initial_scale_transform"
#define BABY_CERBERUS_INITIAL_SCALE_TRANSFORM_PRIORITY 2500
#define BABY_TANTONKA_INITIAL_SCALE_TRANSFORM "baby_tantonka_initial_scale_transform"
#define BABY_TANTONKA_INITIAL_SCALE_TRANSFORM_PRIORITY 2500

#define BONE_INITIAL_SCALE_TRANSFORM "bone_initial_scale_transform"
#define BONE_INITIAL_SCALE_TRANSFORM_PRIORITY 2600

#define SST_INITIAL_SCALE_TRANSFORM "SST_initial_scale_transform"
#define SST_INITIAL_SCALE_TRANSFORM_PRIORITY 2400

#define PSICATALYST_INITIAL_SCALE_TRANSFORM "psicatalyst_initial_scale_transform"
#define PSICATALYST_INITIAL_SCALE_TRANSFORM_PRIORITY 2200

// ROTATIONS
#define EFFECT_INITIAL_ROTATION_TRANSFORM "effect_initial_rotation_transform"
#define EFFECT_INITIAL_ROTATION_TRANSFORM_PRIORITY 4000

#define SPATIALCUT_INITIAL_ROTATION_TRANSFORM "spatialcut_initial_rotation_transform"
#define SPATIALCUT_INITIAL_ROTATION_TRANSFORM_PRIORITY 4001

#define CASING_INITIAL_ROTATION_TRANSFORM "casing_initial_rotation_transform"
#define CASING_INITIAL_ROTATION_TRANSFORM_PRIORITY 4001

#define PLANT_INITIAL_ROTATION_TRANSFORM "plant_initial_rotation_transform"
#define PLANT_INITIAL_ROTATION_TRANSFORM_PRIORITY 4000

#define PLANT_SPREAD_ROTATION_TRANSFORM "plant_spread_rotation_transform"
#define PLANT_SPREAD_ROTATION_TRANSFORM_PRIORITY 4001

// TRANSLATIONS

// CUSTOM
#define AMERIDIAN_CRYSTAL_RESIZING_TRANSFORM "ameridian_crystal_resizing_transform"
#define AMERIDIAN_CRYSTAL_RESIZING_TRANSFORM_PRIORITY 3100 // comes after the initial resizes but before anything else

#define BLOB_INITIAL_TRANSFORM "blob_initial_transform"
#define BLOB_INITIAL_TRANSFORM_PRIORITY 3600 //has a bunch of different types of transforms

#define HUMAN_SIZE_SCALING_TRANSFORM "human_size_scaling_transform" //updates
#define HUMAN_SIZE_SCALING_TRANSFORM_PRIORITY 2900

//========================
// POST-INITIALIZE

// SCALES, SHOULD PROBABLY BE REMOVED LAST

// ROTATIONS
#define PRONE_TRANSFORM "prone_transform"
#define PRONE_TRANSFORM_PRIORITY 7400

#define RANDOM_ROTATION_TRANSFORM "random_rotation_transform"
#define RANDOM_ROTATION_TRANSFORM_PRIORITY 6300

#define FLASHLIGHT_LIGHT_SPOT_ROTATION_TRANSFORM "flashlight_rotation_transform"
#define FLASHLIGHT_LIGHT_SPOT_ROTATION_TRANSFORM_PRIORITY 6450

#define VTM_CLIMB_ROTATION_TRANSFORM "VTM_climb_rotation_transform"
#define VTM_CLIMB_ROTATION_TRANSFORM_PRIORITY 7600
#define VTM_CLIMB_MAG_ROTATION_TRANSFORM "VTM_climb_mag_rotation_transform"
#define VTM_CLIMB_MAG_ROTATION_TRANSFORM_PRIORITY 7601
#define VTM_JUMP_ROTATION_TRANSFORM "VTM_jump_rotation_transform"
#define VTM_JUMP_ROTATION_TRANSFORM_PRIORITY 7602

#define PROJECTILE_FIRED_ROTATION_TRANSFORM "projectile_fired_rotation_transform"
#define PROJECTILE_FIRED_ROTATION_TRANSFORM_PRIORITY 6505

// TRANSLATIONS

// CUSTOM
#define HUMAN_PRONE_TRANSFORM "human_prone_transformation" // has multiple transforms, happens with prone for humans, apply after prone
#define HUMAN_PRONE_TRANSFORM_PRIORITY 7401

#define SHARD_VARIABLE_SIZE_TRANSFORM "shard_variable_size_transform" //updates
#define SHARD_VARIABLE_SIZE_TRANSFORM_PRIORITY 6100

#define WALLMOUNT_PLACED_ROTATION_TRANSFORMATION "wallmount_placed_rotation_transformation"
#define WALLMOUNT_PLACED_ROTATION_TRANSFORMATION_PRIORITY 6000

#define MONEY_JAR_CASH_RESIZE_TRANSFORM "money_jar_cash_resize_transform"
#define MONEY_JAR_CASH_RESIZE_TRANSFORM_PRIORITY 6000
