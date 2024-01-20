//////////////////
//PLASMA WEAPONS//
//////////////////

/obj/item/gun/energy/laser/plasma
	name = "\improper Urban Plasma Rifle"
	desc = "A development from the much larger Winchester Model P94. Designed at the request of the United States Army prior to the war, it had only just \
	begun entering service by the time of the Great War."
	item_state = "plasma"
	icon_state = "plasma"
	armour_penetration = 0.1
	slowdown = 0.75
	can_charge = 0
	fire_delay = 5.2
	recoil = 0.25
	ammo_type = list(/obj/item/ammo_casing/energy/plasma)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	equipsound = 'sound/f13weapons/equipsounds/plasequip.ogg'
	special_weapon = TRUE

/obj/item/gun/energy/laser/plasma/glock
	name = "\improper Glock 86 Plasma Pistol"
	desc = "Glock 86 Plasma Pistol. Designed by the Gaston Glock artificial intelligence. Shoots a small bolt of superheated plasma. Powered by a small energy cell."
	item_state = "plasma-pistol"
	icon_state = "glock86"
	slowdown = 0.1
	recoil = 0.15
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	slot_flags = ITEM_SLOT_BELT
	ammo_type = list(/obj/item/ammo_casing/energy/plasma/pistol)
	equipsound = 'sound/f13weapons/equipsounds/pistolplasequip.ogg'
	cell_type = /obj/item/stock_parts/cell/ammo/ec
	special_weapon = TRUE

/obj/item/gun/energy/laser/plasma/glock/gutsy
	name ="\improper integrated plasma pistol"
	desc = "A pistol-sized miniaturized plasma caster. It fires a bolt of superhot ionized gas."
	item_state = "plasma-pistol"
	icon_state = "plasma-pistol"
	selfcharge = EGUN_SELFCHARGE_BORG
	special_weapon = FALSE
