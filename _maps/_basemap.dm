//#define LOWMEMORYMODE //uncomment this to load centcom and the debug testing arena.

#include "map_files\generic\CentCom.dmm"

#ifndef LOWMEMORYMODE
	#ifdef ALL_MAPS
		#include "map_files\Brattleboro\Dungeons.dmm"
		#include "map_files\Brattleboro\brattleboro-Upper.dmm"
		#include "map_files\Brattleboro\brattleboro.dmm"
		#include "map_files\Brattleboro\brattleboro-Lower.dmm"
		#include "map_files\Brattleboro\WestBrattleboro-Upper.dmm"
		#include "map_files\Brattleboro\WestBrattleboro.dmm"
		#include "map_files\Brattleboro\WestBrattleboro-Lower.dmm"
		#ifdef TRAVISBUILDING
			#include "templates.dm"
		#endif
	#endif
#endif
