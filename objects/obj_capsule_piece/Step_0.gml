/// @description Script

	//Update position
	x += x_speed;
	y += y_speed;
	
	//Gravity
	y_speed += 0.2;
	
	//Destroy outside
	if(!on_screen()) instance_destroy();