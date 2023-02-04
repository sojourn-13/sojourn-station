/*
	Department Datums
	Currently only used for a non-shitcode way of having variable initial balances in department accounts
	in future, should be a holder for job datums
*/

/datum/department
	var/name = "unspecified department"	//Name may be shown in UIs, proper capitalisation
	var/id	= "department" //This should be one of the DEPARTMENT_XXX defines in __defines/jobs.dm
	var/account_number = 0
	var/account_pin
	var/account_initial_balance = 3500	//How much money this account starts off with
	var/list/jobs_in_department = list()

	// With external, this is the name of an organisation
	// Adding a funding source makes the game pay them out of thin air.
	// Adding in a department flag (see sojourn-station/code/__DEFINES/jobs.dm) will make it draw form said account to wire funds for payment of wages.
	// This is takes form the source budget_bage + wages per person
	var/funding_source

	// Budget for misc department expenses, paid regardless of it being manned or not
	var/budget_base = 0

	// Budget for crew salaries. Summed up initial wages of department's personnel
	var/budget_personnel = 0


	// How much account failed to pay to employees. Used for emails
	var/total_debt = 0

/datum/department/proc/get_total_budget()
	if(funding_source)
		return budget_base + budget_personnel
	else
		return FALSE

/*************
	Command
**************/
/datum/department/command
	name = "Nadezhda Council"
	id = DEPARTMENT_COMMAND
	/*
	The command account is the ship account. It is the master account that retainer departments are paid from,
	and represents the Captain's wealth, assets and holdings

	For now, it is set to an effectively infinitely high amount which shouldn't run out in normal gameplay
	In future, we will implement largescale missions and research contracts to earn money, and then set it
	to a much lower starting value
	*/
	account_initial_balance = 50000 //Emergency / Discression funding. 50k acceptable; used to cover costs of other departments as needed by the Premier / Steward. Consider reducing by 10-20k if too much.
	jobs_in_department = list("/datum/job/premier","/datum/job/pg")

/*************
	Retainers
**************/
//These departments are paid out of ship funding
/datum/department/ironhammer
	name = "Marshal and Blackshield Division"
	id = DEPARTMENT_SECURITY
	//This is balanced around full team in 6 hours with nepitism
	//Without nepitsm a full team 27000 in 6 hours
	//With nepitsm a full team 35100 in 6 hours
	account_initial_balance = 40000 //Estimated 5k extra credits than what is required for wages on a full roster.
	jobs_in_department = list("/datum/job/smc","/datum/job/swo","/datum/job/supsec","/datum/job/serg","/datum/job/inspector","/datum/job/medspec","/datum/job/trooper","/datum/job/officer")


/datum/department/technomancers
	name = "Artificer's Guild"
	id = DEPARTMENT_ENGINEERING
	account_initial_balance = 14000 //Few extra thousand credits than needed for wages, covers material cost. Any extra money should be aquired through sales.
	//Full team with nepitsm in 6 hours is 11900
	//A full crew GM + 4 adpets is 1700 an hour, takes 10~ hours to drain the department funds
	jobs_in_department = list("/datum/job/chief_engineer","/datum/job/technomancer")


/datum/department/civilian
	name = "Nadezhda Contractors"
	id = DEPARTMENT_CIVILIAN
	account_initial_balance = 0
	//No standing balance is kept in the account, this is just for paying gardener, janitor and actor
	jobs_in_department = list("/datum/job/clubmanager","/datum/job/clubworker","/datum/job/hydro","/datum/job/artist","/datum/job/janitor")

/******************
	Benefactors
*******************/
//Departments subsidised by an external organisation. These pay their own employees
/datum/department/moebius_medical
	name = "Soteria Institution: Medical Division"
	id = DEPARTMENT_MEDICAL
	//18600 in 6 hours with full crew
	//24180 in 6 hours with full crew + nep
	account_initial_balance = 24200 //Covers crew-cost. Rest should be made up for by medical fees and chem sales.
	jobs_in_department = list("datum/job/cmo","/datum/job/doctor","/datum/job/recovery_team","/datum/job/psychiatrist")

/datum/department/moebius_research
	name = "Soteria Institution: Research Division"
	id = DEPARTMENT_SCIENCE
	//15000 in 6 hours with full crew
	//19500 in 6 hours with full crew + nepitism
	account_initial_balance = 20000 //Covers basic fees of employees. Sell posis and whatever else to make up for material cost.
	jobs_in_department = list("/datum/job/rd","/datum/job/scientist","/datum/job/roboticist")

/datum/department/church
	name = "Church of Absolute"
	id = DEPARTMENT_CHURCH
	//9600 in 6 hours with full crew
	//12480 with all nep in 6 hours
	account_initial_balance = 12500 //Covers base wages. Biomatter, farm, solars, trash beacon - fully self-sufficent. Sell things for more money.
	jobs_in_department = list ("/datum/job/chaplain","/datum/job/acolyte")

