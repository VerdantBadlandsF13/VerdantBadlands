////////////////////
// 5.56 MM & .223 //
////////////////////

/obj/item/projectile/bullet/a556
	name = "5.56 FMJ bullet"
	damage = 26
	armour_penetration = 0.25
	wound_bonus = 18
	bare_wound_bonus = 24

// For use against simple mobs.
// Also carries a fairly strong wound bonus, to make it viable in PvP.
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

// For use against simple mobs.
// Also carries a fairly strong wound bonus, to make it viable in PvP.
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
	pixels_per_second = 4000
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
	name = "4.73 FMJ bullet"
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
