/*
Arc Welders.
TODO: Add the sound loop, when equipped.
*/
/obj/item/gun/energy/arcwelder
	name = "\improper Arc Welder"
	desc = "An industrial welding tool, repurposed some time after the Great War. <br>\
	This weapon, while powerful, uses the incredibly rare electron charge pack. Utilise it sparingly."

	icon = 'modular_badlands/code/modules/unsorted/icons/weapons_64x32.dmi'
	mob_overlay_icon = 'modular_badlands/code/modules/unsorted/icons/backslot_weapon.dmi'
	lefthand_file = 'modular_badlands/code/modules/unsorted/icons/items_lefthand.dmi'
	righthand_file = 'modular_badlands/code/modules/unsorted/icons/items_righthand.dmi'

	icon_state = "arcweld"
	item_state = "arcweld"

	ammo_type = list(/obj/item/ammo_casing/energy/tesla/arc)
	cell_type = /obj/item/stock_parts/cell/ammo/ecp

	fire_sound = 'modular_badlands/code/modules/unsorted/sound/arcweld_fire.ogg'
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	slot_flags = null// NO
	can_suppress = FALSE
	can_scope = FALSE
	slowdown = 1
	fire_delay = 0
	inaccuracy_modifier = 0.25
	special_weapon = TRUE
