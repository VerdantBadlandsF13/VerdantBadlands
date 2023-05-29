/*	-------------------------------------------------
	---------F13 SPAWNERS, READABLE EDITION----------
	-old ported spawners read level is kevcode level-
	--so i just made this new one, based on tg one---
	--oh and, if it rutines about "not enough shit---
	-----------to spawn", it is fine(tm)-------------
 */

//Stop using lootspawners in dungeons improperly. If you put guns in a dungeon, people will want to use them, which will result in them shooting people. You'll have to put in nests or something to constantly give people stuff to shoot at. - Nappist

/obj/effect/spawner/lootdrop/f13
	name = "f13 spawners - DO NOT USE THIS"
	lootdoubles = FALSE	//making sure it will /not/ double

/*	------------------------------------------------
	----------------ARMOR SPAWNERS------------------
	------------------------------------------------ */

/obj/effect/spawner/lootdrop/f13/armor
	name = "armor spawners - DO NOT USE THIS"
	icon_state = "armor_loot"

/obj/effect/spawner/lootdrop/f13/armor/clothes
	name = "pre-war clothes spawner"
	loot = list(
				/obj/effect/spawner/bundle/f13/worker,
				/obj/effect/spawner/bundle/f13/plaidskirt,
				/obj/item/clothing/under/blacktango,
				/obj/item/clothing/under/redeveninggown,
				/obj/item/clothing/under/janimaid,
				/obj/effect/spawner/bundle/f13/badass,
				/obj/effect/spawner/bundle/f13/puffer,
				/obj/effect/spawner/bundle/f13/that,
				/obj/effect/spawner/bundle/f13/benny,
				/obj/effect/spawner/bundle/f13/burgundysuit,
				/obj/effect/spawner/bundle/f13/scratch,
				/obj/effect/spawner/bundle/f13/hoodie,
				/obj/item/clothing/under/pants/camo,
				/obj/effect/spawner/bundle/f13/bartender_purple,
				/obj/effect/spawner/bundle/f13/plaidskirt/bluered,
				/obj/effect/spawner/bundle/f13/navysuit,
				/obj/effect/spawner/bundle/f13/femsuit,
	)

/obj/effect/spawner/bundle/f13/worker
	name = "overalls and flat cap"
	items = list(
				/obj/item/clothing/under/overalls,
				/obj/item/clothing/head/flatcap
				)

/obj/effect/spawner/bundle/f13/plaidskirt
	name = "green and purple plaid skirt"
	items = list(
				/obj/item/clothing/under/plaid_skirt/green,
				/obj/item/clothing/under/plaid_skirt/purple
				)

/obj/effect/spawner/bundle/f13/badass
	name = "leather jacket and fingerless gloves"
	items = list(
				/obj/item/clothing/suit/jacket/leather,
				/obj/item/clothing/gloves/fingerless
				)

/obj/effect/spawner/bundle/f13/puffer
	name = "puffer vest, jeans, and grey cloak"
	items = list(
		/obj/item/clothing/suit/jacket/puffer/vest,
		/obj/item/clothing/under/pants/jeans,
		/obj/item/clothing/neck/mantle/gray,
	)

/obj/effect/spawner/bundle/f13/that
	name = "charcoal suit and hat"
	items = list(
				/obj/item/clothing/under/suit_jacket/charcoal,
				/obj/item/clothing/head/that
				)

/obj/effect/spawner/bundle/f13/benny
	name = "checkered suit and shoes"
	items = list(
				/obj/item/clothing/under/suit_jacket/checkered, // It's Benny time!
				/obj/item/clothing/shoes/laceup
				)

/obj/effect/spawner/bundle/f13/burgundysuit
	name = "burgundy suit, shoes, and cloak"
	items = list(
		/obj/item/clothing/under/suit_jacket/burgundy,
		/obj/item/clothing/shoes/laceup,
		/obj/item/clothing/neck/mantle/brown,
	)

/obj/effect/spawner/bundle/f13/scratch
	name = "white suit and shoes"
	items = list(
				/obj/item/clothing/under/scratch,
				/obj/item/clothing/shoes/sneakers/white
				)

/obj/effect/spawner/bundle/f13/hoodie
	name = "hoodie"
	items = list(
				/obj/item/clothing/head/beanie/black,
				/obj/item/clothing/suit/hooded/chaplain_hoodie
				)

