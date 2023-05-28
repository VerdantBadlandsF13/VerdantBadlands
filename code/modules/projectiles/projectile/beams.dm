/obj/item/projectile/beam
	name = "laser"
	icon_state = "laser"
	pass_flags = PASSTABLE| PASSGLASS
	damage = 20
	light_range = 2
	damage_type = BURN
	hitsound = 'sound/weapons/sear.ogg'
	hitsound_wall = 'sound/weapons/effects/searwall.ogg'
	flag = "laser"
	eyeblur = 2
	impact_effect_type = /obj/effect/temp_visual/impact_effect/red_laser
	light_color = LIGHT_COLOR_RED
	ricochets_max = 50	//Honk!
	ricochet_chance = 80
	is_reflectable = TRUE
	wound_bonus = -20
	bare_wound_bonus = 10

/obj/item/projectile/beam/laser
	tracer_type = /obj/effect/projectile/tracer/laser
	muzzle_type = /obj/effect/projectile/muzzle/laser
	impact_type = /obj/effect/projectile/impact/laser

/obj/item/projectile/beam/laser/lasgun
	name = "laser beam"
	damage = 32
	armour_penetration = 0.1//It's a concentrated beam of light.
	wound_bonus = 20//Ditto.
	bare_wound_bonus = 5//As above.
	hitscan = TRUE
	tracer_type = /obj/effect/projectile/tracer/laser
	muzzle_type = /obj/effect/projectile/muzzle/laser
	impact_type = /obj/effect/projectile/impact/laser

/obj/item/projectile/beam/laser/lasgun/sentrybot
	damage = 15
	armour_penetration = 0.3
	wound_bonus = 45
	bare_wound_bonus = 50

/obj/item/projectile/beam/laser/lasgun/recharger
	name = "recharger beam"
	tracer_type = /obj/effect/projectile/tracer/pulse
	muzzle_type = /obj/effect/projectile/muzzle/pulse
	impact_type = /obj/effect/projectile/impact/pulse
	light_color = LIGHT_COLOR_BLUE

/obj/item/projectile/beam/laser/gatling
	name = "laser beam"
	damage = 16
	armour_penetration = 0
	hitscan = TRUE
	tracer_type = /obj/effect/projectile/tracer/laser
	muzzle_type = /obj/effect/projectile/muzzle/laser
	impact_type = /obj/effect/projectile/impact/laser

/obj/item/projectile/beam/laser/pistol
	name = "laser beam"
	damage = 24
	hitscan = TRUE
	armour_penetration = 0.08//Less concentrated beam of light.
	wound_bonus = 6//Ditto.
	bare_wound_bonus = 12//As above.
	tracer_type = /obj/effect/projectile/tracer/laser
	muzzle_type = /obj/effect/projectile/muzzle/laser
	impact_type = /obj/effect/projectile/impact/laser

/obj/item/projectile/beam/laser/lasgun/recharger/pistol
	name = "recharger beam"
	damage = 20
	hitscan = TRUE
	armour_penetration = 0.02
	tracer_type = /obj/effect/projectile/tracer/pulse
	muzzle_type = /obj/effect/projectile/muzzle/pulse
	impact_type = /obj/effect/projectile/impact/pulse
	light_color = LIGHT_COLOR_BLUE

/obj/item/projectile/beam/laser/gatling //Gatling Laser Projectile
	name = "rapid-fire laser beam"
	damage = 12

/obj/item/projectile/beam/laser/pistol/wattz/hitscan //hitscan wattz
	name = "weak laser beam"
	damage = 18
	hitscan = TRUE
	tracer_type = /obj/effect/projectile/tracer/laser
	muzzle_type = /obj/effect/projectile/muzzle/laser
	impact_type = /obj/effect/projectile/impact/laser

/obj/item/projectile/beam/laser/wattz2k
	name = "laser bolt"
	damage = 38
	wound_bonus = 20
	bare_wound_bonus = 20
	armour_penetration = 0.2
	tracer_type = /obj/effect/projectile/tracer/heavy_laser
	muzzle_type = /obj/effect/projectile/muzzle/heavy_laser
	impact_type = /obj/effect/projectile/impact/heavy_laser
	hitscan = TRUE

/obj/item/projectile/beam/laser/musket //musket
	name = "laser bolt"
	damage = 40
	armour_penetration = 0.6

/obj/item/projectile/plasma
	name = "plasma bolt"
	icon_state = "plasma_clot"
	damage_type = BURN
	damage = 35
	armour_penetration = 0
	flag = "energy"
	wound_bonus = 45
	eyeblur = 0
	is_reflectable = FALSE
	pixels_per_second =  TILES_TO_PIXELS(10)

/obj/item/projectile/plasma/pistol
	damage = 20
