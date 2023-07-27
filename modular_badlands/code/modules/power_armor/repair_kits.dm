/obj/item/repair_kit
	icon = 'icons/fallout/objects/crafting/tool.dmi'
	lefthand_file = 'icons/fallout/onmob/tools/kit_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/tools/kit_righthand.dmi'
	w_class = WEIGHT_CLASS_SMALL
	var/uses_left = 1

/obj/item/repair_kit/weapon_repair_kit
	name = "weapon repair kit"
	desc = "It can be used to repair your weapons, but that's about it."
	icon_state = "weapon_repair_set"
	item_state = "sewingkit"//temp
	uses_left = 5

/obj/item/repair_kit/pa_repair_kit
	name = "power armor repair kit"
	desc = "It can be used to repair your power armor, but that's about it."
	icon_state = "repairkitPA"
	item_state = "sewingkit"//temp
	uses_left = 5

/obj/item/repair_kit/arm_repair_kit
	name = "armor repair kit"
	desc = "It can be used to repair your armor, but that's about it."
	icon_state = "repairkitarmor"
	item_state = "sewingkit"//temp
	uses_left = 5

/obj/item/repair_kit/reloader_set
	name = "powder kit"
	desc = "Used to create additional ammunition. Not good for much else."
	icon_state = "reloader_set"
	item_state = "sewingkit"//temp

/obj/item/repair_kit/sewingkit
	name = "sewing kit"
	desc = "A box with thread, buttons and a selection of needles, for making and mending clothing."
	icon_state = "sewingkit"
	item_state = "sewingkit"
	uses_left = 5

/obj/item/repair_kit/dyeset
	name = "dye set"
	desc = "A tray with various dyes, needed to color clothing."
	icon_state = "dyeset"
	item_state = "dyeset"
