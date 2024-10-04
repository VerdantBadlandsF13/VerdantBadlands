/obj/effect/overlay/bl_turf
	icon = 'modular_badlands/code/modules/environment/icons/bl_turf.dmi'
	icon_state = "ERROR"
	density = FALSE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	plane = FLOOR_PLANE
	layer = ABOVE_OPEN_TURF_LAYER
	anchored = TRUE
	resistance_flags = INDESTRUCTIBLE

/obj/effect/decal/bl_stairway
	name = "up"
	icon = 'modular_badlands/code/modules/environment/icons/bl_decals.dmi'
	icon_state = "up"

/obj/effect/decal/bl_stairway/down
	name = "down"
	icon_state = "down"

/obj/effect/decal/bl_stairway/ex_act(severity)
	return
