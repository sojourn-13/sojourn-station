/mob
	datum_flags = DF_USE_TAG
	density = 1
	layer = 4.0
	animate_movement = 2
	flags = PROXMOVE
	blood_color = "#A10808"
	var/datum/mind/mind
	var/cant_gib = FALSE //This is used for mobs that dquel on death
	var/static/next_mob_id = 0

	//This is here for admins to modife for any player, mob for events or other things. Also antags could
	//likely use this - I.E Bots with deeper scans could see through into a carrion or a Exl agent
	var/colony_friend = FALSE //Are we friendly to the colony? Turrets/Mechs vs Mob
	var/friendly_to_colony = FALSE //Do we attack colony stuff - Mechs / Turrets regardless of who they are

	movement_handlers = list(
	/datum/movement_handler/mob/relayed_movement,
	/datum/movement_handler/mob/death,
	/datum/movement_handler/mob/conscious,
	/datum/movement_handler/mob/eye,
	/datum/movement_handler/mob/delay,
	/datum/movement_handler/move_relay,
	/datum/movement_handler/mob/buckle_relay,
	/datum/movement_handler/mob/stop_effect,
	/datum/movement_handler/mob/physically_capable,
	/datum/movement_handler/mob/physically_restrained,
	/datum/movement_handler/mob/space,
	/datum/movement_handler/mob/movement
	)

	var/lastKnownIP = null
	var/computer_id = null

	/// I'd really rather use signals for this, but, whatever. Assigned in roomba_dispenser.dm when spawned from one.
	var/obj/entity_spawner/spawned_from

	/*A bunch of this stuff really needs to go under their own defines instead of being globally attached to mob.
	A variable should only be globally attached to turfs/objects/whatever, when it is in fact needed as such.
	The current method unnecessarily clusters up the variable list, especially for humans (although rearranging won't really clean it up a lot but the difference will be noticable for other mobs).
	I'll make some notes on where certain variable defines should probably go.
	Changing this around would probably require a good look-over the pre-existing code.
	*/


	var/use_me = 1 //Allows all mobs to use the me verb by default, will have to manually specify they cannot
	var/use_subtle = 1 //Similarly, the subtle verb.
	var/damageoverlaytemp = 0
	var/obj/machinery/machine = null
	var/poll_answer = 0.0
	var/sdisabilities = 0	//Carbon
	var/disabilities = 0	//Carbon

	var/current_vertical_travel_method // Link currently used VTM if we moving between Z-levels
	var/last_move_attempt = 0 //Last time the mob attempted to move, successful or not
	var/atom/movable/pulling = null
	var/other_mobs = null
	var/next_move = null
	var/transforming = null	//Carbon
	var/hand = null
	var/real_name = null

	/// Cameras currently tracking this mob. Needed for garbage collection.
	var/list/tracking_cameras = list()

	var/ajourn = 0
	var/seer = 0 //for cult//Carbon, probably Human

	var/druggy = 0			//Carbon
	var/confused = 0		//Carbon
	var/sleeping = 0		//Carbon
	var/resting = 0			//Carbon
	var/lying = 0
	var/lying_prev = 0
	var/canmove = 1
	var/in_use = FALSE // If we have a user using us, this will be set on. We will check if the user has stopped using us, and thus stop updating and LAGGING EVERYTHING!

/* Is mannquin to be used when we want to make sure character start up beings do not also get the boon of what ever we are adding
   this is current used in magic cups to prevent them form being apart of the faith's list.*/
	var/is_mannequin = FALSE


	/*
Allows mobs to move through dense areas without restriction. For instance, in space or out of holder objects.
This var is no longer actually used for incorporeal moving, this is handled by /datum/movement_handler/mob/incorporeal
However this var is still kept as a quick way to check if the mob is incorporeal. This is used in several performance intensive applications
While it would be entirely possible to check the mob's move handlers list for the existence of the incorp handler, that is less optimal for intensive use
*/
	var/incorporeal_move = 0 //0 is off, 1 is normal, 2 is for ninjas.


	var/unacidable = 0
	var/list/pinned = list()            // List of things pinning this creature to walls (see living_defense.dm)
	var/list/embedded = list()          // Embedded items, since simple mobs don't have organs.
	var/list/languages = list()         // For speaking/listening.
	var/list/speak_emote = list("says") // Verbs used when speaking. Defaults to 'say' if speak_emote is null.
	var/emote_type = 1		// Define emote default type, 1 for seen emotes, 2 for heard emotes
	var/facing_dir = null   // Used for the ancient art of moonwalking.

	var/name_archive //For admin things like possession

	var/timeofdeath = 0.0

	var/bodytemperature = 310.055	//98.7 F

	var/default_pixel_x = 0
	var/default_pixel_y = 0
	var/default_pixel_z = 0
	var/old_x = 0
	var/old_y = 0
	var/nutrition = 400  //carbon
	var/max_nutrition = 400
	var/list/eat_sounds = list('sound/items/eatfood.ogg')

	var/shakecamera = 0
	var/a_intent = I_HELP//Living

	var/decl/move_intent/move_intent = /decl/move_intent/run
	var/move_intents = list(/decl/move_intent/run, /decl/move_intent/walk)

	var/obj/buckled = null//Living
	var/obj/item/l_hand = null//Living
	var/obj/item/r_hand = null//Living
	var/obj/item/back = null//Human/Monkey
	var/obj/item/storage/s_active = null//Carbon
	var/obj/item/clothing/mask/wear_mask = null//Carbon


	var/datum/hud/hud_used = null

	var/list/grabbed_by = list(  )
	var/list/requests = list(  )

	var/in_throw_mode = 0



	var/targeted_organ = BP_CHEST

