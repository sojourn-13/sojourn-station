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
	narrate = "Untamed wilderness and hostile wildlife roam freely past the colony gates amidst the traps and mines. Tread carefully, and keep your wits about you, you are not alone out here..."

//Maintenance

/area/nadezhda/maintenance
	narrate = "Dark passages long abandoned by the colony were left to be the domain of roaches, rats and spiders... Or worse."

/area/nadezhda/maintenance/junk
	narrate = "The Junkyard, maintained by the local faith. Watch out for intergalactical scrap meteors being forcibly pulled by its force."

/area/nadezhda/maintenance/arcade
	narrate = "Once a place of fun and games, now rotted and rusted."

/area/deepmaint
	narrate = "The twisted labyrinth of deep maints. A demented worn down ruin where things that never should have been shamble in the dust and darkness. Do you hear it? Music echoes in the halls, building to a crescendo we never see."

//Outside abandoned structures

/area/colony/exposedsun/crashed_shop
	narrate = "The barest peaking of light comes through the cavern roof, bathing the worn and rusted hulk trapped in the rock in faint light. The distant sound of welders, shuffling feet, and the murmuring of vat grown void wolves can be heard, trying to eke out salvage in this pit of junk."

/area/nadezhda/dungeon/outside/trashcave
	narrate = "Roaches and critters have made this damp and long abandoned cave their nest. A glint of gold shimmers from within the piles of scrap and rock walls, awaiting the curious prospector to unearth its hidden treasures."

/area/nadezhda/dungeon/outside/abandoned_solars
	narrate = "Once an abandoned and destroyed ruin, now reclaimed by the colony and maintained by the soteria. With just a few wires, it grants its boon in power, something to offset the cost of the humming drones patrolling around."

/area/nadezhda/dungeon/outside/burned_outpost
	narrate = "Perhaps a mere accident, or an intential arson to cover deeds of dubious nature, this small outpost has charred to the ground now, leaving behind only the faintest traces of whatever life inhabited it before."

/area/nadezhda/dungeon/outside/hunter_cabin
	narrate = "The smell of rugged wood and butchered game fill the air. The ambience itself speaks of survival, of hearth and safety. Of home. A local hunter might have previously made this place their abode, albeit seemingly not for long..."

/area/nadezhda/dungeon/outside/farm
	narrate = "A humble plot of land ruined by local fauna and left to the mercy of local weeds and abandonement of its soil. With labor and dedication enough, you might make these lands a profitable farm once more..."

/area/nadezhda/outside/forest/river_forest_light
	narrate = "The sound of chirping birds, of local xenofauna sipping by the nearby rivers, the menacing roars of ursine fauna, the chittering of insects, the wind blowing across the open plains... These fields are the place where man and beast collide, for either coexistance or survival of the fittest."

/area/nadezhda/outside/forest/river_forest_lake
	narrate = "These plains are also home to a myriad of rivers dotting its landscape, becoming the dumpster of its previous temporary inhabitants, all converging in a giant lake full of ferocious space fish masquerading as tempting aquatic morsels. If you see the white whale, you best aim for its crooked brow with the nearby harpoons from previous attempts to its life."

/area/nadezhda/outside/forest/river_forest_cabin
	narrate = "Abandoned signs of civilization attempting to settle peaceful turistic spots amidst the jungle. The local beasts have proved them this is no place for a tranquil vacation..."

/area/nadezhda/outside/forest/river_forest_dark
	narrate = "Humid caves, primordially known for being the most primal of habitations for sentient and feral beast alike, also dot the landscape of these plains. You are not the first person to venture inside looking for either safety or resources, and you won't likely be the last... \
			   If you aim to claim these for your own, know that you will eventually have to deal with the same kind of interloper that you once were upon them."

/area/nadezhda/outside/forest/river_forest_underground
	narrate = "Terrifying roars of mutated bears contest the ear piercing shrieks and gurgles of spine-chilling xenomorphs, eerily echoing throughout these caverns. Dare you venture upon their turf war to claim the spoils within for your own...?"

/area/nadezhda/outside/forest/plains_farm
	narrate = "What was once a humble plot of harrowed land tended perhaps by a local hunter that decided to settle down has, at some point, been overrun by aggressive ursine fauna. With labor and dedication enough, you might make these lands a profitable farmstead once more..."

/area/nadezhda/dungeon/outside/abandoned_outpost
	narrate = "The earliest traces of sentient technological settlement on the planet can be found in what's left of this haphazardly built outpost, now fallen to ruin. Be wary of the roaches and spiders that have claimed it as their nest."

/area/nadezhda/dungeon/outside/zoo
	narrate = "Sounds of different fauna, feral growls and cute squeaks of all kinds, can be heard echoing through the otherwise silent emptiness of this abandoned facility. Their purpose unknown, its maintainers nowhere to be seen, it now stands as the ruins of an animal-holding facility colloquially dubbed as 'The zoo'."

/area/nadezhda/dungeon/outside/prepper
	narrate = "A base of operations fallen into disrepair, its former inhabitants hoarding all manner of gear for survival have long since left it to the care of their defensive security systems, now gone haywire. From its insides, a chittering that's definitely not robotic in nature can faintly be heard..."

