/*
	Randomly gereates a viro outbreak and gives it to people randomly, its intent is to give something for doctors to do
	Some are good some are bad but the main thing is to allow for the Biolab to get points and have some content with viro
	Some infections if left for too long are lethal so theirs a risk factor to that

Viro man bad ruins rp/isnt fun to contain dosnt do a good job at all to give medical something to do

/datum/storyevent/viral_infection
	id = "viral_infection"
	name = "viral infection"

	event_type =/datum/event/viral_infection
	event_pools = list(EVENT_LEVEL_MODERATE = POOL_THRESHOLD_MODERATE,
	EVENT_LEVEL_MAJOR = POOL_THRESHOLD_MAJOR)
	tags = list(TAG_TARGETED, TAG_NEGATIVE)
*/
//////////////////////////////////////////////////////////


/var/global/list/event_viruses = list() // so that event viruses are kept around for admin logs, rather than being GCed

datum/event/viral_infection
	var/list/viruses = list()

datum/event/viral_infection/setup()
	announceWhen = rand(0, 3000)
	endWhen = announceWhen + 1

	//generate 1-3 viruses. This way there's an upper limit on how many individual diseases need to be cured if many people are initially infected
	var/num_diseases = rand(1,3)
	for (var/i=0, i < num_diseases, i++)
		var/datum/disease2/disease/D = new /datum/disease2/disease

		var/strength = 1 //whether the disease is of the greater or lesser variety
		if (severity == EVENT_LEVEL_MAJOR && prob(75))
			strength = 2
		D.makerandom(strength)
		viruses += D

datum/event/viral_infection/announce()
	var/level
	if (severity == EVENT_LEVEL_MUNDANE)
		return
	else if (severity == EVENT_LEVEL_MODERATE)
		level = pick("one", "two", "three", "four")
	else
		level = "five"

	if (severity == EVENT_LEVEL_MAJOR || prob(60))
		command_announcement.Announce("Confirmed outbreak of level [level] biohazard within the colony. All personnel must contain the outbreak.", "Biohazard Alert", new_sound = 'sound/AI/outbreak5.ogg')

datum/event/viral_infection/start()
	if(!viruses.len) return

	var/list/candidates = list()	//list of candidate keys
	for(var/mob/living/carbon/human/G in GLOB.player_list)
		if(G.mind && G.stat != DEAD && G.is_client_active(5) && !player_is_antag(G.mind))
			if(isOnStationLevel(G))
				candidates += G
	if(!candidates.len)
		return
	candidates = shuffle(candidates)//Incorporating Donkie's list shuffle

	var/list/used_viruses = list()
	var/list/used_candidates = list()
	var/actual_severity = rand(2, 6)
	while(actual_severity > 0 && candidates.len)
		var/datum/disease2/disease/D = pick(viruses)
		infect_mob(candidates[1], D.getcopy())
		used_candidates += candidates[1]
		candidates.Remove(candidates[1])
		actual_severity--
		used_viruses |= D

	event_viruses |= used_viruses
	var/list/used_viruses_links = list()
	var/list/used_viruses_text = list()
	for(var/datum/disease2/disease/D in used_viruses)
		used_viruses_links += "<a href='?src=\ref[D];info=1'>[D.name()]</a>"
		used_viruses_text += D.name()

	var/list/used_candidates_links = list()
	var/list/used_candidates_text = list()
	for(var/mob/M in used_candidates)
		used_candidates_links += key_name_admin(M)
		used_candidates_text += key_name(M)

	log_admin("Virus event affecting [english_list(used_candidates_text)] started; Viruses: [english_list(used_viruses_text)]")
	message_admins("Virus event affecting [english_list(used_candidates_links)] started; Viruses: [english_list(used_viruses_links)]")
