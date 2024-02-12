////////////////////
// .22 LONG RIFLE //
////////////////////

/obj/item/projectile/bullet/c22
	name = ".22lr bullet"
	damage = 12
	wound_bonus = 6

/obj/item/projectile/bullet/c22/junk
	damage = 10

/////////////////
// .38 SPECIAL //
/////////////////

/obj/item/projectile/bullet/c38
	name = ".38 bullet"
	damage = 14
	wound_bonus = 12

/obj/item/projectile/bullet/c38/junk
	damage = 12

//////////
// 9 MM //
//////////

/obj/item/projectile/bullet/c9mm
	name = "9mm FMJ bullet"
	damage = 16
	wound_bonus = 10

/obj/item/projectile/bullet/c9mm/junk
	damage = 14

///////////
// 10 MM //
///////////

/obj/item/projectile/bullet/c10mm
	name = "10mm FMJ bullet"
	damage = 18
	wound_bonus = 24

/obj/item/projectile/bullet/c10mm/junk
	damage = 16

/////////////
// .45 ACP //
/////////////

/obj/item/projectile/bullet/c45
	name = ".45 FMJ bullet"
	damage = 24
	wound_bonus = 15

/obj/item/projectile/bullet/c45/junk
	damage = 22

/obj/item/projectile/bullet/c45/basketball
	name = "miniaturised dunk'em brand basketball"
	damage = 2
	stamina = 10

/////////////////
// .357 MAGNUM //
/////////////////

/obj/item/projectile/bullet/a357
	name = ".357 FMJ bullet"
	damage = 28
	wound_bonus = 20
	bare_wound_bonus = -14

/obj/item/projectile/bullet/a357/junk
	damage = 26

////////////////
// .44 MAGNUM //
////////////////

/obj/item/projectile/bullet/m44
	name = ".44 FMJ bullet"
	damage = 32
	wound_bonus = 24
	bare_wound_bonus = -20

/obj/item/projectile/bullet/m44/junk
	damage = 30

////////////////
//   .50 AE   //
////////////////

/obj/item/projectile/bullet/m50
	name = ".50 AE bullet"
	damage = 32
	wound_bonus = 24
	bare_wound_bonus = 24
	armour_penetration = 0.8

////////////
// .45-70 //
////////////

/obj/item/projectile/bullet/c4570
	name = ".45-70 FMJ bullet"
	damage = 42
	wound_bonus = 32
	bare_wound_bonus = -24

///////////
// 14 MM //
///////////

/obj/item/projectile/bullet/mm14
	name = "14mm FMJ bullet"
	damage = 32
	wound_bonus = 42
	bare_wound_bonus = 28

/////////////
// NEEDLER //
/////////////

/obj/item/projectile/bullet/needle
	name = "needle"
	icon_state = "cbbolt"
	damage = 25
	armour_penetration = 1//Low damage, 100% pen.

/obj/item/projectile/bullet/needle/Initialize()
	. = ..()
	create_reagents(10, INJECTABLE | DRAWABLE)

/obj/item/projectile/bullet/needle/on_hit(atom/target, blocked = FALSE, skip = FALSE)
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		if(blocked != 100) // not completely blocked
			if(M.can_inject(null, FALSE, def_zone)) // Pass the hit zone to see if it can inject by whether it hit the head or the body.
				..()
				if(skip == TRUE)
					return BULLET_ACT_HIT
				reagents.reaction(M, INJECT)
				reagents.trans_to(M, reagents.total_volume)
				return TRUE
			else
				blocked = 100
				target.visible_message("<span class='danger'>\The [src] was deflected!</span>", \
									   "<span class='userdanger'>You were protected against \the [src]!</span>")

	..(target, blocked)
	DISABLE_BITFIELD(reagents.reagents_holder_flags, NO_REACT)
	reagents.handle_reactions()
	return BULLET_ACT_HIT
