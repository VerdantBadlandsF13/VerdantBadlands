//////////////
// DEFAULTS //
//////////////
/*
/turf/open/indestructible/ground/bl
	icon = 'modular_badlands/code/modules/environment/icons/bl_turf.dmi'
	icon_state = "ERROR"
*/
/turf/open/indestructible/ground/outside/bl
	icon = 'modular_badlands/code/modules/environment/icons/bl_turf.dmi'
	icon_state = "ERROR"

/obj/effect/overlay/bl_turf
	icon = 'modular_badlands/code/modules/environment/icons/bl_turf.dmi'
	icon_state = "ERROR"
	density = FALSE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	plane = FLOOR_PLANE
	layer = ABOVE_OPEN_TURF_LAYER
	anchored = TRUE
	resistance_flags = INDESTRUCTIBLE

//////////////
// GRASSSTF //
//////////////

/turf/open/indestructible/ground/outside/bl/grass_standard/proc/setTurfPlant(newTurfPlant)
	turfPlant = newTurfPlant
	RegisterSignal(turfPlant, COMSIG_PARENT_QDELETING, .proc/clear_turfplant)

/turf/open/indestructible/ground/outside/bl/grass_standard/proc/clear_turfplant()
	UnregisterSignal(turfPlant, COMSIG_PARENT_QDELETING)
	turfPlant = null

/turf/open/indestructible/ground/outside/bl/grass_standard/proc/plantGrass(Plantforce = FALSE)
	var/Weight = 0
	var/randPlant = null

	//spontaneously spawn grass
	if(Plantforce || prob(GRASS_SPONTANEOUS))
		randPlant = pickweight(VERMONT_PLANT_SPAWN_LIST) //Create a new grass object at this location, and assign var
		setTurfPlant(new randPlant(src))
		return TRUE

	//loop through neighbouring desert turfs, if they have grass, then increase weight
	for(var/turf/open/indestructible/ground/outside/bl/grass_standard/T in RANGE_TURFS(3, src))
		if(T.turfPlant)
			Weight += GRASS_WEIGHT

	//use weight to try to spawn grass
	if(prob(Weight))

		//If surrounded on 5+ sides, pick from lush
		if(Weight == (5 * GRASS_WEIGHT))
			randPlant = pickweight(VERMONT_PLANT_SPAWN_LIST)
		else
			randPlant = pickweight(VERMONT_PLANT_SPAWN_LIST)
		setTurfPlant(new randPlant(src))
		return TRUE

// Grass itself.

// STANDARD MEADOW
/turf/open/indestructible/ground/outside/bl/grass_standard/meadow
	name = "meadow"
	desc = "A brighter future, tomorrow."
	icon_state = "grass0"
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_GRASS
	clawfootstep = FOOTSTEP_GRASS

/turf/open/indestructible/ground/outside/bl/grass_standard/meadow/Initialize()
	. = ..()

	if(!((locate(/obj/structure) in src) || (locate(/obj/machinery) in src)))
		plantGrass()
	icon_state = "grass[rand(0,3)]"

/obj/effect/overlay/bl_turf/bl_grass_meadow
	name = "meadow"
	icon_state = "grass_edges"

// DEAD MEADOW
/turf/open/indestructible/ground/outside/bl/grass_standard/dead_meadow
	name = "dying meadow"
	desc = "There's dark days ahead, friend."
	icon_state = "grass_dead0"
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_GRASS
	clawfootstep = FOOTSTEP_GRASS

/turf/open/indestructible/ground/outside/bl/grass_standard/dead_meadow/Initialize()
	. = ..()

	if(!((locate(/obj/structure) in src) || (locate(/obj/machinery) in src)))
		plantGrass()
	icon_state = "grass_dead[rand(0,3)]"

/obj/effect/overlay/bl_turf/bl_dead_meadow
	name = "dying meadow"
	icon_state = "grass_dead_edges"

// SWAMP GRASS
/turf/open/indestructible/ground/outside/bl/grass_standard/swamp_grass
	name = "moist grass"
	desc = "There's dark days ahead, friend."
	icon_state = "grass_swamp0"
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_GRASS
	clawfootstep = FOOTSTEP_GRASS

/turf/open/indestructible/ground/outside/bl/grass_standard/swamp_grass/Initialize()
	. = ..()

	if(!((locate(/obj/structure) in src) || (locate(/obj/machinery) in src)))
		plantGrass()
	icon_state = "grass_swamp[rand(0,3)]"

/obj/effect/overlay/bl_turf/bl_swamp
	name = "moist grass"
	icon_state = "grass_swamp_edges"

// TAIGA GRASS
/turf/open/indestructible/ground/outside/bl/grass_standard/taiga_grass
	name = "mossy soil"
	desc = "There's dark days ahead, friend."
	icon_state = "grass_taiga0"
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_GRASS
	clawfootstep = FOOTSTEP_GRASS

