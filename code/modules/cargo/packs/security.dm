
//Reminders-
// If you add something to this list, please group it by type and sort it alphabetically instead of just jamming it in like an animal
// cost = 700- Minimum cost, or infinite points are possible.
//////////////////////////////////////////////////////////////////////////////
//////////////////////////// Security ////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/supply_pack/security
	group = "Security"
	crate_type = /obj/structure/closet/crate/secure/gear
	can_private_buy = FALSE

//fallout changes

/datum/supply_pack/security/binocularamapf13
	name = "Binoculars and map Crate"
	desc = "Contains three Binoculars and a map. A must for any scouts of the brotherhood."
	cost = 10000
	contains = list(/obj/item/binoculars,
					/obj/item/binoculars,
					/obj/item/binoculars,
					/obj/item/weapon/maptool)

/datum/supply_pack/security/binocularamapf13
	name = "Mortar shells Crate"
	desc = "Contains five mortars. Make sure to aim for the enemy."
	cost = 40000
	contains = list(/obj/item/mortar_shell,
					/obj/item/mortar_shell,
					/obj/item/mortar_shell,
					/obj/item/mortar_shell,
					/obj/item/mortar_shell)
