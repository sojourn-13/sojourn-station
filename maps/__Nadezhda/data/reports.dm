//Report datums for use with the report editor and other programs.

/datum/computer_file/report/recipient/crew_transfer
	form_name = "CTA-SGF-01"
	title = "Crew Transfer Application"
	logo = "\[solcrest\]\[logo\]"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/crew_transfer/generate_fields()
	..()
	var/list/xo_fields = list()
	add_field(/datum/report_field/instruction, "Nadezhda Colony - High Council")
	add_field(/datum/report_field/people/from_manifest, "Name (XO)")
	add_field(/datum/report_field/people/from_manifest, "Name (applicant)", required = 1)
	add_field(/datum/report_field/date, "Date filed")
	add_field(/datum/report_field/time, "Time filed")
	add_field(/datum/report_field/simple_text, "Present position")
	add_field(/datum/report_field/simple_text, "Requested position")
	add_field(/datum/report_field/pencode_text, "Reason stated")
	add_field(/datum/report_field/instruction, "The following fields render the document invalid if not signed clearly.")
	add_field(/datum/report_field/signature, "Applicant signature")
	xo_fields += add_field(/datum/report_field/signature, "Faction Owner's signature")
	xo_fields += add_field(/datum/report_field/number, "Number of personnel in present/previous position")
	xo_fields += add_field(/datum/report_field/number, "Number of personnel in requested position")
	xo_fields += add_field(/datum/report_field/options/yes_no, "Approved")
	for(var/datum/report_field/field in xo_fields)
		field.set_access(access_edit = access_hop)

/datum/computer_file/report/recipient/access_modification
	form_name = "AMA-SGF-02"
	title = "Crew Access Modification Application"
	logo = "\[solcrest\]\[logo\]"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/access_modification/generate_fields()
	..()
	var/list/xo_fields = list()
	add_field(/datum/report_field/instruction, "Nadezhda Colony - High Council")
	add_field(/datum/report_field/people/from_manifest, "Name (XO)")
	add_field(/datum/report_field/people/from_manifest, "Name (applicant)", required = 1)
	add_field(/datum/report_field/date, "Date filed")
	add_field(/datum/report_field/time, "Time filed")
	add_field(/datum/report_field/simple_text, "Present position")
	add_field(/datum/report_field/simple_text, "Requested access")
	add_field(/datum/report_field/pencode_text, "Reason stated")
	add_field(/datum/report_field/simple_text, "Duration of expanded access")
	add_field(/datum/report_field/instruction, "The following fields render the document invalid if not signed clearly.")
	add_field(/datum/report_field/signature, "Applicant signature")
	xo_fields += add_field(/datum/report_field/signature, "Faction Owner's signature")
	xo_fields += add_field(/datum/report_field/number, "Number of personnel in relevant position")
	xo_fields += add_field(/datum/report_field/options/yes_no, "Approved")
	for(var/datum/report_field/field in xo_fields)
		field.set_access(access_edit = access_hop)

/datum/computer_file/report/recipient/borging
	form_name = "CC-SGF-09"
	title = "Cyborgification Contract"
	logo = "\[solcrest\]"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/borging/generate_fields()
	..()
	var/list/xo_fields = list()
	add_field(/datum/report_field/instruction, "Soteria Institute")
	add_field(/datum/report_field/people/from_manifest, "Name (XO)")
	add_field(/datum/report_field/people/from_manifest, "Name (subject)", required = 1)
	add_field(/datum/report_field/date, "Date filed")
	add_field(/datum/report_field/time, "Time filed")
	add_field(/datum/report_field/instruction, "I, undersigned, hereby agree to willingly undergo a Regulation Lobotimization with intention of cyborgification or AI assimilation, and I am aware of all the consequences of such act. I also understand that this operation may be irreversible, and that my employment contract will be terminated.")
	add_field(/datum/report_field/signature, "Subject's signature")
	xo_fields += add_field(/datum/report_field/signature, "Researc Overseer's signature")
	xo_fields += add_field(/datum/report_field/options/yes_no, "Approved")
	for(var/datum/report_field/field in xo_fields)
		field.set_access(access_edit = access_hop)

/datum/computer_file/report/recipient/sec
	logo = "\[solcrest\]"

/datum/computer_file/report/recipient/sec/New()
	..()
	set_access(access_security)
	set_access(access_heads, override = 0)

/datum/computer_file/report/recipient/sec/investigation
	form_name = "SCG-SEC-43"
	title = "Investigation Report"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/sec/investigation/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "Marshal Security Department")
	add_field(/datum/report_field/instruction, "For internal use only.")
	add_field(/datum/report_field/people/from_manifest, "Name")
	add_field(/datum/report_field/date, "Date")
	add_field(/datum/report_field/time, "Time")
	add_field(/datum/report_field/simple_text, "Case name")
	add_field(/datum/report_field/pencode_text, "Summary")
	add_field(/datum/report_field/pencode_text, "Observations")
	add_field(/datum/report_field/signature, "Signature")
	set_access(access_edit = access_security)