/turf/open/indestructible/ground/outside/bl/grass_standard/taiga_grass/Initialize()
	. = ..()

	if(!((locate(/obj/structure) in src) || (locate(/obj/machinery) in src)))
		plantGrass()
	icon_state = "grass_taiga[rand(0,3)]"

/obj/effect/overlay/bl_turf/bl_taiga
	name = "mossy soil"
	icon_state = "grass_taiga_edges"

// BADLANDS GRASS
/turf/open/indestructible/ground/outside/bl/grass_standard/taiga_grass
	name = "mossy soil"
	desc = "There's dark days ahead, friend."
	icon_state = "grass_badlands0"
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_GRASS
	clawfootstep = FOOTSTEP_GRASS

/turf/open/indestructible/ground/outside/bl/grass_standard/taiga_grass/Initialize()
	. = ..()

	if(!((locate(/obj/structure) in src) || (locate(/obj/machinery) in src)))
		plantGrass()
	icon_state = "grass_badlands[rand(0,3)]"

/obj/effect/overlay/bl_turf/bl_taiga
	name = "mossy soil"
	icon_state = "grass_badlands_edges"

/////////////////
// DIRT STUFF //
////////////////
// DRY DIRT
/turf/open/indestructible/ground/outside/bl/dirt
	name = "dry soil"
	desc = "There's dark days ahead, friend."
	icon_state = "dirt0"
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND

/turf/open/indestructible/ground/outside/bl/dirt/Initialize()
	. = ..()
	icon_state = "dirt[rand(0,3)]"

/obj/effect/overlay/bl_turf/dirt_tracks
	name = "dry soil"
	icon_state = "dirttrack0"

/obj/effect/overlay/bl_turf/dirt_tracks/Initialize()
	. = ..()
	icon_state = "dirttrack[rand(0,3)]"

// GRAVEL
/turf/open/indestructible/ground/outside/bl/gravel
	name = "gravel"
	desc = "There's dark days ahead, friend."
	icon_state = "gravel0"
	slowdown = 1
	footstep = FOOTSTEP_GRAVEL
	barefootstep = FOOTSTEP_GRAVEL
	clawfootstep = FOOTSTEP_GRAVEL

/turf/open/indestructible/ground/outside/bl/gravel/Initialize()
	. = ..()
	icon_state = "gravel[rand(0,3)]"

// MUD
/turf/open/indestructible/ground/outside/bl/mud
	name = "mud"
	desc = "There's dark days ahead, friend."
	icon_state = "mud0"
	slowdown = 3
	footstep = FOOTSTEP_MEAT
	barefootstep = FOOTSTEP_MEAT
	clawfootstep = FOOTSTEP_MEAT

/turf/open/indestructible/ground/outside/bl/mud/Initialize()
	. = ..()
	icon_state = "mud[rand(0,3)]"

// SAND
/turf/open/indestructible/ground/outside/bl/sand
	name = "sand"
	desc = "There's dark days ahead, friend."
	icon_state = "sand0"
	slowdown = 0.5
	footstep = FOOTSTEP_LOOSE_SAND
	barefootstep = FOOTSTEP_LOOSE_SAND
	clawfootstep = FOOTSTEP_LOOSE_SAND

/turf/open/indestructible/ground/outside/bl/sand/Initialize()
	. = ..()
	icon_state = "sand[rand(0,3)]"

/obj/effect/overlay/bl_turf/bl_sand
	name = "sand"
	icon_state = "sand_edges"

// STONE
/turf/open/indestructible/ground/outside/bl/stone
	name = "stone"
	desc = "There's dark days ahead, friend."
	icon_state = "stone0"
	footstep = FOOTSTEP_FLOOR
	barefootstep = FOOTSTEP_FLOOR
	clawfootstep = FOOTSTEP_FLOOR

/turf/open/indestructible/ground/outside/bl/stone/Initialize()
	. = ..()
	icon_state = "stone[rand(0,3)]"

/obj/effect/overlay/bl_turf/rocks
	name = "rocks"
	icon_state = "rocks0"

/obj/effect/overlay/bl_turf/rocks/Initialize()
	. = ..()
	icon_state = "rocks[rand(0,7)]"

// CLAY
/turf/open/indestructible/ground/outside/bl/clay
	name = "clay"
	desc = "There's dark days ahead, friend."
	icon_state = "clay0"
	footstep = FOOTSTEP_FLOOR
	barefootstep = FOOTSTEP_FLOOR
	clawfootstep = FOOTSTEP_FLOOR

/turf/open/indestructible/ground/outside/bl/clay/Initialize()
	. = ..()
	icon_state = "clay[rand(0,4)]"

/obj/effect/overlay/bl_turf/bl_clay
	name = "clay"
	icon_state = "clay_edges"
