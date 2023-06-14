/datum/job/wasteland
	department_flag = WASTELAND

/datum/job/wasteland/f13wastelander
	title = "Wastelander"
	flag = F13WASTELANDER
	faction = FACTION_WASTELAND
	total_positions = -1
	spawn_positions = -1
	description = "Whether you're a veteran pathfinder, or just someone down on their luck? You've the misfortune to be in this horrid place."
	supervisors = "fate"
	selection_color = "#dddddd"

	outfit = /datum/outfit/job/wasteland/f13wastelander

	access = list()
	minimal_access = list()
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/wasteland/f13wastelander,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/wasteland/f13wastelander,
		),
		/datum/matchmaking_pref/mentor = list(
			/datum/job/wasteland/f13wastelander,
		),
		/datum/matchmaking_pref/disciple = list(
			/datum/job/wasteland/f13wastelander,
		),
		/datum/matchmaking_pref/patron = list(
			/datum/job/wasteland/f13wastelander,
		),
		/datum/matchmaking_pref/protegee = list(
			/datum/job/wasteland/f13wastelander,
		),
	)
	loadout_options = list(
	/datum/outfit/loadout/wanderer,
	/datum/outfit/loadout/prospector,
	/datum/outfit/loadout/settler,
	/datum/outfit/loadout/bonecutter,
	/datum/outfit/loadout/chemrunner)

/datum/outfit/job/wasteland/f13wastelander
	name = "Wastelander"
	jobtype = /datum/job/wasteland/f13wastelander

	id = null
	ears = null
	l_pocket = /obj/item/storage/bag/money/small/wastelander
	r_pocket = /obj/item/flashlight/flare
	belt = /obj/item/melee/onehanded/knife/survival
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak,
		/obj/item/reagent_containers/hypospray/medipen/stimpak,
		/obj/item/reagent_containers/pill/radx,
		/obj/item/radio,
		/obj/item/gun/ballistic/automatic/pistol/pistol22,
		/obj/item/storage/survivalkit,
		)

/datum/outfit/job/wasteland/f13wastelander/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(
		/obj/item/clothing/under/f13/settler, \
		/obj/item/clothing/under/f13/lumberjack, \
		/obj/item/clothing/under/f13/roving)
	suit = pick(
		/obj/item/clothing/suit/toggle/labcoat/f13/wanderer,
		/obj/item/clothing/suit/f13/slavelabor,
		/obj/item/clothing/suit/f13/vest,
		/obj/item/clothing/suit/f13/cowboygvest,
		/obj/item/clothing/suit/f13/westender,
		/obj/item/clothing/suit/overalls)
	l_hand = pick(
		/obj/item/gun/ballistic/automatic/autopipe,
		/obj/item/gun/ballistic/revolver/caravan_shotgun,
		/obj/item/gun/ballistic/rifle/hunting)

// Wanderer - Wanderer don't tend to stay in one spot. They generally move along the Wasteland looking for their next paycheck. Starts with a shoulder pad and a shitpipe.
/datum/outfit/loadout/wanderer
	name = "Wanderer"
	uniform = /obj/item/clothing/under/f13/merca
	suit = /obj/item/clothing/suit/armored/f13/light/kit/shoulder
	shoes = /obj/item/clothing/shoes/f13/military
	r_hand = /obj/item/gun/ballistic/revolver/piperifle
	gloves = /obj/item/clothing/gloves/f13/leather/fingerless
	backpack_contents = list()
							
// Prospector - Prospectors are scavengers. They dig through the ruins of the old world for supplies. Starts with mining equipment and technofreak.
/datum/outfit/loadout/prospector
	name = "Prospector"
	shoes = /obj/item/clothing/shoes/f13/military
	r_hand = /obj/item/storage/backpack/duffelbag/scavengers
	l_hand = /obj/item/pickaxe/drill
	belt = /obj/item/storage/belt
	backpack_contents = list(/obj/item/mining_scanner=1,
							/obj/item/metaldetector=1,
							/obj/item/shovel=1,
							/obj/item/book/granter/trait/techno =1,
							/obj/item/storage/box/vendingmachine=1,)

// Settler - Settlers look to rebuild society rather than just survive off its remenants. Comes with everything someone would need to settle an area!
/datum/outfit/loadout/settler
	name = "Settler"
	uniform = /obj/item/clothing/under/f13/settler
	shoes = /obj/item/clothing/shoes/f13/military
	r_hand = /obj/item/hatchet
	belt = /obj/item/storage/belt
	backpack_contents = list(
		/obj/item/stack/sheet/metal/fifty = 1,
		/obj/item/stack/sheet/mineral/wood/fifty = 1,
		/obj/item/toy/crayon/spraycan = 1,
		/obj/item/cultivator = 1,
		/obj/item/reagent_containers/glass/bucket = 1,
		/obj/item/storage/bag/plants/portaseeder = 1,)
// Bonecutter - Bonecutter don't exactly have the best medical skills in the wasteland. But they're still invaluable compared to most! For medically focused players.
/datum/outfit/loadout/bonecutter
	name = "Bonecutter"
	uniform = /obj/item/clothing/under/f13/merchant
	suit = /obj/item/clothing/suit/toggle/labcoat
	shoes = /obj/item/clothing/shoes/f13/tan
	gloves = /obj/item/clothing/gloves/f13/crudemedical
	neck = /obj/item/clothing/neck/stethoscope
	belt = /obj/item/storage/belt/medical
	backpack_contents =  list(/obj/item/smelling_salts=1,
							/obj/item/healthanalyzer=1,
							/obj/item/reagent_containers/glass/bottle/epinephrine=2,
							/obj/item/storage/backpack/duffelbag/med/surgery=1,
							/obj/item/paper_bin=1,
							/obj/item/folder=1,
							/obj/item/pen/fountain=1,
							/obj/item/storage/firstaid/ancient=1,
							/obj/item/book/granter/trait/lowsurgery =1,)
// Chemrunner - Chemrunners aren't exactly the most reliable folks in the wasteland, but they can find a strong niche.
/datum/outfit/loadout/chemrunner
	name = "Chem-Runner"
	uniform = /obj/item/clothing/under/f13/settler
	shoes = /obj/item/clothing/shoes/f13/tan
	gloves = /obj/item/clothing/gloves/f13/handwraps
	backpack_contents =  list(/obj/item/book/granter/trait/chemistry)
/*
/datum/outfit/loadout/merchant
	name = "Roving Trader"
	uniform = /obj/item/clothing/under/f13/roving
	neck = /obj/item/clothing/neck/mantle/brown
	shoes = /obj/item/clothing/shoes/f13/brownie
	head = /obj/item/clothing/head/f13/stormchaser
	gloves = /obj/item/clothing/gloves/color/brown
	glasses = /obj/item/clothing/glasses/f13/biker
	backpack_contents =  list(/obj/item/storage/box/vendingmachine=1,
							/obj/item/book/granter/trait/selection =1,) */
							// Disabled for now. Not exactly useful until the update is done.
