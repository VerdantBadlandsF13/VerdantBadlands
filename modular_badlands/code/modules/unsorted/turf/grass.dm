/turf/open/indestructible/ground/outside/grass
	name = "grass"
	desc = "Overgrown grass."
	icon = 'modular_badlands/code/modules/unsorted/icons/grass.dmi'

/turf/open/indestructible/ground/outside/grass/main
	icon_state = "grass1"

/turf/open/indestructible/ground/outside/grass/main/Initialize()
	icon_state = "grass[rand(1, 11)]"
	. = ..()

/turf/open/indestructible/ground/outside/grass/grass_corner
	icon_state = "grasscorner"

/turf/open/indestructible/ground/outside/grass/grass_border
	icon_state = "grassborder"
