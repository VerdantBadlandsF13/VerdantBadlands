// Global var for interactions in lewd code.
// Below this global var should be easily understood.
GLOBAL_VAR(interactions)
// Rigged amalgam of code from various places.
// Edits by me to fit our purposes better. - Carl
#define GFLUID_ETHANOL_POWER_LIMIT 5
#define GFLUID_RARITY_LIMIT REAGENT_VALUE_RARE
#define GFLUID_RARITY_LIMIT REAGENT_VALUE_RARE
GLOBAL_LIST(genital_fluids_list)
GLOBAL_LIST(genital_fluids_paths)

/*
GLOB.genital_fluids_list = list(
	/datum/reagent/blood,
	/datum/reagent/breast_enlarger,
	/datum/reagent/BEsmaller,
	/datum/reagent/penis_enlarger,
	/datum/reagent/PEsmaller,
	/datum/reagent/penis_enlarger,
	/datum/reagent/nutracid,
	/datum/reagent/consumable/semen,
	/datum/reagent/consumable/femcum)
*/

/datum/preferences/New(client/C)
	if(!GLOB.genital_fluids_list)
		build_genital_fluids_list()
	. = ..()

/proc/build_genital_fluids_list()
	// Define disallowed reagents
	var/list/blacklisted = list(
		// General drinks. Fallout.
		// Nuka-Cola
		/datum/reagent/consumable/nuka_cola,
		/datum/reagent/consumable/nukacherry,
		/datum/reagent/consumable/nukagrape,
		/datum/reagent/consumable/nukaorange,
		/datum/reagent/consumable/nukaquartz,
		/datum/reagent/consumable/nukaice,
		/datum/reagent/consumable/nukawild,
		/datum/reagent/consumable/nukanew,
		/datum/reagent/consumable/nukaberry,
		/datum/reagent/consumable/nukacooler,
		/datum/reagent/consumable/nukafree,
		/datum/reagent/consumable/nukafrutti,
		/datum/reagent/consumable/nukafloat,
		// Sunset
		/datum/reagent/consumable/sunset,
		/datum/reagent/consumable/sunsetfloat,
		// Vim
		/datum/reagent/consumable/vim,
		/datum/reagent/consumable/vimquartz,
		/datum/reagent/consumable/vimrefresh,
		/datum/reagent/consumable/vimice,
		// Fruit
		/datum/reagent/consumable/mutjuice,
		/datum/reagent/consumable/yuccajuice,
		/datum/reagent/consumable/tato_juice,
		// Misc
		/datum/reagent/consumable/bawlsshake,
		/datum/reagent/consumable/jakeshake,
		/datum/reagent/consumable/sweetwaterfloat,
		/datum/reagent/consumable/sunsetter,
		/datum/reagent/consumable/yuccashake,
		/datum/reagent/consumable/bawls,
		// General drinks. Standard.
		// Tea
		/datum/reagent/consumable/tea,
		// Juice
		/datum/reagent/consumable/orangejuice,
		/datum/reagent/consumable/tomatojuice,
		/datum/reagent/consumable/limejuice,
		/datum/reagent/consumable/carrotjuice,
		/datum/reagent/consumable/berryjuice,
		/datum/reagent/consumable/applejuice,
		/datum/reagent/consumable/poisonberryjuice,
		/datum/reagent/consumable/watermelonjuice,
		/datum/reagent/consumable/lemonjuice,
		/datum/reagent/consumable/banana,
		/datum/reagent/consumable/strawberryjuice,
		/datum/reagent/consumable/tato_juice,
		/datum/reagent/consumable/grapejuice,
		// Milk
		/datum/reagent/consumable/soymilk,
		/datum/reagent/consumable/coconutmilk,
		// Pudding
		/datum/reagent/consumable/chocolatepudding,
		/datum/reagent/consumable/vanillapudding,
		// Misc
		/datum/reagent/consumable/laughter,
		/datum/reagent/consumable/superlaughter,
		/datum/reagent/consumable/coffee,
		/datum/reagent/consumable/lemonade,
		/datum/reagent/consumable/icecoffee,
		/datum/reagent/consumable/icetea,
		/datum/reagent/consumable/space_cola,
		/datum/reagent/consumable/spacemountainwind,
		/datum/reagent/consumable/dr_gibb,
		/datum/reagent/consumable/space_up,
		/datum/reagent/consumable/lemon_lime,
		/datum/reagent/consumable/pwr_game,
		/datum/reagent/consumable/shamblers,
		/datum/reagent/consumable/buzz_fuzz,
		/datum/reagent/consumable/grey_bull,
		/datum/reagent/consumable/sodawater,
		/datum/reagent/consumable/tonic,
		/datum/reagent/consumable/soy_latte,
		/datum/reagent/consumable/cafe_latte,
		/datum/reagent/consumable/doctor_delight,
		/datum/reagent/consumable/cherryshake,
		/datum/reagent/consumable/bluecherryshake,
		/datum/reagent/consumable/pumpkin_latte,
		/datum/reagent/consumable/gibbfloats,
		/datum/reagent/consumable/pumpkinjuice,
		/datum/reagent/consumable/blumpkinjuice,
		/datum/reagent/consumable/triple_citrus,
		/datum/reagent/consumable/grape_soda,
		/datum/reagent/consumable/menthol,
		/datum/reagent/consumable/grenadine,
		/datum/reagent/consumable/parsnipjuice,
		/datum/reagent/consumable/peachjuice,
		/datum/reagent/consumable/pineapplejuice,
		/datum/reagent/consumable/cream_soda,
		/datum/reagent/consumable/sol_dry,
		/datum/reagent/consumable/pinktea,
		/datum/reagent/consumable/catnip_tea,
		/datum/reagent/consumable/monkey_energy,
		/datum/reagent/consumable/bungojuice,
		/datum/reagent/consumable/aloejuice,
		/datum/reagent/consumable/banana_peel,
		/datum/reagent/consumable/baked_banana_peel,
		/datum/reagent/consumable/virus_food,
		/datum/reagent/consumable/soysauce,
		/datum/reagent/consumable/ketchup,
		/datum/reagent/consumable/mustard,
		/datum/reagent/consumable/blackpepper,
		/datum/reagent/consumable/coco,
		/datum/reagent/consumable/hot_coco,
		/datum/reagent/consumable/garlic,
		/datum/reagent/consumable/sprinkles,
		/datum/reagent/consumable/peanut_butter,
		/datum/reagent/consumable/cornoil,
		/datum/reagent/consumable/dry_ramen,
		/datum/reagent/consumable/hot_ramen,
		/datum/reagent/consumable/hell_ramen,
		/datum/reagent/consumable/flour,
		/datum/reagent/consumable/cherryjelly,
		/datum/reagent/consumable/bluecherryjelly,
		/datum/reagent/consumable/rice,
		/datum/reagent/consumable/vanilla,
		/datum/reagent/consumable/eggyolk,
		/datum/reagent/consumable/corn_starch,
		/datum/reagent/consumable/corn_syrup,
		/datum/reagent/consumable/mayonnaise,
		/datum/reagent/consumable/caramel,
		/datum/reagent/consumable/char,
		/datum/reagent/consumable/bbqsauce,
		/datum/reagent/consumable/laughsyrup,
		// General booze.
		/datum/reagent/consumable/ethanol,
		// F13 booze, with limits below the standard.
		/datum/reagent/consumable/ethanol/yellowpulque,
		/datum/reagent/consumable/ethanol/oldpossum,
		// So you can't stack and produce infinite food.
		/datum/reagent/consumable/enzyme,
		// Nutriment itself.
		/datum/reagent/consumable/nutriment,
		// General foods.
		/datum/reagent/consumable/cooking_oil,
		// Utility.
		/datum/reagent/consumable/capsaicin,
		/datum/reagent/consumable/frostoil,
		/datum/reagent/consumable/condensedcapsaicin,
		/datum/reagent/consumable/sodiumchloride,
		/datum/reagent/consumable/brocjuice,
		/datum/reagent/consumable/xanderjuice,
		/datum/reagent/consumable/agavejuice,
		/datum/reagent/consumable/ferajuice,
		/datum/reagent/consumable/daturajuice,
		/datum/reagent/consumable/coyotejuice,
		/datum/reagent/consumable/cavefungusjuice,
		/datum/reagent/consumable/tato_juice,
		/datum/reagent/consumable/buffalojuice,
		/datum/reagent/consumable/tinlux,
		// Health Chems.
		/datum/reagent/consumable/vitfro,
		/datum/reagent/consumable/honey,
		/datum/reagent/blood/tomato,
		/datum/reagent/water/purified,
		/datum/reagent/water/holywater,
		// Lethal or Dangerous.
		/datum/reagent/consumable/tearjuice,
		/datum/reagent/consumable/entpoly,
		/datum/reagent/consumable/liquidelectricity,
		// Cringe consumables.
	)

	// Define base list
	var/list/consumable_list = subtypesof(/datum/reagent/consumable)

	// Define additional allowed reagents
	var/list/whitelist_list = list(
		// Just water
		/datum/reagent/water,
		// Not quite a liquid.
		/datum/reagent/consumable/sugar,
		// ERP chems.
		/datum/reagent/drug/aphrodisiac,
		/datum/reagent/breast_enlarger,
		/datum/reagent/BEsmaller,
		/datum/reagent/penis_enlarger,
		/datum/reagent/PEsmaller,
		/datum/reagent/penis_enlarger,
		// Literal blood.
		/datum/reagent/blood,
		// :DDDDDDD
		/datum/reagent/serotrotium,
		// Brain hurty juice.
		/datum/reagent/cryptobiolin,
	)

	// Add whitelisted entries to main list
	LAZYADD(consumable_list, whitelist_list)

	// Define final list
	var/list/reagent_list

	// Define final type-based list
	var/list/reagent_list_paths

	for(var/reagent in consumable_list)
		// Define reagent
		var/datum/reagent/instance = find_reagent_object_from_type(reagent)

		// Check if reagent exists
		if(!instance)
			continue

		// Check if reagent is non-liquid
		if(instance.reagent_state != LIQUID)
			// Ignore reagent
			continue

		// Check if reagent is blacklisted
		if(reagent in blacklisted)
			// Ignore reagent
			continue

		// Check if reagent is manually whitelisted
		if(reagent in whitelist_list)
			// Add immediately
			LAZYADD(reagent_list, instance)
			LAZYADD(reagent_list_paths, reagent)

			// Skip further processing
			continue

		// Check if reagent exceeds rarity limit
		if(instance.value >= GFLUID_RARITY_LIMIT)
			// Ignore reagent
			continue

		// Check if reagent is an ethanol sub-type
		if(istype(instance, /datum/reagent/consumable/ethanol))
			// Define ethanol reagent
			var/datum/reagent/consumable/ethanol/drink = instance

			// Check if booze power exceeds the defined limit
			if(drink.boozepwr > GFLUID_ETHANOL_POWER_LIMIT)
				// Ignore reagent
				continue

		// Add reagent to final list
		LAZYADD(reagent_list, instance)

		// Add reagent to type list
		LAZYADD(reagent_list_paths, reagent)

	// Define readable GLOB
	GLOB.genital_fluids_list = reagent_list

	// Define type-path GLOB
	GLOB.genital_fluids_paths = reagent_list_paths