/datum/computer_file/report/recipient/sec/incident
	form_name = "SCG-SEC-12"
	title = "Security Incident Report"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/sec/incident/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "Marshal Security Department")
	add_field(/datum/report_field/instruction, "To be filled out by Officer on duty responding to the Incident. Report must be signed and submitted before the end of the shift!")
	add_field(/datum/report_field/people/from_manifest, "Reporting Officer")
	add_field(/datum/report_field/simple_text, "Offense/Incident Type")
	add_field(/datum/report_field/date, "Date")
	add_field(/datum/report_field/time, "Time of incident")
	add_field(/datum/report_field/people/list_from_manifest, "Assisting Officer(s)")
	add_field(/datum/report_field/simple_text, "Location")
	add_field(/datum/report_field/pencode_text, "Personnel involved in Incident", "\[small\]\[i\](V-Victim, S-Suspect, W-Witness, M-Missing, A-Arrested, RP-Reporting Person, D-Deceased)\[/i\]\[/small\]")
	add_field(/datum/report_field/pencode_text, "Description of Items/Property", "\[small\]\[i\](D-Damaged, E-Evidence, L-Lost, R-Recovered, S-Stolen)\[/i\]\[/small\]")
	add_field(/datum/report_field/pencode_text, "Narrative")
	add_field(/datum/report_field/signature, "Reporting Officer's signature")
	set_access(access_edit = access_security)

/datum/computer_file/report/recipient/sec/evidence
	form_name = "SCG-SEC-02b"
	title = "Evidence and Property Form"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/sec/evidence/generate_fields()
	..()
	var/datum/report_field/temp_field
	add_field(/datum/report_field/instruction, "Marshal Security Department")
	add_field(/datum/report_field/date, "Date")
	add_field(/datum/report_field/time, "Time")
	add_field(/datum/report_field/people/from_manifest, "Confiscated from")
	add_field(/datum/report_field/pencode_text, "List of items in custody/evidence lockup")
	set_access(access_edit = access_security)
	temp_field = add_field(/datum/report_field/signature, "Brig Officer's signature")
	temp_field.set_access(access_edit = list(access_security, access_armory))
	temp_field = add_field(/datum/report_field/signature, "Ranger's signature")
	temp_field.set_access(access_edit = list(access_security, access_forensics_lockers))

//Supply and Exploration; these are not shown in deck manager.

/datum/computer_file/report/recipient/docked
	logo = "\[solcrest\]"
	form_name = "SCG-SUP-12"
	title = "Docked Vessel Report"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/docked/New()
	..()
	set_access(access_cargo, access_cargo)
	set_access(access_heads, override = 0)

/datum/computer_file/report/recipient/docked/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "Nadezhda Ship Visitation and Logging")
	add_field(/datum/report_field/instruction, "General Info")
	add_field(/datum/report_field/date, "Date")
	add_field(/datum/report_field/simple_text, "Vessel Name")
	add_field(/datum/report_field/simple_text, "Vessel Pilot/Owner")
	add_field(/datum/report_field/simple_text, "Vessel Intended Purpose")
	add_field(/datum/report_field/people/from_manifest, "Docking Authorized by")
	add_field(/datum/report_field/instruction, "General Cargo Info")
	add_field(/datum/report_field/pencode_text, "List the types of cargo onboard the vessel")
	add_field(/datum/report_field/instruction, "Hazardous Cargo Info")
	add_field(/datum/report_field/options/yes_no, "Weaponry")
	add_field(/datum/report_field/options/yes_no, "Live Cargo")
	add_field(/datum/report_field/options/yes_no, "Biohazardous material")
	add_field(/datum/report_field/options/yes_no, "Chemical or radiation hazard")
	add_field(/datum/report_field/signature, "To indicate authorization for vessel entry, sign here")
	add_field(/datum/report_field/instruction, "Undocking and Departure")
	add_field(/datum/report_field/time, "Undocking Time")
	add_field(/datum/report_field/pencode_text, "Additional Undocking Comments")

/datum/computer_file/report/recipient/fauna
	logo = "\[solcrest\]"
	form_name = "SCG-EXP-19f"
	title = "Alien Fauna Report"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/docked/New()
	..()
	set_access(access_edit = access_cargo)
	set_access(access_edit = access_moebius, override = 0)

