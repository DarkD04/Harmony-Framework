	//NOTE: Dublicate this room to make levels!
	with(obj_level)
	{
		//Set stage music and loop points
		stage_music = bgm_arboreal_agate1;
		loop_start = 5.354;
		loop_end = 78.056;
		
		//Set level name
		stage_name = "EMPTY ROOM";
		
		//Set stage act
		act = 1;
		
		//Is next level doing act transition
		act_transition = false;
		
		//Animal array
		animal = [A_FLICKY, A_CUCKY, A_RICKY];
		
		//Next level
		next_level = room;
	}