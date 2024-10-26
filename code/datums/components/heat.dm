/datum/component/heat
	var/currentHeat = 0
	var/heatThresholdSpecial //set this value to above overheat+heatperfire if you dont want to use it
	var/overheatThreshold = 100
	var/lastFiredTick
	var/heatPerFire
	var/coolPerTick = 0.01 //world.time ticks in ds
	var/ventCooldown = 30 SECONDS
	var/lastVentedTick


/datum/component/heat/Initialize(clickTypeToVent = COMSIG_CLICK_CTRL, parentIsGun, _heatThresholdSpecial, _overheatThreshold, _heatPerFire, _coolPerTick, _ventCooldown)
	if(parentIsGun && istype(parent, /obj/item/gun))
		RegisterSignal(parent, COMSIG_GUN_POST_FIRE, PROC_REF(tickHeat))
	else if(istype(parent, /obj/item) && ! parentIsGun)
		RegisterSignal(parent, COMSIG_IATTACK, PROC_REF(tickHeat))
	else
		return COMPONENT_INCOMPATIBLE

	RegisterSignal(parent, clickTypeToVent, PROC_REF(ventHeat))
	heatThresholdSpecial = _heatThresholdSpecial
	overheatThreshold = _overheatThreshold
	heatPerFire = _heatPerFire
	coolPerTick = _coolPerTick
	ventCooldown = _ventCooldown
	lastFiredTick = world.time
	lastVentedTick = world.time - ventCooldown

/datum/component/heat/proc/tickHeat()
	var/deltaT = world.time - lastFiredTick
	currentHeat = max(0, currentHeat - deltaT*coolPerTick)

	currentHeat += heatPerFire

	if(currentHeat >= heatThresholdSpecial)
		LEGACY_SEND_SIGNAL(parent, COMSIG_HEAT_SPECIAL)

	if(currentHeat >= overheatThreshold)
		LEGACY_SEND_SIGNAL(parent, COMSIG_HEAT_OVERHEAT)
		overheatVent()


/datum/component/heat/proc/ventHeat(var/forced = FALSE)
	if(world.time - lastVentedTick > ventCooldown)
		currentHeat = 0
		LEGACY_SEND_SIGNAL(parent, COMSIG_HEAT_VENT)
		lastVentedTick = world.time
	else
		return FALSE //we fail

/datum/component/heat/proc/overheatVent()
	currentHeat = 0
