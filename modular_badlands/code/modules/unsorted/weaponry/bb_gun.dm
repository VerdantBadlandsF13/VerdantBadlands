// bb gun
/obj/item/ammo_box/bbs
	name = "ammo box (BBs)"
	icon_state = "BBbox"
	ammo_type = /obj/item/ammo_casing/caseless/bb
	max_ammo = 100
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/ammo_box/magazine/internal/bb
	name = "bb gun magazine"
	desc = "..."
	ammo_type = /obj/item/ammo_casing/caseless/bb
	caliber = "bb"
	max_ammo = 50
	multiload = 1

/obj/item/ammo_casing/caseless/bb
	desc = "A bb"
	caliber = "bb"
	projectile_type = /obj/item/projectile/bullet/F13/bbBullet
	randomspread = 1
	variance = 1

/obj/item/projectile/bullet/F13/bbBullet
	damage = 5

//BB gun
/obj/item/gun/ballistic/shotgun/bb
	name = "BB gun"
	desc = "A Red Ryder BB gun. The classic."
	icon_state = "bb_gun"
	item_state = "varmintrifle"
	dryfire_sound = 'sound/f13weapons/bbgun_noammo.ogg'
	mag_type = /obj/item/ammo_box/magazine/internal/bb
	can_bayonet = FALSE
	pump_sound = 'sound/f13weapons/BBgun_pump.ogg'
	fire_sound = 'sound/f13weapons/BBgun_fire.ogg'
	fire_delay = 3
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