/datum/computer_file/report/recipient/fauna/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "Prospector Expeditions")
	add_field(/datum/report_field/instruction, "The following is to be filled out by members of a Expedition team after discovery and study of new alien life forms.")
	add_field(/datum/report_field/date, "Date")
	add_field(/datum/report_field/people/list_from_manifest, "Personnel Involved")
	add_field(/datum/report_field/pencode_text, "Anatomy/Appearance")
	add_field(/datum/report_field/pencode_text, "Locomotion")
	add_field(/datum/report_field/pencode_text, "Diet")
	add_field(/datum/report_field/pencode_text, "Habitat")
	add_field(/datum/report_field/simple_text, "Homeworld")
	add_field(/datum/report_field/pencode_text, "Behavior")
	add_field(/datum/report_field/pencode_text, "Defense/Offense")
	add_field(/datum/report_field/pencode_text, "Special Characteristic(s)")
	add_field(/datum/report_field/pencode_text, "Classification")
	add_field(/datum/report_field/instruction, "On completion of this form and form approval, the foreman should fax the form to both the chief research overseer and the soteria owner, Nakharan Mkne , as well as keep a copy on file in their office alongside other mission reports.")

//NT reports, mostly for liason but can be used by any NT personnel.

/datum/computer_file/report/recipient/nt
	logo = "\[logo\]"

/datum/computer_file/report/recipient/nt/proc/add_header()
	add_field(/datum/report_field/simple_text, "Colony", "Nadezhda Colony")
	add_field(/datum/report_field/date, "Date")
	add_field(/datum/report_field/time, "Time")
	add_field(/datum/report_field/simple_text, "Index")

/datum/computer_file/report/recipient/nt/anomaly
	form_name = "C-1546"
	title = "Anomalistic Object Report"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/anomaly/New()
	..()
	set_access(access_moebius, access_moebius)

/datum/computer_file/report/recipient/nt/anomaly/generate_fields()
	..()
	add_header()
	add_field(/datum/report_field/simple_text, "AO Codename")
	add_field(/datum/report_field/people/from_manifest, "Reporting Scientist")
	add_field(/datum/report_field/people/from_manifest, "Overviewing Research Director")
	add_field(/datum/report_field/pencode_text, "Containment Procedures")
	add_field(/datum/report_field/pencode_text, "Generalized Overview")
	add_field(/datum/report_field/simple_text, "Approximate Age of AO")
	add_field(/datum/report_field/simple_text, "Threat Level of AO")

/datum/computer_file/report/recipient/nt/fire
	form_name = "C-0102"
	title = "Corporate Employment Termination Form"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/fire/New()
	..()
	set_access(access_heads, access_heads)
	set_access(access_heads, override = 0)

/datum/computer_file/report/recipient/nt/fire/generate_fields()
	..()
	add_header()
	add_field(/datum/report_field/instruction, "Notice of Termination of Employment")
	add_field(/datum/report_field/people/from_manifest, "Name")
	add_field(/datum/report_field/number, "Age")
	add_field(/datum/report_field/simple_text, "Position")
	add_field(/datum/report_field/pencode_text, "Reason for Termination")
	add_field(/datum/report_field/signature, "Authorized by")
	add_field(/datum/report_field/instruction, "Please attach employment records alongside notice of termination.")

/datum/computer_file/report/recipient/nt/incident/New()
	..()
	set_access(access_edit = access_heads)

/datum/computer_file/report/recipient/nt/incident/generate_fields()
	..()
	add_header()
	add_field(/datum/report_field/pencode_text, "Summary of Incident")
	add_field(/datum/report_field/pencode_text, "Details of Incident")

/datum/computer_file/report/recipient/nt/incident/proc/add_signatures()
	add_field(/datum/report_field/signature, "Signature")
	add_field(/datum/report_field/signature, "Witness Signature")
	add_field(/datum/report_field/options/yes_no, "Approved")

/datum/computer_file/report/recipient/nt/incident/ship
	form_name = "C-3203"
	title = "Corporate Ship Incident Report"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/incident/ship/generate_fields()
	..()
	add_field(/datum/report_field/pencode_text, "Departments Involved")
	add_signatures()


/datum/computer_file/report/recipient/nt/incident/personnel
	form_name = "C-3205"
	title = "Colony Personnel Incident Report"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/incident/personnel/generate_fields()
	..()
	add_field(/datum/report_field/people/list_from_manifest, "Employee(s) Involved")
	add_signatures()

/datum/computer_file/report/recipient/nt/incident/asset
	form_name = "C-3201"
	title = "Colony Asset Incident Report"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/incident/asset/generate_fields()
	..()
	add_field(/datum/report_field/pencode_text, "Corporate Employee Injuries")
	add_field(/datum/report_field/pencode_text, "Corporate Assets Lost")
	add_signatures()

/datum/computer_file/report/recipient/nt/incident/xeno
	form_name = "C-3213"
	title = "Colony Non-Humanoid Employee Incident Report"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/incident/xeno/generate_fields()
	add_field(/datum/report_field/instruction, "If non-human employee lacks a valid work visa, use form C-3213A instead.")
	..()
	add_field(/datum/report_field/people/list_from_manifest, "Non-Human Employee(s) Involved")
	add_signatures()

