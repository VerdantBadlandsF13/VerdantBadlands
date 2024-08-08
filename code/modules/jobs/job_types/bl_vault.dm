/datum/job/vault
	department_flag = VFE
	selection_color = "#668959"
	faction = FACTION_VLT
	exp_type = EXP_TYPE_VLT
	roleplay_exclusive_notify = 1
	access = list(ACCESS_VFE)
	minimal_access = list(ACCESS_VFE)

	forbids = "Vault-Tec forbids: <br> \
				- Endangering your fellow dwellers, without explicit order from the Overseer. <br> \
				- Ignoring Security's orders, only capable of being overriden by the Overseer. <br> \
				- Revealing anything about the Vault, beyond surface level details, without permisson from the Overseer."

	enforces = "Vault-Tec expects: <br> \
				- Trading with the outside world. You've a secure depot up above, giving plenty of reason to leave the Vault. <br> \
				- Maintaining security and cohesion between your fellow dwellers. <br> \
				- Obeying the words of Security and the Overseer."

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/vault,
			/datum/job/town/f13tavernkeep,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/vault,
			/datum/job/town/f13tavernkeep,
		),
		/datum/matchmaking_pref/mentor = list(
			/datum/job/vault,
			/datum/job/town/f13tavernkeep,
		),
		/datum/matchmaking_pref/disciple = list(
			/datum/job/vault,
			/datum/job/town/f13tavernkeep,
		),
		/datum/matchmaking_pref/patron = list(
			/datum/job/vault,
			/datum/job/town/f13tavernkeep,
		),
		/datum/matchmaking_pref/protegee = list(
			/datum/job/vault,
			/datum/job/town/f13tavernkeep,
		),
	)

/datum/outfit/job/vault
	ears = 		/obj/item/radio/headset/headset_vault
	gloves = 	/obj/item/pda/dweller
	uniform = 	/obj/item/clothing/under/f13/vault

/datum/outfit/job/vault/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_ENCLAVE_CODES, TRAIT_GENERIC)// Used for opening the vault door. :)

/*
Overseer
*/

/datum/job/vault/f13overseer
	title = "Vault-Tec Overseer"
	flag = F13VFEOVERSEER
	head_announce = list("Security")
	total_positions = 1
	spawn_positions = 1
	description = "You are the leader of the Vault, and your word is law. \
	Working with the Security team and your fellow Vault Dwellers, your goal is to ensure the continued prosperity and survival of the vault."
	supervisors = "Vault-Tec"
	req_admin_notify = 1
	exp_requirements = 120

	outfit = /datum/outfit/job/vault/f13overseer

	access = list(ACCESS_VFE, ACCESS_VFE_RESTRICT, ACCESS_VFE_SECURITY, ACCESS_VFE_MEDICAL, ACCESS_VFE_SCIENCE, ACCESS_VFE_ENGINEERING)
	minimal_access = list(ACCESS_VFE, ACCESS_VFE_RESTRICT, ACCESS_VFE_SECURITY, ACCESS_VFE_MEDICAL, ACCESS_VFE_SCIENCE, ACCESS_VFE_ENGINEERING)

/datum/outfit/job/vault/f13overseer
	name = "Overseer"
	jobtype = /datum/job/vault/f13overseer

	implants = list(/obj/item/implant/mindshield)

	id = 			/obj/item/card/id/chief
	gloves =		/obj/item/pda/captain
	uniform = 		/obj/item/clothing/under/f13/vault
	shoes = 		/obj/item/clothing/shoes/f13/military
	glasses = 		/obj/item/clothing/glasses/sunglasses
	ears = 			/obj/item/radio/headset/headset_overseer
	backpack = 		/obj/item/storage/backpack/satchel/leather
	backpack_contents = list(
		/obj/item/melee/classic_baton/telescopic = 1,
		/obj/item/gun/ballistic/automatic/pistol/n99/roundstart = 1,
		/obj/item/ammo_box/magazine/m10mm_adv/simple = 3,
		/obj/item/crowbar = 1)

/*
Security Chief
*/

