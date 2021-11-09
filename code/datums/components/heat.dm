/datum/component/heat
	var/currentHeat = 0
	var/heatThresholdSpecial //set this value to above overheat+heatperfire if you dont want to use it
	var/overheatThreshold = 100
	var/lastFiredTick
	var/heatPerFire
	var/coolPerTick = 1
	var/ventCooldown = 15 //30s
	var/lastVentedTick


/datum/component/heat/Initialize(clickTypeToVent = COMSIG_CLICK_CTRL, parentIsGun, _heatThresholdSpecial, _overheatThreshold, _heatPerFire, _coolPerTick, _ventCooldown)
	if(parentIsGun && istype(parent, /obj/item/gun))
		RegisterSignal(parent, COMSIG_GUN_POST_FIRE, .proc/tickHeat)
	else if(istype(parent, /obj/item))
		RegisterSignal(parent, COMSIG_IATTACK, .proc/tickHeat)
	else
		return COMPONENT_INCOMPATIBLE

	RegisterSignal(parent, clickTypeToVent, .proc/ventHeat)
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
		SEND_SIGNAL(parent, COMSIG_HEAT_SPECIAL)

	if(currentHeat >= overheatThreshold)
		SEND_SIGNAL(parent, COMSIG_HEAT_OVERHEAT)
		ventHeat(TRUE)


/datum/component/heat/proc/ventHeat(var/forced)
	if(!forced && lastVentedTick - world.time < ventCooldown)
		return FALSE //we fail
	currentHeat = 0
	lastVentedTick = world.time
	SEND_SIGNAL(parent, COMSIG_HEAT_VENT)
