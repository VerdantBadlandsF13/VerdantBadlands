/datum/preferences/update_character(current_version, savefile/S)
	. = ..()
	if(current_version < 52)
		if(!features["balls_fluid"] || !(find_reagent_object_from_type(features["balls_fluid"]) in GLOB.genital_fluids_list))
			features["balls_fluid"] = /datum/reagent/consumable/semen
		if(!features["breasts_fluid"] || !(find_reagent_object_from_type(features["breasts_fluid"]) in GLOB.genital_fluids_list))
			features["breasts_fluid"] = /datum/reagent/consumable/milk
