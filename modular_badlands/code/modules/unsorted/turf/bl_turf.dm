/turf/open/indestructible/ground/outside/grass
	name = "grass"
	desc = "Overgrown grass."
	icon = 'modular_badlands/code/modules/unsorted/icons/bl_turf.dmi'

/turf/open/indestructible/ground/outside/grass/main
	icon_state = "grass0"

/turf/open/indestructible/ground/outside/grass/main/Initialize()
	icon_state = "grass[rand(0, 3)]"
	. = ..()

/turf/open/indestructible/ground/outside/grass/grass_corner
	icon_state = "grasscorner"

/turf/open/indestructible/ground/outside/grass/grass_border
	icon_state = "grassborder"
