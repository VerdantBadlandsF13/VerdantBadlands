// A continuation of what's in obstacle.dm
// Instead of 1:1, this uses a new parent.
/obj/structure/badlands_props
	icon = 'modular_badlands/code/modules/rp_misc/environmental_props/icons/decals.dmi'
	anchored = 1
	density = 1
	opacity = FALSE
	flags_1 = NODECONSTRUCT_1
	resistance_flags = INDESTRUCTIBLE
	var/buildstacktype = /obj/item/stack/rods
	var/buildstackamount = 1

/obj/structure/badlands_props/deconstruct()
	// If we have materials, and don't have the NOCONSTRUCT flag
	if(!(flags_1 & NODECONSTRUCT_1))
		if(buildstacktype)
			new buildstacktype(loc,buildstackamount)
		else
			for(var/i in custom_materials)
				var/datum/material/M = i
				new M.sheet_type(loc, FLOOR(custom_materials[M] / MINERAL_MATERIAL_AMOUNT, 1))
	..()

/obj/structure/badlands_props/waterpump
	name = "large pump"
	desc = "A pump of rather considerable size."
	icon = 'modular_badlands/code/modules/rp_misc/environmental_props/icons/decals_wider.dmi'
	icon_state = "waterpump"
	bound_width = 96
	bound_height = 96
	bound_x = 32
	anchored = TRUE

/obj/structure/badlands_props/modern_filter
	name = "industrial air filter"
	desc = "The machine is on, but you aren't sure you know how to interact with this."
	light_range = 2
	icon = 'modular_badlands/code/modules/rp_misc/environmental_props/icons/modern_structures.dmi'
	icon_state = "airfilter2"
	anchored = TRUE

//////////////////////////RADIOS!/////////////////////////////////

/obj/structure/badlands_props/radio
	name = "parent object"
	desc = "A dj setup for makin sick beats."
	icon = 'icons/fallout/machines/radio.dmi'
	density = TRUE
	opacity = TRUE
	anchored = TRUE

/obj/structure/badlands_props/radio/micstand
	name = "microphone stand"
	desc = "A mic stand."
	icon_state = "micstand"

/obj/structure/badlands_props/radio/micstand/empty
	name = "empty microphone stand"
	desc = "An empty mic stand."
	icon_state = "micstand_empty"

/obj/structure/badlands_props/radio/speaker
	name = "microphone stand"
	desc = "A mic stand."
	icon_state = "loudspeaker"

/obj/structure/badlands_props/radio/mic
	name = "microphone"
	desc = "A microphone."
	icon_state = "radio_mic1"

/obj/structure/badlands_props/radio/mic/alt_one
	name = "microphone"
	desc = "A microphone."
	icon_state = "radio_mic2"

/obj/structure/badlands_props/radio/mic/alt_two
	name = "microphone"
	desc = "A microphone."
	icon_state = "radio_mic3"

/obj/structure/badlands_props/radio/garone
	name = "holotape player"
	desc = "A mic stand."
	icon_state = "gannets_machine20"

/obj/structure/badlands_props/radio/garone/on
	light_range = 2
	icon_state = "gannets_machine21"

/obj/structure/badlands_props/radio/gartwo
	name = "holotape server"
	desc = "A mic stand."
	icon_state = "gannets_machine30"

/obj/structure/badlands_props/radio/gartwo/on
	light_range = 2
	icon_state = "gannets_machine31"

//////////////////////////CAMONET/////////////////////////////////

/obj/structure/badlands_props/camonet
	name ="camonet"
	icon = 'modular_badlands/code/modules/rp_misc/environmental_props/icons/structures.dmi'
	icon_state ="camonet"
	layer = ABOVE_FLY_LAYER
	alpha = 175
	density = FALSE
	anchored = TRUE
	mouse_opacity = FALSE


/////////////////////CONSTRUCTION PROPS///////////////////////

/obj/structure/badlands_props/water_pump
	name = "water pump"
	desc = "An old, pre-war water pump. Likely used to filter the water from the river, for Brattleboro citizenry. <br>\
	It appears sealed shut, not to mention unpowered. Bummer."
	icon = 'modular_badlands/code/modules/rp_misc/environmental_props/icons/decals_wider.dmi'
	icon_state = "waterpump"
	density = TRUE
	anchored = TRUE
	bound_width = 96
	bound_height = 96

/obj/structure/badlands_props/forklift
	name = "forklift"
	desc = "'A lift for forks', this one seems to be out of battery, missing the fuel tank, spark plugs an-- Oh! And the engine is missing too."
	icon = 'modular_badlands/code/modules/rp_misc/environmental_props/icons/vehicleparts64x64.dmi'
	icon_state = "forklift"
	density = TRUE
	anchored = TRUE
	bound_width = 64
	bound_height = 64

/obj/structure/badlands_props/rhiboat
	name = "rigid-hull inflatable boat"
	desc = "'A sturdy boat, manufactured before the war. This still bears markings of the United States Military. <br>\
	Aside from the engine, it appears to be in decent condition. How's this here?"
	icon = 'modular_badlands/code/modules/rp_misc/environmental_props/icons/vehicleparts64x64.dmi'
	icon_state = "rib"
	density = TRUE
	anchored = TRUE
	bound_width = 64
	bound_height = 64

/obj/structure/badlands_props/medical_divider
	name = "medical divider"
	desc = "'A medical divider. Probably used to ensure privacy. Pervert."
	icon = 'modular_badlands/code/modules/rp_misc/environmental_props/icons/modern_structures.dmi'
	icon_state = "medical_divider_half"
	density = FALSE

/obj/structure/badlands_props/medical_divider/full
	icon_state = "medical_divider_full"
	density = TRUE