/datum/computer_file/report/recipient/nt/incident/xeno_no_visa/
	form_name = "C-3213A"
	title = "Colony Non-Humananoid Employee Incident Report: Without Citizenship"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/incident/xeno_no_visa/generate_fields()
	add_field(/datum/report_field/instruction, "If non-humanoid employee has a valid citizen record, use form C-3213 instead.")
	..()
	add_field(/datum/report_field/people/list_from_manifest, "Non-Humanoid Employee(s) Involved")
	add_signatures()

/datum/computer_file/report/recipient/nt/incident/synth
	form_name = "C-3213X"
	title = "Colony Synthetic Employee Incident Report"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/incident/synth/generate_fields()
	..()
	add_field(/datum/report_field/people/list_from_manifest, "Synthetic Employee(s) Involved")
	add_signatures()

/datum/computer_file/report/recipient/nt/incident/crew
	form_name = "C-3241"
	title = "Colony Ship Crew/Employee Incident Report"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/incident/crew/generate_fields()
	add_field(/datum/report_field/instruction, "For multi-party incidents involving both ship crew and company employees.")
	..()
	add_field(/datum/report_field/people/list_from_manifest, "Crew Member(s) Involved")
	add_field(/datum/report_field/people/list_from_manifest, "Employee(s) Involved")
	add_signatures()

/datum/computer_file/report/recipient/nt/volunteer
	form_name = "C-1443"
	title = "Colony Test Subject Volunteer Form"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/volunteer/generate_fields()
	..()
	var/list/temp_fields = list()
	add_header()
	add_field(/datum/report_field/people/from_manifest, "Name of Volunteer")
	add_field(/datum/report_field/simple_text, "Intended Procedure(s)")
	add_field(/datum/report_field/simple_text, "Compensation for Volunteer: (if any)")
	add_field(/datum/report_field/people/list_from_manifest, "Handling Researcher(s)")
	add_field(/datum/report_field/instruction, "By signing, the \"Volunteer\" agrees to absolve the faction, and its employees, of any liability or responsibility for injuries, damages, property loss or side-effects that may result from the intended procedure. If signed by an authorized representative of the faction, such as a Research Overseer or Medical Overseer - this form is deemed reviewed, but is only approved if so marked.")
	add_field(/datum/report_field/signature, "Volunteer's Signature:")
	temp_fields += add_field(/datum/report_field/signature, "Faction Representative's Signature")
	temp_fields += add_field(/datum/report_field/options/yes_no, "Approved")
	for(var/datum/report_field/temp_field in temp_fields)
		temp_field.set_access(access_edit = access_heads)

/datum/computer_file/report/recipient/nt/deny
	form_name = "C-1443D"
	title = "Rejection of Test Subject Volunteer Notice"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/deny/generate_fields()
	..()
	add_header()
	add_field(/datum/report_field/instruction, "Dear Sir/Madam, we regret to inform you that your volunteer application for service as a test subject with the Corporation has been rejected. We thank you for your interest in our company and the progression of research. Attached, you will find a copy of your original volunteer form for your records. Regards,")
	add_field(/datum/report_field/signature, "Faction Representative's Signature")
	add_field(/datum/report_field/people/from_manifest, "Name of Volunteer")
	add_field(/datum/report_field/instruction, "Reason for Rejection")
	add_field(/datum/report_field/options/yes_no, "Physically Unfit")
	add_field(/datum/report_field/options/yes_no, "Mentally Unfit")
	add_field(/datum/report_field/options/yes_no, "Project Cancellation")
	add_field(/datum/report_field/simple_text, "Other")
	add_field(/datum/report_field/options/yes_no, "Report Approved")
	set_access(access_edit = access_heads)

/datum/computer_file/report/recipient/nt/memo/generate_fields()
	..()
	add_header()
	add_field(/datum/report_field/simple_text, "Subject")
	add_field(/datum/report_field/pencode_text, "Body")
	add_field(/datum/report_field/signature, "Authorizing Signature")
	add_field(/datum/report_field/options/yes_no, "Approved")

/datum/computer_file/report/recipient/nt/memo/internal
	form_name = "C-0003"
	title = "Internal Memorandum"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/memo/internal/New()
	..()
	set_access(access_heads, access_heads)

/datum/computer_file/report/recipient/nt/memo/external
	form_name = "C-0005"
	title = "External Memorandum"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/memo/external/New()
	..()
	set_access(access_edit = access_heads)

