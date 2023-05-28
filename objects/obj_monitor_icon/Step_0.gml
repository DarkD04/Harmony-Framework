/// @description Scripts
	//Stop the looping
	if(image_index >= image_number - 1)
	{
		image_speed = 0;	
	}
	
	//Move up
	y = lerp(y, target_y, 0.1);
	
	//Add timer
	timer += 1;
	
	//Destroy
	if(timer = 64)
	{
		event_user(0);
		dust_effect(1);
	}