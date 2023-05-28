/// @description Card events

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
		Input.DisableInput = false;
		obj_level.disable_timer = false;	
		obj_hud.slide_in = true;
		
		//End card
		if(timer = 170) instance_destroy();
	}