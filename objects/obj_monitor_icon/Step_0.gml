/// @description Scripts
	
	if(global.chaotix_monitors)
	{
		//Stop the looping
		if(image_index >= image_number - 1)
		{
			image_speed = 0;	
		}
	
		//Move up
		if(image_index < image_number - 1)
		{
			y -= 2;
		}
	}else
	{
		//Update y position
		y += y_speed;
		
		//Stop animation
		image_speed = 0;
		image_index = 0;
		
		//Speed friction
		y_speed = min(y_speed + 0.09375, 0)
	}
	//Add timer
	timer += 1;
	
	//Destroy
	if(timer == 50)
	{
		event_user(0);
		if(global.chaotix_monitors) dust_effect(1); else instance_destroy();
	}