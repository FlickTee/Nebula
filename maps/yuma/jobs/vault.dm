/datum/job/vault
	department_refs = list(DEPT_VAULT)
	not_random_selectable = 1
	ideal_character_age = 50
	not_random_selectable = 1

/datum/job/vault/overseer
	title = "Overseer"
	supervisors = "the Vault-Tek instruction manual"
//	outfit_type = /decl/hierarchy/outfit/job/ncr/colonel
	head_position = 1
	total_positions = 1
	spawn_positions = 1
	selection_color = "#414176"
	req_admin_notify = 1
//Todo: Access
	access = list()
	minimal_access = list()

/datum/job/vault/security_chief
	title = "Security Chief"
	supervisors = "the Overseer"
//	outfit_type = /decl/hierarchy/outfit/job/ncr/colonel
	head_position = 1
	total_positions = 1
	spawn_positions = 1
	selection_color = "#414176"
	req_admin_notify = 1
//Todo: Access
	access = list()
	minimal_access = list()

/datum/job/vault/security_officer
	title = "Security Officer"
	supervisors = "the Security Chief"
//	outfit_type = /decl/hierarchy/outfit/job/ncr/colonel
	total_positions = 4
	spawn_positions = 4
	selection_color = "#414176"
	req_admin_notify = 1
//Todo: Access
	access = list()
	minimal_access = list()

/datum/job/vault/vault_dweller
	title = "Vault Dweller"
	supervisors = "the Overseer, the Vault-Tek Directives"
//	outfit_type = /decl/hierarchy/outfit/job/ncr/colonel
	total_positions = 10
	spawn_positions = 10
	selection_color = "#414176"
//Todo: Access
	access = list()
	minimal_access = list()
	alt_titles = list(
		"Scientist",
		"Engineer",
		"Botanist",
		"Roboticist",
		"Laborer"
	)