//Tank Traps
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

//Sandbags Kinda
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

//Cliff walls for rivers and such.
/obj/structure/barricade/cliff_face
	name = "steep incline"
	desc = "Too steep to climb. <br>\
	Perhaps you should go around?"
	icon = 'icons/fallout/turfs/smoothing.dmi'
	icon_state = "cliff"
	density = TRUE
	anchored = TRUE
	plane = FLOOR_PLANE
	layer = ABOVE_OPEN_TURF_LAYER
	pass_flags_self = LETPASSTHROW
	flags_1 = ON_BORDER_1
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF | FREEZE_PROOF

/obj/structure/barricade/cliff_face/alt
	icon_state = "cliffalt"

/obj/structure/barricade/cliff_face/corner
	icon_state = "cliff_corner"