/obj/effect/spawner/bundle/f13/bartender_purple
	name = "purple bartender's outfit spawner"
	items = list(
				/obj/item/clothing/neck/apron/bartender,
				/obj/item/clothing/under/rank/bartender/purple,
				)

/obj/effect/spawner/bundle/f13/plaidskirt/bluered
	name = "blue and red plaid skirts"
	items = list(
				/obj/item/clothing/under/plaid_skirt/blue,
				/obj/item/clothing/under/plaid_skirt
				)

/obj/effect/spawner/bundle/f13/navysuit
	name = "navy suit and shoes"
	items = list(
				/obj/item/clothing/under/suit_jacket/navy,
				/obj/item/clothing/shoes/laceup
				)

/obj/effect/spawner/bundle/f13/femsuit
	name = "female executive suit and shoes"
	items = list(
				/obj/item/clothing/under/suit_jacket/female,
				/obj/item/clothing/shoes/laceup
				)



/obj/effect/spawner/lootdrop/f13/armor/costumes
	name = "pre-war costumes spawner"
	loot = list(
				/obj/effect/spawner/bundle/f13/soviet,
				/obj/effect/spawner/bundle/f13/geisha,
				/obj/item/clothing/under/blacktango,
				/obj/item/clothing/under/redeveninggown,
				/obj/effect/spawner/bundle/f13/mexican,
				/obj/item/clothing/under/sailor,
				/obj/effect/spawner/lootdrop/f13/schoolgirl,
				/obj/effect/spawner/bundle/f13/hats,
				/obj/effect/spawner/bundle/f13/jabroni,
				/obj/effect/spawner/bundle/f13/romeaboo,
				/obj/item/clothing/under/maid,
				/obj/effect/spawner/bundle/f13/vampire,
				/obj/item/clothing/under/kilt,
				/obj/effect/spawner/bundle/f13/pirate
	)

/obj/effect/spawner/bundle/f13/soviet
	name = "soviet costume"
	items = list(
		/obj/item/clothing/head/ushanka,
		/obj/item/clothing/under/soviet,
		/obj/item/clothing/neck/mantle/gray,
	)

/obj/effect/spawner/bundle/f13/geisha
	name = "geisha costume"
	items = list(
				/obj/item/clothing/under/geisha,
				/obj/item/clothing/shoes/sandal
				)

/obj/effect/spawner/bundle/f13/mexican
	name = "sombrero and poncho"
	items = list(
				/obj/item/clothing/head/sombrero,
				/obj/item/clothing/neck/mantle/poncho
				)

/obj/effect/spawner/lootdrop/f13/schoolgirl
	name = "schoolgirl outfit spawner"
	loot = list(
				/obj/item/clothing/under/schoolgirl/red,
				/obj/item/clothing/under/schoolgirl
				)

/obj/effect/spawner/bundle/f13/hats
	name = "hats"
	items = list(
				/obj/item/clothing/head/fluff/bandit,
				/obj/item/clothing/head/fluff/gambler
				)

/obj/effect/spawner/bundle/f13/jabroni
	name = "jabroni outfit spawner"
	items = list(
				/obj/item/clothing/under/jabroni,
				/obj/item/clothing/glasses/sunglasses/blindfold
				)

/obj/effect/spawner/bundle/f13/romeaboo
	name = "roman gladiator outfit spawner"
	items = list(
				/obj/item/clothing/under/gladiator,
				/obj/item/clothing/shoes/roman
				)

/obj/effect/spawner/bundle/f13/vampire
	name = "vampire outfit spawner"
	items = list(
		/obj/item/clothing/under/draculass,
		/obj/item/clothing/neck/mantle/gray,
	)

/obj/effect/spawner/bundle/f13/pirate
	name = "pirate outfit spawner"
	items = list(
				/obj/item/clothing/under/pirate,
				/obj/item/clothing/suit/pirate
				)

/*	------------------------------------------------
	---------------MEDICAL SPAWNERS-----------------
	------------------------------------------------ */

/obj/effect/spawner/lootdrop/f13/medical
	name = "medical spawners - DO NOT USE THIS"

