/// @description Script
	//Update speed
	if(time > sprite_height + h && type = 1 || type = 0)
	{
		x += x_speed;
		y += y_speed;
	}
	
	//Add timer
	time += 1;
	
	//Destroy
	if(time > timer_end+4)
	{
		instance_destroy();	
	}
	
	