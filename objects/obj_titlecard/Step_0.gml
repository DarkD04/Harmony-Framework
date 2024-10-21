/// @description Card events
	obj_player.input_disable = true
	
	//Remove the title card with debug
	if(!global.title_card)
	{
		instance_destroy();	
		if(!act_card)
		{
			camera_return();
		}
		else
		{
			fade_in_room(5);	
		}
		
		obj_player.input_disable = false;
		obj_level.disable_timer = false;	
		obj_hud.slide_in = true;
	}
	
	//Add title card timer
	timer++;
	
	//Transition in
	if(timer < 100)
	{
		if(timer > 8)  offset[0] = max(offset[0] - 16, 0);
		if(timer > 28)  offset[1] = max(offset[1] - 16, 0);
		if(timer > 46)  offset[2] = max(offset[2] - 16, 0);
		if(timer > 28)  offset[3] = max(offset[3] - 16, 0);
	}
	
	//Transition out
	if(timer > 120)
	{
		offset[0] += 16;	
		offset[3] += 16;	
	}
	
	//Transition out
	if(timer > 140)
	{
		offset[1] += 16;	
		offset[2] += 16;	
	}
	
	//Enable flags
	if(timer > 160)
	{
		if(!act_card)
		{
			camera_return();
		}
		
		obj_player.input_disable = false;
		obj_level.disable_timer = false;	
		obj_hud.slide_in = true;
		
		//End card
		if(timer = 170) instance_destroy();
	}