/obj/effect/spawner/lootdrop/f13/medical/surgical
	name = "surgical item spawner"
	lootcount = 1

	loot = list(
				/obj/item/hemostat,
				/obj/item/surgicaldrill,
				/obj/item/retractor,
				/obj/item/cautery,
				/obj/item/scalpel,
				/obj/item/clothing/suit/hooded/surgical,
				/obj/item/clothing/gloves/color/latex,
				/obj/item/clothing/mask/surgical,
				/obj/item/surgical_drapes,
				/obj/item/circular_saw
				)

/obj/effect/spawner/lootdrop/f13/medical/surgical/blood
	name = "blood spawner"
	lootcount = 1

	loot = list(
				/obj/item/reagent_containers/blood/random
				)

/obj/effect/spawner/lootdrop/f13/medical/vault
	name = "vault medical spawner - DO NOT USE"

/obj/effect/spawner/lootdrop/f13/medical/vault/equipment
	name = "vault medical equipment spawner"
	lootcount = 1

	loot = list(
				/obj/item/defibrillator/compact/combat/loaded,
				/obj/item/reagent_containers/hypospray/combat,
				/obj/item/clothing/glasses/hud/health/night
				)

/obj/effect/spawner/lootdrop/f13/medical/vault/meds  //no drugs, didn't add
	name = "vault medical meds spawner"
	lootcount = 1

	loot = list(
				/obj/item/reagent_containers/hypospray/medipen/stimpak,
				/obj/item/storage/pill_bottle/chem_tin/radx,
				/obj/item/reagent_containers/blood/radaway,
				/obj/item/storage/pill_bottle/chem_tin/mentats
				)

/obj/effect/spawner/lootdrop/f13/medical/wasteland
	name = "wasteland medical spawner - DO NOT USE"

/obj/effect/spawner/lootdrop/f13/medical/wasteland/meds //remove equipment, has nothing on it
	name = "wasteland meds spawner"
	lootcount = 1

	loot = list(/obj/item/reagent_containers/pill/patch/healingpowder,
				/obj/item/storage/pill_bottle/chem_tin/radx,
				/obj/item/reagent_containers/blood/radaway,
				/obj/item/storage/pill_bottle/chem_tin/mentats,
				/obj/item/reagent_containers/hypospray/medipen/stimpak,
				/obj/item/reagent_containers/medspray/styptic,
				/obj/item/reagent_containers/medspray/silver_sulf,
				/obj/item/reagent_containers/medspray/sterilizine
				)

/obj/effect/spawner/lootdrop/f13/medical/wasteland/meds/drug //remove equipment, has nothing on it
	name = "wasteland drugs spawner"
	lootcount = 1

	loot = list(
				/obj/item/reagent_containers/pill/patch/jet,
				/obj/item/reagent_containers/pill/patch/turbo,
				/obj/item/reagent_containers/pill/patch/healingpowder,
				/obj/item/reagent_containers/pill/stimulant,
				/obj/item/reagent_containers/hypospray/medipen/medx,
				/obj/item/storage/pill_bottle/chem_tin/buffout
				)


/obj/effect/spawner/lootdrop/f13/medical/rnd/mid
	name = "mid dungeon science loot"	//to replace guns as treasure in slightly protected areas
	lootcount = 1

	loot = list(
		/obj/item/screwdriver/power,
		/obj/item/wrench/power,
		/obj/item/storage/box/medicine/stimpaks/stimpaks5,
		/obj/item/stack/sheet/prewar/twenty,
		/obj/item/stack/sheet/plastic/twenty,
		/obj/item/defibrillator/primitive,
		/obj/item/reagent_containers/syringe/bluespace,
		)


/obj/effect/spawner/lootdrop/f13/medical/rnd/good
	name = "good dungeon science loot"	//to replace guns as treasure in heavily guarded areas
	lootcount = 1

	loot = list( //Now out of 100
		/obj/item/reagent_containers/glass/beaker/meta = 2,
		/obj/item/stack/sheet/mineral/abductor/ten = 2,
		/obj/item/scalpel/advanced = 5,
		/obj/item/surgical_drapes/advanced = 5,
		/obj/item/clothing/glasses/night = 5,
		/obj/item/circuitboard/machine/chem_dispenser/apothecary = 5,
		/obj/item/storage/box/stockparts/deluxe = 2,
		/obj/item/storage/box/emps = 5,
		/obj/item/organ/cyberimp/arm/janitor = 4,
		/obj/item/reagent_containers/glass/bottle/fentanyl = 5,
		/obj/item/reagent_containers/glass/bottle/frostoil = 5,
		/obj/item/book/granter/trait/midsurgery = 5,
		/obj/item/reagent_containers/glass/bottle/FEV_solution = 20,
		/obj/item/reagent_containers/glass/bottle/FEV_solution/two = 5,
		/obj/item/reagent_containers/glass/bottle/FEV_solution/curling = 20,
		)

