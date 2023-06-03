// Shotgun

/obj/item/ammo_casing/shotgun
	name = "shotgun slug"
	desc = "A 12 gauge lead slug."
	icon = 'icons/fallout/objects/guns/ammo.dmi'
	icon_state = "bbshell"
	caliber = "shotgun"
	projectile_type = /obj/item/projectile/bullet/shotgun_slug
	custom_materials = list(/datum/material/iron=250, /datum/material/blackpowder=70)

/obj/item/ammo_casing/shotgun/buckshot
	name = "buckshot shell"
	desc = "A 12 gauge buckshot shell."
	icon_state = "gshell"
	projectile_type = /obj/item/projectile/bullet/pellet/shotgun_buckshot
	pellets = 6
	variance = 18

/obj/item/ammo_casing/shotgun/improvised
	name = "improvised shell"
	desc = "An extremely weak shotgun shell with multiple small pellets made out of metal shards."
	icon_state = "improvshell"
	projectile_type = /obj/item/projectile/bullet/pellet/shotgun_improvised
	custom_materials = list(/datum/material/iron=250)
	pellets = 10
	variance = 25

/obj/item/ammo_casing/shotgun/techshell
	name = "unloaded technological shell"
	desc = "A high-tech shotgun shell which can be loaded with materials to produce unique effects."
	icon_state = "cshell"
	projectile_type = null

/obj/item/ammo_casing/shotgun/dart
	name = "shotgun dart"
	desc = "A dart for use in shotguns. Can be injected with up to 30 units of any chemical."
	icon_state = "cshell"
	projectile_type = /obj/item/projectile/bullet/dart
	var/reagent_amount = 30

/obj/item/ammo_casing/shotgun/dart/Initialize()
	. = ..()
	create_reagents(reagent_amount, OPENCONTAINER)

/obj/item/ammo_casing/shotgun/dart/attackby()
	return

/obj/item/ammo_casing/shotgun/dart/noreact
	name = "cryostasis shotgun dart"
	desc = "A dart for use in shotguns. Uses technology similar to cryostasis beakers to keep internal reagents from reacting. Can be injected with up to 10 units of any chemical."
	icon_state = "cnrshell"
	reagent_amount = 10

/obj/item/ammo_casing/shotgun/dart/noreact/Initialize()
	. = ..()
	ENABLE_BITFIELD(reagents.reagents_holder_flags, NO_REACT)

/obj/item/ammo_casing/shotgun/dart/bioterror
	desc = "A shotgun dart filled with an obscene amount of lethal reagents. God help whoever is shot with this."
	projectile_type = /obj/item/projectile/bullet/dart/piercing
	reagent_amount = 50

/obj/item/ammo_casing/shotgun/dart/bioterror/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/toxin/amanitin, 12) //for a nasty surprise after you get shot and somehow escape and don't think to quickly purge, and even shock those who are loaded up on purging agents
	reagents.add_reagent(/datum/reagent/toxin/chloralhydrate, 6)
	reagents.add_reagent(/datum/reagent/toxin/mutetoxin, 6) //;HELPIES OPS IN MAINT
	reagents.add_reagent(/datum/reagent/impedrezene, 6)
	reagents.add_reagent(/datum/reagent/toxin/acid/fluacid, 5) //this and the acid equal about 25ish burn, not counting the minute toxin damage dealt by their metabolism, this makes each dart about as lethal as a stechkin shot in upfront damage
	reagents.add_reagent(/datum/reagent/toxin/acid, 5)
	reagents.add_reagent(/datum/reagent/consumable/frostoil, 10) //tempgun slowdown goes both ways and adds to the burn

/obj/item/ammo_casing/shotgun/flechette
	name = "12 gauge flechette shell"
	desc = "It's a 12-gauge flechette shell."
	icon_state = "magshell"
	projectile_type = /obj/item/projectile/bullet/pellet/flechette
	pellets = 24
	variance = 24
