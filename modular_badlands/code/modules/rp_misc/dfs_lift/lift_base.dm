/obj/effect/elevator
	name = "\improper empty space"
	desc = "There seems to be an awful lot of machinery down below"
	icon = 'modular_badlands/code/modules/rp_misc/dfs_lift/icons/160x160.dmi'
	icon_state = "supply_elevator_lowered"
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF | FREEZE_PROOF
/*
The gears for the elevator itself.
*/
/obj/machinery/gear
	name = "\improper gear"
	icon = 'modular_badlands/code/modules/rp_misc/dfs_lift/icons/elevator.dmi'
	icon_state = "gear"
	anchored = TRUE
	density = FALSE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF | FREEZE_PROOF

/obj/machinery/gear/proc/start_moving(direction = NORTH)
	icon_state = "gear_moving"
	setDir(direction)

/obj/machinery/gear/proc/stop_moving()
	icon_state = "gear"

/obj/machinery/elevator_strut
	name = "\improper strut"
	icon = 'modular_badlands/code/modules/rp_misc/dfs_lift/icons/elevator_strut.dmi'
	anchored = TRUE
	density = FALSE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF | FREEZE_PROOF

/obj/machinery/elevator_strut/top
	icon_state = "strut_top"

/obj/machinery/elevator_strut/bottom
	icon_state = "strut_bottom"
