
/////////////////////////////////////////
/////////////////Mining//////////////////
/////////////////////////////////////////
/datum/design/cargo_express
	name = "Computer Design (Express Supply Console)"//shes beautiful
	desc = "Allows for the construction of circuit boards used to build an Express Supply Console."//who?
	id = "cargoexpress"//the coder reading this
	build_type = IMPRINTER
	materials = list(/datum/material/glass = 1000)
	build_path = /obj/item/circuitboard/computer/cargo/express
	category = list("Mining Designs")
	departmental_flags = DEPARTMENTAL_FLAG_CARGO

/datum/design/bluespace_pod
	name = "Supply Drop Pod Upgrade Disk"
	desc = "Allows the Cargo Express Console to call down the Bluespace Drop Pod, greatly increasing user safety."//who?
	id = "bluespace_pod"//the coder reading this
	build_type = PROTOLATHE
	materials = list(/datum/material/glass = 1000)
	build_path = /obj/item/disk/cargo/bluespace_pod
	category = list("Mining Designs")
	departmental_flags = DEPARTMENTAL_FLAG_CARGO

/datum/design/drill
	name = "Mining Drill"
	desc = "Yours is the drill that will pierce through the rock walls."
	id = "drill"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 6000, /datum/material/glass = 1000) //expensive, but no need for miners.
	build_path = /obj/item/pickaxe/drill
	category = list("Mining Designs")
	departmental_flags = DEPARTMENTAL_FLAG_CARGO

/datum/design/drill_diamond
	name = "Diamond-Tipped Mining Drill"
	desc = "Yours is the drill that will pierce the heavens!"
	id = "drill_diamond"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 6000, /datum/material/glass = 1000, /datum/material/diamond = 2000) //Yes, a whole diamond is needed.
	build_path = /obj/item/pickaxe/drill/diamonddrill
	category = list("Mining Designs")
	departmental_flags = DEPARTMENTAL_FLAG_CARGO

/datum/design/plasteel_pick
	name = "plasteel-tipped pickaxe"
	desc = "A pickaxe with a plasteel pick head. Less robust at cracking rock walls and digging up dirt than the titanium pickaxe, but better at cracking open skulls."
	id = "plasteel_pick"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron=2000, /datum/material/plasma=2000)
	build_path = /obj/item/pickaxe/plasteel
	category = list("Mining Designs")
	departmental_flags = DEPARTMENTAL_FLAG_CARGO

/datum/design/titanium_pick
	name = "titanium-tipped pickaxe"
	desc = "A pickaxe with a titanium pick head. Extremely robust at cracking rock walls and digging up dirt, but less than the plasteel pickaxe at cracking open skulls."
	id = "titanium_pick"
	build_type = PROTOLATHE
	materials = list(/datum/material/titanium = 4000)
	build_path = /obj/item/pickaxe/titanium
	category = list("Mining Designs")
	departmental_flags = DEPARTMENTAL_FLAG_CARGO

/datum/design/jackhammer
	name = "Sonic Jackhammer"
	desc = "Essentially a handheld planet-cracker. Can drill through walls with ease as well."
	id = "jackhammer"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 6000, /datum/material/glass = 2000, /datum/material/silver = 2000, /datum/material/diamond = 6000)
	build_path = /obj/item/pickaxe/drill/jackhammer
	category = list("Mining Designs")
	departmental_flags = DEPARTMENTAL_FLAG_CARGO
