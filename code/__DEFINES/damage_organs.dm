// Damage things. TODO: Merge these down to reduce on defines.
// Way to waste perfectly good damage-type names (BRUTE) on this... If you were really worried about case sensitivity, you could have just used lowertext(damagetype) in the proc.
#define BRUTE		"brute"
#define BURN		"fire"
#define TOX			"tox"
#define OXY			"oxy"
#define CLONE		"clone"
#define HALLOSS		"halloss"
#define BLAST		"blast"
#define PSY			"psy"
#define ELECTROCUTE	"electrocute"

#define CUT		"cut"
#define BRUISE	"bruise"
#define PIERCE	"pierce"
#define LASER	"laser"
#define SHATTER	"shatter"

#define STUN		"stun"
#define WEAKEN		"weaken"
#define PARALYZE	"paralyze"
#define IRRADIATE	"irradiate"
#define SLUR		"slur"
#define STUTTER		"stutter"
#define EYE_BLUR	"eye_blur"
#define DROWSY		"drowsy"

// Damage flags
#define DAM_SHARP     1
#define DAM_EDGE      2
#define DAM_LASER     4
#define DAM_BULLET    8
#define DAM_EXPLODE   16
#define DAM_DISPERSED 32 // Makes apply_damage calls without specified zone distribute damage rather than randomly choose organ (for humans)
#define DAM_BIO       64 // Toxin damage that should be mitigated by biological (i.e. sterile) armor

#define FIRE_DAMAGE_MODIFIER 0.0215 // Higher values result in more external fire damage to the skin. (default 0.0215)
#define	AIR_DAMAGE_MODIFIER 2.025  // More means less damage from hot air scalding lungs, less = more damage. (default 2.025)

// Organ defines.
#define ORGAN_CUT_AWAY		BITFLAG(0)  // The organ is in the process of being surgically removed.
#define ORGAN_BLEEDING		BITFLAG(1)  // The organ is currently bleeding.
#define ORGAN_BROKEN		BITFLAG(2)  // The organ is broken.
#define ORGAN_DEAD			BITFLAG(3)  // The organ is necrotic.
#define ORGAN_MUTATED		BITFLAG(4)  // The organ is unusable due to genetic damage.
#define ORGAN_DESTROYED		BITFLAG(5)  // defunct... Old Surgery Code /// Replace at earliest convenience
#define ORGAN_SPLINTED		BITFLAG(6)  // The organ has been splinted
#define ORGAN_DISFIGURED	BITFLAG(7)  // The organ is scarred/disfigured. Alters whether or not the face can be recognised.
#define ORGAN_SABOTAGED		BITFLAG(8)  // The organ will explode if exposed to EMP, if prosthetic.
#define ORGAN_BRITTLE		BITFLAG(9)  // The organ takes additional blunt damage. If robotic, cannot be repaired through normal means.
#define ORGAN_DISLOCATED	BITFLAG(10) //The organ is dislocated and will cause pain until set back in place.
#define ORGAN_INFECTED		BITFLAG(11)
#define ORGAN_WOUNDED		BITFLAG(12)

// Organ Properties
#define ORGAN_PROP_PROSTHETIC	BITFLAG(0) // The organ is prosthetic. Changes numerous behaviors, search BP_IS_PROSTHETIC for checks.
#define ORGAN_PROP_CRYSTAL		BITFLAG(1) // The organ does not suffer laser damage, but shatters on droplimb.

#define MODIFICATION_ORGANIC  0	// Organic
#define MODIFICATION_ASSISTED 1 // Like pacemakers, not robotic
#define MODIFICATION_SILICON  2	// Fully robotic, no organic parts
#define MODIFICATION_LIFELIKE 3	// Robotic, made to appear organic
#define MODIFICATION_REMOVED  4	// Removed completly
#define MODIFICATION_SUPERIOR 5 //Better than good, a cut above.
#define MODIFICATION_SLIME    6 //goo people

// Organ flag defines.
#define ORGAN_FLAG_CAN_AMPUTATE		BITFLAG(0) // The organ can be amputated.
#define ORGAN_FLAG_CAN_BREAK		BITFLAG(1) // The organ can be broken.
#define ORGAN_FLAG_CAN_STAND		BITFLAG(2) // The organ contributes to standing.
#define ORGAN_FLAG_HAS_TENDON		BITFLAG(3) // The organ can have its tendon cut.
#define ORGAN_FLAG_FINGERPRINT		BITFLAG(4) // The organ has a fingerprint.
#define ORGAN_FLAG_HEALS_OVERKILL	BITFLAG(5) // The organ heals from overkill damage.
#define ORGAN_FLAG_DEFORMED			BITFLAG(6) // The organ is permanently disfigured.
#define ORGAN_FLAG_CAN_DISLOCATE	BITFLAG(7) // The organ can be dislocated.
#define ORGAN_FLAG_SKELETAL			BITFLAG(8) // The organ has been skeletonized.

