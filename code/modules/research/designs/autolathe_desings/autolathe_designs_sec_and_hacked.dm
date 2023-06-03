///////////////////////////////////
//////////Autolathe Designs ///////
///////////////////////////////////
/////////////
////Secgear//
/////////////

/////////////////
///Hacked Gear //
/////////////////

/datum/design/large_welding_tool
	name = "Industrial Welding Tool"
	id = "large_welding_tool"
	build_type = AUTOLATHE | NO_PUBLIC_LATHE
	materials = list(/datum/material/iron = 70, /datum/material/glass = 60)
	build_path = /obj/item/weldingtool/largetank
	category = list("hacked", "Tools")

/datum/design/rcd
	name = "Rapid Construction Device (RCD)"
	id = "rcd"
	build_type = AUTOLATHE | NO_PUBLIC_LATHE
	materials = list(/datum/material/iron = 30000)
	build_path = /obj/item/construction/rcd
	category = list("hacked", "Construction")

/datum/design/rpd
	name = "Rapid Pipe Dispenser (RPD)"
	id = "rpd"
	build_type = AUTOLATHE | NO_PUBLIC_LATHE
	materials = list(/datum/material/iron = 75000, /datum/material/glass = 37500)
	build_path = /obj/item/pipe_dispenser
	category = list("hacked", "Construction")


/datum/design/handcuffs
	name = "Handcuffs"
	id = "handcuffs"
	build_type = AUTOLATHE | NO_PUBLIC_LATHE
	materials = list(/datum/material/iron = 500)
	build_path = /obj/item/restraints/handcuffs
	category = list("hacked", "Security")

/////////////////
//   Bullets   //
/////////////////

/datum/design/electropack
	name = "Electropack"
	id = "electropack"
	build_type = AUTOLATHE | NO_PUBLIC_LATHE
	materials = list(/datum/material/iron = 10000, /datum/material/glass = 2500)
	build_path = /obj/item/electropack
	category = list("hacked", "Security")

/datum/design/cleaver
	name = "Butcher's Cleaver"
	id = "cleaver"
	build_type = AUTOLATHE | NO_PUBLIC_LATHE
	materials = list(/datum/material/iron = 18000)
	build_path = /obj/item/kitchen/knife/butcher
	category = list("hacked", "Dinnerware")

/datum/design/foilhat
	name = "Tinfoil Hat"
	id = "tinfoil_hat"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 5500)
	build_path = /obj/item/clothing/head/foilhat
	category = list("hacked", "Misc")