/obj/effect/spawner/lootdrop/f13/medical/random_fev
	name = "random FEV bottle"	//for when you can't decide what is worse
	lootcount = 1

	loot = list(
		/obj/item/reagent_containers/glass/bottle/FEV_solution = 1,
		/obj/item/reagent_containers/glass/bottle/FEV_solution/two = 1,
		/obj/item/reagent_containers/glass/bottle/FEV_solution/curling = 1,
		)

/obj/effect/spawner/lootdrop/f13/junkspawners //TIER 4 GARBAGE
	name = "garbage spawner"
	lootcount = 2
	fan_out_items = TRUE

	loot = list(
				/obj/item/trash/coal,
				/obj/item/trash/popcorn,
				/obj/item/trash/plate,
				/obj/item/trash/tray,
				/obj/item/trash/boritos,
				/obj/item/trash/can,
				/obj/item/trash/candle,
				/obj/item/trash/cheesie,
				/obj/item/trash/chips,
				/obj/item/trash/energybar,
				/obj/item/trash/pistachios,
				/obj/item/trash/raisins,
				/obj/item/trash/semki,
				/obj/item/trash/sosjerky,
				/obj/item/trash/syndi_cakes,
				/obj/item/trash/waffles,
				/obj/item/trash/f13/rotten,
				/obj/item/trash/f13/tin,
				/obj/item/trash/f13/dog,
				/obj/item/trash/f13/dandyapples,
				/obj/item/trash/f13/bubblegum,
				/obj/item/trash/f13/bubblegum_large,
				/obj/item/trash/f13/cram,
				/obj/item/trash/f13/cram_large,
				/obj/item/trash/f13/yumyum,
				/obj/item/trash/f13/fancylads,
				/obj/item/trash/f13/sugarbombs,
				/obj/item/trash/f13/crisps,
				/obj/item/trash/f13/steak,
				/obj/item/trash/f13/specialapples,
				/obj/item/trash/f13/blamco_large,
				/obj/item/trash/f13/blamco,
				/obj/item/trash/f13/mechanist,
				/obj/item/trash/f13/instamash,
				/obj/item/trash/f13/porknbeans,
				/obj/item/trash/f13/borscht,
				/obj/item/trash/f13/mre,
				/obj/item/broken_bottle,
				/obj/item/multitool,
				/obj/item/cigbutt/cigarbutt,
				/obj/item/razor,
				/obj/item/candle,
				/obj/item/rollingpaper,
				/obj/item/toner,
				/obj/item/camera,
				/obj/item/soap/homemade,
				/obj/item/stack/cable_coil/random,
				/obj/item/stack/medical/bruise_pack,
				/obj/item/valentine,
				/obj/item/taperecorder,
				/obj/item/tape/random,
				/obj/item/stack/medical/gauze,
				/obj/item/storage/box/snappops,
				/obj/item/storage/crayons,
				/obj/item/stack/packageWrap,
				/obj/item/storage/box/matches,
				/obj/item/reagent_containers/food/snacks/deadmouse,
				/obj/item/tank/internals/oxygen,
				/obj/item/storage/box/papersack,
				/obj/item/storage/box/lights/mixed,
				/obj/item/reagent_containers/food/drinks/sillycup,
				/obj/item/restraints/handcuffs/cable/zipties,
				/obj/item/storage/pill_bottle,
				/obj/item/storage/belt/fannypack/black,
				/obj/item/toy/dummy,
				/obj/item/toy/eightball,
				/obj/item/toy/cards/deck,
				/obj/item/toy/xmas_cracker,
				/obj/item/reagent_containers/glass/bowl,
				/obj/item/reagent_containers/spray/cleaner,
				/obj/item/reagent_containers/glass/bucket,
				/obj/item/poster/random_contraband,
				/obj/item/poster/random_official
				)

