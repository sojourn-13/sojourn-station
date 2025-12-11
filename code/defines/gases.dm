/decl/xgm_gas/oxygen
	id = GAS_OXYGEN
	name = "Oxygen"
	specific_heat = 20	// J/(mol*K)
	molar_mass = 0.032	// kg/mol
	flags = XGM_GAS_OXIDIZER | XGM_GAS_FUSION_FUEL
	breathed_product = "oxygen"

/decl/xgm_gas/nitrogen
	id = GAS_NITROGEN
	name = "Nitrogen"
	specific_heat = 20	// J/(mol*K)
	molar_mass = 0.028	// kg/mol

/decl/xgm_gas/carbon_dioxide
	id = GAS_CO2
	name = "Carbon Dioxide"
	specific_heat = 30	// J/(mol*K)
	molar_mass = 0.044	// kg/mol

/decl/xgm_gas/methyl_bromide
	id = GAS_METHYL_BROMIDE
	name = "Methyl Bromide"
	specific_heat = 42.59 // J/(mol*K)
	molar_mass = 0.095	  // kg/mol
	breathed_product = "methyl_bromide"

/decl/xgm_gas/plasma
	id = GAS_PLASMA
	name = "Plasma"

	//Note that this has a significant impact on TTV yield.
	//Because it is so high, any leftover plasma soaks up a lot of heat and drops the yield pressure.
	specific_heat = 200	// J/(mol*K)

	//Hypothetical group 14 (same as carbon), period 8 element.
	//Using multiplicity rule, it's atomic number is 162
	//and following a N/Z ratio of 1.5, the molar mass of a monatomic gas is:
	molar_mass = 0.405	// kg/mol

	tile_overlay = "plasma-orange"
	overlay_limit = 0.7
	flags = XGM_GAS_FUEL | XGM_GAS_CONTAMINANT | XGM_GAS_FUSION_FUEL
	breathed_product = /datum/reagent/toxin/plasma

/decl/xgm_gas/sleeping_agent
	id = GAS_N2O
	name = "Nitrous Oxide"
	specific_heat = 40	// J/(mol*K)
	molar_mass = 0.044	// kg/mol. N2O
	flags = XGM_GAS_OXIDIZER //N2O is a powerful oxidizer
	breathed_product = "nitrous_oxide"

/decl/xgm_gas/methane
	id = GAS_METHANE
	name = "Methane"
	specific_heat = 30	// J/(mol*K)
	molar_mass = 0.016	// kg/mol
	flags = XGM_GAS_FUEL

/decl/xgm_gas/alium
	id = GAS_ALIEN
	name = "Aliether"

/decl/xgm_gas/alium/New()
	var/num = rand(100,999)
	name = "Compound #[num]"
	specific_heat = rand(1, 400)	// J/(mol*K)
	molar_mass = rand(20,800)/1000	// kg/mol
	if(prob(40))
		flags |= XGM_GAS_FUEL
	else if(prob(40)) //it's prooobably a bad idea for gas being oxidizer to itself.
		flags |= XGM_GAS_OXIDIZER
	if(prob(40))
		flags |= XGM_GAS_CONTAMINANT
	if(prob(40))
		flags |= XGM_GAS_FUSION_FUEL

	if(prob(50))
		tile_color = RANDOM_RGB
		overlay_limit = 0.5

/decl/xgm_gas/hydrogen
	id = GAS_HYDROGEN
	name = "Hydrogen"
	specific_heat = 100	// J/(mol*K)
	molar_mass = 0.002	// kg/mol
	flags = XGM_GAS_FUEL|XGM_GAS_FUSION_FUEL
	burn_product = GAS_STEAM

/decl/xgm_gas/hydrogen/deuterium
	id = GAS_DEUTERIUM
	name = "Deuterium"
	specific_heat = 80
	molar_mass = 0.004

/decl/xgm_gas/hydrogen/tritium
	id = GAS_TRITIUM
	name = "Tritium"
	molar_mass = 0.006
	specific_heat = 60

/decl/xgm_gas/helium
	id = GAS_HELIUM
	name = "Helium"
	specific_heat = 80	// J/(mol*K)
	molar_mass = 0.004	// kg/mol
	flags = XGM_GAS_FUSION_FUEL
	breathed_product = "helium"

/decl/xgm_gas/argon
	id = GAS_ARGON
	name = "Argon"
	specific_heat = 10	// J/(mol*K)
	molar_mass = 0.018	// kg/mol

// If narcosis is ever simulated, krypton has a narcotic potency seven times greater than regular airmix.
/decl/xgm_gas/krypton
	id = GAS_KRYPTON
	name = "Krypton"
	specific_heat = 5	// J/(mol*K)
	molar_mass = 0.036	// kg/mol

/decl/xgm_gas/neon
	id = GAS_NEON
	name = "Neon"
	specific_heat = 20	// J/(mol*K)
	molar_mass = 0.01	// kg/mol

/decl/xgm_gas/xenon
	id = GAS_XENON
	name = "Xenon"
	specific_heat = 3	// J/(mol*K)
	molar_mass = 0.054	// kg/mol
	breathed_product = "xenon"

/decl/xgm_gas/nitrodioxide
	id = GAS_NO2
	name = "Nitrogen Dioxide"
	tile_color = "#ca6409"
	specific_heat = 37	// J/(mol*K)
	molar_mass = 0.054	// kg/mol
	flags = XGM_GAS_OXIDIZER
	breathed_product = "toxin"

/decl/xgm_gas/nitricoxide
	id = GAS_NO
	name = "Nitric Oxide"

	specific_heat = 10	// J/(mol*K)
	molar_mass = 0.030	// kg/mol
	flags = XGM_GAS_OXIDIZER

/decl/xgm_gas/chlorine
	id = GAS_CHLORINE
	name = "Chlorine"
	tile_color = "#c5f72d"
	overlay_limit = 0.5
	specific_heat = 5	// J/(mol*K)
	molar_mass = 0.017	// kg/mol
	flags = XGM_GAS_CONTAMINANT
	breathed_product = "chlorine"

/decl/xgm_gas/vapor
	id = GAS_STEAM
	name = "Steam"
	tile_overlay = "generic"
	overlay_limit = 0.5
	specific_heat = 30	// J/(mol*K)
	molar_mass = 0.020	// kg/mol
	breathed_product =     /datum/reagent/water
	condensation_product = /datum/reagent/water
	condensation_point =   308.15 // 35C. Dew point is ~20C but this is better for gameplay considerations.

/decl/xgm_gas/sulfurdioxide
	id = GAS_SULFUR
	name = "Sulfur Dioxide"

	specific_heat = 30	// J/(mol*K)
	molar_mass = 0.044	// kg/mol

/decl/xgm_gas/ammonia
	id = GAS_AMMONIA
	name = "Ammonia"

	specific_heat = 20	// J/(mol*K)
	molar_mass = 0.017	// kg/mol
	breathed_product = "ammonia"

/decl/xgm_gas/carbon_monoxide
	id = GAS_CO
	name = "Carbon Monoxide"
	specific_heat = 30	// J/(mol*K)
	molar_mass = 0.028	// kg/mol
	breathed_product = "carbon_monoxide"

/decl/xgm_gas/boron
	id = GAS_BORON
	name = "Boron"
	specific_heat = 11
	molar_mass = 0.011
	flags = XGM_GAS_FUSION_FUEL
	breathed_product = "boron"
