/// Initializes TGS and loads the returned revising info into GLOB.revdata
/world/proc/InitTgs()
	TgsNew(new /datum/tgs_event_handler/impl, TGS_SECURITY_TRUSTED)
	GLOB.revdata.load_tgs_info()
