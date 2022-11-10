#define ALL (~0) //For convenience.
#define NONE 0

#define FLAGS_EQUALS(flag, flags) ((flag & (flags)) == (flags))

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

#define ATOM_IS_OPEN_CONTAINER(A)         (A.flags & ATOM_FLAG_OPEN_CONTAINER)

// Movable-level flags (/atom/movable/movable_flags)
#define MOVABLE_FLAG_PROXMOVE             BITFLAG(0) // Does this object require proximity checking in Enter()?
#define MOVABLE_FLAG_Z_INTERACT           BITFLAG(1) // Should attackby and attack_hand be relayed through ladders and open spaces?
#define MOVABLE_FLAG_EFFECTMOVE           BITFLAG(2) // Is this an effect that should move?
#define MOVABLE_FLAG_DEL_SHUTTLE          BITFLAG(3) // Shuttle transistion will delete this.
#define MOVABLE_FLAG_WHEELED              BITFLAG(4) // Movable has reduced stamina cost/speed reduction when pulled.

// Object-level flags (/obj/obj_flags)
#define OBJ_FLAG_ANCHORABLE               BITFLAG(0) // This object can be stuck in place with a tool
#define OBJ_FLAG_CONDUCTIBLE              BITFLAG(1) // Conducts electricity. (metal etc.)
#define OBJ_FLAG_ROTATABLE                BITFLAG(2) // Can be rotated with alt-click
#define OBJ_FLAG_NOFALL                   BITFLAG(3) // Will prevent mobs from falling
#define OBJ_FLAG_MOVES_UNSUPPORTED        BITFLAG(4) // Object moves with shuttle transition even if turf below is a background turf.
