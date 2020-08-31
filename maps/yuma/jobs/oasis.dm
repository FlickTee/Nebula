/datum/job/oasis
	department_refs = list(DEPT_OASIS)
	skill_points = 0
	not_random_selectable = 0

/datum/job/oasis/mayor
	title = "Mayor"
	supervisors = "the voting constituency"
//	outfit_type = /decl/hierarchy/outfit/job/ncr/colonel
	head_position = 1
	total_positions = 1
	spawn_positions = 1
	selection_color = "#717416"
	req_admin_notify = 1
//Todo: Access
	access = list()
	minimal_access = list()
	ideal_character_age = 70
	not_random_selectable = 1
	is_whitelisted_role = TRUE

/datum/job/oasis/secretary
	title = "Secretary"
	supervisors = "the Mayor, or in the absence of the mayor, the voting public"
//	outfit_type = /decl/hierarchy/outfit/job/ncr/colonel
	total_positions = 1
	spawn_positions = 1
	selection_color = "#717416"
//Todo: Access
	access = list()
	minimal_access = list()
	not_random_selectable = 0

/datum/job/oasis/sheriff
	title = "Sheriff"
	supervisors = "the Mayor and the Law"
//	outfit_type = /decl/hierarchy/outfit/job/ncr/colonel
	total_positions = 1
	spawn_positions = 1
	selection_color = "#717416"
//Todo: Access
	access = list()
	minimal_access = list()
	not_random_selectable = 1

/datum/job/oasis/deputy
	title = "Deputy"
	supervisors = "the Sheriff and the Mayor"
//	outfit_type = /decl/hierarchy/outfit/job/ncr/colonel
	total_positions = 2
	spawn_positions = 2
	selection_color = "#717416"
//Todo: Access
	access = list()
	minimal_access = list()
	not_random_selectable = 1

/datum/job/oasis/militia
	title = "Militia"
	supervisors = "the Sheriff, the Deputies, the Mayor"
//	outfit_type = /decl/hierarchy/outfit/job/ncr/colonel
	total_positions = 4
	spawn_positions = 4
	selection_color = "#717416"
//Todo: Access
	access = list()
	minimal_access = list()

/datum/job/oasis/banker
	title = "Banker"
	supervisors = "the Mayor, the Sheriff"
//	outfit_type = /decl/hierarchy/outfit/job/ncr/colonel
	total_positions = 1
	spawn_positions = 1
	selection_color = "#717416"
//Todo: Access
	access = list()
	minimal_access = list()
	not_random_selectable = 1


/datum/job/oasis/shopkeeer
	title = "Shopkeeper"
	supervisors = "your pocketbook and maybe the Mayor"
//	outfit_type = /decl/hierarchy/outfit/job/ncr/colonel
	total_positions = 1
	spawn_positions = 1
	selection_color = "#717416"
//Todo: Access
	access = list()
	minimal_access = list()
	not_random_selectable = 1

/datum/job/oasis/tavern_keeper
	title = "Tavern Owner"
	supervisors = "the Mayor, your caps"
//	outfit_type = /decl/hierarchy/outfit/job/ncr/colonel
	total_positions = 1
	spawn_positions = 1
	selection_color = "#717416"
//Todo: Access
	access = list()
	minimal_access = list()


/datum/job/oasis/preacher
	title = "Preacher"
	supervisors = "your religious beliefs"
//	outfit_type = /decl/hierarchy/outfit/job/ncr/colonel
	total_positions = 1
	spawn_positions = 1
	selection_color = "#717416"
//Todo: Access
	access = list()
	minimal_access = list()
	alt_titles = list(
		"Child of Atom",
		"Hubologist"
	)


/datum/job/oasis/citizen
	title = "Citizen"
	supervisors = "the Mayor"
//	outfit_type = /decl/hierarchy/outfit/job/ncr/colonel
	total_positions = 20
	spawn_positions = 20
	selection_color = "#717416"
//Todo: Access
	access = list()
	minimal_access = list()
	alt_titles = list(
		"Farmer",
		"Scavenger",
		"Mechanic",
		"Bum",
		"Hunter",
		"Socialite",
		"Local Bounty Hunter"
	)

