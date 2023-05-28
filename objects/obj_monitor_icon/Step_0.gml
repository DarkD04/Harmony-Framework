/// @description Scripts
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

	//Add timer
	timer += 1;
	
	//Destroy
	if(timer = 50)
	{
		event_user(0);
		dust_effect(1);
	}