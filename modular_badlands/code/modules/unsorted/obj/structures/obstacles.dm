// Tank Traps - Used elsewhere, but these can't be climbed through.
/obj/structure/tanktrap
	name = "Czech hedgehog"
	desc = "An odd set of angled beams. What're these doing all the way in Vermont?"
	icon = 'icons/obj/obstacles.dmi'
	icon_state = "iron_barricade"
	density = 1
	anchored = 1
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF | FREEZE_PROOF

/obj/structure/tanktrap/light
	icon_state = "iron_barricade2"

/obj/structure/tanktrap/old
	name = "rusted Czech hedgehog"
	desc = "An odd set of angled beams, rusted to near worthlessness. What're these doing all the way in Vermont?"
	icon_state = "iron_barricadeA"

/obj/structure/tanktrap/old/light
	icon_state = "iron_barricade2A"

// Sandbags Kinda
/obj/structure/barricade/sandbag_wall
	name = "sandbag wall"
	desc = "Neatly stacked sandbags. <br>\
	Wait a moment, is that just concrete in a sack?"
	icon = 'icons/obj/obstacles.dmi'
	icon_state = "sandbag_single"
	density = 1
	anchored = 1
	pass_flags_self = LETPASSTHROW
	flags_1 = ON_BORDER_1
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF | FREEZE_PROOF

/obj/structure/barricade/sandbag_wall/multi
	icon_state = "sandbag_horizontal"

// Cliff walls for rivers and such.
/obj/structure/railing/cliff_face
	name = "steep incline"
	desc = "Too steep to climb. <br>\
	Perhaps you should go around?"
	icon = 'icons/fallout/turfs/smoothing.dmi'
	icon_state = "cliff"
	density = TRUE
	anchored = TRUE
	plane = FLOOR_PLANE
	layer = WALL_OBJ_LAYER
	pass_flags_self = LETPASSTHROW
	flags_1 = ON_BORDER_1
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF | FREEZE_PROOF

/obj/structure/railing/cliff_face/alt
	icon_state = "cliffalt"

/obj/structure/railing/cliff_face/corner
	icon_state = "cliff_corner"

/*
This is a pre-destroyed nuclear reactor for the sake of mapping special fluff stuff.
Not actually a reactor, just uses the icon and irradiates the surrounding area a bit.
Nowhere else to really put this. Pulled from what I had done on Hyper. - Carl
*/

/obj/structure/fluff/destroyed_nuclear_reactor
	name = "Destroyed Nuclear Reactor"
	desc = "What in the hell happened here?"
	icon = 'modular_badlands/code/modules/unsorted/icons/rbmk.dmi'
	icon_state = "reactor_slagged"
	pixel_x = -32
	pixel_y = -32
	density = FALSE
	anchored = TRUE
	deconstructible = FALSE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF | FREEZE_PROOF
	light_color = LIGHT_COLOR_CYAN
	dir = 8 //Less headache inducing :))

/obj/structure/fluff/destroyed_nuclear_reactor/Initialize()
	. = ..()
	set_light(3)
//	AddComponent(/datum/component/radioactive, 15000 , src)
	START_PROCESSING(SSradiation,src)

/obj/structure/fluff/destroyed_nuclear_reactor/Destroy()
	STOP_PROCESSING(SSradiation,src)
	return ..()

/obj/structure/fluff/destroyed_nuclear_reactor/process()
	if(QDELETED(src))
		return PROCESS_KILL

	if(!z || !SSmobs.clients_by_zlevel[z].len) // we don't care about irradiating if no one is around to see it!
		return

	for(var/mob/living/carbon/human/victim in view(src,5))
		if(istype(victim) && victim.stat != DEAD)
			victim.rad_act(1500)//WHY ARE YOU STANDING NEAR IT?
