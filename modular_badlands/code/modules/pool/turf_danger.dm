/obj/effect/overlay/riverwater
	name = "river water"
	desc = "Shallow river water."
	icon = 'icons/turf/floors.dmi'
	icon_state = "riverwater_motion"
	anchored = TRUE
	layer = ABOVE_ALL_MOB_LAYER
	plane = MOB_PLANE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	alpha = 90//Maybe not needed?

/turf/open/indestructible/sound/pool/river
	name = "riverbed"
	desc = "A downward sloping surface. Looks rather deep, so best be careful! <br>\
	<b>Drag and drop yourself onto it to climb in...</b>"
	icon = 'modular_badlands/code/modules/pool/icons/pool.dmi'
	icon_state = "riverbed"
	sound = 'modular_badlands/code/modules/pool/sound/sound_effects_splash.ogg'
	id = null
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/indestructible/sound/pool/river/Initialize(mapload)
	. = ..()
	water_overlay = new /obj/effect/overlay/riverwater(get_turf(src))