//No access restrictions for easier use.
/datum/computer_file/report/recipient/nt/sales
	form_name = "C-2192"
	title = "Corporate Sales Contract and Receipt"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/sales/generate_fields()
	..()
	add_header()
	add_field(/datum/report_field/instruction, "Product Information")
	add_field(/datum/report_field/simple_text, "Product Name")
	add_field(/datum/report_field/simple_text, "Product Type")
	add_field(/datum/report_field/number, "Product Unit Cost (T)")
	add_field(/datum/report_field/number, "Product Units Requested")
	add_field(/datum/report_field/number, "Total Cost (T)")
	add_field(/datum/report_field/instruction, "Seller Information")
	add_field(/datum/report_field/instruction, "The 'Purchaser' may not return any sold product units for re-compensation in thalers, but may return the item for an identical item, or item of equal material (not thaler) value. The 'Seller' agrees to make their best effort to repair, or replace any items that fail to accomplish their designed purpose, due to malfunction or manufacturing error - but not user-caused damage.")
	add_field(/datum/report_field/people/from_manifest, "Name")
	add_field(/datum/report_field/signature, "Signature")
	add_field(/datum/report_field/options/yes_no, "Approved")


/datum/computer_file/report/recipient/nt/payout
	form_name = "C-3310"
	title = "Next of Kin Payout Authorization"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/payout/generate_fields()
	..()
	add_header()
	add_field(/datum/report_field/people/from_manifest, "This document hereby authorizes the payout of the remaining salary of")
	add_field(/datum/report_field/pencode_text, "As well as the net-worth of any remaining personal assets: (Asset, Thaler Amount)")
	add_field(/datum/report_field/pencode_text, "Including personal effects")
	add_field(/datum/report_field/instruction, "To be shipped and delivered directly to the employee's next of kin without delay.")
	add_field(/datum/report_field/signature, "Signature")
	add_field(/datum/report_field/options/yes_no, "Approved")
	set_access(access_edit = access_heads)

//Solgov reports, mostly for the SGR
/datum/computer_file/report/recipient/sol
	logo = "\[solcrest\]"
	form_name = "SCG-REP-00"

/datum/computer_file/report/recipient/sol/audit
	form_name = "SCG-REP-12"
	title = "Nadezhda Department Audit"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/sol/audit/generate_fields()
	add_field(/datum/report_field/date, "Date")
	add_field(/datum/report_field/time, "Time")
	add_field(/datum/report_field/simple_text, "Name of Department")
	add_field(/datum/report_field/pencode_text, "Positive Observations")
	add_field(/datum/report_field/pencode_text, "Negative Observations")
	add_field(/datum/report_field/pencode_text, "Other Notes")
	add_field(/datum/report_field/signature, "Signature")
	add_field(/datum/report_field/options/yes_no, "Approved")
	set_access(access_edit = access_heads)

/datum/computer_file/report/recipient/sol/audit
	form_name = "SCG-REP-4"
	title = "Crewman Incident Report"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/sol/audit/generate_fields()
	add_field(/datum/report_field/date, "Date")
	add_field(/datum/report_field/time, "Time")
	add_field(/datum/report_field/people/from_manifest, "Crewman Involved in Incident")
	add_field(/datum/report_field/simple_text, "Nature of Incident")
	add_field(/datum/report_field/pencode_text, "Description of incident")
	add_field(/datum/report_field/signature, "Signature")
	add_field(/datum/report_field/options/yes_no, "Approved")
	set_access(access_edit = list(access_heads, access_heads))

/datum/computer_file/report/recipient/sol/audit
	form_name = "SCG-REP-03b"
	title = "Visitor Issuing Form"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/sol/audit/generate_fields()
	var/datum/report_field/temp_field
	add_field(/datum/report_field/date, "Date")
	add_field(/datum/report_field/time, "Time")
	add_field(/datum/report_field/people/from_manifest, "Recipient of Visitation Form")
	add_field(/datum/report_field/simple_text, "Species of Recipient")
	temp_field = add_field(/datum/report_field/signature, "Issuer of Visitation Pass Signature")
	add_field(/datum/report_field/signature, "Recipient of Visitation Pass Signature")
	add_field(/datum/report_field/options/yes_no, "Approved")
	temp_field.set_access(access_edit = access_heads)

//D the Snek's magical report code, will likely never be used, but hey, I did a thing
/datum/computer_file/report/recipient/shipping_receipt
	form_name = "LSC-LSR-01"
	title = "Lonestar Shipping Receipt"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/shipping_receipt/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "Lonestar Shipping Receipt")
	add_field(/datum/report_field/date, "Date")
	add_field(/datum/report_field/time, "Time")
	add_field(/datum/report_field/simple_text, "You were served by:")
	add_field(/datum/report_field/pencode_text, "You bought the following items:")
	add_field(/datum/report_field/simple_text, "Your Total:")
	add_field(/datum/report_field/signature, "Signature")

