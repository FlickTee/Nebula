/datum/map/yuma
	default_assistant_title = "Wastelander"
	allowed_jobs = list(

		/datum/job/ncr/brig_gen,
		/datum/job/ncr/colonel,
		/datum/job/ncr/lieutenant,
		/datum/job/ncr/vet_ranger,
		/datum/job/ncr/ranger,
		/datum/job/ncr/sergeant,
		/datum/job/ncr/corporal,
		/datum/job/ncr/private,

		/datum/job/vault/overseer,
		/datum/job/vault/security_chief,
		/datum/job/vault/security_officer,
		/datum/job/vault/vault_dweller,

		/datum/job/oasis/mayor,
		/datum/job/oasis/secretary,
		/datum/job/oasis/banker,
		/datum/job/oasis/shopkeeer,
		/datum/job/oasis/tavern_keeper,
		/datum/job/oasis/sheriff,
		/datum/job/oasis/deputy,
		/datum/job/oasis/militia,
		/datum/job/oasis/preacher,
		/datum/job/oasis/citizen,


		/datum/job/bos/elder,
		/datum/job/bos/headscribe,
		/datum/job/bos/sentinel,
		/datum/job/bos/senior_paladin,
		/datum/job/bos/senior_knight,
		/datum/job/bos/senior_scribe,
		/datum/job/bos/paladin,
		/datum/job/bos/knight,
		/datum/job/bos/scribe,
		/datum/job/bos/initiate,

		/datum/job/legion/centurion,

		/datum/job/assistant
	)

/datum/job/assistant
	title = "Wastelander"
	supervisors = "your own conscience"
	department_refs = list(DEPT_MISC)