/obj/effect/spawner/lootdrop/f13/seedspawner
	name = "seed spawner"
	lootdoubles = TRUE
	fan_out_items = TRUE
	lootcount = 4

/obj/effect/spawner/lootdrop/f13/seedspawner/Initialize(mapload) // This will spawn gatfruit sometimes.
	loot = list(/obj/item/seeds/ambrosia,
					/obj/item/seeds/apple,
					/obj/item/seeds/banana,
					/obj/item/seeds/cotton,
					/obj/item/seeds/berry,
					/obj/item/seeds/poppy/broc,
					/obj/item/seeds/cabbage,
					/obj/item/seeds/carrot,
					/obj/item/seeds/carrot/parsnip,
					/obj/item/seeds/cherry,
					/obj/item/seeds/chanterelle,
					/obj/item/seeds/chili,
					/obj/item/seeds/cocoapod,
					/obj/item/seeds/coffee,
					/obj/item/seeds/corn,
					/obj/item/seeds/eggplant,
					/obj/item/seeds/grape,
					/obj/item/seeds/grass,
					/obj/item/seeds/lemon,
					/obj/item/seeds/lime,
					/obj/item/seeds/onion,
					/obj/item/seeds/orange,
					/obj/item/seeds/rainbow_bunch,
					/obj/item/seeds/pineapple,
					/obj/item/seeds/potato,
					/obj/item/seeds/poppy,
					/obj/item/seeds/pumpkin,
					/obj/item/seeds/wheat/rice,
					/obj/item/seeds/soya,
					/obj/item/seeds/sugarcane,
					/obj/item/seeds/sunflower,
					/obj/item/seeds/tea,
					/obj/item/seeds/tobacco,
					/obj/item/seeds/tomato,
					/obj/item/seeds/tower,
					/obj/item/seeds/watermelon,
					/obj/item/seeds/wheat,
					/obj/item/seeds/whitebeet,
					/obj/item/seeds/xander,
					/obj/item/seeds/mutfruit,
					/obj/item/seeds/amanita,
					/obj/item/seeds/glowshroom,
					/obj/item/seeds/liberty,
					/obj/item/seeds/nettle,
					/obj/item/seeds/plump,
					/obj/item/seeds/reishi,
					/obj/item/seeds/cannabis,
					/obj/item/seeds/starthistle,
					/obj/item/seeds/random)
	. = ..()

/obj/effect/spawner/lootdrop/f13/foodspawner
	name = "food spawner"
	lootdoubles = TRUE
	fan_out_items = TRUE

	loot = list(
				/obj/item/storage/box/ingredients/american,
				/obj/item/reagent_containers/food/snacks/f13/crisps,
				/obj/item/reagent_containers/food/snacks/f13/crisps,
				/obj/item/reagent_containers/food/snacks/f13/bubblegum,
				/obj/item/reagent_containers/food/snacks/f13/cram,
				/obj/item/reagent_containers/food/snacks/f13/yumyum,
				/obj/item/reagent_containers/food/snacks/f13/fancylads,
				/obj/item/reagent_containers/food/snacks/f13/sugarbombs,
				/obj/item/reagent_containers/food/snacks/cheesiehonkers,
				/obj/item/reagent_containers/food/snacks/f13/steak,
				/obj/item/reagent_containers/food/snacks/f13/dandyapples,
				/obj/item/reagent_containers/food/snacks/f13/blamco,
				/obj/item/reagent_containers/food/snacks/f13/instamash ,
				/obj/item/reagent_containers/food/snacks/f13/canned/porknbeans,
				/obj/item/storage/box/ingredients/carnivore,
				/obj/item/storage/box/ingredients/delights,
				/obj/item/storage/box/ingredients/exotic,
				/obj/item/storage/box/ingredients/fiesta,
				/obj/item/storage/box/ingredients/fruity,
				/obj/item/storage/box/ingredients/grains,
				/obj/item/storage/box/ingredients/italian,
				/obj/item/storage/box/ingredients/sweets,
				/obj/item/storage/box/ingredients/vegetarian,
				/obj/item/storage/box/ingredients/wildcard,
				/obj/item/reagent_containers/food/condiment/flour,
				/obj/item/reagent_containers/food/condiment/rice,
				/obj/item/reagent_containers/food/condiment/yeast,
				/obj/item/reagent_containers/food/condiment/soymilk,
				/obj/item/reagent_containers/food/condiment/ketchup,
				/obj/item/reagent_containers/food/condiment/sugar,
				/obj/item/reagent_containers/food/condiment/milk,
				/obj/item/reagent_containers/food/condiment/saltshaker,
				/obj/item/reagent_containers/food/condiment/peppermill,
				/obj/item/reagent_containers/food/condiment/soysauce,
				/obj/item/reagent_containers/food/snacks/beans,
				/obj/item/reagent_containers/food/snacks/cracker,
				/obj/item/reagent_containers/food/snacks/lollipop,
				)


