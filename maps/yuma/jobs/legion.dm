/datum/job/legion
	department_refs = list(DEPT_LEGION)
	skill_points = 0
	not_random_selectable = 1

/datum/job/legion/centurion
	title = "Centurion"
	supervisors = "Caesar's Legates or Caesar himself"
//	outfit_type = /decl/hierarchy/outfit/job/ncr/colonel
	head_position = 1
	total_positions = 2
	spawn_positions = 2
	selection_color = "#111416"
	req_admin_notify = 1
//Todo: Access
	access = list()
	minimal_access = list()
	ideal_character_age = 50
	not_random_selectable = 1

