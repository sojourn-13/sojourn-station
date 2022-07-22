/**
 * Associative list of var copies, key being their name, value being the list of vars they hold.
 *
 * Used with the "var saving" system, where admins can use VV to save a "var copy" of an atom, and later use the Spawn Copy verb to
 * first spawn the type of the original atom, and then apply any vars the admin chose to add to the var copy. This is a method of
 * copypasting varedited atoms with ease.
**/
GLOBAL_LIST_EMPTY(var_copies)
GLOBAL_PROTECT(var_copies)

#define TOPIC_NOACTION 0
#define TOPIC_HANDLED 1
#define TOPIC_REFRESH 2

#define CanInteract(user, state) (CanUseTopic(user, state) == STATUS_INTERACTIVE)

#define CanInteractWith(user, target, state) (target.CanUseTopic(user, state) == STATUS_INTERACTIVE)

#define CanPhysicallyInteract(user) CanInteract(user, GLOB.physical_state)

#define CanPhysicallyInteractWith(user, target) CanInteractWith(user, target, GLOB.physical_state)