/datum/computer_file/report/recipient/shipping_invoice
	form_name = "LSC-LSI-02"
	title = "Lonestar Shipping Invoice"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/shipping_invoice/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "Lonestar Shipping Invoice")
	add_field(/datum/report_field/simple_text, "Employee:")
	add_field(/datum/report_field/simple_text, "Original Price of Item/Order:")
	add_field(/datum/report_field/simple_text, "Item/Order sold:")
	add_field(/datum/report_field/simple_text, "80% of the above is:")
	add_field(/datum/report_field/simple_text, "The seller is entilted to a maximum amount of:")
	add_field(/datum/report_field/simple_text, "The seller has taken:")
	add_field(/datum/report_field/instruction, "The seller is entitled to a maximum of 20% of the profits made. Going over is a breach of contract and will result in your demotion. The receipt of sale is required to be attached to this paperwork for it to be considered valid.")

/datum/computer_file/report/recipient/mining_report
	form_name = "LSC-LMR-03"
	title = "Lonestar Mining Report"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/mining_report/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "Mining Report")
	add_field(/datum/report_field/simple_text, "Mined by:")
	add_field(/datum/report_field/pencode_text, "Detailed amount of Materials after processing:")
	add_field(/datum/report_field/simple_text, "Total Shipping Profits of All Materials (Standard Value):")
	add_field(/datum/report_field/simple_text, "Were all items sold via the Lonestar Cargo Shuttle?:")
	add_field(/datum/report_field/pencode_text, "What materials were sold to other departments?:")
	add_field(/datum/report_field/simple_text, "Total amount of profit:")
	add_field(/datum/report_field/simple_text, "The miner is entitled to:")
	add_field(/datum/report_field/simple_text, "Was a prospector or guard present during mining operation?:")
	add_field(/datum/report_field/simple_text, "The prospector/guard is entilted to:")
	add_field(/datum/report_field/signature, "Buyers Signature:")
	add_field(/datum/report_field/signature, "Prospectors/Guard Signature:")
	add_field(/datum/report_field/date, "Date")
	add_field(/datum/report_field/time, "Time")
	add_field(/datum/report_field/instruction, "Employees are entitled to a maximum of 10% of the profits made. Going over is a breach of contract and will result in your demotion.")

/datum/computer_file/report/recipient/item_request
	form_name = "LSC-IRF-04"
	title = "Item Request Form"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/item_request/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "Item Request Form")
	add_field(/datum/report_field/simple_text, "Applicant Name:")
	add_field(/datum/report_field/simple_text, "Requested Item:")
	add_field(/datum/report_field/simple_text, "Reason for Request:")
	add_field(/datum/report_field/signature, "Applicant Signature:")
	add_field(/datum/report_field/signature, "Signature of Relevant Head Of Staff:")
	add_field(/datum/report_field/signature, "Signature of Premier:")
	add_field(/datum/report_field/date, "Date")
	add_field(/datum/report_field/time, "Time")

/datum/computer_file/report/recipient/item_application
	form_name = "LSC-IAP-05"
	title = "Item Application"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/item_application/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "Item Application")
	add_field(/datum/report_field/simple_text, "Applicant Name:")
	add_field(/datum/report_field/simple_text, "Requested Item:")
	add_field(/datum/report_field/signature, "Applicant Signature:")
	add_field(/datum/report_field/signature, "Signature of Applicant Head Of Staff:")
	add_field(/datum/report_field/signature, "Signature of Relevant Head Of Staff:")
	add_field(/datum/report_field/signature, "Signature of Premier:")
	add_field(/datum/report_field/instruction, "By singing this form as applicant you are agreeing that you understand the faction in question does not provide any warranty whatsoever that the item will be free of defects or faults. In no respect shall the faction in questionincur any liability for any damages, injury or loss, including, but not limited to, direct, indirect, special, or consequential damages arising out of, resulting from, or any way connected to the use of the item. The item if provided, remains the providing factions property and is in no way your own.")
	add_field(/datum/report_field/instruction, "Stamps of Command Staff placed below this line.")

/datum/computer_file/report/recipient/requisition
	form_name = "LSC-RQF-06"
	title = "Requisition Form"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/requisition/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "Requisition Approval Sheet")
	add_field(/datum/report_field/instruction, "The following is to be filled out in order to facilitate the deliver process of requisitions from cargo. Only appoved requisitions are to be listed on this form. All requisitions listed on this form are to be attached to this form. Requisitions listed may be from a single individual or faction.")
	add_field(/datum/report_field/instruction, "Requester Information")
	add_field(/datum/report_field/simple_text, "Name:")
	add_field(/datum/report_field/simple_text, "Faction:")
	add_field(/datum/report_field/pencode_text, "Ordered Items:")
	add_field(/datum/report_field/simple_text, "Total Cost:")
	add_field(/datum/report_field/simple_text, "Location of Delivery:")
	add_field(/datum/report_field/date, "Date")
	add_field(/datum/report_field/instruction, "NOTE: Items may be delievered or picked up at cargo.")
	add_field(/datum/report_field/signature, "Surface Operations Manager/Cargo Technician's Signature:")
	add_field(/datum/report_field/signature, "Requesters Signature:")
	add_field(/datum/report_field/instruction, "NOTE: The below area is to be stamped by a Cargo Technician or the SOM when all items on this list are ordered.")

