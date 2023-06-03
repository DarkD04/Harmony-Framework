function player_movement(){	
	//Change angle modes
	if(ground_angle >= 0 && ground_angle <= 45 || ground_angle >= 315 && ground_angle <= 360) mode = 0;
	if(ground_angle >= 46 && ground_angle <= 134) mode = 1;
	if(ground_angle >= 135 && ground_angle <= 225) mode = 2;
	if(ground_angle >= 226 && ground_angle <= 314) mode = 3;
		
	//Cap the speed
	x_speed = clamp(x_speed, -max_speed, max_speed);
	ground_speed = clamp(ground_speed, -max_speed, max_speed);
	
	//Change direction
	switch(mode)
	{
		case 0: x_dir = 0; y_dir = 1; break;	
		case 1: x_dir = 1; y_dir = 0; break;
		case 2: x_dir = 0; y_dir = -1; break;	
		case 3: x_dir = -1; y_dir = 0; break;	
	}	
	//Moving on the angle:
	if(ground)
	{
		x_speed = ground_speed * dcos(ground_angle);
		y_speed = ground_speed * -dsin(ground_angle);
	}
	
	//Airborn events:
	if(!ground && state != ST_KNUXGLIDE)
	{
		//Add gravity to y speed:
		y_speed += y_accel/steps;	
		
	}
	
	//Update position with speed:
	x += x_speed/steps;
	y += y_speed/steps;
	
	//Don't allow player to go off screen
	x = clamp(x, obj_camera.limit_left + 16, obj_camera.limit_right - 16)
	if(x <= obj_camera.limit_left + 16 && ground_speed < 0 || x >= obj_camera.limit_right - 16 && ground_speed > 0)
	{
		ground_speed = 0;
		x_speed = 0;
	}
	
	//Falling case
	if(ground_angle >= 45 && ground_angle <= 360-45 && control_lock = 0 && abs(ground_speed) < 2.5) control_lock = 30;
	if(ground_angle >= 90 && ground_angle <= 270 && abs(ground_speed) < 2.5 && !force_roll) ground = false;
	
	//Vertical wall collision radius reset
	wall_h = 0;
	
	//Offset wall offset on flat ground
	if(ground && ground_angle = 0) wall_h = 4;
	
	//Reset ceiling flag
	touching_ceiling = false;
	
	//If player is inside ceiling
	if(line_check(-hitbox_w, -hitbox_h-1) || line_check(hitbox_w, -hitbox_h-1)) touching_ceiling = true
}