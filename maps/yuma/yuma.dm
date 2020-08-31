#if !defined(USING_MAP_DATUM)

	#include "yuma_areas.dm"
	#include "yuma_jobs.dm"
	#include "yuma_loadout.dm"
	#include "yuma_spawnpoints.dm"
	#include "yuma_unit_testing.dm"
	#include "yuma_map_marks.dm"


	#include "yuma-1.dmm"
	#include "yuma-2.dmm"
	#include "yuma-3.dmm"
	#include "yuma-4.dmm"
	#include "yuma-5.dmm"
	#include "yuma-6.dmm"
	#include "yuma-7.dmm"


	#include "jobs/_departments.dm"

	#include "jobs/bos.dm"
	#include "jobs/legion.dm"
	#include "jobs/ncr.dm"
	#include "jobs/oasis.dm"
	#include "jobs/vault.dm"
	#include "jobs/tribal.dm"
	#include "jobs/misc.dm"

	#include "..\..\mods\fallout\_fallout.dme"

	#define USING_MAP_DATUM /datum/map/yuma

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Yuma

#endif