/datum/job/vault/f13hos
	title = "Vault-Tec Security Chief"
	flag = F13VFEHOS
	head_announce = list("Security")
	total_positions = 1
	spawn_positions = 1
	description = "You are the leader of the Security Team, and your word is near law. \
	Working with the Security team, Overseer and your fellow Vault Dwellers, your goal is to ensure the continued prosperity and survival of the vault. \
	Obey the Overseer's wishes, when possible. You should act as his attack dog, ideally."
	supervisors = "Vault-Tec"
	req_admin_notify = 1
	exp_requirements = 120

	outfit = /datum/outfit/job/vault/f13hos

	access = list(ACCESS_VFE, ACCESS_VFE_RESTRICT, ACCESS_VFE_SECURITY, ACCESS_VFE_MEDICAL, ACCESS_VFE_SCIENCE, ACCESS_VFE_ENGINEERING)
	minimal_access = list(ACCESS_VFE, ACCESS_VFE_RESTRICT, ACCESS_VFE_SECURITY, ACCESS_VFE_MEDICAL, ACCESS_VFE_SCIENCE, ACCESS_VFE_ENGINEERING)

/datum/outfit/job/vault/f13hos
	name = "Vault-Tec Security Chief"
	jobtype = /datum/job/vault/f13hos

	implants = list(/obj/item/implant/mindshield)

	id = 			/obj/item/card/id/chief
	gloves =		/obj/item/pda/captain
	uniform = 		/obj/item/clothing/under/f13/vault
	shoes = 		/obj/item/clothing/shoes/f13/military
	glasses = 		/obj/item/clothing/glasses/sunglasses
	ears = 			/obj/item/radio/headset/headset_vaultsec
	backpack = 		/obj/item/storage/backpack/satchel/leather
	box = /obj/item/storage/survivalkit_aid_adv
	backpack_contents = list(
		/obj/item/melee/classic_baton/telescopic = 1,
		/obj/item/gun/ballistic/automatic/pistol/n99/roundstart = 1,
		/obj/item/ammo_box/magazine/m10mm_adv/simple = 3,
		/obj/item/crowbar = 1)

/*
Engineering Chief
*/

/datum/job/vault/f13coe
	title = "Vault-Tec Engineering Chief"
	flag = F13VFECOE
	head_announce = list("Engineering")
	total_positions = 1
	spawn_positions = 1
	description = "You are the leader of the Engineering Team. \
	Working with the Engineering team, Overseer and your fellow Vault Dwellers, your goal is to ensure the continued prosperity and survival of the vault. \
	Obey the Overseer's wishes, when possible. You should act as his left hand, with the Security Chief as the right, ideally."
	supervisors = "Vault-Tec"
	req_admin_notify = 1
	exp_requirements = 120

	outfit = /datum/outfit/job/vault/f13coe

	access = list(ACCESS_VFE, ACCESS_VFE_RESTRICT, ACCESS_VFE_SECURITY, ACCESS_VFE_MEDICAL, ACCESS_VFE_SCIENCE, ACCESS_VFE_ENGINEERING)
	minimal_access = list(ACCESS_VFE, ACCESS_VFE_RESTRICT, ACCESS_VFE_SECURITY, ACCESS_VFE_MEDICAL, ACCESS_VFE_SCIENCE, ACCESS_VFE_ENGINEERING)

/datum/outfit/job/vault/f13coe
	name = "Vault-Tec Engineer"
	jobtype = /datum/job/vault/f13coe

	id =			/obj/item/card/id/chief
	ears = 			/obj/item/radio/headset/headset_vault/eng
	uniform = 		/obj/item/clothing/under/f13/vault
	belt = 			/obj/item/storage/belt/utility/full/engi
	shoes =			/obj/item/clothing/shoes/sneakers/brown
	head =			/obj/item/clothing/head/hardhat/white
	gloves =		/obj/item/pda/engineering
	r_pocket = 		/obj/item/t_scanner
	backpack = 		/obj/item/storage/backpack/industrial
	satchel = 		/obj/item/storage/backpack/satchel/eng
	duffelbag = 	/obj/item/storage/backpack/duffelbag/engineering
	backpack_contents = list(/obj/item/crowbar = 1)

/*
Security Officer
*/

/datum/job/vault/f13officer
	title = "Vault-Tec Security"
	flag = F13VFEOFFICER
	total_positions = 4
	spawn_positions = 4
	description = "You answer directly to the Overseer. You are the first line of defense against civil unrest and outside intrusion. \
	It is your duty to enforce the laws created by the Overseer and proactively seek out potential threats to the safety of Vault residents."
	exp_requirements = 60

	outfit = /datum/outfit/job/vault/f13security

	access = list(ACCESS_VFE, ACCESS_VFE_SECURITY, ACCESS_VFE_MEDICAL, ACCESS_VFE_ENGINEERING, ACCESS_VFE_SCIENCE)
	minimal_access = list(ACCESS_VFE, ACCESS_VFE_SECURITY, ACCESS_VFE_MEDICAL, ACCESS_VFE_ENGINEERING, ACCESS_VFE_SCIENCE)