/area/nadezhda/dungeon/outside/prepper/vault/entryway
	narrate = "The ruins of a civilization long lost to unknown causes, nothing but a deafening echo of silence can be heard through the immense hallways of this now abandoned habitational complex. That is, until its synthetic denizens and burrowed spiders start their staked feud for the ownership of this den..."

/area/nadezhda/dungeon/outside/smuggler_zone
	narrate = "An outpost of heavily reinforced walls stands strong and imposing, erected in the middle of the forest. Guarded closely by hordes of armed vatgrown void wolves, their low unintelligible grunting a mockery of sapiant life." // It's Caramelldansen.

/area/nadezhda/dungeon/outside/smuggler_zone_u
	narrate = "The inside of the Void Wolves outpost, lively with the smell of cheap drugs and even cheaper booze, as well as the threating buzz of the energy guns and swords of its inhabitants."

/area/nadezhda/outside/one_star
	narrate = "An imposing office complex curiously located in the middle of the forest, its high technology machines and gadgets guarded closely by an army of heavily armed synthetics..."

/area/nadezhda/outside/dcave
	narrate = "Terrors may indeed stalk these caves, but trinkets and baubles can be found amidst the rubble and trash for those with sufficient light, a keen eye... and a steady trigger finger."

/area/nadezhda/outside/pond
	narrate = "A large pond housing life from frogs to croaker lords alike."

/area/nadezhda/outside/scave
	narrate = "A small cave out of many that dot the planet, spiders can usually be seen lurking inside, nesting for prey to fall on their webs."

/area/nadezhda/outside/forest/swamp_hut
	narrate = "A small abandoned hut in the middle of the swamps with tilled plots of land and farm animals - an oasis for those with wishes of settlement, or who seek shelter from the local fauna. Beware the tribals that usually move inside looking for the same..."

/area/nadezhda/outside/forest/hunting_lodge_shed_dark
	narrate = "The mooing of the tatonkas. Cerberuse's snarling. The happy clucking of mutated chickens. All hunts, great and small alike, begin with the preparation brought about by the humble animals on this farm..."

/area/nadezhda/outside/mountainsolars
	narrate = "Being so high up makes the air thin, and the sun scorch harder. But there is beauty to be found on the vantage of the highest point in the colony, dotted by solar panels to provide power."

// SUBSTATIONS (Subtype of maint, that should let them serve as shielded area during radstorm)

/area/nadezhda/maintenance/substation
	narrate = "One of the many substations around the colony housing the SMES units and power net controllers, providing electricity to its particular area."

//Command

/area/nadezhda/command/meeting_room
	narrate = "A place for behind-closed-doors meetings to get things done, or argue for hours in..."

/area/nadezhda/command/armory
	narrate = "Cleanly polished and well mantained firearms carefully set in place for the council members to peruse, when Marshals and Blackshields fail, and all hope of acquiring a firearm is lost..."

/area/nadezhda/command/panic_room
	narrate = "A secure vault for the command personnel unable to aid in cases of colony unrest or attacks of code red magnitude."

/area/nadezhda/command/tcommsat
	narrate = "Cold air permeates this pressurized area where plinking sounds of the telecoms logging, broadcasting, and sending of messages can be heard echoing incessantly."

/area/nadezhda/command/courtroom
	narrate = "Laws only apply if you have the authority (and the means) to enforce them. You shall find such authority set in use in this place."

//Crew Quarters

/area/nadezhda/crew_quarters/kitchen
	narrate = "The bustling of incessant clients, sounds of microwaves and blenders working, the sharpening of knives and multitude of steps. To some, chaos. To others, a perfectly normal cacophony of everyday work in lieu of the finest meals available."

/area/nadezhda/crew_quarters/bar
	narrate = "The songs from the jukebox help mitigate the bustling from the nearby kitchen to soften the atmosphere. This is the place where glasses clink, drinks are poured, and lives are changed."

/area/nadezhda/crew_quarters/janitor
	narrate = "The small abode of custodial equipment, the most spotless place of this usually dust-ridden colony who is soon to be polished to a mirror sheen by its humblest of workers."

/area/nadezhda/security/armory
	narrate = "Weapons line the shelves in perfect order and even more perfect condition. Ammunition is neatly kept separate. The autolathe clicks and pistons in anticipation for the guns and ammunition it will print on yet another busy day..."

/area/nadezhda/security/armoryshop
	narrate = "The smell of freshly pressed gunpowder permeates the air. Weapons line the shelves in perfect order and even more perfect condition. The shutters guard closely instruments of great equality, yet still allowing them to be seen for the sake of appraisal."

/area/nadezhda/security/range
	narrate = "The heavy smell of gunpowder permeates the air. Miniscule dents and pockets on the rock walls tell the story of past marksmanship trainings."

//Research and Development

/area/nadezhda/rnd/server
	narrate = "The beeping of faster-than-light processing sputters through the background noise of vents chilling the air around the servers. This is where the sum total of scientific knowledge is properly cooled and stored every single day."

