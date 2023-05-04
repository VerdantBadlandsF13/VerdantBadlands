// Generic Waterside Effects
/obj/effect/overlay/turfs/water
	name = "beach overlay"
	icon_state = "sand_water_side"

/obj/effect/overlay/turfs/water/corner
	icon_state = "sand_water_corner"

// General Water Effects
/obj/effect/overlay/river_water
	name = "water"
	icon = 'icons/turf/pool.dmi'
	icon_state = "bottom"
	density = FALSE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	layer = ABOVE_MOB_LAYER
	anchored = TRUE
	resistance_flags = INDESTRUCTIBLE

/obj/effect/overlay/river_water/top
	icon_state = "top"
	layer = BELOW_MOB_LAYER
