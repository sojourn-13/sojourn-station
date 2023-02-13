//Done like this to prevent people from loadout taking this
/obj/item/clothing/accessory/work_visa_sol
	name = "solarian work visa"
	desc = "An older general purpose of visa for work issued by the Solarian Federation. It states their occupation was"
	icon_state = "workvisa"
	item_state = "pass"

/obj/item/clothing/accessory/work_visa_sol/Initialize()
	//the name of the person
	var/adding_name = capitalize(pick(GLOB.first_names_male)) + " " + capitalize(pick(GLOB.last_names))
	name = "[adding_name] [name]"
	//flavour on wha ttheir job was
	var/what_did_they_do = list(
			"Aerospace Engineer",
			"Aerospace Engineering Technician",
			"Agricultural Crop Farm Manager",
			"Agricultural Engineer",
			"Agricultural Equipment Operator",
			"Agricultural Inspector",
			"Agricultural Product Sorter",
			"Agricultural Sciences Professor",
			"Agricultural Technician",
			"Labor Relations Advisor",
			"Laboratory Tester",
			"Land Surveyor",
			"Landscape Architect",
			"Landscape Contractor",
			"Laboratory Tester",
			"Electrical Drafter",
			"Electrical Engineers",
			"Electrical Parts Reconditioner",
			"Electrical Technician",
			"Electro-Mechanical Technicians",
			"Electromechanical Equipment Assembler",
			"Electronic Drafter",
			"Electronics Engineer",
			"Electronics Technician",
			"English Language and Literature Professor",
			"Environmental Compliance Inspector",
			"Environmental Disease Analyst",
			"Environmental Engineer",
			"Environmental Planner",
			"Environmental Research Analyst",
			"Environmental Science Technician",
			"Environmental Science Professsor",
			"Fire Inspector",
			"Fire Investigator",
			"Fire Prevention Engineer",
			"Fire Protection Engineer",
			"Fire Protection Engineering Technician",
			"Mechanical Drafter",
			"Mechanical Engineer",
			"Mechanical Engineering Technician",
			"Mechanical Inspector",
			"Medical Laboratory Technician",
			"Medical Appliance Technician",
			"Medical Assistant",
			"Medical Equipment Preparer",
			"Medical Examiner/Coroner",
			"Medical Photographer",
			"Medical Records Administrator",
			"Medical Records Technician",
			"Medical Secretary",
			"Emergency Management Specialist",
			"Emergency Medical Technician"
			)
	desc = "[desc] [pick(what_did_they_do)]"