/datum/outfit/job/vault/f13security
	name = "Vault-Tec Security"
	jobtype = /datum/job/vault/f13officer

	implants = list(/obj/item/implant/mindshield)

	id =			/obj/item/card/id/sec
	ears = 			/obj/item/radio/headset/headset_vaultsec
	uniform = 		/obj/item/clothing/under/f13/vault
	head = 			/obj/item/clothing/head/helmet/riot/vaultsec
	suit =			/obj/item/clothing/suit/armored/f13/light/vfe_vest
	gloves =		/obj/item/pda/security
	glasses = 		/obj/item/clothing/glasses/sunglasses
	shoes = 		/obj/item/clothing/shoes/f13/military
	belt = 			/obj/item/storage/belt/security
	r_hand =		/obj/item/gun/ballistic/automatic/pistol/n99/roundstart
	l_pocket = 		/obj/item/restraints/handcuffs
	r_pocket = 		/obj/item/assembly/flash/handheld
	backpack = 		/obj/item/storage/backpack/security
	satchel = 		/obj/item/storage/backpack/satchel/sec
	duffelbag = 	/obj/item/storage/backpack/duffelbag/sec
	box = /obj/item/storage/survivalkit_aid_adv
	backpack_contents = list(
		/obj/item/melee/classic_baton/police = 1,
		/obj/item/restraints/handcuffs = 1,
		/obj/item/ammo_box/magazine/m10mm_adv/simple = 2,
		/obj/item/crowbar = 1)

/*
Medical Doctor
*/

/datum/job/vault/f13doctor
	title = "Vault-Tec Doctor"
	flag = F13VFEDOCTOR
	total_positions = 2
	spawn_positions = 2
	description = "You answer directly to the Overseer. You are tasked with ensuring the medical well-being of everyone in the Vault."

	outfit = /datum/outfit/job/vault/f13doctor

	access = list(ACCESS_VFE, ACCESS_VFE_MEDICAL)
	minimal_access = list(ACCESS_VFE, ACCESS_VFE_MEDICAL)

	starting_modifiers = list(/datum/skill_modifier/job/surgery, /datum/skill_modifier/job/affinity/surgery)

/datum/outfit/job/vault/f13doctor
	name = "Medical Doctor"
	jobtype = /datum/job/vault/f13doctor
	chemwhiz = TRUE

	id = /obj/item/card/id/vaultiecard
	uniform = 		/obj/item/clothing/under/f13/vault
	ears = 			/obj/item/radio/headset/headset_vault/med
	shoes = 		/obj/item/clothing/shoes/f13/military
	suit =			/obj/item/clothing/suit/toggle/labcoat
	l_hand = 		/obj/item/storage/firstaid/regular
	gloves =		/obj/item/pda/medical
	suit_store = 	/obj/item/flashlight/pen
	backpack = 		/obj/item/storage/backpack/medic
	satchel = 		/obj/item/storage/backpack/satchel/med
	duffelbag = 	/obj/item/storage/backpack/duffelbag/med
	backpack_contents = list(
		/obj/item/crowbar = 1)

/datum/outfit/job/vault/f13doctor/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_MEDICALEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SURGERY_HIGH, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDICALGRADUATE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_ENCLAVE_CODES, TRAIT_GENERIC)// Used for opening the vault door. :)

/*
Scientist
*/

/datum/job/vault/f13vaultscientist
	title = "Vault-Tec Scientist"
	flag = F13VFESCIENTIST
	total_positions = 2
	spawn_positions = 2
	description = "You answer directly to the Overseer.\
	You are tasked with researching new technologies, conducting mining expeditions, and upgrading the machinery of the Vault."

	outfit = /datum/outfit/job/vault/f13vaultscientist

	access = list(ACCESS_VFE, ACCESS_VFE_SCIENCE)
	minimal_access = list(ACCESS_VFE, ACCESS_VFE_SCIENCE)

/datum/outfit/job/vault/f13vaultscientist
	name = "Scientist"
	jobtype = /datum/job/vault/f13vaultscientist
	chemwhiz = TRUE

	id = /obj/item/card/id/vaultiecard
	uniform = 		/obj/item/clothing/under/f13/vault
	ears = 			/obj/item/radio/headset/headset_vault/sci
	shoes = 		/obj/item/clothing/shoes/f13/military
	suit =			/obj/item/clothing/suit/toggle/labcoat
	gloves =		/obj/item/pda/toxins
	backpack = 		/obj/item/storage/backpack/science
	satchel = 		/obj/item/storage/backpack/satchel/tox
	backpack_contents = list(/obj/item/crowbar = 1)

