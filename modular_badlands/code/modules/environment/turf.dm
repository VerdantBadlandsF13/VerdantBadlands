//////////////
// DEFAULTS //
//////////////
/turf/open/indestructible/ground/bl
	icon = 'modular_badlands/code/modules/unsorted/icons/bl_turf.dmi'

/turf/open/indestructible/ground/outside/bl
	icon = 'modular_badlands/code/modules/unsorted/icons/bl_turf.dmi'

//////////////
// GRASSSTF //
//////////////

// Someone else can set up our unique turfs I can't be assed. >:(

/turf/open/indestructible/ground/outside/bl/proc/plantGrass(Plantforce = FALSE)
	var/Weight = 0
	var/randPlant = null

	//spontaneously spawn grass
	if(Plantforce || prob(GRASS_SPONTANEOUS))
		randPlant = pickweight(VERMONT_PLANT_SPAWN_LIST) //Create a new grass object at this location, and assign var
		setTurfPlant(new randPlant(src))
		return TRUE

	//loop through neighbouring desert turfs, if they have grass, then increase weight
	for(var/turf/open/indestructible/ground/outside/bl/T in RANGE_TURFS(3, src))
		if(T.turfPlant)
			Weight += GRASS_WEIGHT

	//use weight to try to spawn grass
	if(prob(Weight))

		//If surrounded on 5+ sides, pick from lush
		if(Weight == (5 * GRASS_WEIGHT))
			randPlant = pickweight(VERMONT_PLANT_SPAWN_LIST)
		else
			randPlant = pickweight(DESOLATE_PLANT_SPAWN_LIST)
		setTurfPlant(new randPlant(src))
		return TRUE