/******************
	Independant
*******************/
//Self funds and pays wages out of its earnings
/datum/department/guild
	name = "Lonestar Shipping Solutions"
	id = DEPARTMENT_LSS

	/*
		The LSS account represents the holdings of the local branch, and CEO.
	*/
	/* if you want to change this remember to do so in code\game\gamemodes\score.dm as well,
	if you manage to get this variable refferenced there you're a better man than me. godspeed
	*/
	//Note: LSS isnt accounted for wages when starting money as they have the easyest ways to make money
	account_initial_balance = 17000 //Has a lot of workers to pay - but their /entire/ job is literally to make money. Should cover the base nessessities of hourly payment.
	jobs_in_department = list("/datum/job/merchant","/datum/job/cargo_tech","/datum/job/mining")

/datum/department/prospector
	name = "Prospectors"
	id = DEPARTMENT_PROSPECTOR
	//Full team in 6 hours is 6600
	//Full team with Nep in 6 hours is 6600
	//Nep in 6 hours with full team is 8580
	account_initial_balance = 8500 //Starts with an even wage to cover payment-expenses. Their job is to make money and, thus, should not start with more money than needed.
	jobs_in_department = list("/datum/job/foreman","/datum/job/salvager","/datum/job/pro")

/datum/department/independent
	name = "Independent Allied Factions"
	id = DEPARTMENT_INDEPENDENT
	jobs_in_department = list("/datum/job/off_colony_hunt_master","/datum/job/off_colony_hunter","/datum/job/off_colony_herbalist","/datum/job/outsider","/datum/job/assistant")

/datum/department/greyson_positronic
	name = "Greyson Positronic"
	id = DEPARTMENT_GREYSON
	jobs_in_department = list()


///////////////////////DEPARTMENT EXPERIENCE PERKS//////////////////////////////////////////

/datum/perk/experienced
	name = "Experienced: HOLDER"
	desc = "This is only a test."
	active = FALSE
	passivePerk = FALSE
	var/subPerk = FALSE
	var/datum/department/dept




/datum/perk/experienced/activate()
	..()
	var/list/perkChoice
	var/paths = subtypesof(type)
	for (var/T in paths)
		var/datum/perk/experienced/checker = new T
		if (checker)
			if ((checker.dept == dept)&&(checker.subPerk))
				perkChoice += list(checker)

	var/datum/perk/experienced/choice = input("Hey, this is the first text.", "SECOND!", FALSE) as anything in perkChoice
	if (istype(choice,/datum/perk/experienced))
		holder.stats.addPerk(choice.type)
	holder.stats.removePerk(type)

///////////////////////////////
//EXPERIENCED PERKS
//
//When the base Department perk is clicked, it will search all subtypes of the /datum/perk/experienced/<<DEPARTMENT>>/ folder for all subperks of that particular kind.
//It will then present an input choice list as to what "Sub-Perk" they would like to choose for being experienced.
//////////////////////////////


/datum/perk/experienced/Prospector
	name = "Experienced: Prospector"
	gain_text = "Did it work?"
	dept = DEPARTMENT_PROSPECTOR

/datum/perk/experienced/Prospector/ThingOne
	subPerk = TRUE
	name = "Experienced: Prospector - Thing One Check"   /////Use this format. Or don't?
	gain_text = "Alright, you're scaring me..."

/datum/perk/experienced/Science
	name = "Experienced: Science"
	gain_text = "Well, that apparently worked?"
	desc = "Hm....."
	dept = DEPARTMENT_SCIENCE

/datum/perk/experienced/Medical
	name = "Experienced: Medical"
	dept = DEPARTMENT_MEDICAL

/datum/perk/experienced/Lonestar
	name = "Experienced: Lonestar"
	dept = DEPARTMENT_LSS
	gain_text = "Yay? Lonestar!!!"

/datum/perk/experienced/Lonestar/Station
	subPerk = TRUE
	name = "Station?"
	gain_text = "STATION!"
	desc = "Station."

/datum/perk/experienced/Lonestar/DoubleTrouble
	subPerk = TRUE
	name = "BOUBLE TWOBLE!"
	gain_text = "I knojsdklakfdj;af"
	desc = "Another boring description"

/datum/perk/experienced/Cult
	name = "Experienced: Church of the Gamer Word"
	dept = DEPARTMENT_CHURCH

/datum/perk/experienced/Service
	name = "Experienced: Service Worker"
	dept = DEPARTMENT_CIVILIAN

/datum/perk/experienced/artificers
	name = "Experienced: Artificer's Guild"
	dept = DEPARTMENT_ENGINEERING

/datum/perk/experienced/shitcurity
	name = "Experienced: Shitcurity"
	dept = DEPARTMENT_SECURITY

/datum/perk/experienced/unaligned
	name = "Experienced: Other"
	dept = DEPARTMENT_INDEPENDENT

//No, there is no experience perk for the Premiere, as the point of the position is suffering.
