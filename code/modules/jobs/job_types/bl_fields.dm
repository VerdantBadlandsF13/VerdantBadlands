/datum/job/dfs
	department_flag = DFS
	selection_color = "#966c61"
	faction = FACTION_DFS
	exp_type = EXP_TYPE_DFS

	access = list(ACCESS_DFS)
	minimal_access = list(ACCESS_DFS)

	forbids = "Dry Fields Security forbids: <br> \
				- Provoking wars. You're tough, but not undefeatable. Know what battles you can and can't afford. <br> \
				- Farming. While not forbidden by any rule or technicality, it is much more cost effective to coerce the locals into giving you what you want. <br> \
				- Overextend. Never isolate yourself unless you're undercover. A team works better together."

	enforces = "Dry Fields Security expects: <br> \
				- Strongarming. Appearing tough and responding to diplomacy with a show of force can work miracles. <br> \
				- Extortion. You want money and people may not want protection. Give them a reason to. <br> \
				- Scavenging. You do not have a stable supply of food, water or components. <br> \
				- Kidnapping. Someone have something you want? Try taking one of their friends, or them. People are usually worth a lot more than their share of cram alive. <br> \
				- Negotiation. Violence has its place, but diplomacy goes a long way when it's backed up by your guns."

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/dfs,
			/datum/job/wasteland/f13tavernkeep,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/gmb,
			/datum/job/wasteland/f13tavernkeep,
		),
		/datum/matchmaking_pref/mentor = list(
			/datum/job/dfs,
			/datum/job/wasteland/f13tavernkeep,
		),
		/datum/matchmaking_pref/disciple = list(
			/datum/job/dfs,
			/datum/job/wasteland/f13tavernkeep,
		),
		/datum/matchmaking_pref/patron = list(
			/datum/job/dfs,
			/datum/job/wasteland/f13tavernkeep,
		),
		/datum/matchmaking_pref/protegee = list(
			/datum/job/dfs,
			/datum/job/wasteland/f13tavernkeep,
		),
	)

/datum/outfit/job/dfs
	name = "DFSdatums"
	jobtype = /datum/job/dfs
	id = /obj/item/card/id/dfs_raider_tags
	backpack = /obj/item/storage/backpack/trekker
	satchel = /obj/item/storage/backpack/satchel/trekker
	neck = /obj/item/storage/belt/holster/legholster/dfs
	ears = /obj/item/radio/headset/headset_dfs
	uniform = /obj/item/clothing/under/f13/dfs
	shoes = /obj/item/clothing/shoes/f13/military
	r_pocket = /obj/item/flashlight/flare

// DFS Advisor
/datum/job/dfs/advisor
	title = "DFS Advisor"
	flag = F13DFSADVISOR
	total_positions = 1
	spawn_positions = 1
	description = "The highest authority in Dry Fields Security.  \
	Despite the name, Advisors are responsible for anything ranging from giving out orders to patrols while at base to leading their troops directly in battle or while on patrol."
	supervisors = "Morals."
	outfit = /datum/outfit/job/dfs/advisor
	req_admin_notify = 1
	exp_requirements = 960
	access = list(ACCESS_DFS, ACCESS_DFS_BOSS)
	minimal_access = list(ACCESS_DFS, ACCESS_DFS_BOSS)

	loadout_options = list(
	/datum/outfit/loadout/advisor/brute,
	/datum/outfit/loadout/advisor/suave)

/datum/outfit/job/dfs/advisor
	name = "DFS Advisor"
	jobtype = /datum/job/dfs/advisor
	uniform = /obj/item/clothing/under/f13/dfs
	neck = /obj/item/storage/belt/holster/legholster/dfs_boss
	id = /obj/item/card/id/dfs_boss_raider_tags

/datum/outfit/job/dfs/advisor/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, TRAIT_GENERIC)

/datum/outfit/loadout/advisor/brute
	name = "Brute"
	l_hand = /obj/item/twohanded/thermic_lance/reconciliation
	suit = /obj/item/clothing/suit/armored/f13/heavy/dfs
	head = /obj/item/clothing/head/helmet/f13/firefighter//TEMP HELMET

/datum/outfit/loadout/advisor/suave
	name = "Suave"
	mask = /obj/item/clothing/mask/cigarette/pipe
	gloves = /obj/item/melee/unarmed/brass/lovetap
	r_hand = /obj/item/gun/ballistic/automatic/fnfal/roundstart
	l_hand = /obj/item/ammo_box/magazine/m762
	suit = /obj/item/clothing/suit/armored/f13/light/dfs/command

// DFS Enforcer
/datum/job/dfs/enforcer
	title = "DFS Enforcer"
	flag = F13DFSENFORCER
	total_positions = 1
	spawn_positions = 1
	description = "Stays near the compound to ensure nobody gets in or out without verification. \
	Guards prisoners when applicable, stops infighting and otherwise keeps the compound secure."
	supervisors = "Advisor."
	outfit = /datum/outfit/job/dfs/enforcer
	req_admin_notify = 1
	exp_requirements = 480
	access = list(ACCESS_DFS, ACCESS_DFS_BOSS)
	minimal_access = list(ACCESS_DFS, ACCESS_DFS_BOSS)

	loadout_options = list(
	/datum/outfit/loadout/enforcer/taskmaster,
	/datum/outfit/loadout/enforcer/peacemaker,
	/datum/outfit/loadout/enforcer/bouncer)

