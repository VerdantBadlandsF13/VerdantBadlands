// This holds the base for icon generation of signage.
/obj/structure/badlands_props/signage
	name = "signage"
	desc = "..."
	icon = 'modular_badlands/code/modules/rp_misc/environmental_props/icons/signage.dmi'
	density = FALSE
	opacity = FALSE

// This holds the base for factionised objects.
/obj/structure/badlands_props/factionised
	name = "parent"
	desc = "..."
	density = FALSE
	opacity = FALSE

/obj/structure/badlands_props/factionised/gmb_graffiti
	name = "graffiti"
	desc = "Graffiti dedicated to the Green Mountain Boys."
	icon = 'modular_badlands/code/modules/rp_misc/environmental_props/icons/bl_decals_wide_two.dmi'
	icon_state = "gmb"
	bound_width = 64
	bound_height = 64

/obj/structure/badlands_props/factionised/dfs_graffiti
	name = "graffiti"
	desc = "Graffiti dedicated to Dry Fields Security."
	icon = 'modular_badlands/code/modules/rp_misc/environmental_props/icons/bl_decals_wide_two.dmi'
	icon_state = "dfs"
	bound_width = 64
	bound_height = 64

// flags for GMB
/obj/structure/badlands_props/factionised/gmb_flag
	name = "GMB Flag"
	desc = "An old flag, dedicated to an even older purpose."
	icon = 'modular_badlands/code/modules/environment/icons/bl_misc.dmi'
	icon_state = "gmbflag"

/obj/structure/badlands_props/factionised/gmb_flag_worn
	name = "GMB Flag"
	desc = "An old, worn out flag, dedicated to an even older purpose."
	icon = 'modular_badlands/code/modules/environment/icons/bl_misc.dmi'
	icon_state = "gmflagworn"
