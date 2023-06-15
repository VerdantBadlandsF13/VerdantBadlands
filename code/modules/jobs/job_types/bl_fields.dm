/datum/job/dfs
	department_flag = DFS
	selection_color = "#2f556b"
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

/datum/outfit/job/dfs
	name = "DFSdatums"
	jobtype = /datum/job/dfs
	id = /obj/item/card/id/dfs_raider_tags
	backpack = /obj/item/storage/backpack/trekker
	satchel = /obj/item/storage/backpack/satchel/trekker
	neck = /obj/item/storage/belt/holster/legholster
	ears = null
	uniform	= /obj/item/clothing/under/f13/merca/dfs
	shoes = /obj/item/clothing/shoes/f13/military
	r_pocket = /obj/item/flashlight/flare
	l_pocket = /obj/item/radio

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

/datum/outfit/job/dfs/advisor
	name = "DFS Advisor"
	jobtype = /datum/job/dfs/advisor
	uniform = /obj/item/clothing/under/f13/mercc/dfs
	id = /obj/item/card/id/dfs_boss_raider_tags

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
	/datum/outfit/loadout/enforcer/enforcer,)

/datum/outfit/job/dfs/enforcer
	name = "DFS Enforcer"
	jobtype = /datum/job/dfs/enforcer
	uniform = /obj/item/clothing/under/f13/mercc/dfs
	id = /obj/item/card/id/dfs_boss_raider_tags

// Fourty-five submachinegun. For when business decisions become executive! And a badass coat.
/datum/outfit/loadout/enforcer/taskmaster
	name = "Taskmaster"
	r_hand = /obj/item/gun/ballistic/automatic/smg/tommygun
	l_hand = /obj/item/ammo_box/magazine/tommygunm45 // Fifty rounds on tap. Two spare sticks.
	gloves = /obj/item/clothing/gloves/f13/military
	suit = /obj/item/clothing/suit/armored/f13/medium/armoredcoat
	backpack_contents = list(/obj/item/ammo_box/magazine/tommygunm45/stick/empty,
							/obj/item/ammo_box/magazine/tommygunm45/stick/empty,)

// To be fair: nobody fucks with a dude who uses a flamethrower. Heavy armor and VERY clearly a background of Raider. What a peacemaker!
/datum/outfit/loadout/enforcer/peacemaker
	name = "Peacemaker"
	r_hand = /obj/item/m2flamethrowertank
	suit = /obj/item/clothing/suit/armored/f13/heavy/sulphite
	head = /obj/item/clothing/head/helmet/f13/sulphitehelm
	backpack_contents = list()

/datum/outfit/loadout/enforcer/enforcer
	name = "Enforcer"
	r_hand = /obj/item/gun/ballistic/shotgun/automatic/combat/auto5
	suit = /obj/item/clothing/suit/armored/f13/medium/combat/mk2
	head = /obj/item/clothing/head/helmet/f13/combat/mk2
	backpack_contents = list(/obj/item/ammo_box/shotgun/buck,)

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

/datum/outfit/job/dfs/agent
	name = "DFS Agent"
	jobtype = /datum/job/dfs/agent

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
	/datum/outfit/loadout/grunt/mercenary,
	/datum/outfit/loadout/grunt/sadist,
	/datum/outfit/loadout/grunt/punisher,)

/datum/outfit/job/dfs/regular
	name = "DFS Regular"
	jobtype = /datum/job/dfs/regular

// Mercenaries trade armor for a solid rifle. Something to show off for the Caravan.
/datum/outfit/loadout/grunt/mercenary
	name = "Mercenary"
	r_hand = /obj/item/gun/ballistic/automatic/rangemaster
	l_hand = /obj/item/ammo_box/magazine/m762 // 1 loaded, two empty standard magazines.
	suit = /obj/item/clothing/suit/armored/f13/light/leathermk2
	backpack_contents = list(/obj/item/ammo_box/magazine/m762/empty,
							/obj/item/ammo_box/magazine/m762/empty,
							/obj/item/melee/onehanded/knife/bayonet)
							
// Sadists rush into combat with strong medium armor, but no firearm. Likely conscripted Raiders that proved their worth.
/datum/outfit/loadout/grunt/sadist
	name = "Sadist"
	r_hand = /obj/item/twohanded/fireaxe/bmprsword
	l_hand = /obj/item/melee/onehanded/knife/bowie
	suit = /obj/item/clothing/suit/armored/f13/medium/combat/scrapcombat
	head = /obj/item/clothing/head/helmet/f13/combat
	backpack_contents = list()
	
// Punishers use heavy armor and shotguns to become bulwarks on the defence.
/datum/outfit/loadout/grunt/punisher
	name = "Punisher"
	r_hand = /obj/item/gun/ballistic/shotgun/hunting // Full box of the fun-stuff
	l_hand = /obj/item/melee/onehanded/knife/bowie
	suit = /obj/item/clothing/suit/armored/f13/heavy/metal
	head = /obj/item/clothing/head/helmet/f13/combat/mk2/raider
	backpack_contents = list(/obj/item/ammo_box/shotgun/buck)

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

/datum/outfit/job/dfs/grunt
	name = "DFS Grunt"
	jobtype = /datum/job/dfs/grunt
