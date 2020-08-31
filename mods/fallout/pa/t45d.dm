/obj/item/rig/powerarmor
	name = "t45d control harness"
	desc = "A control harness for a suit of power armor built roughly 200 years ago."
	icon = 'mods/fallout/icons/rebase/pa/t45d.dmi'
//	on_mob_icon = 'icons/fallout/rebase/pa/t45d.dmi' //Same file for easier use-- obsolete now?
	icon_state = "world"
	suit_type = "power armor"
	armor = list(
		melee = ARMOR_MELEE_VERY_HIGH,
		bullet = ARMOR_BALLISTIC_RIFLE,
		laser = ARMOR_LASER_MAJOR,
		energy = ARMOR_ENERGY_MINOR,
		bomb = ARMOR_BOMB_RESISTANT,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_RESISTANT
		)
	online_slowdown = 1
	offline_slowdown = 3
	offline_vision_restriction = TINT_HEAVY
	//todo: fill
	allowed = list()

	chest_type = /obj/item/clothing/suit/space/rig/t45d
	helm_type = /obj/item/clothing/head/helmet/space/rig/t45d
	boot_type = /obj/item/clothing/shoes/magboots/rig/t45d
	glove_type = /obj/item/clothing/gloves/rig/t45d

/obj/item/clothing/head/helmet/space/rig/t45d
//todo: find the left facing
	light_overlay = "helmet_light_dual_green"

/obj/item/clothing/suit/space/rig/t45d

/obj/item/clothing/shoes/magboots/rig/t45d

/obj/item/clothing/gloves/rig/t45d
	item_flags = ITEM_FLAG_THICKMATERIAL | ITEM_FLAG_NOCUFFS

/obj/item/rig/powerarmor/equipped
	initial_modules = list(
		/obj/item/rig_module/mounted/egun,
		/obj/item/rig_module/vision/thermal,
		/obj/item/rig_module/grenade_launcher,
		/obj/item/rig_module/electrowarfare_suite,
		/obj/item/rig_module/cooling_unit,
		/obj/item/rig_module/voice
		)
