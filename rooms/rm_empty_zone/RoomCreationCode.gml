	music_add("WEAPON WING ZONE - SEAN EVANS", bgm_weaponwing_test, 7.625)
	
	//NOTE: Dublicate this room to make levels!
	with(obj_level)
	{
		//Set stage music and loop points
		stage_music = "WEAPON WING ZONE - SEAN EVANS";
		
		//Set level name
		stage_name = "Empty Room";
		
		author_name = "NO ONE"
		
		//Set stage act
		act = 0;
		
		//Is next level doing act transition
		act_transition = false;
		
		//Animal array
		animal = [A_FLICKY, A_CUCKY, A_RICKY];
		
		//Next level
		next_level = room;
	}