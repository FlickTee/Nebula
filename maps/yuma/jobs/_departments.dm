#define DEPT_NCR "ncr"
#define DEPT_LEGION "legion"
#define DEPT_VAULT "vault"
#define DEPT_BOS "bos"
#define DEPT_OASIS "oasis"
#define DEPT_TRIBAL "tribal"
#define DEPT_EVENT "event"
#define DEPT_MISC "misc"


/datum/department/ncr
	title = "NCR"
	reference = DEPT_NCR
	announce_channel = "Engineering"
	colour = "#ffa500"

/datum/department/legion
	title = "Caesar's Legion"
	reference = DEPT_LEGION
	announce_channel = "Security"
	colour = "#dd0000"

/datum/department/vault
	title = "Vault 113"
	reference = DEPT_VAULT
//	goals = list(/datum/goal/department/medical_fatalities)
	announce_channel = "Medical"
	colour = "#008000"

/datum/department/bos
	title = "Yuma Chapter Brotherhood"
	reference = DEPT_BOS
	announce_channel = "Science"
	colour = "#a6aba6"

/datum/department/oasis
	title = "Town of Oasis"
	reference = DEPT_OASIS

/datum/department/tribal
	title = "Tribal"
	reference = DEPT_TRIBAL

/datum/department/event
	title = "???"
	reference = DEPT_EVENT
	colour = "#800080"

/datum/department/miscellaneous
	title = "Miscellaneous"
	reference = DEPT_MISC
/*
/datum/department/service
	title = "Service"
	reference = DEPT_SERVICE
	announce_channel = "Service"
	colour = "#88b764"

/datum/department/supply
	title = "Supply"
	reference = DEPT_SUPPLY
	announce_channel = "Supply"
	colour = "#bb9040"

/datum/department/support
	title = "Command Support"
	reference = DEPT_SUPPORT
	announce_channel = "Command"
	colour = "#800080"

/datum/department/exploration
	title = "Exploration"
	reference = DEPT_EXPLORATION
	announce_channel = "Exploration"
	colour = "#68099e"
	*/