// Parent object, not histscan.
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
	ricochets_max = 50	//Honk!
	ricochet_chance = 80
	is_reflectable = TRUE
	wound_bonus = -20
	bare_wound_bonus = 10
	impact_effect_type = /obj/effect/temp_visual/impact_effect/red_laser
	light_color = LIGHT_COLOR_RED

/obj/item/projectile/beam/laser
	name = "laser bolt"
	damage = 32
	armour_penetration = 0.3//It's a concentrated beam of light.
	wound_bonus = 20//Ditto.
	bare_wound_bonus = 5//As above.
	hitscan = TRUE
	tracer_type = /obj/effect/projectile/tracer/laser
	muzzle_type = /obj/effect/projectile/muzzle/laser
	impact_type = /obj/effect/projectile/impact/laser

/obj/item/projectile/beam/laser/recharger
	name = "recharger bolt"
	impact_effect_type = /obj/effect/temp_visual/impact_effect/blue_laser
	tracer_type = /obj/effect/projectile/tracer/pulse
	muzzle_type = /obj/effect/projectile/muzzle/pulse
	impact_type = /obj/effect/projectile/impact/pulse
	light_color = LIGHT_COLOR_BLUE

/obj/item/projectile/beam/laser/recharger/pistol
	name = "recharger bolt"
	damage = 24
	armour_penetration = 0.1

/obj/item/projectile/beam/laser/wattz2k
	name = "heavy laser bolt"
	damage = 38
	wound_bonus = 20
	bare_wound_bonus = 20
	armour_penetration = 0.4
	tracer_type = /obj/effect/projectile/tracer/heavy_laser
	muzzle_type = /obj/effect/projectile/muzzle/heavy_laser
	impact_type = /obj/effect/projectile/impact/heavy_laser

/obj/item/projectile/beam/laser/wattz2k/musket
	damage = 40
	armour_penetration = 0.6

/obj/item/projectile/beam/laser/gatling
	name = "laser bolt"
	damage = 16
	armour_penetration = 0

/obj/item/projectile/beam/laser/gatling/sentrybot
	damage = 15
	armour_penetration = 0.3
	wound_bonus = 45
	bare_wound_bonus = 50

/obj/item/projectile/beam/laser/pistol
	name = "laser bolt"
	damage = 24
	armour_penetration = 0.1//Less concentrated beam of light.
	wound_bonus = 6//Ditto.
	bare_wound_bonus = 12

/obj/item/projectile/beam/laser/pistol/wattz
	name = "feeble laser bolt"
	damage = 18

/obj/item/projectile/beam/laser/pistol/stun
	name = "compliance beam"
	damage = 32
	armour_penetration = 0.5
	damage_type = STAMINA
	impact_effect_type = /obj/effect/temp_visual/impact_effect/blue_laser
	light_color = LIGHT_COLOR_BLUE
	tracer_type = /obj/effect/projectile/tracer/disabler
	muzzle_type = /obj/effect/projectile/muzzle/disabler
	impact_type = /obj/effect/projectile/impact/disabler
