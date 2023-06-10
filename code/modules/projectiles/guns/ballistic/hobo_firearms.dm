/obj/item/gun/ballistic/automatic/zipgun
	name = "Zip gun (9mm)"
	icon_state = "zipgun"
	desc = "A crudely handcrafted zip gun that uses 9mm ammo."
	item_state = "gun"
	w_class = WEIGHT_CLASS_SMALL
	weapon_weight = WEAPON_LIGHT
	slowdown = 0.1
	mag_type = /obj/item/ammo_box/magazine/zipgun
	force = 16
	spread = 8
	fire_delay = 4
	burst_size = 1
	extra_damage = 3
	fire_sound = 'sound/f13weapons/9mm.ogg'

/obj/item/gun/ballistic/automatic/hobo/zipgun/update_icon_state()
	icon_state = "zipgun[magazine ? "-[CEILING(get_ammo(0)/1, 1)*1]" : ""][chambered ? "" : "-e"][suppressed ? "-suppressed" : ""]"

/obj/item/gun/ballistic/revolver/piperifle
	name = "pipe rifle (.223)"
	desc = "A rusty piece of pipe used to fire .223 and 5,56mm ammo."
	icon_state = "piperifle"
	item_state = "pepperbox"
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/improvisedpipe
	force = 20
	fire_delay = 0.25
	spread = 2
	extra_damage = 4
	fire_sound = 'sound/f13weapons/varmint_rifle.ogg'