//	var/job = null//Living

	var/can_pull_size = ITEM_SIZE_TITANIC // Maximum w_class the mob can pull.
	var/can_pull_mobs = MOB_PULL_LARGER       // Whether or not the mob can pull other mobs.

	var/datum/dna/dna = null//Carbon
	var/list/active_genes = null
	var/list/mutations = list() //Carbon -- Doohl
	//see: setup.dm for list of mutations

	var/radiation = 0.0//Carbon

	var/voice_name = "unidentifiable voice"

	var/faction = "neutral" //Used for checking whether hostile simple animals will attack you, possibly more stuff later
	var/captured = 0 //Functionally, should give the same effect as being buckled into a chair when true.

	var/blinded = null
	var/ear_deaf = null		//Carbon

/// The last mob/living/carbon to push/drag/grab this mob (mostly used by slimes friend recognition)
	var/datum/weakref/LAssailant_weakref

//Wizard mode, but can be used in other modes thanks to the brand new "Give Spell" badmin button
	var/spell/list/spell_list = list()

	mouse_drag_pointer = MOUSE_ACTIVE_POINTER

	var/update_icon = 1 //Set to 1 to trigger update_icons() at the next life() call

	var/status_flags = CANSTUN|CANWEAKEN|CANPARALYSE|CANPUSH	//bitflags defining which status effects can be inflicted (replaces canweaken, canstun, etc)

	/// Can they interact with station electronics
	var/has_unlimited_silicon_privilege = FALSE

	var/area/lastarea = null

	var/digitalcamo = 0 // Can they be tracked by the AI?

	var/obj/control_object //Used by admins to possess objects. All mobs should have this var

	//Whether or not mobs can understand other mobtypes. These stay in /mob so that ghosts can hear everything.
	var/universal_speak = 0 // Set to 1 to enable the mob to speak to everyone -- TLE
	var/universal_understand = 0 // Set to 1 to enable the mob to understand everyone, not necessarily speak

	//If set, indicates that the client "belonging" to this (clientless) mob is currently controlling some other mob
	//so don't treat them as being SSD even though their client var is null.
	var/mob/teleop = null

	var/turf/listed_turf = null  	//the current turf being examined in the stat panel
	var/list/shouldnt_see = list()	//list of objects that this mob shouldn't see in the stat panel. this silliness is needed because of AI alt+click and cult blood runes

	var/mob_size = MOB_MEDIUM

	var/paralysis = 0
	var/stunned = 0
	var/weakened = 0
	var/drowsyness = 0.0//Carbon

	var/memory = ""
	var/flavor_text = ""
	var/ooc_text = ""


	var/list/HUDneed = list() // What HUD object need see
	var/list/HUDinventory = list()
	var/list/HUDfrippery = list()//flavor
	var/list/HUDprocess = list() //What HUD object need process
	var/list/HUDtech = list()
	var/defaultHUD = "" //Default mob hud

	/// lazy list. contains /obj/screen/alert only,  On /mob so clientless mobs will throw alerts properly
	var/list/alerts

	var/list/progressbars = null

	///The z level this mob is currently registered in
	var/registered_z

	var/speed_factor = 1.0

	var/datum/stat_holder/stats

	var/mob_classification = 0 //Bitfield. Uses TYPE_XXXX defines in defines/mobs.dm.

	var/forbid_seeing_deadchat = FALSE // Used for lings to not see deadchat, and to have ghosting behave as if they were not really dead.

	var/list/planes_visible = null	// List of atom planes that are logically visible/interactable (list of actual plane numbers).

	var/obj/effect/gibspawner/gibspawner = /obj/effect/gibspawner/generic // for xeno gibs, originally

	var/click_delay_addition = 0
	var/list/datum/action/actions = list()
