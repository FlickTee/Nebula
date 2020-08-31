/datum/job/ncr
	guestbanned = 1
	department_refs = list(DEPT_NCR)
	not_random_selectable = 1
	ideal_character_age = 50

/datum/job/ncr/brig_gen
	title = "NCR Brigadier-General"
	supervisors = "the NCR President, any visiting Generals"
//	outfit_type = /decl/hierarchy/outfit/job/ncr/colonel
	head_position = 1
	total_positions = 1
	spawn_positions = 1
	selection_color = "#915190"
	req_admin_notify = 1
//Todo: Access
	access = list()
	minimal_access = list()
	is_whitelisted_role = TRUE

/datum/job/ncr/colonel
	title = "NCR Colonel"
	supervisors = "the NCR President, any visiting Generals"
//	outfit_type = /decl/hierarchy/outfit/job/ncr/colonel
	head_position = 1
	total_positions = 1
	spawn_positions = 1
	selection_color = "#915190"
	req_admin_notify = 1
//Todo: Access
	access = list()
	minimal_access = list()
	must_fill = 1
	is_whitelisted_role = TRUE
	not_random_selectable = 1

/datum/job/ncr/lieutenant
	title = "NCR Lieutenant"
	supervisors = "the Captain"
//	outfit_type = /decl/hierarchy/outfit/job/ncr/colonel
	head_position = 1
	total_positions = 2
	spawn_positions = 2
	selection_color = "#814180"
//Todo: Access
	access = list()
	minimal_access = list()
	is_whitelisted_role = TRUE

/datum/job/ncr/vet_ranger
	title = "NCR Veteran Ranger"
	supervisors = "the Lieutenants, or the Colonel"
//	outfit_type = /decl/hierarchy/outfit/job/ncr/colonel
	total_positions = 1
	spawn_positions = 1
	selection_color = "#7F3C6F"
//Todo: Access
	access = list()
	minimal_access = list()
	is_whitelisted_role = TRUE

/datum/job/ncr/ranger
	title = "NCR Ranger"
	supervisors = "the Veteran Rangers, Lieutenants, or the Colonel"
//	outfit_type = /decl/hierarchy/outfit/job/ncr/colonel
	total_positions = 3
	spawn_positions = 3
	selection_color = "#7F3C6F"
//Todo: Access
	access = list()
	minimal_access = list()
	is_whitelisted_role = TRUE

/datum/job/ncr/sergeant
	title = "NCR Sergeant"
	supervisors = "the Lieutenants or Captain"
//	outfit_type = /decl/hierarchy/outfit/job/ncr/colonel
	total_positions = 3
	spawn_positions = 3
	selection_color = "#7F3C6F"
//Todo: Access
	access = list()
	minimal_access = list()
	is_whitelisted_role = TRUE

/datum/job/ncr/corporal
	title = "NCR Corporal"
	supervisors = "the Sergeants, Lieutenants or Captain"
//	outfit_type = /decl/hierarchy/outfit/job/ncr/colonel
	total_positions = 6
	spawn_positions = 6
	selection_color = "#773767"
//Todo: Access
	access = list()
	minimal_access = list()

/datum/job/ncr/private
	title = "NCR Private"
	supervisors = "basically everyone"
//	outfit_type = /decl/hierarchy/outfit/job/ncr/colonel
	total_positions = 9
	spawn_positions = 9
	selection_color = "#743464"
//Todo: Access
	access = list()
	minimal_access = list()
	not_random_selectable = 0