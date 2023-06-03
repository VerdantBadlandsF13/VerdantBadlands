///////////////////////////////
///////Weapons & Ammo//////////
///////////////////////////////
//////////////
//Ammo Shells/
//////////////

/datum/design/shell_clip
	name = "stripper clip (shotgun shells)"
	id = "sec_shellclip"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 5000)
	build_path = /obj/item/ammo_box/shotgun
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

//////////////
//Firing Pins/
//////////////

/datum/design/pin_testing
	name = "Test-Range Firing Pin"
	desc = "This safety firing pin allows firearms to be operated within proximity to a firing range."
	id = "pin_testing"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 500, /datum/material/glass = 300)
	build_path = /obj/item/firing_pin/test_range
	category = list("Firing Pins")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/pin_mindshield
	name = "Mindshield Firing Pin"
	desc = "This is a security firing pin which only authorizes users who are mindshield-implanted."
	id = "pin_loyalty"
	build_type = PROTOLATHE
	materials = list(/datum/material/silver = 600, /datum/material/diamond = 600, /datum/material/uranium = 200)
	build_path = /obj/item/firing_pin/implant/mindshield
	category = list("Firing Pins")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/pin_explorer
	name = "Outback Firing Pin"
	desc = "This firing pin only shoots while ya ain't on station, fair dinkum!"
	id = "pin_explorer"
	build_type = PROTOLATHE
	materials = list(/datum/material/silver = 1000, /datum/material/gold = 1000, /datum/material/iron = 500)
	build_path = /obj/item/firing_pin/explorer
	category = list("Firing Pins")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

///////////
//Grenades/
///////////

/datum/design/large_grenade
	name = "Large Grenade"
	desc = "A grenade that affects a larger area and use larger containers."
	id = "large_Grenade"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 3000)
	build_path = /obj/item/grenade/chem_grenade/large
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/pyro_grenade
	name = "Pyro Grenade"
	desc = "An advanced grenade that is able to self ignite its mixture."
	id = "pyro_Grenade"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2000, /datum/material/plasma = 500)
	build_path = /obj/item/grenade/chem_grenade/pyro
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/cryo_grenade
	name = "Cryo Grenade"
	desc = "An advanced grenade that rapidly cools its contents upon detonation."
	id = "cryo_Grenade"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2000, /datum/material/silver = 500)
	build_path = /obj/item/grenade/chem_grenade/cryo
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/adv_grenade
	name = "Advanced Release Grenade"
	desc = "An advanced grenade that can be detonated several times, best used with a repeating igniter."
	id = "adv_Grenade"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 3000, /datum/material/glass = 500)
	build_path = /obj/item/grenade/chem_grenade/adv_release
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SCIENCE

///////////
//Shields//
///////////

//Removed
/datum/design/tele_shield
	name = "Telescopic Riot Shield"
	desc = "An advanced riot shield made of lightweight materials that collapses for easy storage."
	id = "tele_shield"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 4000, /datum/material/glass = 4000, /datum/material/silver = 300, /datum/material/titanium = 200)
	build_path = /obj/item/shield/riot
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

//Removed
/datum/design/laser_shield
	name = "Laser Resistant Riot Shield"
	desc = "An advanced riot shield made of darker glasses to prevent laser fire from passing through."
	id = "laser_shield"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 4000, /datum/material/glass = 1000, /datum/material/plastic = 4000, /datum/material/silver = 800, /datum/material/titanium = 600, /datum/material/plasma = 5000)
	build_path = /obj/item/shield/riot
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/bullet_shield
	name = "Bullet Resistant Riot Shield"
	desc = "An advanced riot shield made bullet resistant plastics and heavy metals to protect against projectile harm."
	id = "bullet_shield"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 4000, /datum/material/glass = 1000, /datum/material/silver = 2000, /datum/material/titanium = 1200, /datum/material/plastic = 2500)
	build_path = /obj/item/shield/riot/bullet_proof
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

//////////
//MISC////
//////////

/datum/design/suppressor
	name = "Suppressor"
	desc = "A reverse-engineered suppressor that fits on most small arms with threaded barrels."
	id = "suppressor"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2000, /datum/material/silver = 500)
	build_path = /obj/item/suppressor
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/cleric_mace
	name = "Cleric Mace"
	desc = "A mace fit for a cleric. Useful for bypassing plate armor, but too bulky for much else."
	id = "cleric_mace"
	build_type = AUTOLATHE
	materials = list(MAT_CATEGORY_RIGID = 12000)
	build_path = /obj/item/melee/cleric_mace
	category = list("Imported")

/datum/design/mindshield
	name = "Mindshield Implant"
	desc = "A mindshield implant."
	id = "implant_loyal"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 500, /datum/material/glass = 500)
	build_path = /obj/item/implantcase/mindshield
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/mfc
	name = "Microfusion Cell"
	id = "mfc"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 10000, /datum/material/glass = 2000)
	build_path =/obj/item/stock_parts/cell/ammo/mfc
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/ec
	name = "Energy Cell"
	id = "ec"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 1000)
	build_path =/obj/item/stock_parts/cell/ammo/ec
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/ecp
	name = "Electron Charge Pack"
	id = "ecp"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 10000, /datum/material/glass = 2000, /datum/material/diamond = 2000)
	build_path = /obj/item/stock_parts/cell/ammo/ecp
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
