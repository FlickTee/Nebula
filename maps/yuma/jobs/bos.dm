
/datum/job/bos
	department_refs = list(DEPT_BOS)
	is_whitelisted_role = TRUE
	not_random_selectable = 1
	ideal_character_age = 50

/datum/job/bos/elder
	title = "Brotherhood Elder"
	supervisors = "the Lost Hills commanders"
//	outfit_type = /decl/hierarchy/outfit/job/ncr/colonel
	head_position = 1
	total_positions = 1
	spawn_positions = 1
	selection_color = "#212126"
	req_admin_notify = 1
//Todo: Access
	access = list()
	minimal_access = list()

/datum/job/bos/headscribe
	title = "Brotherhood Head Scribe"
	supervisors = "the Elder"
//	outfit_type = /decl/hierarchy/outfit/job/ncr/colonel
	total_positions = 1
	spawn_positions = 1
	selection_color = "#262628"
//Todo: Access
	access = list()
	minimal_access = list()

/datum/job/bos/sentinel
	title = "Brotherhood Sentinel"
	supervisors = "the Elder"
//	outfit_type = /decl/hierarchy/outfit/job/ncr/colonel
	total_positions = 1
	spawn_positions = 1
	selection_color = "#262628"
//Todo: Access
	access = list()
	minimal_access = list()

/datum/job/bos/senior_paladin
	title = "Brotherhood Senior Paladin"
	supervisors = "the Elder"
//	outfit_type = /decl/hierarchy/outfit/job/ncr/colonel
	total_positions = 1
	spawn_positions = 1
	selection_color = "#262628"
//Todo: Access
	access = list()
	minimal_access = list()

/datum/job/bos/senior_knight
	title = "Brotherhood Senior Knight"
	supervisors = "the Elder"
//	outfit_type = /decl/hierarchy/outfit/job/ncr/colonel
	total_positions = 1
	spawn_positions = 1
	selection_color = "#262628"
//Todo: Access
	access = list()
	minimal_access = list()

/datum/job/bos/senior_scribe
	title = "Brotherhood Senior Scribe"
	supervisors = "the Elder"
//	outfit_type = /decl/hierarchy/outfit/job/ncr/colonel
	total_positions = 1
	spawn_positions = 1
	selection_color = "#262628"
//Todo: Access
	access = list()
	minimal_access = list()

/datum/job/bos/paladin
	title = "Brotherhood Paladin"
	supervisors = "the the Elder, the Sentinel, the Senior Paladin"
//	outfit_type = /decl/hierarchy/outfit/job/ncr/colonel
	total_positions = 4
	spawn_positions = 4
	selection_color = "#262628"
//Todo: Access
	access = list()
	minimal_access = list()
	alt_titles = list(
		"Junior Paladin"
		)

/datum/job/bos/knight
	title = "Brotherhood Knight"
	supervisors = "the Senior Knight or higher ranks"
//	outfit_type = /decl/hierarchy/outfit/job/ncr/colonel
	total_positions = 4
	spawn_positions = 4
	selection_color = "#262628"
//Todo: Access
	access = list()
	minimal_access = list()
	alt_titles = list(
		"Junior Knight"
		)

/datum/job/bos/scribe
	title = "Brotherhood Scribe"
	supervisors = "the Senior Scribe or higher ranks"
//	outfit_type = /decl/hierarchy/outfit/job/ncr/colonel
	total_positions = 4
	spawn_positions = 4
	selection_color = "#262628"
//Todo: Access
	access = list()
	minimal_access = list()
	alt_titles = list(
		"Junior Scribe"
		)

/datum/job/bos/initiate
	title = "Brotherhood Initiate"
	supervisors = "everyone but other Initiates"
//	outfit_type = /decl/hierarchy/outfit/job/ncr/colonel
	total_positions = 3
	spawn_positions = 3
	selection_color = "#262628"
//Todo: Access
	access = list()
	minimal_access = list()
	alt_titles = list(
		"Knight Aspirant",
		"Scribe Aspirant"
		)
	is_whitelisted_role = FALSE
