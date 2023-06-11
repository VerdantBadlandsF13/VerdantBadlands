///////////////////////
///		Weapons		///
///////////////////////

/obj/effect/spawner/lootdrop/f13/themed_weapons
	name = "PARENT OF WEAPON SPAWNERS"
	lootcount = 1	//how many items will be spawned
	lootdoubles = TRUE	//if the same item can be spawned twice
	fan_out_items = TRUE	//Whether the items should be distributed to offsets 0,1,-1,2,-2,3,-3.. This overrides pixel_x/y on the spawner itself
	loot = list()

// Explosive Pipes retrofitted into technical firearms & beating implements
/obj/effect/spawner/lootdrop/f13/themed_weapons/homemade_guns
	name = "handmade gun"
	loot = list(
		/obj/item/gun/ballistic/automatic/zipgun,
		/obj/item/gun/ballistic/revolver/piperifle,
	)
/obj/effect/spawner/lootdrop/f13/themed_weapons/homemade_bows
	name = "crossbows and bows"
	loot = list(
		/obj/item/gun/ballistic/bow/tribal,
		/obj/item/gun/ballistic/bow/sturdy,
		/obj/item/gun/ballistic/bow/crossbow,
		/obj/item/gun/ballistic/bow/crossbow/xbow,
	)

/obj/effect/spawner/lootdrop/f13/themed_weapons/homemade_melee
	name = "handmade melee"
	loot = list(
		/obj/item/melee/onehanded/machete,
		/obj/item/melee/onehanded/knife/bone,
		/obj/item/melee/onehanded/club,
		/obj/item/melee/onehanded/club/tireiron,
		/obj/item/melee/onehanded/club/fryingpan,
		/obj/item/twohanded/fireaxe/boneaxe,
		/obj/item/twohanded/spear/scrapspear,
		/obj/item/twohanded/spear/bonespear,
	)

// Civilian Class Weapons - "Anything that is something Grandpa would use to commit a hatecrime"
/obj/effect/spawner/lootdrop/f13/themed_weapons/civ_guns_pistol
	name = "civ pistol"
	loot = list(
		/obj/item/gun/ballistic/automatic/pistol/type17,
		/obj/item/gun/ballistic/automatic/pistol/pistol22,
		/obj/item/gun/ballistic/automatic/pistol/ninemil,
		/obj/item/gun/ballistic/revolver/revolver45,
		/obj/item/gun/ballistic/automatic/pistol/m1911,
		/obj/item/gun/ballistic/revolver/colt357,
	)

/obj/effect/spawner/lootdrop/f13/themed_weapons/civ_guns_rifle
	name = "civ rifle"
	loot = list(
		/obj/item/gun/ballistic/rifle/hunting,
		/obj/item/gun/ballistic/rifle/mosin, // Yes. The shitstick is civilian class.
		/obj/item/gun/ballistic/automatic/m1garand,
		/obj/item/gun/ballistic/automatic/rangemaster, // TAKE A LOOK AT - I consider this Civilian, through it may be extremely good for the 'civilian' stuff.

	)

/obj/effect/spawner/lootdrop/f13/themed_weapons/civ_guns_shotgun
	name = "civ shotgun"
	loot = list(
		/obj/item/gun/ballistic/revolver/caravan_shotgun,
		/obj/item/gun/ballistic/revolver/widowmaker,
		/obj/item/gun/ballistic/shotgun/hunting,
		/obj/item/gun/ballistic/shotgun/automatic/combat/shotgunlever,
	)

/obj/effect/spawner/lootdrop/f13/themed_weapons/civ_guns_smg // Police are civilian.
	name = "civ submachinegun"
	loot = list(
		/obj/item/gun/ballistic/automatic/smg/tommygun,
		/obj/item/gun/ballistic/automatic/smg/american180,
	)

/obj/effect/spawner/lootdrop/f13/themed_weapons/civ_guns_all
	name = "civ allguns"
	loot = list(
		/obj/item/gun/ballistic/revolver/caravan_shotgun,
		/obj/item/gun/ballistic/revolver/widowmaker,
		/obj/item/gun/ballistic/rifle/hunting,
		/obj/item/gun/ballistic/rifle/mosin,
		/obj/item/gun/ballistic/automatic/pistol/type17,
		/obj/item/gun/ballistic/automatic/pistol/pistol22,
		/obj/item/gun/ballistic/automatic/pistol/ninemil,
		/obj/item/gun/ballistic/revolver/revolver45,
		/obj/item/gun/ballistic/automatic/pistol/m1911,
		/obj/item/gun/ballistic/automatic/m1garand,
		/obj/item/gun/ballistic/automatic/rangemaster,
		/obj/item/gun/ballistic/revolver/colt357,
	)

