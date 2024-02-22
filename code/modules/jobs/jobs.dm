GLOBAL_LIST_INIT(nonhuman_positions, list(
	"AI",
	"Vault-Tec Robot",
	ROLE_PAI,
	))

GLOBAL_LIST_INIT(command_positions, list(
	"Vault-Tec Overseer",
	"Vault-Tec Security Chief",
	"Vault-Tec Engineering Chief",
	"Commander",
	"DFS Advisor",
	"Foreman",
	))

GLOBAL_LIST_INIT(silicon_whitelist_positions, list(
	"Vault-Tec Robot"))

GLOBAL_LIST_INIT(faction_whitelist_positions, list(
	"Commander",
	"Practitioner",
	"Walker",
	"Militia",
	"Volunteer",

	"DFS Advisor",
	"DFS Enforcer",
	"DFS Agent",
	"DFS Regular",
	"DFS Grunt",

	"Foreman",
	"Lumberjack",

	"Vault-Tec Overseer",
	"Vault-Tec Security Chief",
	"Vault-Tec Engineering Chief",
	"Vault-Tec Security",
	"Vault-Tec Doctor",
	"Vault-Tec Scientist",
	"Vault-Tec Engineer",
	"Vault-Tec Robot",
	"Vault Dweller",
	))

GLOBAL_LIST_INIT(vault_positions, list(
	"Vault-Tec Overseer",
	"Vault-Tec Security Chief",
	"Vault-Tec Engineering Chief",
	"Vault-Tec Security",
	"Vault-Tec Doctor",
	"Vault-Tec Scientist",
	"Vault-Tec Engineer",
	"Vault-Tec Robot",
	"Vault Dweller",
	))

GLOBAL_LIST_INIT(wasteland_positions, list(
	"Wastelander",
	"Tavernkeep",
	))

GLOBAL_LIST_INIT(security_positions, list(
	"Vault-tec Security",
	))

GLOBAL_LIST_INIT(silicon_positions, list(
	"Vault-Tec Robot",
	))

GLOBAL_LIST_INIT(gmb_positions, list(
	"Commander",
	"Practitioner",
	"Walker",
	"Militia",
	"Volunteer",
	))

GLOBAL_LIST_INIT(dfs_positions, list(
	"DFS Advisor",
	"DFS Enforcer",
	"DFS Agent",
	"DFS Regular",
	"DFS Grunt",
	))

GLOBAL_LIST_INIT(lbj_positions, list(
	"Foreman",
	"Lumberjack",
	))

// job categories for rendering the late join menu
GLOBAL_LIST_INIT(position_categories, list(
	EXP_TYPE_GMB = list("jobs" = gmb_positions, "color" = "#6daf838"),
	EXP_TYPE_DFS = list("jobs" = dfs_positions, "color" = "#966c61"),
	EXP_TYPE_LBJ = list("jobs" = lbj_positions, "color" = "#c0c473"),
	EXP_TYPE_VLT = list("jobs" = vault_positions, "color" = "#668959"),
	EXP_TYPE_WASTELAND = list("jobs" = wasteland_positions, "color" = "#5a5a5a"),
	))

GLOBAL_LIST_INIT(exp_jobsmap, list(
	EXP_TYPE_COMMAND = list("titles" = command_positions),

	EXP_TYPE_FALLOUT = list("titles" = vault_positions | wasteland_positions | gmb_positions | dfs_positions | lbj_positions),

	EXP_TYPE_VAULT = list("titles" = vault_positions),

	EXP_TYPE_GMB = list("titles" = gmb_positions),
	EXP_TYPE_DFS = list("titles" = dfs_positions),
	EXP_TYPE_LBJ = list("titles" = lbj_positions),

	))

GLOBAL_LIST_INIT(exp_specialmap, list(
	EXP_TYPE_LIVING = list(), // all living mobs
	EXP_TYPE_ANTAG = list(),
	EXP_TYPE_SPECIAL = list("Lifebringer","Ash Walker","Exile","Servant Golem","Free Golem","Hermit","Translocated Vet","Escaped Prisoner","Hotel Staff","SuperFriend","Space Syndicate","Ancient Crew","Space Doctor","Space Bartender","Beach Bum","Skeleton","Zombie","Space Bar Patron","Lavaland Syndicate","Ghost Role", "Ghost Cafe Visitor"), // Ghost roles
	EXP_TYPE_GHOST = list() // dead people, observers
	))

GLOBAL_PROTECT(exp_jobsmap)
GLOBAL_PROTECT(exp_specialmap)

/proc/guest_jobbans(job)
	return ((job in GLOB.command_positions) || (job in GLOB.nonhuman_positions) || (job in GLOB.security_positions))



//this is necessary because antags happen before job datums are handed out, but NOT before they come into existence
//so I can't simply use job datum.department_head straight from the mind datum, laaaaame.
/proc/get_department_heads(job_title)
	if(!job_title)
		return list()

	for(var/datum/job/J in SSjob.occupations)
		if(J.title == job_title)
			return J.department_head //this is a list

/proc/get_full_job_name(job)
	var/static/regex/cap_expand = new("cap(?!tain)")
	var/static/regex/cmo_expand = new("cmo")
	var/static/regex/hos_expand = new("hos")
	var/static/regex/hop_expand = new("hop")
	var/static/regex/rd_expand = new("rd")
	var/static/regex/ce_expand = new("ce")
	var/static/regex/qm_expand = new("qm")
	var/static/regex/sec_expand = new("(?<!security )officer")
	var/static/regex/engi_expand = new("(?<!station )engineer")
	var/static/regex/atmos_expand = new("atmos tech")
	var/static/regex/doc_expand = new("(?<!medical )doctor|medic(?!al)")
	var/static/regex/mine_expand = new("(?<!shaft )miner")
	var/static/regex/chef_expand = new("chef")
	var/static/regex/borg_expand = new("(?<!cy)borg")

	job = lowertext(job)
	job = cap_expand.Replace(job, "captain")
	job = cmo_expand.Replace(job, "chief medical officer")
	job = hos_expand.Replace(job, "head of security")
	job = hop_expand.Replace(job, "head of personnel")
	job = rd_expand.Replace(job, "research director")
	job = ce_expand.Replace(job, "chief engineer")
	job = qm_expand.Replace(job, "quartermaster")
	job = sec_expand.Replace(job, "security officer")
	job = engi_expand.Replace(job, "station engineer")
	job = atmos_expand.Replace(job, "atmospheric technician")
	job = doc_expand.Replace(job, "medical doctor")
	job = mine_expand.Replace(job, "shaft miner")
	job = chef_expand.Replace(job, "cook")
	job = borg_expand.Replace(job, "cyborg")
	return job