/obj/effect/spawner/lootdrop/f13/foodspawner/Initialize(mapload) //on mapload, pick how many shit to spawn
	lootcount = pick(1, 2)
	. = ..()

/obj/effect/spawner/lootdrop/f13/crafting
	name = "crafting spawner"
	lootdoubles = TRUE
	fan_out_items = TRUE

	loot = list(
				/obj/item/crafting/abraxo,
				/obj/item/stack/crafting/metalparts/three,
				/obj/item/stack/crafting/metalparts/five,
				/obj/item/stack/crafting/goodparts/three,
				/obj/item/stack/crafting/goodparts/five,
				/obj/item/stack/crafting/electronicparts/three,
				/obj/item/stack/crafting/electronicparts/five,
				/obj/item/reagent_containers/glass/bottle/blackpowder)

/obj/effect/spawner/lootdrop/f13/crafting/Initialize(mapload) //on mapload, pick how many shit to spawn
	lootcount = pick(1, 2)
	. = ..()


/obj/effect/spawner/lootdrop/f13/alcoholspawner //TIER 7 ALCOHOL
	name = "alcoholspawner"
	lootdoubles = TRUE
	fan_out_items = TRUE

	loot = list(
				/obj/item/reagent_containers/food/drinks/beer,
				/obj/item/reagent_containers/food/drinks/ale,
				/obj/item/reagent_containers/food/drinks/bottle/gin,
				/obj/item/reagent_containers/food/drinks/bottle/hcider,
				/obj/item/reagent_containers/food/drinks/bottle/whiskey,
				/obj/item/reagent_containers/food/drinks/bottle/vodka,
				/obj/item/reagent_containers/food/drinks/bottle/tequila,
				/obj/item/reagent_containers/food/drinks/bottle/rum,
				/obj/item/reagent_containers/food/drinks/bottle/vermouth,
				/obj/item/reagent_containers/food/drinks/bottle/kahlua,
				/obj/item/reagent_containers/food/drinks/bottle/cognac,
				/obj/item/reagent_containers/food/drinks/bottle/wine,
				/obj/item/reagent_containers/food/drinks/bottle/absinthe,
				/obj/item/reagent_containers/food/drinks/bottle/lizardwine,
				/obj/item/reagent_containers/food/drinks/bottle/hcider,
				/obj/item/reagent_containers/food/drinks/bottle/grappa,
				/obj/item/reagent_containers/food/drinks/bottle/sake,
				/obj/item/reagent_containers/food/drinks/bottle/fernet
				)

/obj/effect/spawner/lootdrop/f13/alcoholspawner/Initialize(mapload) //on mapload, pick how many shit to spawn
	lootcount = pick(1, 2)
	. = ..()

/obj/effect/spawner/lootdrop/f13/resourcespawner //now include R N G (TM) (higher number means it has a bigger spawn chance)
	name = "resource spawner"
	lootcount = 2

	loot = list(
				/obj/item/stack/rods/ten = 3,
				/obj/item/stack/sheet/metal/ten = 5,
				/obj/item/stack/sheet/cardboard/twenty = 1,
				/obj/item/stack/sheet/metal/five = 2,
				/obj/item/stack/sheet/plasteel/five = 1,
				/obj/item/stack/sheet/plastic/five = 4,
				/obj/item/stack/sheet/cloth/ten = 1,
				/obj/item/stack/crafting/metalparts/five = 4,
				/obj/item/stack/crafting/goodparts/three = 2
				)

