/datum/job/dfs
	department_flag = DFS
	selection_color = "#2f556b"
	faction = FACTION_DFS
	exp_type = EXP_TYPE_DFS

	access = list(ACCESS_DFS)
	minimal_access = list(ACCESS_DFS)

	forbids = "The DFS forbids: Provoking wars. You're tough, but not undefeatable. Know what battles you can and can't afford. <br> \
				- Farming. While not forbidden by any rule or technicality, it is much more cost effective to coerce the locals into giving you what you want. <br> \
				- Overextend. Never isolate yourself unless you're undercover. A team works better together."

	enforces = "The DFS expects: Strongarming. Appearing tough and responding to diplomacy with a show of force can work miracles. <br> \
				- Extortion. You want money and people may not want protection. Give them a reason to. <br> \
				- Scavenging. You do not have a stable supply of food, water or components. <br> \
				- Kidnapping. Someone have something you want? Try taking one of their friends, or them. People are usually worth a lot more than their share of cram alive. <br> \
				- Negotiation. Violence has its place, but diplomacy goes a long way when it's backed up by your guns."

/datum/outfit/job/dfs
	name = "DFSdatums"
	jobtype = /datum/job/dfs
	backpack = /obj/item/storage/backpack/trekker
	satchel = /obj/item/storage/backpack/satchel/trekker
	neck = /obj/item/storage/belt/holster/legholster
	ears = null
	uniform	= /obj/item/clothing/under/f13/merca/dfs
	shoes = /obj/item/clothing/shoes/f13/military
	backpack_contents = list(
		/obj/item/storage/survivalkit_aid = 1,
		)

//DFS Advisor
/datum/job/dfs/advisor
	title = "DFS Advisor"
	flag = F13DFSADVISOR
	total_positions = 1
	spawn_positions = 1
	description = "The highest authority in Dry Fields Security.  \
	Despite the name, Advisors are responsible for anything ranging from giving out orders to patrols while at base to leading his men directly in battle or while on patrol."
	supervisors = "Morals."
	outfit = /datum/outfit/job/dfs
	req_admin_notify = 1

//DFS Enforcer
/datum/job/dfs/enforcer
	title = "DFS Enforcer"
	flag = F13DFSENFORCER
	total_positions = 1
	spawn_positions = 1
	description = "Stays near the compound to ensure nobody gets in or out without verification. \
	Guards prisoners when applicable, stops infighting and otherwise keeps the compound secure."
	supervisors = "Advisor."
	outfit = /datum/outfit/job/dfs

//DFS Agent
/datum/job/dfs/agent
	title = "DFS Agent"
	flag = F13DFSAGENT
	total_positions = 2
	spawn_positions = 2
	description = "A Regular specialized in subtlety and subterfuge. Not typically involved in combat, Agents are responsible for exploration, spying and kidnapping."
	supervisors = "Enforcer."
	outfit = /datum/outfit/job/dfs

//DFS Regular
/datum/job/dfs/regular
	title = "DFS Regular"
	flag = F13DFSREGULAR
	total_positions = 4
	spawn_positions = 4
	description = "Backbone of the DFS. They are members who have demonstrated their ability crush resistance and hold their own."
	supervisors = "Agent."
	outfit = /datum/outfit/job/dfs

//DFS Grunt
/datum/job/dfs/grunt
	title = "DFS Grunt"
	flag = F13DFSGRUNT
	total_positions = -1
	spawn_positions = -1
	description = "The lowest on the totem pole, Grunts are either wastelanders or outlaws in need of a more organized group."
	supervisors = "Regular."
	outfit = /datum/outfit/job/dfs
