function player_movement(){	
	//Cap the speed
	x_speed = clamp(x_speed, -max_speed, max_speed);
	y_speed = clamp(y_speed, -max_speed, max_speed);
	ground_speed = clamp(ground_speed, -max_speed, max_speed);
	

	//Moving on the angle:
	if(ground)
	{
		x_speed = ground_speed * dcos(ground_angle);
		y_speed = ground_speed * -dsin(ground_angle);
	}
	
	//Airborn events:
	if(!ground && gravity_allow)
	{
		//Add gravity to y speed:
		y_speed += y_accel/steps;	
	}
	
	//Update position with speed:
	x += x_speed/steps;
	y += y_speed/steps;
	
	//Get the speed
	var spd = ground ? ground_speed : x_speed;
	
	//Don't allow player to go off screen
	x = clamp(x, obj_camera.limit_left + 16, obj_camera.limit_right - 16)
	if(x <= obj_camera.limit_left + 16 && spd < 0 || x >= obj_camera.limit_right - 16 && spd > 0)
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
	if(ground && ground_angle = 0) 
	{
		wall_h = 4;
	}
}