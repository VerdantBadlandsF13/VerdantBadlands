//#define LOWMEMORYMODE //uncomment this to load centcom and runtime station and thats it.

#include "map_files\generic\CentCom.dmm"

#ifndef LOWMEMORYMODE
	#ifdef ALL_MAPS
		#include "map_files\Brattleboro\Dungeons.dmm"
		#include "map_files\Brattleboro\brattleboro-Upper.dmm"
		#include "map_files\Brattleboro\brattleboro.dmm"
		#include "map_files\Brattleboro\brattleboro-Lower.dmm"
		#include "map_files\Brattleboro\WestBratTriLevel.dmm"
		#ifdef TRAVISBUILDING
			#include "templates.dm"
		#endif
	#endif
#endif