/datum/outfit/job/vault/f13vaultscientist/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_SURGERY_MID, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_CYBERNETICIST, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_CYBERNETICIST_EXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_RESEARCHER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_ENCLAVE_CODES, TRAIT_GENERIC)// Used for opening the vault door. :)

/*
Vault Engineer
*/

/datum/job/vault/f13vaultengineer
	title = "Vault-Tec Engineer"
	flag = F13VFEENGINEER
	total_positions = 2
	spawn_positions = 2
	description = "You answer directly to the Overseer. You are tasked with overseeing the Reactor, maintaining Vault defenses and machinery, and engaging in construction projects to improve the Vault as a whole."

	outfit = /datum/outfit/job/vault/f13vaultengineer

	access = list(ACCESS_VFE, ACCESS_VFE_ENGINEERING)
	minimal_access = list(ACCESS_VFE, ACCESS_VFE_ENGINEERING)

/datum/outfit/job/vault/f13vaultengineer
	name = "Vault-Tec Engineer"
	jobtype = /datum/job/vault/f13vaultengineer

	id = /obj/item/card/id/vaultiecard
	ears = 			/obj/item/radio/headset/headset_vault/eng
	uniform = 		/obj/item/clothing/under/f13/vault
	belt = 			/obj/item/storage/belt/utility/full
	shoes = 		/obj/item/clothing/shoes/sneakers/red
	gloves =		/obj/item/pda/engineering
	head = 			/obj/item/clothing/head/hardhat
	r_pocket = 		/obj/item/t_scanner
	backpack = 		/obj/item/storage/backpack/industrial
	satchel = 		/obj/item/storage/backpack/satchel/eng
	duffelbag = 	/obj/item/storage/backpack/duffelbag/engineering
	backpack_contents = list(/obj/item/crowbar = 1)

/*
Vault Dweller
*/

/datum/job/vault/f13vaultDweller
	title = "Vault Dweller"
	flag = F13VFEDWELLER
	department_flag = VAULT
	department_head = list("Overseer")
	total_positions = -1
	spawn_positions = -1
	description = "You're one of many within this old-world vault. Bankrolled by your ancestors ages ago, it's here that their lineage continues. \
	By all accounts, it's a well lit, comfy hole in the earth, with a well established compound on the surface for trading. \
	Try to listen to the Overseer, lest you wish to fall on their bad side."
	exp_requirements = 60
	exp_type = EXP_TYPE_FALLOUT

	outfit = /datum/outfit/job/vault/f13vaultDweller

/datum/outfit/job/vault/f13vaultDweller
	name = "Vault Dweller"
	id = /obj/item/card/id/vfe
	jobtype = /datum/job/vault/f13vaultDweller
	backpack = 		/obj/item/storage/backpack/satchel/leather
	backpack_contents = list(/obj/item/crowbar = 1)

// Special - 'Borg
/datum/job/vault/f13borg
	title = "Vault-Tec Robot"
	flag = F13CYBORG
	total_positions = 1
	spawn_positions = 1
	description = "You are a Robotic unit assigned to Vault Fifty-Eight. \
	As a Robot for Vault-Tec, you're bound to the orders of the assigned Overseer, Security and Dwellers, in that order for priority. \
	Should the Overseer or Security declare something, you must follow it. You may ignore the general population otherwise, \
	so long as it doesn't conflict with your laws."
	exp_requirements = 60

/datum/job/vault/f13borg/equip(mob/living/carbon/human/H, visualsOnly = FALSE, announce = TRUE, latejoin = FALSE, datum/outfit/outfit_override = null, client/preference_source)
	return H.Robotize(FALSE, latejoin)

/datum/job/vault/f13borg/override_latejoin_spawn()
	return TRUE

/datum/job/vault/f13borg/after_spawn(mob/living/silicon/robot/R, mob/M)
	. = ..()
	ADD_TRAIT(R, TRAIT_TECHNOPHREAK, TRAIT_GENERIC)
	ADD_TRAIT(R, TRAIT_ENCLAVE_CODES, TRAIT_GENERIC)// Used for opening the vault door. :)
	R.apply_pref_name("cyborg", M.client)
	R.gender = NEUTER
	R.forceMove(pick(GLOB.special_borg_start))
