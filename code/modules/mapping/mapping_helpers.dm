//Landmarks and other helpers which speed up the mapping process and reduce the number of unique instances/subtypes of items/turf/ect
/obj/effect/landmark/dungeon_mark
	name = "test"
	invisibility = 25

	var/list/templates

/obj/effect/landmark/dungeon_mark/oasis
	name = "oasis bunker"

/obj/effect/landmark/dungeon_mark/northclaws
	name = "north claws bunker"

/obj/effect/landmark/dungeon_mark/northsmall
	name = "north mini claws bunker"

/obj/effect/landmark/dungeon_mark/miniclaws
	name = "sewer mini claws bunker"

/obj/effect/landmark/dungeon_mark/ants
	name = "ant bunker"

/obj/effect/landmark/dungeon_mark/northmutants
	name = "north mutants bunker"

/obj/effect/landmark/dungeon_mark/bandit
	name = "bandit bunker"

/obj/effect/landmark/dungeon_mark/Initialize()
	. = ..()
	GLOB.dungeon_marks += src

/obj/effect/landmark/dungeon_mark/Destroy()
	GLOB.dungeon_marks -= src
	return ..()

/obj/effect/landmark/map_load_mark
	name = "map loader landmark"
	invisibility = 25

	var/id = null
	var/list/templates	//list of template types to pick from

/obj/effect/landmark/map_load_mark/Initialize()
	. = ..()
	LAZYADD(SSmapping.map_load_marks,src)

/obj/effect/landmark/map_load_mark/Destroy()
	LAZYREMOVE(SSmapping.map_load_marks, src)
	return ..()
