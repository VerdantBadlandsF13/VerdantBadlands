
//Reminders-
// If you add something to this list, please group it by type and sort it alphabetically instead of just jamming it in like an animal
// cost = 700- Minimum cost, or infinite points are possible.
//////////////////////////////////////////////////////////////////////////////
//////////////////////////// Emergency ///////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/supply_pack/emergency
	group = "Emergency"

/datum/supply_pack/emergency/pipboy
	name = "PIPboy Crate"
	desc = "3 PIP-boys, buy two and get the third for free. Made from the one of the last facto´ries that makes them."
	cost = 1000
	contains = list(/obj/item/pda,
					/obj/item/pda,
					/obj/item/pda)

/datum/supply_pack/emergency/caps
	name = "Caps Crate"
	desc = "Ten thousand points, converted to one hundred caps."
	cost = 10000
	contains = list(/obj/item/stack/f13Cash/caps/onezerozero)

/datum/supply_pack/emergency/mre
	name = "MRE Packs (Emergency Rations)"
	desc = "The lights are out. Oxygen's running low. You've run out of food except space weevils. Don't let this be you! Order our NT branded MRE kits today! This pack contains 5 MRE packs with a randomized menu and an oxygen tank."
	cost = 2000
	contains = list(/obj/item/storage/box/mre/menu1/safe,
					/obj/item/storage/box/mre/menu1/safe,
					/obj/item/storage/box/mre/menu2/safe,
					/obj/item/storage/box/mre/menu2/safe,
					/obj/item/storage/box/mre/menu3,
					/obj/item/storage/box/mre/menu4/safe)
	crate_name = "MRE crate (emergency rations)"
