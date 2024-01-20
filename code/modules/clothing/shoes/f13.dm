//Fallout 13 shoes directory
/*
/obj/item/clothing/shoes
	var/stepsound = TRUE
*/
/obj/item/clothing/shoes/f13
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/shoes
	mutantrace_variation = NONE // Temporal fix until digitigrade-adapted sprites are done

/obj/item/clothing/shoes/f13/rag
	name = "footcloths"
	desc = "Ripped cloth used as improvised foot strips, instead of shoes. Crude and gets dirty fast."
	icon_state = "rag"
	item_state = "rag"
	can_be_tied = FALSE

/obj/item/clothing/shoes/f13/raidertreads
	name = "raider treads"
	desc = "A decrepit boot on one foot, fuckall on the other, the height of raider fashion."
	icon_state = "raidertreads"
	item_state = "raidertreads"
	can_be_tied = FALSE

/obj/item/clothing/shoes/f13/military
	name = "military boots"
	desc = "High speed, no-drag combat boots, designed for use by the U.S. Army before the Great War."
	icon_state = "military"
	item_state = "military"
	strip_delay = 40
	lace_time = 12 SECONDS

/obj/item/clothing/shoes/f13/military/leather
	name = "leather combat boots"
	desc = "A pair of laced, heavy-duty leather boots designed for hard combat."
	icon_state = "laced"
	item_state = "laced"

/obj/item/clothing/shoes/f13/military/explorer
	name = "worn boots"
	desc = "A pair of slightly worn, steel-toed work boots.<br>Good at keeping toes safe from falling junk you find amid the ruins."
	icon_state = "explorer"

/obj/item/clothing/shoes/f13/tan
	name = "tan shoes"
	desc = "A pair of tanned leather shoes."
	icon_state = "tan"
	item_state = "tan"

/obj/item/clothing/shoes/f13/brownie
	name = "brown shoes"
	desc = "A pair of brown leather shoes made of wasteland animals hides."
	icon_state = "brownie"
	item_state = "brownie"

/obj/item/clothing/shoes/f13/fancy
	name = "black shoes"
	desc = "A pair of fancy black shoes."
	icon_state = "fancy"
	item_state = "fancy"

// GMB
/obj/item/clothing/shoes/f13/military/gmb
	name = "laced militia boots"
	desc = "A pair of laced, heavy-duty leather boots"
	icon = 'icons/fallout/clothing/bl_mountain.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/bl_mountain.dmi'
	icon_state = "gmboot"
	item_state = "gmboot"

/obj/item/clothing/shoes/f13/military/gmb/leather
	name = "leather militia boots"
	desc = "A pair of laced, heavy-duty leather boots designed for hiking."
	icon_state = "leatherboots"
	item_state = "leatherboots"