/obj/effect/spawner/lootdrop/f13/themed_weapons/civ_guns_longarms
	name = "civ longarms"
	loot = list(
		/obj/item/gun/ballistic/revolver/caravan_shotgun,
		/obj/item/gun/ballistic/revolver/widowmaker,
		/obj/item/gun/ballistic/rifle/hunting,
		/obj/item/gun/ballistic/rifle/mosin,
		/obj/item/gun/ballistic/automatic/m1garand,
		/obj/item/gun/ballistic/automatic/rangemaster,
		/obj/item/gun/ballistic/shotgun/hunting,

	)

/obj/effect/spawner/lootdrop/f13/themed_weapons/civ_melee
	name = "civ melee"
	loot = list(
		/obj/item/melee/onehanded/knife/hunting,
		/obj/item/melee/onehanded/knife/survival,
		/obj/item/melee/onehanded/knife/switchblade,
		/obj/item/twohanded/fireaxe,
		/obj/item/twohanded/fireaxe/bmprsword,
		/obj/item/twohanded/spear,
		/obj/item/twohanded/baseball,
		/obj/item/twohanded/baseball/spiked,
		/obj/item/twohanded/baseball/golfclub,
		/obj/item/twohanded/sledgehammer,
	)
// Military Weapons - "IT'S GOT MILITARY IN THE NAME IT'S DANGEROUS!" - Literally anything not civilian-issue

/obj/effect/spawner/lootdrop/f13/themed_weapons/mil_pistol
	name = "mil pistol"
	loot = list(
		/obj/item/gun/ballistic/automatic/pistol/beretta,
		/obj/item/gun/ballistic/automatic/pistol/beretta/automatic,
		/obj/item/gun/ballistic/automatic/pistol/n99,
		/obj/item/gun/ballistic/automatic/pistol/mk23,
		/obj/item/gun/ballistic/automatic/pistol/deagle/automag,
		/obj/item/gun/ballistic/automatic/pistol/deagle,
		/obj/item/gun/ballistic/automatic/pistol/pistol14, // I mean technically it's military? Technically? It seems more sporting but fuck you.
		/obj/item/gun/ballistic/revolver/hunting,
		/obj/item/gun/ballistic/revolver/needler,
	)

/obj/effect/spawner/lootdrop/f13/themed_weapons/mil_smg
	name = "mil submachineguns"
	loot = list(
		/obj/item/gun/ballistic/automatic/smg/greasegun,
		/obj/item/gun/ballistic/automatic/smg/p90,
		/obj/item/gun/ballistic/automatic/smg/mp5,
	)

/obj/effect/spawner/lootdrop/f13/themed_weapons/mil_rifle
	name = "mil rifle"
	loot = list(
		/obj/item/gun/ballistic/automatic/marksman/sniper,
		/obj/item/gun/ballistic/automatic/assault_rifle,
		/obj/item/gun/ballistic/automatic/type93,
		/obj/item/gun/ballistic/automatic/fnfal,
		/obj/item/gun/ballistic/rifle/enfield, // "MAN THEY PUT AN ENFIELD IN THIS SHIT?"
	)

/obj/effect/spawner/lootdrop/f13/themed_weapons/mil_advrifle
	name = "mil advrifle"
	loot = list(
		/obj/item/gun/ballistic/automatic/g11,
		/obj/item/gun/ballistic/automatic/bozar,
		/obj/item/gun/ballistic/automatic/m72,
		/obj/item/gun/ballistic/rifle/mag/antimateriel,
	)

/obj/effect/spawner/lootdrop/f13/themed_weapons/mil_shotgun
	name = "mil shotgun"
	loot = list(
		/obj/item/gun/ballistic/shotgun/police,
		/obj/item/gun/ballistic/shotgun/trench,
		/obj/item/gun/ballistic/shotgun/automatic/combat/auto5,
	)

/obj/effect/spawner/lootdrop/f13/themed_weapons/mil_advshotgun
	name = "mil advshotgun"
	loot = list(
		/obj/item/gun/ballistic/shotgun/automatic/combat/neostead,
		/obj/item/gun/ballistic/shotgun/automatic/combat/citykiller,
		/obj/item/gun/ballistic/automatic/shotgun/pancor,
	)

/obj/effect/spawner/lootdrop/f13/themed_weapons/mil_machinegun
	name = "mil machinegun"
	loot = list(
		/obj/item/gun/ballistic/automatic/lsw,
		/obj/item/gun/ballistic/automatic/m1919,
	)

/obj/effect/spawner/lootdrop/f13/themed_weapons/mil_longarms
	name = "mil longarms"
	loot = list(
		/obj/item/gun/ballistic/automatic/marksman/sniper,
		/obj/item/gun/ballistic/automatic/assault_rifle,
		/obj/item/gun/ballistic/automatic/type93,
		/obj/item/gun/ballistic/automatic/fnfal,
		/obj/item/gun/ballistic/rifle/enfield,
		/obj/item/gun/ballistic/shotgun/police,
		/obj/item/gun/ballistic/shotgun/trench,
		/obj/item/gun/ballistic/shotgun/automatic/combat/auto5,
	)