/datum/computer_file/report/recipient/confirmation_form
	form_name = "LSC-CFF-07"
	title = "Confirmation Form"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/confirmation_form/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "Confirmation Form")
	add_field(/datum/report_field/simple_text, "Shipment Destination:")
	add_field(/datum/report_field/instruction, "Ores/Material in this Shipment:")
	add_field(/datum/report_field/simple_text, "Iron Ore:")
	add_field(/datum/report_field/simple_text, "Metal:")
	add_field(/datum/report_field/simple_text, "Plasteel:")
	add_field(/datum/report_field/simple_text, "Sand:")
	add_field(/datum/report_field/simple_text, "Glass:")
	add_field(/datum/report_field/simple_text, "Reinforced Glass:")
	add_field(/datum/report_field/simple_text, "Gold Ore:")
	add_field(/datum/report_field/simple_text, "Gold Bars:")
	add_field(/datum/report_field/simple_text, "Silver Ore:")
	add_field(/datum/report_field/simple_text, "Silver Bars:")
	add_field(/datum/report_field/simple_text, "Plasma Ore:")
	add_field(/datum/report_field/simple_text, "Solid Plasma:")
	add_field(/datum/report_field/simple_text, "Uranium Ore:")
	add_field(/datum/report_field/simple_text, "Uranium:")
	add_field(/datum/report_field/simple_text, "Diamond Ore:")
	add_field(/datum/report_field/simple_text, "Diamonds:")
	add_field(/datum/report_field/pencode_text, "Miscellaneous:")
	add_field(/datum/report_field/signature, "Supply Personell Signature:")
	add_field(/datum/report_field/signature, "Recipient Signature:")
	add_field(/datum/report_field/instruction, "By signing this form as recipient, you agree that all materials listed were present at the time of signing. You also agree that after signing, you and your department take full responsibility for the materials delivered.")

/datum/computer_file/report/recipient/council_communication
	form_name = "HOD-QET-01"
	title = "High Council Communication Form"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/council_communication/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "NADEZHDA QUANTUM ENTANGLEMENT NETWORK")
	add_field(/datum/report_field/instruction, "FORM HOD-QET-01:")
	add_field(/datum/report_field/instruction, "GENERAL TRANSMISSION")
	add_field(/datum/report_field/instruction, "")
	add_field(/datum/report_field/instruction, "QUANTUM ENTANGLEMENT TRANSMISSION")
	add_field(/datum/report_field/instruction, "")
	add_field(/datum/report_field/date, "Date")
	add_field(/datum/report_field/time, "Time")
	add_field(/datum/report_field/instruction, "")
	add_field(/datum/report_field/simple_text, "Origin:")
	add_field(/datum/report_field/simple_text, "Department:")
	add_field(/datum/report_field/simple_text, "Destination:")
	add_field(/datum/report_field/simple_text, "Sender's Name:")
	add_field(/datum/report_field/simple_text, "Sender's Rank:")
	add_field(/datum/report_field/instruction, "")
	add_field(/datum/report_field/simple_text, "Priority:")
	add_field(/datum/report_field/simple_text, "Subject:")
	add_field(/datum/report_field/instruction, "")
	add_field(/datum/report_field/pencode_text, "Message Body:")
	add_field(/datum/report_field/signature, "Sender's Signature:")
	add_field(/datum/report_field/signature, "Signatures of additional authorities:")
	add_field(/datum/report_field/instruction, "Stamps of applicable authorities below this line.")

/datum/computer_file/report/recipient/emergency_transmission
	form_name = "HOD-EMT-02"
	title = "Emergency Transmission"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/emergency_transmission/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "EMERGENCY TRANSMISSION")
	add_field(/datum/report_field/instruction, "")
	add_field(/datum/report_field/simple_text, "Sender:")
	add_field(/datum/report_field/simple_text, "Position:")
	add_field(/datum/report_field/pencode_text, "Message:")
	add_field(/datum/report_field/signature, "Signed:")

/datum/computer_file/report/recipient/awol
	form_name = "HOD-EAM-03"
	title = "Employee AWOL/MIA"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/awol/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "CD-14 Form: Colonist missing while on duty")
	add_field(/datum/report_field/simple_text, "Name/Aliases:")
	add_field(/datum/report_field/simple_text, "Assignment:")
	add_field(/datum/report_field/simple_text, "Reason for Colonist missing from duty:")
	add_field(/datum/report_field/simple_text, "What can be done to rectify this issue:")
	add_field(/datum/report_field/simple_text, "Is executive action required:")
	add_field(/datum/report_field/simple_text, "Head of Department:")
	add_field(/datum/report_field/instruction, "Colonist delinquent of duty are governed by the  protocol 348-60-9, and the relevant faction withholds the right to perform any and all acts of reasonable punishment and repossession upon said employee under protocol 348-60-2. Colonist are at minimum docked of pay till such time as recommencement as governed by contract 24-5. Any and all losses caused by the employee colonist loss and excessive loss is defined within protocol 23-13B. The relevant faction withholds the right to deny, permit, override all concordant or orders of command staff from other factions except those given by a lawful order or council vote.")

