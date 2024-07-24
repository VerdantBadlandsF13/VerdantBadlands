/datum/job/town
	department_flag = TWN
	selection_color = "#6b5f63"
	faction = FACTION_TWN
	exp_type = EXP_TYPE_TWN

	access = list(ACCESS_TOWN)
	minimal_access = list(ACCESS_TOWN)

	forbids = "The town's binding rules: <br> \
				- You're a group of wasters in an organised community.<br> \
				- The Lookout-on-Duty's word is generally law, enforcing the current leadership's wishes. Try to follow it.<br> \
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
	description = "Welcome to our little slice of Heaven. \
	So long as you respect our by-laws of course. \
	This is what you, the figurehead of the Hilltop Neighbourhood, say to every newcomer and trader with a charming smile. \
	Our founding fathers established our loving community by following the ancient texts; the Hou-Ah Handing Book, a text so ancient that it's words are untranslatable by most. \
	Thanks to your background however, you can decipher the legalese contained within and use it to secure your only goal: Having a comfortable office and bedroom in the largest house in town."
	supervisors = "fate"

	outfit = /datum/outfit/job/town/f13townleader

	access = list(ACCESS_TOWN, ACCESS_TWN_RESTRICT)
	minimal_access = list(ACCESS_TOWN, ACCESS_TWN_RESTRICT)

	loadout_options = list(
	/datum/outfit/loadout/f13townleader/pastor,
	/datum/outfit/loadout/f13townleader/sheriff,
	/datum/outfit/loadout/f13townleader/councilman)

/datum/outfit/job/town/f13townleader
	name = "Hilltop Leader"
	jobtype = /datum/job/town/f13townleader
	id =			/obj/item/card/id/hilltop_leadership_keys
	l_pocket =		/obj/item/storage/bag/money/small/wastelander


/datum/outfit/loadout/f13townleader/pastor
	name = "Pastor"
	desc = "Where there are people, there are souls to save. Hilltop is no exception. \
	As an Evangelist, you came here on a most devout mission: Teach the local hicks about the love of Christ. \
	What ended up happening was your swift ascension to a position of leadership in the town thanks to your moderate level of education and accrued goodwill from the locals. \
	Unlike most other influential men here, you genuinely wish only the best for the settlers."
	backpack_contents = list(
		/obj/item/book/granter/trait/holy =1,
		/obj/item/storage/book/bible =1,
		)

/datum/outfit/loadout/f13townleader/sheriff
	name = "Sheriff"
	desc = "A very intelligent man from a very far away land in ancient times once said that a state is a human community that successfully claims the monopoly of physical force in a given territory. \
	You took this quote to heart early in your life and decided to become the only legitimate kind of statesman: a Sheriff. \
	Your word is law, the lookouts only ever stop looking out to look up (at you), and your make sure to keep the troublemakers out; be they raiders, mercenaries, or republicans."

/datum/outfit/loadout/f13townleader/councilman
	name = "Councilman"
	desc = "You were never actually interested in politics. \
	A string of extremely fortunate events simply fell in your lap while you were working your usual scam artist gig. \
	You found a pre-war book on law. Soon after, you manage to fake your way to be a member on the Hilltop Council. \
	You've got the cleanest suit, the people's respect, a safe home, a big leather chair, and most importantly? A lot of funds to embezzle."

/datum/job/town/f13lookout
	title = "Hilltop Lookout"
	flag = F13TWNLOOKOUT
	total_positions = 2
	spawn_positions = 2
	description = "Thick walls, friendly neighbours, good drink, and <b>NO WITCHES</b>. This is what makes Hilltop beautiful. And you are what makes it safe. \
	Be it with guns, knives, improvised explosives, or a big lever that says 'gate lock'; you and your colleagues have kept this place safe from the outside. \
	Internal crime is basically unheard of, but you never know... A witch might mind control someone into causing trouble."
	supervisors = "the leadership"

	outfit = /datum/outfit/job/town/f13lookout

	access = list(ACCESS_TOWN, ACCESS_TWN_RESTRICT)
	minimal_access = list(ACCESS_TOWN, ACCESS_TWN_RESTRICT)

	loadout_options = list(
	/datum/outfit/loadout/f13lookout/deputy,
	/datum/outfit/loadout/f13lookout/mercenary,
	/datum/outfit/loadout/f13lookout/warrior)

/datum/outfit/job/town/f13lookout
	name = "Lookout"
	jobtype = /datum/job/town/f13lookout
	id =			/obj/item/card/id/hilltop_leadership_keys
	l_pocket =		/obj/item/storage/bag/money/small/wastelander

