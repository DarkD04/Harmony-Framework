/// @description Script
	
	//Update speeds
	x += x_speed;
	y += y_speed;
	
	//Gravity
	y_speed += grav;
	
	//Rotation
	image_angle += angle_speed;
	
	//Destroy off screen
	if(!on_screen(64, 64)) instance_destroy();