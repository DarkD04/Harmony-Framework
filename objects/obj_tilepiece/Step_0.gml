/// @description Script
	//Update speed
	x += x_speed;
	y += y_speed;
	
	//Add gravity
	if(delay = 0)y_speed += 0.25
	
	//Subtract timer
	delay = max(delay - 1, 0);
	
	//Destroy off screen
	if(!on_screen(32, 32)) instance_destroy();