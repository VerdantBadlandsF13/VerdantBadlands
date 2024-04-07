/datum/job/town
	department_flag = TWN
	selection_color = "#6b5f63"
	faction = FACTION_TWN
	exp_type = EXP_TYPE_TWN

	access = list(ACCESS_TOWN)
	minimal_access = list(ACCESS_TOWN)

	forbids = "The town's binding rules: <br> \
				- You're a group of wasters in an organised community.<br> \
				- The Lookout-on-duty's word is generally law, enforcing the current leadership's wishes. Try to follow it.<br> \
				- Authority is key. They're there to keep you safe, after all."

	enforces = "The town's founding principles: <br> \
				- Tending to your own over others. <br> \
				- Outsiders, while valuable for trade, are likely just as dangerous. <br> \
				- Keeping the little slice of heaven safe."

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/gmb,
			/datum/job/dfs,
			/datum/job/town,
			/datum/job/wasteland/f13wastelander,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/gmb,
			/datum/job/dfs,
			/datum/job/town,
			/datum/job/wasteland/f13wastelander,
		),
		/datum/matchmaking_pref/mentor = list(
			/datum/job/gmb,
			/datum/job/dfs,
			/datum/job/town,
			/datum/job/wasteland/f13wastelander,
		),
		/datum/matchmaking_pref/disciple = list(
			/datum/job/gmb,
			/datum/job/dfs,
			/datum/job/town,
			/datum/job/wasteland/f13wastelander,
		),
		/datum/matchmaking_pref/patron = list(
			/datum/job/gmb,
			/datum/job/dfs,
			/datum/job/town,
			/datum/job/wasteland/f13wastelander,
		),
		/datum/matchmaking_pref/protegee = list(
			/datum/job/gmb,
			/datum/job/dfs,
			/datum/job/town,
			/datum/job/wasteland/f13wastelander,
		),
	)

/datum/outfit/job/town
	name = "TWNdatums"
	jobtype = /datum/job/dfs
	id = /obj/item/card/id/hilltop_keys
	backpack = /obj/item/storage/backpack/trekker
	satchel = /obj/item/storage/backpack/satchel/trekker
	neck = /obj/item/storage/belt/holster/legholster/dfs
	ears = /obj/item/radio/headset/headset_town
	uniform = /obj/item/clothing/under/f13/dfs
	shoes = /obj/item/clothing/shoes/f13/military
	r_pocket = /obj/item/flashlight/flare
// Spare radio for general communication.
	backpack_contents = list(
		/obj/item/radio,
		)


/datum/job/town/f13townleader
	title = "Hilltop Leadership"
	flag = F13TWNLEADERSHIP
	total_positions = 1
	spawn_positions = 1
	req_admin_notify = 1
	roleplay_exclusive_notify = 1
	description = "You're an elected leader of the Hilltop. Whether that had been honest or otherwise, it matters not. \
	Now, you're either guiding or controlling those under you."
	supervisors = "fate"

	outfit = /datum/outfit/job/town/f13townleader

	access = list(ACCESS_TOWN, ACCESS_TWN_RESTRICT)
	minimal_access = list(ACCESS_TOWN, ACCESS_TWN_RESTRICT)

/datum/outfit/job/town/f13townleader
	name = "Hilltop Leader"
	jobtype = /datum/job/town/f13townleader
	id =			/obj/item/card/id/hilltop_leadership_keys
	l_pocket =		/obj/item/storage/bag/money/small/wastelander




/datum/job/town/f13lookout
	title = "Hilltop Lookout"
	flag = F13TWNLOOKOUT
	total_positions = 2
	spawn_positions = 2
	description = "You're one of the town's two lookouts, intended to keep the settlers safe. Try to be a good guiding hand. <b>Or not...</b>"
	supervisors = "fate"

	outfit = /datum/outfit/job/town/f13lookout

	access = list(ACCESS_TOWN, ACCESS_TWN_RESTRICT)
	minimal_access = list(ACCESS_TOWN, ACCESS_TWN_RESTRICT)

