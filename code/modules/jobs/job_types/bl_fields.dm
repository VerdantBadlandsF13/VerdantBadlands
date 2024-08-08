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
				- Overextension. Never isolate yourself unless you're undercover. A team works better together."

	enforces = "Dry Fields Security expects: <br> \
				- Strongarming. Appearing tough and responding to diplomacy with a show of force can work miracles. <br> \
				- Extortion. You want money and people may not want protection. Give them a reason to. <br> \
				- Scavenging. You do not have a stable supply of food, water or components. <br> \
				- Kidnapping. Someone have something you want? Try taking one of their friends, or them. People are usually worth a lot more than their share of cram alive. <br> \
				- Negotiation. Violence has its place, but diplomacy goes a long way when it's backed up by your guns."

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/dfs,
			/datum/job/town/f13tavernkeep,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/gmb,
			/datum/job/town/f13tavernkeep,
		),
		/datum/matchmaking_pref/mentor = list(
			/datum/job/dfs,
			/datum/job/town/f13tavernkeep,
		),
		/datum/matchmaking_pref/disciple = list(
			/datum/job/dfs,
			/datum/job/town/f13tavernkeep,
		),
		/datum/matchmaking_pref/patron = list(
			/datum/job/dfs,
			/datum/job/town/f13tavernkeep,
		),
		/datum/matchmaking_pref/protegee = list(
			/datum/job/dfs,
			/datum/job/town/f13tavernkeep,
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
	description = "The biggest rat knows where all the best cheese is. And you're not him. \
	You're the biggest cat in the whole barn, who patiently waited for the rats to fatten up before making dinner out of them."
	supervisors = "the Executive"
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
	box = /obj/item/storage/survivalkit_aid_adv

/datum/outfit/job/dfs/advisor/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, TRAIT_GENERIC)

/datum/outfit/loadout/advisor/brute
	name = "Brute"
	desc = "You beat the fuck out of everyone around you until they stopped asking questions. It worked so far, so why stop?"
	l_hand = /obj/item/twohanded/thermic_lance/reconciliation
	suit = /obj/item/clothing/suit/armored/f13/heavy/dfs
	head = /obj/item/clothing/head/helmet/f13/dfs

/datum/outfit/loadout/advisor/suave
	name = "Suave"
	desc = "This position you're in? You didn't earn it by being here the longest, you did it because you meticulously planned your ascension. \
	The Executive noticed it and made you into what you are now; the Boss."
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
	description = "You're one of a kind. \
	You stopped boasting and shouting years ago, and it's what made your Advisor notice you. \
	Whether you came from the ranks of the Agents or Regulars? \
	The combination of your veterancy, track record, and general demeanour means you were made into his right-hand man, bodyguard, and confidant. \
	You are freakishly loyal, even when you turn out to be the wrangler for certain kinds of Advisors."
	supervisors = "the Advisor"
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
	desc = "You were an Acquisition Agent once. \
	But your ability to squeeze every ounce of work from slaves and intimidate grunts into running head first into minefields was picked up on by your Advisor. \
	Now you run the day to day operations of the crew for the Boss while he takes it easy."
	r_hand = /obj/item/gun/ballistic/automatic/smg/tommygun/roundstart
	l_hand = /obj/item/ammo_box/magazine/tommygunm45
	suit = /obj/item/clothing/suit/armored/f13/light/dfs/command

/datum/outfit/loadout/enforcer/peacemaker
	name = "Peacemaker"
	desc = "You were never subtle, or really that smart. \
	Everyone around you knows that and questions why you were put into this position. \
	But they never do so out loud because they fear you. You're not a manager or a bodyguard, you're the Advisor's Pitbull"
	r_hand = /obj/item/m2flamethrowertank
	suit = /obj/item/clothing/suit/armored/f13/heavy/dfs
	head = /obj/item/clothing/head/helmet/f13/dfs

/datum/outfit/loadout/enforcer/bouncer
	name = "Bouncer"
	desc = "Nobody knows you. All they know is your name. \
	You're not loyal any more, you are fanatically devoted to your Advisor and shadow his every movement. \
	Countless times you saved his life, even if he didn't notice."
	mask = /obj/item/clothing/mask/cigarette
	r_hand = /obj/item/gun/ballistic/shotgun/automatic/combat/auto5/roundstart
	suit = /obj/item/clothing/suit/armored/f13/light/dfs/command

// DFS Agent
/datum/job/dfs/agent
	title = "DFS Agent"
	flag = F13DFSAGENT
	total_positions = 2
	spawn_positions = 2
	description = "You're smart. Smarter than most of your comrades. \
	The Boss clearly knows that and respects you for it because your ascension to rookiedom was swiftly ended as you were made an agent. \
	A spy, a saboteur, a diplomat and general handsome guy with a killer smile. Truth is, you were made an agent because you didn't fry all your braincells with jet yet."
	supervisors = "the Enforcer"
	outfit = /datum/outfit/job/dfs/agent
	exp_requirements = 240

	loadout_options = list(
	/datum/outfit/loadout/agent/acquisition,
	/datum/outfit/loadout/agent/specialist)

