/datum/weather/rad_storm
	name = "radiation storm"
	desc = "A cloud of radioactive debris sweeps through the area, dealing radiation damage to those who are unprotected and leaving behind debris."
	probability = 12

	telegraph_message = "<span class='userdanger'>The horizon darkens, a cloud of radioactive dust approaching fast.</span>"
	telegraph_overlay = "light_ash"
	telegraph_duration = 250

	weather_message = "<span class='userdanger'><i>The land is pelted by radioactive debris and waves of heat! Find shelter!</i></span>"
	weather_overlay = "ash_storm"
	weather_duration_lower = 750
	weather_duration_upper = 1800

	end_overlay = "light_ash"
	end_duration = 100
	end_message = "<span class='userdanger'>The worst of the storm passes, an open sky once again visible.</span>"

	area_types = list(/area/f13/wasteland)
	target_trait = ZTRAIT_SURFACE
	carbon_exclusive = TRUE

	immunity_type = "rad"

	var/radiation_intensity = 100
	var/list/weak_sounds = list()
	var/list/strong_sounds = list()

/datum/weather/rad_storm/start()
	GLOB.rad_storm_sounds -= weak_sounds
	GLOB.rad_storm_sounds += strong_sounds
	return ..()

/datum/weather/rad_storm/wind_down()
	GLOB.rad_storm_sounds -= strong_sounds
	GLOB.rad_storm_sounds += weak_sounds
	return ..()

/datum/weather/rad_storm/end()
	GLOB.rad_storm_sounds -= weak_sounds
// Nightmare spawns the radioactive debris around the map. I haven't redone this yet, so don't use it. - Carl
//	nightmare()
	return ..()

/datum/weather/rad_storm/telegraph()
	var/list/eligible_areas = list()
	for (var/z in impacted_z_levels)
		eligible_areas += SSmapping.areas_in_z["[z]"]
	for(var/area/place in eligible_areas)
		if(place.outdoors)
			weak_sounds[place] = /datum/looping_sound/weak_outside_radstorm
			strong_sounds[place] = /datum/looping_sound/active_outside_radstorm
		else
			weak_sounds[place] = /datum/looping_sound/weak_inside_radstorm
			strong_sounds[place] = /datum/looping_sound/active_inside_radstorm
		CHECK_TICK

	//We modify this list instead of setting it to weak/stron sounds in order to preserve things that hold a reference to it
	//It's essentially a playlist for a bunch of components that chose what sound to loop based on the area a player is in
	GLOB.rad_storm_sounds += weak_sounds
	return ..()

/datum/weather/rad_storm/weather_act(mob/living/L)
	var/resist = L.getarmor(null, "rad")
	var/ratio = 1 - (min(resist, 100) / 100)
	L.rad_act(radiation_intensity * ratio)

/datum/weather/rad_storm/proc/nightmare()
	for(var/X in GLOB.landmarks_list)
		if(istype(X, /obj/effect/landmark/nuclear_waste_spawner))
			var/obj/effect/landmark/nuclear_waste_spawner/WS = X
			WS.fire()
