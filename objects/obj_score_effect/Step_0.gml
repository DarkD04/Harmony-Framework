/// @description Script

	//Update the position
	y += y_speed;
	
	//Friction
	y_speed = min(y_speed + 0.09375, 0)
	
	//Stop the animation
	image_speed = 0;
	
	//timer timer
	timer += 1;
	
	//Destroy after 32 frames
	if(timer >= 32) instance_destroy();