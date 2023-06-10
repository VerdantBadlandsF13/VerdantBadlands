/obj/item/gun/energy/pulse
	name = "\improper YK42B Pulse Rifle"
	desc = "The YK42B is an electrical pulse weapon developed by the Yuma Flats Energy Consortium. \
	It excels in damage against heavily armored opponents, especially those in power armor."
	icon = 'icons/fallout/objects/guns/energy.dmi'
	lefthand_file = 'icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/guns_righthand.dmi'
	icon_state = "yk42"
	item_state = "yk42"
	can_flashlight = 1
	w_class = WEIGHT_CLASS_BULKY
	flags_1 =  CONDUCT_1
	slot_flags = ITEM_SLOT_BACK
	ammo_type = list(/obj/item/ammo_casing/energy/ion)
	shaded_charge = 1
	weapon_weight = WEAPON_HEAVY
	slowdown = 0.25
	flight_x_offset = 17
	flight_y_offset = 9
	equipsound = 'sound/f13weapons/equipsounds/yk42equip.ogg'
	special_weapon = TRUE

/obj/item/gun/energy/pulse/attackby(obj/item/A, mob/user, params)
	. = ..()
	if(.)
		return
	if(istype(A, /obj/item/stock_parts/cell/ammo))
		var/obj/item/stock_parts/cell/ammo/AM = A
		if(istype(AM, cell_type))
			var/obj/item/stock_parts/cell/ammo/oldcell = cell
			if(user.transferItemToLoc(AM, src))
				cell = AM
				if(oldcell)
					to_chat(user, "<span class='notice'>You perform a tactical reload on \the [src], replacing the cell.</span>")
					oldcell.dropped()
					oldcell.forceMove(get_turf(src.loc))
					oldcell.update_icon()
				playsound(src, 'sound/f13weapons/yk42reload.ogg', 60, TRUE)
				A.update_icon()
				update_icon()
				return 1
			else
				to_chat(user, "<span class='warning'>You cannot seem to get \the [src] out of your hands!</span>")

/obj/item/gun/energy/pulse/emp_act(severity)
	return

/obj/item/gun/energy/gutsy_flamethrower
	name = "integrated flamethrower"
	desc = "An energy-based laser gun that draws power from the cyborg's internal energy cell directly. So, this is what freedom looks like?"
	icon = 'icons/obj/guns/flamethrower.dmi'
	icon_state = "m2_flamethrower_on"
	item_state = "m2flamethrower"
	can_charge = FALSE
	selfcharge = EGUN_SELFCHARGE_BORG
	cell_type = /obj/item/stock_parts/cell/secborg
	charge_delay = 3
	ammo_type = list(/obj/item/ammo_casing/energy/flamethrower)

/obj/item/gun/energy/gutsy_flamethrower/emp_act()
	return

/obj/item/gun/energy/teslacannon
	name = "Tesla Cannon"
	desc = "A shoulder-mounted energy weapon that is powered by electron charge packs that discharges a large electrical impulse upon impact with a much larger area of effect. "
	icon_state = "lasercannon"
	item_state = "laser"
	ammo_type = list(/obj/item/ammo_casing/energy/tesla/teslacannon)
	cell_type = /obj/item/stock_parts/cell/ammo/ecp
	fire_delay = 13
	slowdown = 1
	weapon_weight = WEAPON_HEAVY
	equipsound = 'sound/f13weapons/equipsounds/aer14equip.ogg'
	special_weapon = TRUE

/obj/item/gun/energy/taser
	name = "taser gun"
	desc = "A low-capacity, energy-based stun gun used by security teams to subdue targets at range."
	icon_state = "taser"
	item_state = null	//so the human update icon uses the icon_state instead.
	ammo_type = list(/obj/item/ammo_casing/energy/electrode)
	ammo_x_offset = 3

/obj/item/gun/energy/laser/cyborg
	name = "integrated AER9"
	can_charge = FALSE
	desc = "An energy-based laser gun that draws power from the robot's internal energy cell directly. So this is what freedom looks like?"
	fire_delay = 1
	ammo_type = list(/obj/item/ammo_casing/energy/laser/lasgun)
	icon_state = "laser"
	item_state = "laser-rifle9"
	selfcharge = EGUN_SELFCHARGE_BORG
	cell_type = /obj/item/stock_parts/cell/secborg
	charge_delay = 3

/obj/item/gun/energy/laser/pistol/cyborg
	name = "\improper assaultron AEP7"
	desc = "A basic energy-based laser projector that fires concentrated beams of light from your eye! It draws power from your cell so try not to go crazy."
	can_scope = FALSE
	can_charge = FALSE
	selfcharge = EGUN_SELFCHARGE_BORG
	cell_type = /obj/item/stock_parts/cell/secborg
	charge_delay = 3

/obj/item/gun/energy/laser/pistol/cyborg/gutsy
	name = "\improper integrated AEP7"
	desc = "An integrated laser pistol that draws power directly from your cell."

/obj/item/gun/energy/taser
	name = "taser gun"
	desc = "A low-capacity, energy-based stun gun used by security teams to subdue targets at range."
	icon_state = "taser"
	item_state = null	//so the human update icon uses the icon_state instead.
	ammo_type = list(/obj/item/ammo_casing/energy/electrode)
	ammo_x_offset = 3

/obj/item/gun/energy/e_gun/advtaser/cyborg
	name = "cyborg taser"
	desc = "An integrated hybrid taser that draws directly from a cyborg's power cell. The one contains a limiter to prevent the cyborg's power cell from overheating."
	icon = 'icons/obj/items_cyborg.dmi'
	icon_state = "taser"
	can_flashlight = FALSE
	can_charge = FALSE
	selfcharge = EGUN_SELFCHARGE_BORG
	cell_type = /obj/item/stock_parts/cell/secborg
	charge_delay = 5

/obj/item/gun/energy/e_gun/advtaser/cyborg/mean
	desc = "An integrated hybrid taser that draws directly from a cyborg's power cell."
	use_cyborg_cell = TRUE
	selfcharge = EGUN_NO_SELFCHARGE

/obj/item/gun/energy/disabler
	name = "disabler"
	desc = "A self-defense weapon that exhausts organic targets, weakening them until they collapse."
	icon_state = "disabler"
	item_state = null
	ammo_type = list(/obj/item/ammo_casing/energy/disabler)
	ammo_x_offset = 3

/obj/item/gun/energy/disabler/cyborg
	name = "cyborg disabler"
	desc = "An integrated disabler that draws from a cyborg's power cell. This one contains a limiter to prevent the cyborg's power cell from overheating."
	icon = 'icons/obj/items_cyborg.dmi'
	icon_state = "taser"
	item_state = "taser"
	can_charge = FALSE
	selfcharge = EGUN_SELFCHARGE_BORG
	cell_type = /obj/item/stock_parts/cell/secborg
	charge_delay = 5

/obj/item/gun/energy/disabler/cyborg/mean
	desc = "An integrated disabler that draws from a cyborg's power cell."
	use_cyborg_cell = TRUE
	selfcharge = EGUN_NO_SELFCHARGE