/datum/outfit/job/town/f13lookout
	name = "Lookout"
	jobtype = /datum/job/town/f13lookout
	id =			/obj/item/card/id/hilltop_leadership_keys
	l_pocket =		/obj/item/storage/bag/money/small/wastelander




/datum/job/town/f13tavernkeep
	title = "Tavernkeep"
	flag = F13TWNTAVERNKEEP
	total_positions = 1
	spawn_positions = 1
	req_admin_notify = 1
	roleplay_exclusive_notify = 1
	description = "You own, or at the very least manage, the local's favourite drinking spot. For better or worse. Prepare for a bad weekend."
	supervisors = "fate"

	outfit = /datum/outfit/job/town/f13tavernkeep

	access = list(ACCESS_TOWN, ACCESS_TOWN_BAR)
	minimal_access = list(ACCESS_TOWN, ACCESS_TOWN_BAR)

/datum/outfit/job/town/f13tavernkeep
	name = "Tavernkeep"
	jobtype = /datum/job/town/f13tavernkeep
	id =			/obj/item/card/id/tavern_keys
	l_pocket =		/obj/item/storage/bag/money/small/wastelander




/datum/job/town/f13settler
	title = "Hilltop Inhabitant"
	flag = F13TWNINHABITANT
	total_positions = -1
	spawn_positions = -1
	description = "You're one of the town's two lookouts, intended to keep the settlers safe. Try to be a good guiding hand. <b>Or not...</b>"
	supervisors = "fate"

	outfit = /datum/outfit/job/town/f13settler

	access = list(ACCESS_TOWN)
	minimal_access = list(ACCESS_TOWN)

/datum/outfit/job/town/f13settler
	name = "Hilltop Inhabitant"
	jobtype = /datum/job/town/f13settler
	l_pocket =		/obj/item/storage/bag/money/small/wastelander

























// Settler - Settlers look to rebuild society rather than just survive off its remenants. Comes with everything someone would need to settle an area!
/datum/outfit/loadout/settler
	name = "Settler"
	uniform = /obj/item/clothing/under/f13/settler
	shoes = /obj/item/clothing/shoes/f13/military
	r_hand = /obj/item/hatchet
	belt = /obj/item/storage/belt
	backpack_contents = list(
		/obj/item/stack/sheet/metal/fifty=1,
		/obj/item/stack/sheet/mineral/wood/fifty=1,
		/obj/item/toy/crayon/spraycan=1,
		/obj/item/cultivator=1,
		/obj/item/shovel=1,
		/obj/item/reagent_containers/glass/bucket=1,
		/obj/item/storage/bag/plants/portaseeder=1)

// Bonecutter - Bonecutters don't exactly have the best medical skills in the wasteland. But they're still invaluable compared to most! For medically focused players.
/datum/outfit/loadout/bonecutter
	name = "Bonecutter"
	uniform = /obj/item/clothing/under/f13/merchant
	suit = /obj/item/clothing/suit/toggle/labcoat
	shoes = /obj/item/clothing/shoes/f13/tan
	gloves = /obj/item/clothing/gloves/f13/crudemedical
	neck = /obj/item/clothing/neck/stethoscope
	belt = /obj/item/storage/belt/medical/primitive
	backpack_contents = list(/obj/item/smelling_salts=1,
							/obj/item/healthanalyzer=1,
							/obj/item/reagent_containers/glass/bottle/epinephrine=2,
							/obj/item/paper_bin=1,
							/obj/item/folder=1,
							/obj/item/pen/fountain=1,
							/obj/item/book/granter/trait/lowsurgery=1)

// Chemrunner - Chemrunners aren't exactly the most reliable folks in the wasteland, but they can find a strong niche.
/datum/outfit/loadout/chemrunner
	name = "Chem-Runner"
	uniform = /obj/item/clothing/under/f13/settler
	shoes = /obj/item/clothing/shoes/f13/tan
	gloves = /obj/item/clothing/gloves/f13/handwraps
	r_hand = /obj/item/gun/ballistic/revolver/single_shotgun
	backpack_contents = list(/obj/item/book/granter/trait/chemistry=1)