/datum/outfit/job/dfs/enforcer
	name = "DFS Enforcer"
	jobtype = /datum/job/dfs/enforcer
	uniform = /obj/item/clothing/under/f13/dfs/fire
	belt = /obj/item/storage/belt/bandolier/grenade_belt_incen
	gloves = /obj/item/clothing/gloves/f13/military
	id = /obj/item/card/id/dfs_boss_raider_tags

/datum/outfit/loadout/enforcer/taskmaster
	name = "Taskmaster"
	r_hand = /obj/item/gun/ballistic/automatic/smg/tommygun/roundstart
	l_hand = /obj/item/ammo_box/magazine/tommygunm45
	suit = /obj/item/clothing/suit/armored/f13/light/dfs/command

/datum/outfit/loadout/enforcer/peacemaker
	name = "Peacemaker"
	r_hand = /obj/item/m2flamethrowertank
	suit = /obj/item/clothing/suit/armored/f13/heavy/dfs
	head = /obj/item/clothing/head/helmet/f13/firefighter//TEMP HELMET

/datum/outfit/loadout/enforcer/bouncer
	name = "Bouncer"
	mask = /obj/item/clothing/mask/cigarette
	r_hand = /obj/item/gun/ballistic/shotgun/automatic/combat/auto5/roundstart
	suit = /obj/item/clothing/suit/armored/f13/light/dfs/command

// DFS Agent
/datum/job/dfs/agent
	title = "DFS Agent"
	flag = F13DFSAGENT
	total_positions = 2
	spawn_positions = 2
	description = "A Regular specialized in subtlety and subterfuge. Not typically involved in combat, Agents are responsible for exploration, spying and kidnapping."
	supervisors = "Enforcer."
	outfit = /datum/outfit/job/dfs/agent
	exp_requirements = 240

	loadout_options = list(
	/datum/outfit/loadout/agent/acquisition,
	/datum/outfit/loadout/agent/specialist)

/datum/outfit/job/dfs/agent
	name = "DFS Agent"
	jobtype = /datum/job/dfs/agent
	suit = /obj/item/clothing/suit/armored/f13/light/dfs

/datum/outfit/loadout/agent/acquisition
	name = "Acquisition Agent"
	r_hand = /obj/item/gun/ballistic/automatic/assault_rifle/roundstart
	l_hand = /obj/item/ammo_box/magazine/m556/rifle
	backpack_contents = list(
		/obj/item/electropack/shockcollar =2,
		/obj/item/electropack/shockcollar/explosive =1,
		/obj/item/key/scollar =1,
		/obj/item/key/bcollar =1,
		)

/datum/outfit/loadout/agent/specialist
	name = "Specialist"
	r_hand = /obj/item/gun/ballistic/automatic/marksman/sniper/roundstart
	l_hand = /obj/item/ammo_box/magazine/w308
	belt = /obj/item/storage/belt/bandolier/grenade_belt

// DFS Regular
/datum/job/dfs/regular
	title = "DFS Regular"
	flag = F13DFSREGULAR
	total_positions = 4
	spawn_positions = 4
	description = "Backbone of the DFS. They are members who have demonstrated their ability crush resistance and hold their own."
	supervisors = "Agent."
	outfit = /datum/outfit/job/dfs/regular
	exp_requirements = 120

	loadout_options = list(
	/datum/outfit/loadout/regular/veteran,
	/datum/outfit/loadout/regular/rook)

/datum/outfit/job/dfs/regular
	name = "DFS Regular"
	jobtype = /datum/job/dfs/regular
	suit = /obj/item/clothing/suit/armored/f13/light/dfs

/datum/outfit/loadout/regular/veteran
	name = "Veteran"
	r_hand = /obj/item/gun/ballistic/automatic/smg/mp5/roundstart
	l_hand = /obj/item/ammo_box/magazine/uzim9mm

/datum/outfit/loadout/regular/rook
	name = "Rook"
	r_hand = /obj/item/gun/ballistic/rifle/hunting/roundstart

//DFS Grunt
/datum/job/dfs/grunt
	title = "DFS Grunt"
	flag = F13DFSGRUNT
	total_positions = -1
	spawn_positions = -1
	description = "The lowest on the totem pole, Grunts are either wastelanders or outlaws in need of a more organized group."
	supervisors = "Regular."
	outfit = /datum/outfit/job/dfs/grunt
	exp_requirements = 60
	exp_type = EXP_TYPE_WASTELAND

	loadout_options = list(
	/datum/outfit/loadout/grunt/wastrel,
	/datum/outfit/loadout/grunt/washout)

/datum/outfit/job/dfs/grunt
	name = "DFS Grunt"
	jobtype = /datum/job/dfs/grunt

/datum/outfit/loadout/grunt/wastrel
	name = "Wastrel"
	suit = /obj/item/clothing/suit/armored/f13/light/outlander
	r_hand = /obj/item/gun/ballistic/revolver/single_shotgun

/datum/outfit/loadout/grunt/washout
	name = "Washout"
	suit = /obj/item/clothing/suit/armored/f13/medium/outlander
	l_hand = /obj/item/gun/ballistic/revolver/piperifle

