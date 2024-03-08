// FO13 Faction Start. Set to override for the time being to allow latejoining in their original spots.
/obj/effect/landmark/start/f13
	icon = 'icons/mob/landmarks.dmi'
	jobspawn_override = TRUE
	delete_after_roundstart = FALSE
	icon_state = "Assistant"

/obj/effect/landmark/start/f13/wastelander
	name = "Wastelander"
	icon_state = "Wastelander"

/obj/effect/landmark/start/f13/tavernkeep
	name = "Tavernkeep"
	icon_state = "Bartender"

/obj/effect/landmark/start/f13/hillside_leadership
	name = "Hillside Leadership"
	icon_state = "Bartender"

/obj/effect/landmark/start/f13/hillside_lookout
	name = "Hillside Lookout"
	icon_state = "Bartender"

/obj/effect/landmark/start/f13/hillside_settler
	name = "Hillside Inhabitant"
	icon_state = "Bartender"
// Vault

/obj/effect/landmark/start/f13/overseer
	name = "Vault-Tec Overseer"
	icon_state = "Overseer"

/obj/effect/landmark/start/f13/secchief
	name = "Vault-Tec Security Chief"
	icon_state = "Overseer"

/obj/effect/landmark/start/f13/engchief
	name = "Vault-Tec Engineering Chief"
	icon_state = "Overseer"

/obj/effect/landmark/start/f13/vaultdoctor
	name = "Vault-Tec Doctor"
	icon_state = "Vault-tec Doctor"

/obj/effect/landmark/start/f13/vaultscientist
	name = "Vault-Tec Scientist"
	icon_state = "Vault-tec Scientist"

/obj/effect/landmark/start/f13/vaultsecurityofficer
	name = "Vault-Tec Security"
	icon_state = "Vault-tec Security"

/obj/effect/landmark/start/f13/vaultengineer
	name = "Vault-Tec Engineer"
	icon_state = "Vault-tec Engineer"

/obj/effect/landmark/start/f13/vaultdweller
	name = "Vault Dweller"
	icon_state = "Vault Dweller"

/obj/effect/landmark/start/f13/vaultrobot
	name = "Vault-Tec Robot"
	icon_state = "Cyborg"

/obj/effect/landmark/start/f13/vaultrobot/Initialize()
	..()
	GLOB.special_borg_start += loc
	return INITIALIZE_HINT_QDEL

// GMB
/obj/effect/landmark/start/f13/gmb_commander
	name = "Commander"
	icon_state = "Raider"

/obj/effect/landmark/start/f13/gmb_practitioner
	name = "Practitioner"
	icon_state = "Pusher"

/obj/effect/landmark/start/f13/gmb_walker
	name = "Walker"
	icon_state = "Boss"

/obj/effect/landmark/start/f13/gmb_militia
	name = "Militia"
	icon_state = "Pusher"

/obj/effect/landmark/start/f13/gmb_volunteer
	name = "Volunteer"
	icon_state = "Tribal"

// DFS

/obj/effect/landmark/start/f13/dfs_advisor
	name = "DFS Advisor"
	icon_state = "Raider"

/obj/effect/landmark/start/f13/dfs_enforcer
	name = "DFS Enforcer"
	icon_state = "Pusher"

/obj/effect/landmark/start/f13/dfs_agent
	name = "DFS Agent"
	icon_state = "Boss"

/obj/effect/landmark/start/f13/dfs_regular
	name = "DFS Regular"
	icon_state = "Pusher"

/obj/effect/landmark/start/f13/dfs_grunt
	name = "DFS Grunt"
	icon_state = "Tribal"

// LBJ
/obj/effect/landmark/start/f13/lbj_foreman
	name = "Foreman"
	icon_state = "Preacher"

/obj/effect/landmark/start/f13/lbj_lumberjack
	name = "Lumberjack"
	icon_state = "Shopkeeper"
