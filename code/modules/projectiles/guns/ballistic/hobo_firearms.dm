/obj/item/gun/ballistic/automatic/zipgun
	name = "pipe gun (9mm)"
	icon_state = "zipgun"
	desc = "A crudely handcrafted piece of metal that slings 9mm munitions. As dangerous to you as it is the enemy."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
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
	recoil = 0.25
	condition_mul = 3
	fire_sound = 'sound/f13weapons/9mm.ogg'

/obj/item/gun/ballistic/automatic/hobo/zipgun/update_icon_state()
	icon_state = "zipgun[magazine ? "-[CEILING(get_ammo(0)/1, 1)*1]" : ""][chambered ? "" : "-e"][suppressed ? "-suppressed" : ""]"

/obj/item/gun/ballistic/revolver/piperifle
	name = "pipe revolver rifle (.223)"
	desc = "A rusty piece of pipe, fitted with a makeshift cylinder and used to fire .223 and 5.56mm ammo."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
	icon_state = "piperifle"
	item_state = "pepperbox"
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/improvisedpipe
	force = 20
	fire_delay = 0.25
	spread = 2
	extra_damage = 4
	condition_mul = 3
	can_jam = FALSE
	fire_sound = 'sound/f13weapons/varmint_rifle.ogg'

/obj/item/gun/ballistic/automatic/autopipe
	name = "auto-pipe rifle (.357)"
	desc = "A belt fed pipe rifle held together with hope and a prayer. Highly inaccurate."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
	icon_state = "autopipe"
	item_state = "autopipe"
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	mag_type = /obj/item/ammo_box/magazine/autopipe
	force = 20
	recoil = 2
	is_automatic = TRUE
	automatic = 1
	autofire_shot_delay = 1.75
	spread = 15
	extra_damage = -6
	condition_mul = 6
	fire_sound = 'sound/weapons/Gunshot.ogg'

/obj/item/gun/ballistic/automatic/autopipe/update_icon_state()
	icon_state = "autopipe[magazine ? "-[CEILING(get_ammo(0)/1, 6)*1]" : ""][chambered ? "" : "-e"][suppressed ? "-suppressed" : ""]"