/datum/outfit/job/dfs/agent
	name = "DFS Agent"
	jobtype = /datum/job/dfs/agent
	suit = /obj/item/clothing/suit/armored/f13/light/dfs
	head = /obj/item/clothing/head/helmet/f13/dfs_hood

/datum/outfit/loadout/agent/acquisition
	name = "Acquisition Agent"
	desc = "While you were smart enough to be made into an agent, you never achieved the same level of tactfulness as others. \
	You'll never climb up the ranks, but you're fine with that. Why? Because you've got the best job in the world. Officially, you're a conscription manager. \
	Formally, you're a slaver."
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
	desc = "You're in line to become the next Boss. \
	You and all the other specialists. \
	All that is left is to prove that you're not just a moron with authority, and can actually coerce people into doing your bidding. \
	You'll prove it by extorting wasters and rousing lesser gangs against each other for fun."
	r_hand = /obj/item/gun/ballistic/automatic/marksman/sniper/roundstart
	l_hand = /obj/item/ammo_box/magazine/w308
	belt = /obj/item/storage/belt/bandolier/grenade_belt
	backpack_contents = list(
		/obj/item/book/granter/trait/explosives =1,
		/obj/item/book/granter/crafting_recipe/blueprint/trapper =1,
		)

// DFS Regular
/datum/job/dfs/regular
	title = "DFS Regular"
	flag = F13DFSREGULAR
	total_positions = 4
	spawn_positions = 4
	description = "You don't pretend to be a raider any more. Why would you? \
	You're a real warrior, you've got the track record and scars to prove it, and like to show it off to those useless grunts. \
	You memorised the two most important pairs of words to say when a superior talks to you: 'Yes Boss.' and 'Sorry Boss.'"
	supervisors = "the Agents"
	outfit = /datum/outfit/job/dfs/regular
	exp_requirements = 120

	loadout_options = list(
	/datum/outfit/loadout/regular/veteran,
	/datum/outfit/loadout/regular/rook)

/datum/outfit/job/dfs/regular
	name = "DFS Regular"
	jobtype = /datum/job/dfs/regular
	suit = /obj/item/clothing/suit/armored/f13/light/dfs
	head = /obj/item/clothing/head/helmet/f13/dfs_hood

/datum/outfit/loadout/regular/veteran
	name = "Veteran"
	desc = "You remember your days as a rookie as if they were childhood memories. You were young and stupid then. \
	Now you spend your days complaining about the new rookies while smoking or kneecapping stray wasters with your buddies."
	r_hand = /obj/item/gun/ballistic/automatic/smg/mp5/roundstart
	l_hand = /obj/item/ammo_box/magazine/uzim9mm

/datum/outfit/loadout/regular/rook
	name = "Rook"
	desc = "Congratulations soldier, you're someone now. \
	Bet it feels good doesn't it? It's only been an hour, and you already firmly believe that grunts should be be beaten if they dare raise their eyes to look at you. \
	But everyone else knows the truth; that new equipment? You stole it. Those new stripes on your uniform? You ripped them off a corpse."
	r_hand = /obj/item/gun/ballistic/rifle/hunting/roundstart

//DFS Grunt
/datum/job/dfs/grunt
	title = "DFS Grunt"
	flag = F13DFSGRUNT
	total_positions = -1
	spawn_positions = -1
	description = "You are the lowest of the low, just wasteland scum given a gun and vague directions of what to point it at. \
	You either joined voluntarily with the promise of easy caps and chems, or had been'conscripted' as a child. \
	You've got next to no hope of climbing the ranks unless you prove yourself."
	supervisors = "the Regulars"
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
	desc = "You consider yourself lucky because you had the choice of joining or not. \
	You don't know this, but not joining when offered to usually means being strung up by the ankles and used for target practice."
	suit = /obj/item/clothing/suit/armored/f13/light/outlander
	r_hand = /obj/item/gun/ballistic/revolver/single_shotgun

/datum/outfit/loadout/grunt/washout
	name = "Washout"
	desc = "The DFS is all you know. The DFS is all you've ever known. \
	Your earliest memories were that of following a squad as a child soldier, running the pockets of the dead or serving as bait for cretins with a conscience. \
	But look at you, you're a real man now, you shot someone."
	suit = /obj/item/clothing/suit/armored/f13/medium/outlander
	l_hand = /obj/item/gun/ballistic/revolver/piperifle