/datum/computer_file/report/recipient/reassignment
	form_name = "HOD-RAO-04"
	title = "Reassignment Order"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/reassignment/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "Reassignment Order")
	add_field(/datum/report_field/simple_text, "Employee:")
	add_field(/datum/report_field/simple_text, "Original Position:")
	add_field(/datum/report_field/simple_text, "New Position:")
	add_field(/datum/report_field/simple_text, "Reason for Assignment:")
	add_field(/datum/report_field/signature, "Signature of relevant Head of Staff:")
	add_field(/datum/report_field/signature, "Signature of Premier:")
	add_field(/datum/report_field/date, "Date")
	add_field(/datum/report_field/time, "Time")

/datum/computer_file/report/recipient/access_change
	form_name = "HOD-ACO-05"
	title = "Access Change Order"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/access_change/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "Access Change Order")
	add_field(/datum/report_field/simple_text, "Employee:")
	add_field(/datum/report_field/simple_text, "Access Added/Removed:")
	add_field(/datum/report_field/simple_text, "Reasoning for Addition/Removal:")
	add_field(/datum/report_field/signature, "Signature of relevant Head of Staff:")
	add_field(/datum/report_field/signature, "Signature of Premier:")
	add_field(/datum/report_field/date, "Date")
	add_field(/datum/report_field/time, "Time")

/datum/computer_file/report/recipient/dismissal
	form_name = "HOD-DMO-06"
	title = "Dismissal Order"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/dismissal/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "Access Change Order")
	add_field(/datum/report_field/simple_text, "Employee:")
	add_field(/datum/report_field/simple_text, "Original Position:")
	add_field(/datum/report_field/simple_text, "Reason for Dismissal:")
	add_field(/datum/report_field/signature, "Signature of relevant Head of Staff:")
	add_field(/datum/report_field/signature, "Signature of Premier:")
	add_field(/datum/report_field/date, "Date")
	add_field(/datum/report_field/time, "Time")

/datum/computer_file/report/recipient/staff_assessment
	form_name = "HOD-SAP-07"
	title = "Staff Assessment Paperwork"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/staff_assessment/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "Shift Departmental Staff Assessment")
	add_field(/datum/report_field/simple_text, "Department:")
	add_field(/datum/report_field/simple_text, "Employee Name:")
	add_field(/datum/report_field/simple_text, "Current Job:")
	add_field(/datum/report_field/simple_text, "Current Duties:")
	add_field(/datum/report_field/simple_text, "Does the staff member wear the correct uniform or protective gear:")
	add_field(/datum/report_field/simple_text, "Rate the staff members performance, 1-10:")
	add_field(/datum/report_field/simple_text, "Does the staff member require further training:")
	add_field(/datum/report_field/simple_text, "Head of Department:")
	add_field(/datum/report_field/instruction, "Contained review materials are not representative of the views of the relevant faction. Said faction is not liable for any bias or offensive language contained within said review materials. The relevant faction in question withholds the right to action upon any information contained within this assessment.")

/datum/computer_file/report/recipient/access_form
	form_name = "PRM-AAF-01"
	title = "Additional Access Form"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/access_form/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "Additional Access Form")
	add_field(/datum/report_field/simple_text, "Name:")
	add_field(/datum/report_field/simple_text, "Rank:")
	add_field(/datum/report_field/instruction, "Nadezhda Colony")
	add_field(/datum/report_field/simple_text, "Requested Access:")
	add_field(/datum/report_field/simple_text, "Reason:")
	add_field(/datum/report_field/signature, "Signature of relevant Head of Staff:")
	add_field(/datum/report_field/signature, "Signature of Premier:")

/datum/computer_file/report/recipient/transfer_form
	form_name = "PRM-TRF-02"
	title = "Transfer Form"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/transfer_form/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "Additional Access Form")
	add_field(/datum/report_field/simple_text, "Name:")
	add_field(/datum/report_field/simple_text, "Rank:")
	add_field(/datum/report_field/instruction, "Nadezhda Colony")
	add_field(/datum/report_field/simple_text, "From Department:")
	add_field(/datum/report_field/simple_text, "To Department:")
	add_field(/datum/report_field/simple_text, "Requested Position:")
	add_field(/datum/report_field/simple_text, "Reason:")
	add_field(/datum/report_field/signature, "Signature:")
	add_field(/datum/report_field/signature, "Signature of Transferring Head of Staff:")
	add_field(/datum/report_field/signature, "Signature of Recieving Head of Staff:")
	add_field(/datum/report_field/signature, "Signature of Premier:")