/datum/outfit/loadout/f13lookout/deputy
	name = "Deputy"
	desc = "You love the law. \
	She may be blind, but she is a beautiful mistress and you would sooner lay down your life for her than see her be defiled by some outsider. \
	You keep the gate safe, you walk the beat, and sometimes you beat information out of witches. All in a day's work."

/datum/outfit/loadout/f13lookout/mercenary
	name = "Mercenary"
	desc = "You love money. \
	Hilltop can't defend itself with just its inbred gang of law enforcers, and so they often resolve that issue by hiring bounty hunters, mercenaries, foreign deserters, or reformed raiders to protect it from the outside. \
	You'd sooner turn tail than die for this place, but this is why you took this job. \
	It pays incredibly well and shooting a 'witch' once in a while isn't really dangerous to you."

/datum/outfit/loadout/f13lookout/warrior
	name = "Warrior"
	desc = "You love beating up the baddies. A while ago your dimwit self found a gun in the trash. \
	Since then you've started calling yourself a warrior and followed the other Lookouts around and telling them you want to kill the bad guys. \
	In every other situation you'd have been escorted home and forgotten about the gun. \
	But since you never actually asked for a wage, the Lookouts took you in as one of their own."

/datum/job/town/f13tavernkeep
	title = "Tavernkeep"
	flag = F13TWNTAVERNKEEP
	total_positions = 1
	spawn_positions = 1
	req_admin_notify = 1
	roleplay_exclusive_notify = 1
	description = "You are the proprietor of the local B&B-Tavern-Speakeasy-Pawnshop combo in Hilltop. \
	You love your job, you love your customers, and you love to point your gun at punks who want to start trouble. \
	You sadly can't chase them to far away because of your limp, which you love to tell the story of to your patrons. \
	Said story changes to become even more interesting every hour."
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
	description = "Brought to Hilltop by fate, you were either born here or came so often that everyone assumed you lived here. \
	The day to day isn't bad, you do whatever job you were taught to do or claimed to be, and finish the day drinking the best moonshine in Vermont at the tavern. \
	Feels good to live in Hilltop."
	supervisors = "the lookouts and leadership"

	outfit = /datum/outfit/job/town/f13settler

	access = list(ACCESS_TOWN)
	minimal_access = list(ACCESS_TOWN)

	loadout_options = list(
	/datum/outfit/loadout/f13settler/moonshiner,
	/datum/outfit/loadout/f13settler/sidewalker,
	/datum/outfit/loadout/f13settler/barber,
	/datum/outfit/loadout/f13settler/handyman,
	/datum/outfit/loadout/f13settler/homeowner)

/datum/outfit/job/town/f13settler
	name = "Hilltop Inhabitant"
	jobtype = /datum/job/town/f13settler
	l_pocket =		/obj/item/storage/bag/money/small/wastelander


/datum/outfit/loadout/f13settler/moonshiner
	name = "Moonshiner"
	desc = "You make the best moonshine in all of Vermont, and those who say otherwise will get to taste your second speciality: the knuckle sandwich. \
	You are without a doubt the main economic drive of the town. \
	All thanks to outsider traders who often take a detour to purchase your brew with the hopes of reselling it all over Battleborough and beyond. \
	No refunds."

/datum/outfit/loadout/f13settler/sidewalker
	name = "Sidewalker"
	desc = "While a resident of Hilltop, you don't actually have a house here on accounts of being either too poor or too new for one. \
	This sorry state of events leaves you to take the most disgraceful jobs available around the place or go prospect the many ruins outside of town."

/datum/outfit/loadout/f13settler/barber
	name = "Barber"
	desc = "You learned to cut hair and do it with unequalled precision. \
	Sadly due to circumstances only known to you, you had to expand your business practice to surgery and medicine in order to make end's meet. \
	You likely learned to perform surgery by practising on the desperate."

/datum/outfit/loadout/f13settler/handyman
	name = "Handyman"
	desc = "Formally you are equal in status to the Homeowners. The only difference is that you are called to fix just about anything and everything in town. \
	Walls, floors, sweeping the streets, squeaky bed, unhinged door. If something is broken, you are ready to get paid to fix it."

/datum/outfit/loadout/f13settler/homeowner
	name = "Homeowner"
	desc = "You lucked out. You actually own a place to sleep in at night. \
	And this is because you are either really good at what you do, or because you are involved in the local Moonshining business as a farmer."
