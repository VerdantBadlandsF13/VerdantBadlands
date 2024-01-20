// STANDARD MEADOW
/turf/open/indestructible/ground/bl/outside/grass_standard/meadow
	name = "meadow"
	desc = "A brighter future, tomorrow."
	icon_state = "grass"
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_GRASS
	clawfootstep = FOOTSTEP_GRASS

/turf/open/indestructible/ground/bl/outside/grass_standard/meadow/Initialize()
	. = ..()

	if(!((locate(/obj/structure) in src) || (locate(/obj/machinery) in src)))
		plantGrass()
	icon_state = "grass[rand(0,3)]"

/obj/effect/overlay/bl_turf/bl_grass_meadow
	name = "meadow"
	icon_state = "grass_edges"

// DEAD MEADOW
/turf/open/indestructible/ground/bl/outside/grass_standard/dead_meadow
	name = "dying meadow"
	desc = "There's dark days ahead, friend."
	icon_state = "grass_dead"
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_GRASS
	clawfootstep = FOOTSTEP_GRASS

/turf/open/indestructible/ground/bl/outside/grass_standard/dead_meadow/Initialize()
	. = ..()

	if(!((locate(/obj/structure) in src) || (locate(/obj/machinery) in src)))
		plantGrass()
	icon_state = "grass_dead[rand(0,3)]"

/obj/effect/overlay/bl_turf/bl_dead_meadow
	name = "dying meadow"
	icon_state = "grass_dead_edges"

// SWAMP GRASS
/turf/open/indestructible/ground/bl/outside/grass_standard/swamp_grass
	name = "moist grass"
	desc = "There's dark days ahead, friend."
	icon_state = "grass_swamp"
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_GRASS
	clawfootstep = FOOTSTEP_GRASS

/turf/open/indestructible/ground/bl/outside/grass_standard/swamp_grass/Initialize()
	. = ..()

	if(!((locate(/obj/structure) in src) || (locate(/obj/machinery) in src)))
		plantGrass()
	icon_state = "grass_swamp[rand(0,3)]"

/obj/effect/overlay/bl_turf/bl_swamp
	name = "moist grass"
	icon_state = "grass_swamp_edges"

// TAIGA GRASS
/turf/open/indestructible/ground/bl/outside/grass_standard/taiga_grass
	name = "mossy grass"
	desc = "There's dark days ahead, friend."
	icon_state = "grass_taiga"
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_GRASS
	clawfootstep = FOOTSTEP_GRASS

/turf/open/indestructible/ground/bl/outside/grass_standard/taiga_grass/Initialize()
	. = ..()

	if(!((locate(/obj/structure) in src) || (locate(/obj/machinery) in src)))
		plantGrass()
	icon_state = "grass_taiga[rand(0,3)]"

/obj/effect/overlay/bl_turf/bl_taiga
	name = "mossy grass"
	icon_state = "grass_taiga_edges"

// BADLANDS GRASS
/turf/open/indestructible/ground/bl/outside/grass_standard/badlands_grass
	name = "dry grass"
	desc = "There's dark days ahead, friend."
	icon_state = "grass_badlands"
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_GRASS
	clawfootstep = FOOTSTEP_GRASS

/turf/open/indestructible/ground/bl/outside/grass_standard/badlands_grass/Initialize()
	. = ..()

	if(!((locate(/obj/structure) in src) || (locate(/obj/machinery) in src)))
		plantGrass()
	icon_state = "grass_badlands[rand(0,3)]"

/obj/effect/overlay/bl_turf/bl_badlands
	name = "dry grass"
	icon_state = "grass_badlands_edges"

/////////////////
// DIRT STUFF //
////////////////
// DRY DIRT
/turf/open/indestructible/ground/bl/outside/dirt
	name = "dry soil"
	desc = "There's dark days ahead, friend."
	icon_state = "dirt"
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND

/turf/open/indestructible/ground/bl/outside/dirt/Initialize()
	. = ..()
	icon_state = "dirt[rand(0,3)]"

/obj/effect/overlay/bl_turf/dirt_tracks
	name = "dry soil"
	icon_state = "dirttrack0"

/obj/effect/overlay/bl_turf/dirt_tracks/Initialize()
	. = ..()
	icon_state = "dirttrack[rand(0,3)]"

/turf/open/indestructible/ground/bl/dirt
	name = "dry soil"
	desc = "There's dark days ahead, friend."
	icon_state = "dirt"
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND

