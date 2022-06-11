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
	account_initial_balance = 50000

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
	account_initial_balance = 50000 //+15k~ do to being state funded


/datum/department/technomancers
	name = "Artificer's Guild"
	id = DEPARTMENT_ENGINEERING
	account_initial_balance = 25000 //+15k~ do to being state funded
	//Full team with nepitsm in 6 hours is 11900
	//A full crew GM + 4 adpets is 1700 an hour, takes 10~ hours to drain the department funds


/datum/department/civilian
	name = "Nadezhda Contractors"
	id = DEPARTMENT_CIVILIAN
	account_initial_balance = 0
	//No standing balance is kept in the account, this is just for paying gardener, janitor and actor

/******************
	Benefactors
*******************/
//Departments subsidised by an external organisation. These pay their own employees
/datum/department/moebius_medical
	name = "Soteria Institution: Medical Division"
	id = DEPARTMENT_MEDICAL
	//18600 in 6 hours with full crew
	//24180 in 6 hours with full crew + nep
	account_initial_balance = 30000 //5~k For buying medical and items and payments

/datum/department/moebius_research
	name = "Soteria Institution: Research Division"
	id = DEPARTMENT_SCIENCE
	//15000 in 6 hours with full crew
	//19500 in 6 hours with full crew + nepitism
	account_initial_balance = 20000 //+10k~ For buying materials and components and things of scientific value as well as pay the demanding staff

/datum/department/church
	name = "Church of Absolute"
	id = DEPARTMENT_CHURCH
	//9600 in 6 hours with full crew
	//12480 with all nep in 6 hours
	account_initial_balance = 25000 //Materals, and they are the faith, they donate and get a lot to the colony thus they have a lot to spend

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
	account_initial_balance = 25000 //has a lot of workers thus needs a higher starting to off-set its paychecks if no one actively runs the cargo shuttle

/datum/department/prospector
	name = "Prospectors"
	id = DEPARTMENT_PROSPECTOR
	//Full team in 6 hours is 6600
	//Full team with Nep in 6 hours is 6600
	//Nep in 6 hours with full team is 8580
	account_initial_balance = 12500 //5k+6~hours of work. should be good for them to make money

/datum/department/independent
	name = "Independent Allied Factions"
	id = DEPARTMENT_INDEPENDENT