/obj/effect/spawner/lootdrop/f13/themed_weapons/mil_advlongarms
	name = "mil advlongarms"
	loot = list(
		/obj/item/gun/ballistic/automatic/g11,
		/obj/item/gun/ballistic/automatic/bozar,
		/obj/item/gun/ballistic/automatic/m72,
		/obj/item/gun/ballistic/rifle/mag/antimateriel,
		/obj/item/gun/ballistic/shotgun/automatic/combat/neostead,
		/obj/item/gun/ballistic/shotgun/automatic/combat/citykiller,
		/obj/item/gun/ballistic/automatic/shotgun/pancor,
	)

/obj/effect/spawner/lootdrop/f13/themed_weapons/mil_smallarms // Pistols + SMG's
	name = "mil smallarms"
	loot = list(
		/obj/item/gun/ballistic/automatic/pistol/beretta,
		/obj/item/gun/ballistic/automatic/pistol/beretta/automatic,
		/obj/item/gun/ballistic/automatic/pistol/n99,
		/obj/item/gun/ballistic/automatic/pistol/mk23,
		/obj/item/gun/ballistic/automatic/pistol/deagle/automag,
		/obj/item/gun/ballistic/automatic/pistol/deagle,
		/obj/item/gun/ballistic/automatic/pistol/pistol14,
		/obj/item/gun/ballistic/revolver/hunting,
		/obj/item/gun/ballistic/revolver/needler,
		/obj/item/gun/ballistic/automatic/smg/greasegun,
		/obj/item/gun/ballistic/automatic/smg/p90,
		/obj/item/gun/ballistic/automatic/smg/mp5,
	)

/obj/effect/spawner/lootdrop/f13/themed_weapons/mil_assaultarms // Rifles + SMG's + Shotguns
	name = "mil longarms"
	loot = list(
		/obj/item/gun/ballistic/automatic/marksman/sniper,
		/obj/item/gun/ballistic/automatic/assault_rifle,
		/obj/item/gun/ballistic/automatic/type93,
		/obj/item/gun/ballistic/automatic/fnfal,
		/obj/item/gun/ballistic/rifle/enfield,
		/obj/item/gun/ballistic/shotgun/police,
		/obj/item/gun/ballistic/shotgun/trench,
		/obj/item/gun/ballistic/shotgun/automatic/combat/auto5,
		/obj/item/gun/ballistic/automatic/smg/greasegun,
		/obj/item/gun/ballistic/automatic/smg/p90,
		/obj/item/gun/ballistic/automatic/smg/mp5,
	)

/obj/effect/spawner/lootdrop/f13/themed_weapons/mil_allguns // Please have extreme restraint with this one. It can spawn everything in the military list! INCLUDING advanced!
	name = "mil allguns"
	loot = list(
		/obj/item/gun/ballistic/automatic/marksman/sniper,
		/obj/item/gun/ballistic/automatic/assault_rifle,
		/obj/item/gun/ballistic/automatic/type93,
		/obj/item/gun/ballistic/automatic/fnfal,
		/obj/item/gun/ballistic/rifle/enfield,
		/obj/item/gun/ballistic/shotgun/police,
		/obj/item/gun/ballistic/shotgun/trench,
		/obj/item/gun/ballistic/shotgun/automatic/combat/auto5,
		/obj/item/gun/ballistic/automatic/smg/greasegun,
		/obj/item/gun/ballistic/automatic/smg/p90,
		/obj/item/gun/ballistic/automatic/smg/mp5,
		/obj/item/gun/ballistic/automatic/lsw,
		/obj/item/gun/ballistic/automatic/m1919,
		/obj/item/gun/ballistic/automatic/g11,
		/obj/item/gun/ballistic/automatic/bozar,
		/obj/item/gun/ballistic/automatic/m72,
		/obj/item/gun/ballistic/rifle/mag/antimateriel,
		/obj/item/gun/ballistic/shotgun/automatic/combat/neostead,
		/obj/item/gun/ballistic/shotgun/automatic/combat/citykiller,
		/obj/item/gun/ballistic/automatic/shotgun/pancor,
		/obj/item/gun/ballistic/automatic/pistol/beretta,
		/obj/item/gun/ballistic/automatic/pistol/beretta/automatic,
		/obj/item/gun/ballistic/automatic/pistol/n99,
		/obj/item/gun/ballistic/automatic/pistol/mk23,
		/obj/item/gun/ballistic/automatic/pistol/deagle/automag,
		/obj/item/gun/ballistic/automatic/pistol/deagle,
		/obj/item/gun/ballistic/automatic/pistol/pistol14,
		/obj/item/gun/ballistic/revolver/hunting,
		/obj/item/gun/ballistic/revolver/needler,
	)

/obj/effect/spawner/lootdrop/f13/themed_weapons/mil_melee
	name = "mil melee"
	loot = list(
		/obj/item/shovel/trench,
		/obj/item/melee/onehanded/machete/forgedmachete,
		/obj/item/melee/onehanded/machete/scrapsabre,
		/obj/item/melee/onehanded/knife/bayonet,
		/obj/item/melee/onehanded/knife/bowie,
		/obj/item/melee/onehanded/knife/trench,
	)
