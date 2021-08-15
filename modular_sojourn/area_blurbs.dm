//Many thanks to Occulus-Server for the code

/area

	var/narrate //A text-based description of what this area is for.
	var/list/blurbed_stated_to = list() //This list of names is here to make sure we don't state our descriptive blurb to a person more than once.



/area/proc/do_area_blurb(var/mob/living/L)
	if(isnull(narrate))
		return

	if(L?.get_preference_value(/datum/client_preference/area_info_blurb) != GLOB.PREF_YES)
		return

	if(!(L.ckey in blurbed_stated_to))
		blurbed_stated_to += L.ckey
		to_chat(L, SPAN_NOTICE("[narrate]"))


/************
OKAY SO HERE'S HOW THIS WORKS
We have an area. When someone enters the area, it checks if this person has the preference enabled and if they haven't been in that area before. If both are false, it throws up a description.
The var is 'narrate'.
/area/eris/crew_quarters/bar
	name = "\improper Bar"
	icon_state = "bar"
	sound_env = LARGE_SOFTFLOOR
	narrate = "Reflective blue floors give the illusion of neon and glamour. The smell of alcohol is strong on the air. " < This is the important line.
ty ilu - bear
*/



////////////
//Nadezhda//
////////////


/area/colony/exposedsun/pastgate
	narrate = "Past the gate has untamed wilds and hostiles."

//Maintenance

/area/nadezhda/maintenance
	narrate = "Passages darken and abanded by the colony left to be a domain of roaches, rats and spiders..."

/area/nadezhda/maintenance/junk
	narrate = "The Scrap yard, maintained by the local faith, watch out for falling scrap."

/area/nadezhda/maintenance/arcade
	narrate = "Once a place of fun and games, now rotted and rusted."

//Outside abandoned structures

/area/nadezhda/dungeon/outside/trashcave
	narrate = "A damp cave of with roaches and scrap, as well as ore to dig."

/area/nadezhda/dungeon/outside/abandoned_solars
	narrate = "Once abanadond, the pannels unset and destoryed by local funa, now just needs a bit of wiring."

/area/nadezhda/dungeon/outside/burned_outpost
	narrate = "Abanadond leaving only the trace of a fire that had destoryed this outpost."

/area/nadezhda/dungeon/outside/hunter_cabin
	narrate = "Smell of meat and dust fill the air."

/area/nadezhda/dungeon/outside/farm
	narrate = "A sorry plot of land ruined by local funa perhaps theirs still a harvest to be had here."

/area/nadezhda/dungeon/outside/abandoned_outpost
	narrate = "Abanadond outpost filled with trash and spiders."

/area/nadezhda/dungeon/outside/zoo
	narrate = "Cold damn air lingers as the now dorment building stands with unknown inside."

/area/nadezhda/dungeon/outside/prepper
	narrate = "A valt build into the moutain side housing robotic and treasers inside. That is unless the roaches or spiders got here first..."

/area/nadezhda/dungeon/outside/prepper/vault/entryway
	narrate = "A complex of housing, storage and power all left to ruin."

/area/nadezhda/dungeon/outside/smuggler_zone
	narrate = "A small outpost for pirates and smugglers alike."

/area/nadezhda/dungeon/outside/smuggler_zone_u
	narrate = "The inside of the smugglers outpost, lively with the smell of cheap drugs and cheaper booze."

/area/nadezhda/outside/one_star
	narrate = "A imposing office center in the middle of noware, sorting Greyson robotics portecting its treasers inside."

/area/nadezhda/outside/dcave
	narrate = "A common cave filled with wildlife."

/area/nadezhda/outside/pond
	narrate = "A large pond housing life from frogs to croaker lords alike."

/area/nadezhda/outside/scave
	narrate = "A small cave that is common to see spiders lerking inside."

/area/nadezhda/outside/forest/swamp_hut
	narrate = "A small hut with a farm in the hostile swamp terrain."

/area/nadezhda/outside/forest/hunting_lodge_shed_dark
	narrate = "The smell of farm animals and dust fills the area."

/area/nadezhda/outside/mountainsolars
	narrate = "Being so high up makes the air thin, and the sun beam down harder."

// SUBSTATIONS (Subtype of maint, that should let them serve as shielded area during radstorm)

/area/nadezhda/maintenance/substation
	narrate = "One of the many substations around the colony seeing the SMES storage and power net sceners."

//Command

/area/nadezhda/command/meeting_room
	narrate = "A place for behind close door meetings to get things done, or argue for hours in..."

/area/nadezhda/command/armory
	narrate = "Clean fire arms and armor for when marshals and blackshield fails..."

/area/nadezhda/command/panic_room
	narrate = "A vault for the command personal unable to aid in cases of colony unrest or attack."

/area/nadezhda/command/tcommsat
	narrate = "Cold air and plinking sounds of the telecoms log, broadcast and send messages at high speed."

/area/nadezhda/command/courtroom
	narrate = "Laws only applies if you have the authority to enforce it. You find the authority here."

//Crew Quarters

/area/nadezhda/crew_quarters/kitchen
	narrate = "All the cooking tools, and equiment needed for a fine meal."

/area/nadezhda/crew_quarters/bar
	narrate = "The long bar and music box singles the relaxing atmosphere."

/area/nadezhda/crew_quarters/janitor
	narrate = "The smell of space cleaner stings the nose."

/area/nadezhda/security/armory
	narrate = "Weapons line the shelfs and the glimer reflects off the armor."

/area/nadezhda/security/armoryshop
	narrate = "Weapons line the shelfs and the glimer reflects off the armor."

/area/nadezhda/security/range
	narrate = "The smell of gunpowder hovers in the air. Miniscule dents and pockets on the walls tell the story of past marksmanship."

//Research and Development

/area/nadezhda/rnd/server
	narrate = "Plinks and the sound of rushing air fills the area."