/obj/effect/spawner/lootdrop/f13/traitbooks
	name = "trait book spawner"
	lootcount = 1
	loot = list(/obj/item/book/granter/trait/lowsurgery = 10,
				/obj/item/book/granter/trait/chemistry = 10,
				/obj/item/book/granter/trait/trekking = 17,
				/obj/item/book/granter/trait/techno = 14,
				/obj/item/book/granter/trait/gunslinger = 4,
				/obj/item/book/granter/trait/iron_fist = 4,
				/obj/item/book/granter/trait/bigleagues = 4,
				/obj/item/book/granter/trait/explosives = 17,
				/obj/item/book/granter/trait/explosives_advanced = 5,
				/obj/item/book/granter/trait/rifleman = 5,
				/obj/item/book/granter/crafting_recipe/gunsmith_three = 10,
				/obj/item/book/granter/crafting_recipe/gunsmith_four = 10
				)

/obj/effect/spawner/lootdrop/f13/traitbooks/low
	name = "low trait book spawner"
	lootcount = 1
	loot = list(/obj/item/book/granter/trait/lowsurgery = 1,
				/obj/item/book/granter/trait/chemistry = 1,
				/obj/item/book/granter/trait/techno = 10,
				/obj/item/book/granter/trait/explosives = 10,
				/obj/item/book/granter/action/drink_fling = 10,
				/obj/item/book/granter/crafting_recipe/gunsmith_one = 10,
				/obj/item/book/granter/crafting_recipe/gunsmith_two = 5
				)
/obj/effect/spawner/lootdrop/f13/blueprintLow
	name = "gun comps spawner"
	icon_state = "blueprint_loot"
	lootcount = 1
	loot = list(
		/obj/item/advanced_crafting_components/flux,
		/obj/item/advanced_crafting_components/lenses,
		/obj/item/advanced_crafting_components/conductors,
		/obj/item/advanced_crafting_components/receiver,
		/obj/item/advanced_crafting_components/assembly,
		/obj/item/advanced_crafting_components/alloys,
		/obj/item/attachments/scope,
		/obj/item/attachments/burst_improvement,
		/obj/item/attachments/recoil_decrease,
		/obj/item/attachments/auto_sear
	)

/obj/effect/spawner/lootdrop/f13/blueprintLowPartsWeighted
	name = "parts and mods spawner (weighted towards parts)"
	icon_state = "blueprint_loot"
	lootcount = 3
	lootdoubles = FALSE
	loot = list(
		/obj/item/advanced_crafting_components/flux = 2,
		/obj/item/advanced_crafting_components/lenses = 2,
		/obj/item/advanced_crafting_components/conductors = 2,
		/obj/item/advanced_crafting_components/receiver = 2,
		/obj/item/advanced_crafting_components/assembly = 2,
		/obj/item/advanced_crafting_components/alloys = 2,
		/obj/item/attachments/scope,
		/obj/item/attachments/burst_improvement,
		/obj/item/attachments/recoil_decrease,
		/obj/item/attachments/auto_sear
	)

/obj/effect/spawner/lootdrop/f13/attachments
	name = "attachments"
	lootcount = 1
	lootdoubles = FALSE
	loot = list(
		/obj/item/attachments/scope,
		/obj/item/attachments/burst_improvement,
		/obj/item/attachments/recoil_decrease,
		/obj/item/attachments/auto_sear
	)

/obj/effect/spawner/lootdrop/f13/ncr_c_ration
	name = "c-ration spawner"
	icon = 'icons/obj/storage.dmi'
	icon_state = "c-ration"
	lootcount = 1
	loot = list(
			/obj/item/storage/box/ration/menu_one,
			/obj/item/storage/box/ration/menu_two,
			/obj/item/storage/box/ration/menu_three,
			/obj/item/storage/box/ration/menu_four,
			/obj/item/storage/box/ration/menu_five,
			/obj/item/storage/box/ration/menu_six,
			/obj/item/storage/box/ration/menu_seven,
			/obj/item/storage/box/ration/menu_eight,
			/obj/item/storage/box/ration/menu_nine,
			/obj/item/storage/box/ration/menu_ten,
			/obj/item/storage/box/ration/menu_eleven,
			)

/obj/effect/spawner/lootdrop/f13/ncr_k_ration
	name = "c-ration spawner"
	icon = 'icons/obj/storage.dmi'
	icon_state = "k-ration"
	lootcount = 1
	loot = list(
			/obj/item/storage/box/ration/ranger_breakfast,
			/obj/item/storage/box/ration/ranger_lunch,
			/obj/item/storage/box/ration/ranger_dinner,
			)
