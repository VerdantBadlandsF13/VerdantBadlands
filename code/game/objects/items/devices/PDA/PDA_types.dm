// Special AI/pAI PDAs that cannot explode.
/obj/item/pda/ai
	icon = null
	ttone = "data"
	fon = FALSE
	detonatable = FALSE

/obj/item/pda/ai/pai
	ttone = "assist"

/obj/item/pda/dweller
	icon_state = "pda-clear"

/obj/item/pda/medical
	default_cartridge = /obj/item/cartridge/medical
	icon_state = "pda-medical"

/obj/item/pda/viro
	default_cartridge = /obj/item/cartridge/medical
	icon_state = "pda-virology"

/obj/item/pda/engineering
	default_cartridge = /obj/item/cartridge/engineering
	icon_state = "pda-engineer"

/obj/item/pda/security
	default_cartridge = /obj/item/cartridge/security
	icon_state = "pda-security"

/obj/item/pda/detective
	default_cartridge = /obj/item/cartridge/detective
	icon_state = "pda-detective"

/obj/item/pda/warden
	default_cartridge = /obj/item/cartridge/security
	icon_state = "pda-warden"

/obj/item/pda/janitor
	default_cartridge = /obj/item/cartridge/janitor
	icon_state = "pda-janitor"
	ttone = "slip"

/obj/item/pda/toxins
	default_cartridge = /obj/item/cartridge/signal/toxins
	icon_state = "pda-science"
	ttone = "boom"

/obj/item/pda/heads
	default_cartridge = /obj/item/cartridge/head
	icon_state = "pda-hop"

/obj/item/pda/heads/hop
	default_cartridge = /obj/item/cartridge/hop
	icon_state = "pda-hop"

/obj/item/pda/heads/hos
	default_cartridge = /obj/item/cartridge/hos
	icon_state = "pda-hos"

/obj/item/pda/heads/ce
	default_cartridge = /obj/item/cartridge/ce
	icon_state = "pda-ce"

/obj/item/pda/heads/cmo
	default_cartridge = /obj/item/cartridge/cmo
	icon_state = "pda-cmo"

/obj/item/pda/heads/rd
	default_cartridge = /obj/item/cartridge/rd
	inserted_item = /obj/item/pen/fourcolor
	icon_state = "pda-rd"

/obj/item/pda/captain
	default_cartridge = /obj/item/cartridge/captain
	inserted_item = /obj/item/pen/fountain/captain
	icon_state = "pda-captain"
	detonatable = FALSE

/obj/item/pda/lieutenant
	default_cartridge = /obj/item/cartridge/captain
	inserted_item = /obj/item/pen/fountain/captain
	icon_state = "pda-lieutenant"
	ttone = "bwoink"
	detonatable = FALSE
	hidden = TRUE
	note = "Congratulations, you have chosen the RobCo Pip-Boy 3000 Personal Information Processor Prestige Edition! To help with navigation, we have provided the following definitions. North, South, West, East."

/obj/item/pda/cargo
	default_cartridge = /obj/item/cartridge/quartermaster
	icon_state = "pda-cargo"

/obj/item/pda/quartermaster
	default_cartridge = /obj/item/cartridge/quartermaster
	inserted_item = /obj/item/pen/fountain
	icon_state = "pda-qm"

/obj/item/pda/shaftminer
	icon_state = "pda-miner"

/obj/item/pda/syndicate
	default_cartridge = /obj/item/cartridge/virus/syndicate
	icon_state = "pda-syndi"
	owner = "John Doe"
	hidden = 1

/obj/item/pda/chaplain
	icon_state = "pda-chaplain"
	ttone = "holy"

/obj/item/pda/lawyer
	default_cartridge = /obj/item/cartridge/lawyer
	inserted_item = /obj/item/pen/fountain
	icon_state = "pda-lawyer"
	ttone = "objection"

/obj/item/pda/botanist
	//default_cartridge = /obj/item/cartridge/botanist
	icon_state = "pda-hydro"

/obj/item/pda/roboticist
	icon_state = "pda-roboticist"
	default_cartridge = /obj/item/cartridge/roboticist

/obj/item/pda/curator
	icon_state = "pda-library"
	current_overlays = list("pda-r-library","blank","id_overlay","insert_overlay", "light_overlay", "pai_overlay")
	default_cartridge = /obj/item/cartridge/curator
	inserted_item = /obj/item/pen/fountain
	desc = "A portable microcomputer by RobCo Industries. This model is a WGW-11 series e-reader."
	note = "Congratulations, your Vault has chosen the RobCo Pip-Boy 3000 E-reader and Personal Information Processor! To help with navigation, we have provided the following definitions. North, South, West, East."
	silent = TRUE //Quiet in the library!
	overlays_offsets = list('icons/obj/pda.dmi' = list(-3,0))
	overlays_x_offset = -3

/obj/item/pda/clear
	icon_state = "pda-clear"
	desc = "A portable microcomputer by RobCo Industries. This model is a special edition with a transparent case."
	note = "Congratulations, your Vault has chosen the RobCo Pip-Boy 3000 Personal Information Processor Deluxe Special Max Turbo Limited Edition! To help with navigation, we have provided the following definitions. North, South, West, East."

/obj/item/pda/neko
	icon_state = "pda-neko"
	overlays_icons = list('icons/obj/pda_alt.dmi' = list("pda-r", "screen_neko", "id_overlay", "insert_overlay", "light_overlay", "pai_overlay"))
	desc = "A portable microcomputer by RobCo Industries. This model is a special feline edition."
	note = "Congratulations, your Vault has chosen the RobCo Pip-Boy 3000 Personal Information Processor Deluxe Special Max Turbo Limited Edition NYA~!  To help with navigation, we have provided the following definitions. North, South, West, East."

/obj/item/pda/cook
	icon_state = "pda-cook"

/obj/item/pda/bar
	icon_state = "pda-bartender"
	inserted_item = /obj/item/pen/fountain

/obj/item/pda/atmos
	default_cartridge = /obj/item/cartridge/atmos
	icon_state = "pda-atmos"

/obj/item/pda/chemist
	default_cartridge = /obj/item/cartridge/chemistry
	icon_state = "pda-chemistry"

/obj/item/pda/geneticist
	default_cartridge = /obj/item/cartridge/medical
	icon_state = "pda-genetics"
