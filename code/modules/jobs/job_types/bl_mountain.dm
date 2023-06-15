/datum/job/gmb
	department_flag = GMB
	selection_color = "#556b2f"
	faction = FACTION_GMB
	exp_type = EXP_TYPE_GMB

	access = list(ACCESS_GMB)
	minimal_access = list(ACCESS_GMB)

	forbids = "The Green Mountain Boys forbid: <br> \
				- Marauding of any kind, unless it is a designated enemy stronghold. <br> \
				- Slavery of any kind. <br> \
				- Extortion. <br> \
				- Kidnapping anyone but persons of interest."

	enforces = "The Green Mountain Boys expect: <br> \
				- Maintain relative peace and order within the outpost's area. <br> \
				- Protect the citizenry to the best of your ability. <br> \
				- Ensure a consistent food supply for your militia company and citizens. <br> \
				- Make contact and build rapport with existing powers in the area."

/datum/outfit/job/gmb
	name = "GMBdatums"
	jobtype = /datum/job/gmb
	id = /obj/item/card/id/gmb_keys
	backpack = /obj/item/storage/backpack/trekker
	satchel = /obj/item/storage/backpack/satchel/trekker
	ears = null
	uniform	= /obj/item/clothing/under/f13/gmb
	shoes = /obj/item/clothing/shoes/f13/military
	r_pocket = /obj/item/flashlight/flare
	l_pocket = /obj/item/radio

// Commander
/datum/job/gmb/commander
	title = "Commander"
	flag = F13GMBCOMMANDER
	total_positions = 1
	spawn_positions = 1
	description = "The head of the Brattleboro GMB group. All members of the Brattleboro GMB answer directly to them."
	supervisors = "Morals."
	outfit = /datum/outfit/job/gmb/commander
	req_admin_notify = 1
	exp_requirements = 960
	access = list(ACCESS_GMB, ACCESS_GMB_BOSS, ACCESS_GMB_MOTORPOOL)
	minimal_access = list(ACCESS_GMB, ACCESS_GMB_BOSS, ACCESS_GMB_MOTORPOOL)

/datum/outfit/job/gmb/commander
	name = "Commander"
	jobtype = /datum/job/gmb/commander
	id = /obj/item/card/id/gmb_commander_keys

// Watchman
/datum/job/gmb/watchman
	title = "Watchman"
	flag = F13GMBWATCHMAN
	total_positions = 1
	spawn_positions = 1
	description = "Like the Militia, but watches over the camp and its general surroundings as well as handling any disputes between both civilians and GMB members."
	supervisors = "Commander."
	outfit = /datum/outfit/job/gmb/watchman
	req_admin_notify = 1
	exp_requirements = 480
	access = list(ACCESS_GMB, ACCESS_GMB_BOSS, ACCESS_GMB_MOTORPOOL)
	minimal_access = list(ACCESS_GMB, ACCESS_GMB_BOSS, ACCESS_GMB_MOTORPOOL)

/datum/outfit/job/gmb/watchman
	name = "Watchman"
	jobtype = /datum/job/gmb/watchman
	id = /obj/item/card/id/gmb_commander_keys

// Walker
/datum/job/gmb/walker
	title = "Walker"
	flag = F13GMBWALKER
	total_positions = 2
	spawn_positions = 2
	description = "A veteran militia member tasked with diplomacy, relations, retrieval and scouting as well as leading patrols. \
	Answers only to the Commander and in the absence of a Commander is the leading authority."
	supervisors = "Commander."
	outfit = /datum/outfit/job/gmb/walker
	exp_requirements = 240
	access = list(ACCESS_GMB, ACCESS_GMB_MOTORPOOL)
	minimal_access = list(ACCESS_GMB, ACCESS_GMB_MOTORPOOL)

	loadout_options = list(
	//datum/outfit/loadout/walker/veteran,
	/datum/outfit/loadout/walker/marksmen,
	/datum/outfit/loadout/walker/heavy,)

/datum/outfit/job/gmb/walker
	name = "Walker"
	jobtype = /datum/job/gmb/walker
	id = /obj/item/card/id/gmb_commander_keys

