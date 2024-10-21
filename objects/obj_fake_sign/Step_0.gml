	/// @description Script
	
	//Update the position
	y += y_speed;
	
	//Airborne events
	if(!ground)
	{
		//Gravity
		y_speed += grav;
		
		//Floor detection
		while(collision_instance(0, 0, PLANE_A, true, false))
		{
			y--;
			y_speed = 0;
			ground = true;	
		}
	}
	
	//If there's no floor, make the signpost airborn
	if(!collision_instance(0, 8, PLANE_A, true, false))
	{
		ground = false;	
	}