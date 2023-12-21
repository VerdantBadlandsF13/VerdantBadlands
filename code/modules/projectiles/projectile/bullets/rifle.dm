//////////////////////
// AMMUNITION TYPES //
//////////////////////

/*
FMJ - Exclusive to looting. Very slim chance to pass through a target and hit someone else. Good AP and no condition malus.

HP - Exclusive to looting. Less AP. Significant tissue damage, although it 'shatters' on impact against armour.

DU - Unobtanium. Super high AP and hits multiple targets. Unique to high powered weaponry, such as the AMR and mounted guns.

JNK - The standard ammunition for crafting and almost every obtainable firearm at round start.
Incurs a significant condition malus, travels ever slightly slower and possesses less slightly lower AP.

CTM - Contaminated ammunition. Identical to junk rounds, but has a very slight chance to cause infections.
*/

////////////////////
// 5.56 MM & .223 //
////////////////////

/obj/item/projectile/bullet/a556
	name = "5.56 FMJ bullet"
	damage = 26
	armour_penetration = 0.25
	wound_bonus = 18
	bare_wound_bonus = 24

/obj/item/projectile/bullet/a556/junk
	name = "hand loaded 5.56 bullet"
	pixels_per_second = TILES_TO_PIXELS(13)
	armour_penetration = 0.15

/obj/item/projectile/bullet/a556/a223
	name = ".223 FMJ bullet"
	damage = 24
	wound_bonus = 24
	bare_wound_bonus = 32
	supereffective_damage = 24
	supereffective_faction = list("hostile", "ant", "deathclaw", "cazador", "china", "gecko", "radscorpion")

////////////////////
// 7.62 MM & .308 //
////////////////////

/obj/item/projectile/bullet/a762
	name = "7.62 FMJ bullet"
	damage = 34
	armour_penetration = 0.35
	wound_bonus = 28
	bare_wound_bonus = 24

/obj/item/projectile/bullet/a762/junk
	name = "hand loaded 7.62 bullet"
	pixels_per_second = TILES_TO_PIXELS(13)
	armour_penetration = 0.25

/obj/item/projectile/bullet/a762/a308
	name = ".308 bullet"
	damage = 32
	wound_bonus = 32
	bare_wound_bonus = 42
	supereffective_damage = 24
	supereffective_faction = list("hostile", "ant", "deathclaw", "cazador", "china", "gecko", "radscorpion")

/////////
// .50 //
/////////
/obj/item/projectile/bullet/a50MG
	name = ".50 bullet"
	damage = 75
	armour_penetration = 1
	pixels_per_second = TILES_TO_PIXELS(200)
	zone_accuracy_factor = 100
	wound_bonus = 60
	bare_wound_bonus = 80//Same as the HMG.
	supereffective_damage = 125
	supereffective_faction = list("hostile", "ant", "supermutant", "deathclaw", "cazador", "raider", "china", "gecko", "wastebot", "radscorpion")

// Used, currently, for the emplaced MG.
/obj/item/projectile/bullet/a50MG/depleteduranium
	name = ".50 DU-bullet"
	damage = 15
	armour_penetration = 1
	wound_bonus = 60
	bare_wound_bonus = 80

//////////////////////
// 4.73 MM CASELESS //
//////////////////////

/obj/item/projectile/bullet/a473
	name = "4.73 FMJ bullet"
	damage = 32
	armour_penetration = 0.1
	wound_bonus = 8
	bare_wound_bonus = 12

/obj/item/projectile/bullet/a473/minigun
	damage = 14
	armour_penetration = 0
	wound_bonus = 24
	bare_wound_bonus = 32

//////////////////////////
//		5 MM minigun	//
//////////////////////////

/obj/item/projectile/bullet/m5mm
	damage = 19
	wound_bonus = 24
	bare_wound_bonus = 10
	armour_penetration = 0.50
	supereffective_damage = 10
	supereffective_faction = list("hostile", "ant", "supermutant", "deathclaw", "cazador", "raider", "china", "gecko", "wastebot", "radscorpion")

//////////////////////////
// 5 MM minigun special //
// Intended for SB use  //
//////////////////////////

/obj/item/projectile/bullet/sb5mm
	damage = 16
	wound_bonus = 64
	bare_wound_bonus = 32
	armour_penetration = 0.6

/////////////////////////
//2 MM ELECTROMAGNETIC //
/////////////////////////

/obj/item/projectile/bullet/c2mm
	damage = 62
	wound_bonus = 62
	bare_wound_bonus = 62
	armour_penetration = 0.9
	pixels_per_second = TILES_TO_PIXELS(100)
	supereffective_damage = 62
	supereffective_faction = list("hostile", "ant", "supermutant", "deathclaw", "cazador", "raider", "china", "gecko", "wastebot", "radscorpion")