/*/datum/outfit/loadout/walker/veteran
	name = "Veteran"
	backpack_contents = list()*/ // WAITING FOR THE CARL TO GIVE IDEA

/datum/outfit/loadout/walker/marksmen
	name = "Marksmen"
	r_hand = /obj/item/gun/ballistic/rifle/enfield
	l_hand = /obj/item/gun/ballistic/automatic/pistol/beretta/automatic
	suit = /obj/item/clothing/suit/armored/f13/light/leathermk2
	backpack_contents = list(/obj/item/ammo_box/magazine/m9mmds,) // Please add .308 when able, KOARL

/datum/outfit/loadout/walker/heavy
	name = "Heavy"
	r_hand = /obj/item/gun/ballistic/automatic/lsw
	l_hand = /obj/item/ammo_box/magazine/m556/rifle
	suit = /obj/item/clothing/suit/armored/f13/heavy/metal
	head = /obj/item/clothing/head/helmet/armyhelmet/heavy
	backpack_contents = list()

// Militia
/datum/job/gmb/militia
	title = "Militia"
	flag = F13GMBMILITIA
	total_positions = 4
	spawn_positions = 4
	description = "A more well trained Volunteer. The main working force of the GMB."
	supervisors = "Commander."
	outfit = /datum/outfit/job/gmb/militia
	exp_requirements = 120

	loadout_options = list(
	/datum/outfit/loadout/militia/hunter,
	/datum/outfit/loadout/militia/musketeer,
	/datum/outfit/loadout/militia/rifleman,)


/datum/outfit/job/gmb/militia
	name = "Militia"
	jobtype = /datum/job/gmb/militia

/datum/outfit/loadout/militia/rifleman
	name = "Rifleman"
	r_hand = /obj/item/gun/ballistic/automatic/assault_rifle
	l_hand = /obj/item/ammo_box/magazine/m556/rifle // two loaded magazines.
	backpack_contents = list(/obj/item/ammo_box/magazine/m556/rifle,
							/obj/item/melee/onehanded/knife/bayonet)

/datum/outfit/loadout/militia/hunter
	name = "Hunter"
	r_hand = /obj/item/gun/ballistic/rifle/repeater/cowboy
	l_hand = /obj/item/ammo_box/magazine/internal/shot/tube357 // four loaded magazines.
	backpack_contents = list(/obj/item/ammo_box/magazine/internal/shot/tube357,
							/obj/item/ammo_box/magazine/internal/shot/tube357,
							/obj/item/ammo_box/magazine/internal/shot/tube357,
							/obj/item/melee/onehanded/knife/hunting,)

/datum/outfit/loadout/militia/musketeer
	name = "Musketeer"
	l_hand = /obj/item/gun/ballistic/rifle/hobo/lasmusket
	// Yup. Nothing else. Fuck you. It's a laser rifle. Be happy you even got that one cell.
	backpack_contents = list()

// Volunteer
/datum/job/gmb/volunteer
	title = "Volunteer"
	flag = F13GMBVOLUNTEER
	total_positions = -1
	spawn_positions = -1
	description = "You're essentially just a wastelander with a uniform and a gun."
	supervisors = "Commander."
	outfit = /datum/outfit/job/gmb/volunteer
	exp_requirements = 60
	exp_type = EXP_TYPE_WASTELAND
	loadout_options = list(
	/datum/outfit/loadout/volunteer/conscript,
	/datum/outfit/loadout/volunteer/watchmen,)

/datum/outfit/job/gmb/volunteer
	name = "Volunteer"
	jobtype = /datum/job/gmb/volunteer

/datum/outfit/loadout/volunteer/conscript
	name = "Conscript"
	r_hand = /obj/item/gun/ballistic/revolver/piperifle // YOU'RE A CONSCRIPT. BE HAPPY YOU EVEN GET A GUN.
	backpack_contents = list(/obj/item/melee/onehanded/knife/bayonet,)

/datum/outfit/loadout/volunteer/watchmen
	name = "Watchmen"
	r_hand = /obj/item/gun/ballistic/revolver/piperifle // YOU'RE A CONSCRIPT. BE HAPPY YOU EVEN GET A GUN.
	backpack_contents = list(/obj/item/melee/onehanded/knife/bayonet)
