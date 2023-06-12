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
	/datum/outfit/loadout/salvager,
	/datum/outfit/loadout/scavenger,
	/datum/outfit/loadout/settler,
	/datum/outfit/loadout/medic,
	/datum/outfit/loadout/merchant)

/datum/outfit/job/wasteland/f13wastelander
	name = "Wastelander"
	jobtype = /datum/job/wasteland/f13wastelander

	id = null
	ears = null
	r_hand = /obj/item/book/granter/trait/selection
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

/datum/outfit/loadout/salvager
	name = "Salvager"
	uniform = /obj/item/clothing/under/f13/machinist
	shoes = /obj/item/clothing/shoes/f13/military
	gloves = /obj/item/clothing/gloves/f13/blacksmith
	head = /obj/item/clothing/head/welding
	r_hand = /obj/item/weldingtool/largetank

/datum/outfit/loadout/scavenger
	name = "Scavenger"
	shoes = /obj/item/clothing/shoes/f13/military
	r_hand = /obj/item/storage/backpack/duffelbag/scavengers
	l_hand = /obj/item/pickaxe/drill
	belt = /obj/item/storage/belt
	backpack_contents = list(/obj/item/mining_scanner=1,
							/obj/item/metaldetector=1,
							/obj/item/shovel=1)

/datum/outfit/loadout/settler
	name = "Settler"
	uniform = /obj/item/clothing/under/f13/settler
	shoes = /obj/item/clothing/shoes/f13/military
	r_hand = /obj/item/hatchet
	belt = /obj/item/storage/belt
	backpack_contents = list(
		/obj/item/stack/sheet/metal/fifty = 1,
		/obj/item/stack/sheet/mineral/wood/fifty = 1,
		/obj/item/pickaxe/mini = 1,
		/obj/item/toy/crayon/spraycan = 1,
		/obj/item/cultivator = 1,
		/obj/item/reagent_containers/glass/bucket = 1,
		/obj/item/storage/bag/plants/portaseeder = 1,
		)

/datum/outfit/loadout/medic
	name = "Wasteland Doctor"
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
		)

/datum/outfit/loadout/merchant
	name = "Roving Trader"
	uniform = /obj/item/clothing/under/f13/roving
	neck = /obj/item/clothing/neck/mantle/brown
	shoes = /obj/item/clothing/shoes/f13/brownie
	head = /obj/item/clothing/head/f13/stormchaser
	gloves = /obj/item/clothing/gloves/color/brown
	glasses = /obj/item/clothing/glasses/f13/biker
	backpack_contents =  list(/obj/item/storage/box/vendingmachine=1)
