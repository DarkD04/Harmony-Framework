/// @description Return to player

	target_x = approach(target_x, target.x, return_speed);
	target_y = approach(target_y, target.y, return_speed);
	
	return_speed += 0.25;
	
	if(target_x = target.x && target_y = target.y)
	{
		return_speed = 0;
		mode = 0;
	}