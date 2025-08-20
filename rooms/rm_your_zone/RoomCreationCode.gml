	
	music_add("FOREGONE DESTRUCTION - MICHIEL VAN DEN BOS", bgm_foregone, 0.000) //Loop is in seconds and miliseconds
	
	//You may modify these values for your level:
	global.use_airroll = false;
	global.use_battery_rings = false;
	global.use_dropdash = true;
	global.use_peelout = true;
	global.use_spindash = true;
	
	//NOTE: Duplicate this room to make levels!
	with(obj_level)
	{
		//Set stage music and loop points
		stage_music = "FOREGONE DESTRUCTION - MICHIEL VAN DEN BOS"
		
		//Set level name
		stage_name = "Your Level Here";
		
		author_name = "INSERT YOUR NAME HERE"
		
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