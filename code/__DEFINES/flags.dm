#define ALL (~0) //For convenience.
#define NONE 0

#define FLAGS_EQUALS(flag, flags) ((flag & (flags)) == (flags))

// for /datum/var/datum_flags
#define DF_USE_TAG (1<<0)
#define DF_VAR_EDITED (1<<1)
#define DF_ISPROCESSING (1<<2)

// Atom-level flags (/atom/var/atom_flags)
#define ATOM_FLAG_CHECKS_BORDER           BITFLAG(0)  // If a dense atom (potentially) only blocks movements from a given direction, i.e. window panes
#define ATOM_FLAG_CLIMBABLE               BITFLAG(1)  // This object can be climbed on
#define ATOM_FLAG_NO_BLOOD                BITFLAG(2)  // Used for items if they don't want to get a blood overlay.
#define ATOM_FLAG_NO_REACT                BITFLAG(3)  // Reagents don't react inside this container.
#define ATOM_FLAG_OPEN_CONTAINER          BITFLAG(4)  // Is an open container for chemistry purposes.
#define ATOM_FLAG_INITIALIZED             BITFLAG(5)  // Has this atom been initialized
#define ATOM_FLAG_NO_TEMP_CHANGE          BITFLAG(6)  // Reagents do not cool or heat to ambient temperature in this container.
#define ATOM_FLAG_CAN_BE_PAINTED          BITFLAG(7)  // Can be painted using a paint sprayer or similar.
#define ATOM_FLAG_SHIELD_CONTENTS         BITFLAG(8)  // Protects contents from some global effects (Solar storms)
#define ATOM_FLAG_ADJACENT_EXCEPTION      BITFLAG(9)  // Skips adjacent checks for atoms that should always be reachable in window tiles
#define ATOM_FLAG_NO_DISSOLVE             BITFLAG(10) // Bypasses solvent reactions in the container.
#define ATOM_FLAG_NO_PHASE_CHANGE         BITFLAG(11) // Bypasses heating and cooling product reactions in the container.
#define ATOM_FLAG_BLOCK_DIAGONAL_FACING   BITFLAG(12) // Atom cannot face non-cardinal directions.
