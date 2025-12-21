
	
	//NOTE: Duplicate this room to make levels!
	with(obj_level)
	{
		//Set stage music and loop points
		stage_music = "FOREGONE DESTRUCTION - MICHIEL VAN DEN BOS"
		
		//Set level name
		stage_name = "Your Level Here";
		
		//Set stage act
		act = 0;
		
		//Is next level doing act transition in case if you do a multi-zone level.
		act_transition = false;
		
		//HLDC specifics
		red_ring_count = 5;
		
		is_emerald_hunt = false;
		emerald_hunt_total = 3;
		
		//Animal array
		animal = [A_FLICKY, A_CUCKY, A_RICKY];
		
		//Next level
		next_level = room;
	}