/turf/open/indestructible/ground/bl/dirt/Initialize()
	. = ..()
	icon_state = "dirt[rand(0,3)]"

// GRAVEL
/turf/open/indestructible/ground/bl/outside/gravel
	name = "gravel"
	desc = "There's dark days ahead, friend."
	icon_state = "gravel"
	slowdown = -0.1
	footstep = FOOTSTEP_GRAVEL
	barefootstep = FOOTSTEP_GRAVEL
	clawfootstep = FOOTSTEP_GRAVEL

/turf/open/indestructible/ground/bl/outside/gravel/Initialize()
	. = ..()
	icon_state = "gravel[rand(0,3)]"

/turf/open/indestructible/ground/bl/gravel
	name = "gravel"
	desc = "There's dark days ahead, friend."
	icon_state = "gravel"
	slowdown = -0.1
	footstep = FOOTSTEP_GRAVEL
	barefootstep = FOOTSTEP_GRAVEL
	clawfootstep = FOOTSTEP_GRAVEL

/turf/open/indestructible/ground/bl/gravel/Initialize()
	. = ..()
	icon_state = "gravel[rand(0,3)]"

// MUD
/turf/open/indestructible/ground/bl/outside/mud
	name = "mud"
	desc = "There's dark days ahead, friend."
	icon_state = "mud"
	slowdown = 3
	footstep = FOOTSTEP_MEAT
	barefootstep = FOOTSTEP_MEAT
	clawfootstep = FOOTSTEP_MEAT

/turf/open/indestructible/ground/bl/outside/mud/Initialize()
	. = ..()
	icon_state = "mud[rand(0,3)]"

/turf/open/indestructible/ground/bl/mud
	name = "mud"
	desc = "There's dark days ahead, friend."
	icon_state = "mud"
	slowdown = 3
	footstep = FOOTSTEP_MEAT
	barefootstep = FOOTSTEP_MEAT
	clawfootstep = FOOTSTEP_MEAT

/turf/open/indestructible/ground/bl/mud/Initialize()
	. = ..()
	icon_state = "mud[rand(0,3)]"

// SAND
/turf/open/indestructible/ground/bl/outside/sand
	name = "sand"
	desc = "There's dark days ahead, friend."
	icon_state = "sand"
	slowdown = 0.5
	footstep = FOOTSTEP_LOOSE_SAND
	barefootstep = FOOTSTEP_LOOSE_SAND
	clawfootstep = FOOTSTEP_LOOSE_SAND

/turf/open/indestructible/ground/bl/outside/sand/Initialize()
	. = ..()
	icon_state = "sand[rand(0,3)]"

/obj/effect/overlay/bl_turf/bl_sand
	name = "sand"
	icon_state = "sand_edges"

// STONE
/turf/open/indestructible/ground/bl/outside/stone
	name = "stone"
	desc = "There's dark days ahead, friend."
	icon_state = "stone"
	footstep = FOOTSTEP_FLOOR
	barefootstep = FOOTSTEP_FLOOR
	clawfootstep = FOOTSTEP_FLOOR

/turf/open/indestructible/ground/bl/outside/stone/Initialize()
	. = ..()
	icon_state = "stone[rand(0,3)]"

/turf/open/indestructible/ground/bl/stone
	name = "stone"
	desc = "There's dark days ahead, friend."
	icon_state = "stone"
	footstep = FOOTSTEP_FLOOR
	barefootstep = FOOTSTEP_FLOOR
	clawfootstep = FOOTSTEP_FLOOR

/turf/open/indestructible/ground/bl/stone/Initialize()
	. = ..()
	icon_state = "stone[rand(0,3)]"

/obj/effect/overlay/bl_turf/rocks
	name = "rocks"
	icon_state = "rocks0"

/obj/effect/overlay/bl_turf/rocks/Initialize()
	. = ..()
	icon_state = "rocks[rand(0,7)]"

// CLAY
/turf/open/indestructible/ground/bl/outside/clay
	name = "clay"
	desc = "There's dark days ahead, friend."
	icon_state = "clay"
	footstep = FOOTSTEP_FLOOR
	barefootstep = FOOTSTEP_FLOOR
	clawfootstep = FOOTSTEP_FLOOR

/turf/open/indestructible/ground/bl/outside/clay/Initialize()
	. = ..()
	icon_state = "clay[rand(0,3)]"

/obj/effect/overlay/bl_turf/bl_clay
	name = "clay"
	icon_state = "clay_edges"
