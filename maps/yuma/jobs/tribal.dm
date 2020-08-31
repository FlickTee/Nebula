
/datum/job/tribal
	department_refs = list(DEPT_TRIBAL)
	not_random_selectable = 1

/datum/job/tribal/chief
	title = "Chief"
	supervisors = "the wellbeing of the tribe and every one of its members"
//	outfit_type = /decl/hierarchy/outfit/job/ncr/colonel
	head_position = 1
	total_positions = 1
	spawn_positions = 1
	selection_color = "#716416"
	req_admin_notify = 1
//Todo: Access
	access = list()
	minimal_access = list()
	ideal_character_age = 70
	is_whitelisted_role = TRUE

/datum/job/tribal/shaman
	title = "Shaman"
	supervisors = "the Chief"
//	outfit_type = /decl/hierarchy/outfit/job/ncr/colonel
	total_positions = 1
	spawn_positions = 1
	selection_color = "#716416"
//Todo: Access
	access = list()
	minimal_access = list()
	ideal_character_age = 50

/datum/job/tribal/warrior
	title = "Warrior"
	supervisors = "the Chief, the Shaman"
//	outfit_type = /decl/hierarchy/outfit/job/ncr/colonel
	total_positions = 5
	spawn_positions = 5
	selection_color = "#716416"
//Todo: Access
	access = list()
	minimal_access = list()
	ideal_character_age = 50


/datum/job/tribal/shaman
	title = "Villager"
	supervisors = "the Chief, the Shaman"
//	outfit_type = /decl/hierarchy/outfit/job/ncr/colonel
	total_positions = 6
	spawn_positions = 6
	selection_color = "#716416"
//Todo: Access
	access = list()
	minimal_access = list()
	ideal_character_age = 50