// Droplimb types.
#define DISMEMBER_METHOD_EDGE  0
#define DISMEMBER_METHOD_BLUNT 1
#define DISMEMBER_METHOD_BURN  2
#define DISMEMBER_METHOD_ACID  3

// Robotics hatch_state defines.
#define HATCH_CLOSED 0
#define HATCH_UNSCREWED 1
#define HATCH_OPENED 2

// Damage above this value must be repaired with surgery.
#define ROBOLIMB_SELF_REPAIR_CAP 30

//Blood levels. These are percentages based on the species blood_volume
#define BLOOD_VOLUME_SAFE_MODIFIER    45
#define BLOOD_VOLUME_OKAY_MODIFIER    35
#define BLOOD_VOLUME_BAD_MODIFIER     20

// enum-ish values for surgery conditions
#define OPERATE_DENY     0
#define OPERATE_PASSABLE 1
#define OPERATE_OKAY     2
#define OPERATE_IDEAL    3

#define MODULAR_BODYPART_INVALID    0 // Cannot be detached or reattached.
#define MODULAR_BODYPART_PROSTHETIC 1 // Can be detached or reattached freely.
#define MODULAR_BODYPART_CYBERNETIC 2 // Can be detached or reattached to compatible parent organs.

//Armor defines

#define ARMOR_MELEE			"melee"
#define ARMOR_BULLET		"bullet"
#define ARMOR_ENERGY		"energy"
#define ARMOR_BOMB			"bomb"
#define ARMOR_BIO			"bio"
#define ARMOR_RAD			"rad"

// Body part functions
#define BODYPART_GRASP				(1<<0)
#define BODYPART_STAND				(1<<1)
#define BODYPART_REAGENT_INTAKE		(1<<2)
#define BODYPART_GAS_INTAKE			(1<<3)

#define ORGAN_RECOVERY_THRESHOLD (5 MINUTES)

#define DROPLIMB_EDGE 0
#define DROPLIMB_BLUNT 1
#define DROPLIMB_BURN 2
#define DROPLIMB_EDGE_BURN 3

// INTERNAL ORGANS
#define IORGAN_VITAL_HEALTH 12 // Heart
#define IORGAN_VITAL_BRUISE 6
#define IORGAN_VITAL_BREAK 8
#define IORGAN_STANDARD_HEALTH 8
#define IORGAN_STANDARD_BRUISE 3
#define IORGAN_STANDARD_BREAK 5
#define IORGAN_SMALL_HEALTH 6
#define IORGAN_SMALL_BRUISE 2
#define IORGAN_SMALL_BREAK 4
#define IORGAN_TINY_HEALTH 4
#define IORGAN_TINY_BRUISE 1
#define IORGAN_TINY_BREAK 2
#define IORGAN_SKELETAL_HEALTH 14
#define IORGAN_SKELETAL_BRUISE 4
#define IORGAN_SKELETAL_BREAK 6
#define IORGAN_MAX_HEALTH 14 // Brain

#define IORGAN_KIDNEY_TOX_RATIO 0.25
#define IORGAN_LIVER_TOX_RATIO 0.75

// INTERNAL WOUNDS
#define TREATMENT_ITEM 1
#define TREATMENT_TOOL 2
#define TREATMENT_CHEM 3

#define IWOUND_CAN_DAMAGE		(1<<0)
#define IWOUND_PROGRESS			(1<<1)
#define IWOUND_PROGRESS_DEATH	(1<<2)
#define IWOUND_SPREAD			(1<<3)
#define IWOUND_HALLUCINATE		(1<<4)

#define IWOUND_INSIGNIFICANT_DAMAGE 0.05
#define IWOUND_LIGHT_DAMAGE 0.1
#define IWOUND_MEDIUM_DAMAGE 0.25
#define IWOUND_HEAVY_DAMAGE 0.5

#define IWOUND_1_MINUTE	30
#define IWOUND_2_MINUTES 60
#define IWOUND_3_MINUTES 90
#define IWOUND_4_MINUTES 120
#define IWOUND_5_MINUTES 150
#define IWOUND_6_MINUTES 180
#define IWOUND_8_MINUTES 240
#define IWOUND_10_MINUTES 300
#define IWOUND_12_MINUTES 360


// Organ generation
#define ORGAN_HAS_BONES			(1<<0)
#define ORGAN_HAS_BLOOD_VESSELS	(1<<1)
#define ORGAN_HAS_NERVES		(1<<2)
#define ORGAN_HAS_MUSCLES		(1<<3)
