/// @description Script
	//Add angle value
	angle = (angle + spin_speed) mod 360;
	
	//Signpost shadow
	var sign_frames = sprite_get_number(sprite_index) * 2;
	image_index = round(angle / (360/sign_frames));
	
	//Get the player
	var player = instance_nearest(x, y, obj_player);
	
	//Trigger the spin
	if(player.x > x - player.ground_speed && !triggered)
	{
		//Lock the camera
		obj_camera.target_left = x - obj_camera.center_x;
		obj_camera.target_right = x + obj_camera.center_x;
		
		//Spin
		spin_speed = 16;
		triggered = true;
		
		//Sonic be too fast!!!
		if (player.ground_speed > 6)
		{
			ground = false;
			y_speed = abs(player.ground_speed) * -0.5;
		}
	}
	
	//Slow dow the spin
	if(triggered && ground)
	{
		//Slow down normally
		spin_speed = max(spin_speed - 0.066, 0);
		
		//Until the stop!
		if(spin_speed < 1 && angle mod 360 < 180) angle += 1.5;
		
		//Patch
		if(spin_speed = 0 && angle >= 180) angle = 180;
	}
	
	//Bump the sign
	if(triggered && y_speed > 0 && player_collide_object(C_TOP) && player.y_speed < 0)
	{
		y_speed = -2;
		x_speed = (x - player.x) / 16;
	}
	
	//Update speeds
	x += x_speed;
	y += y_speed;
	
	//Add gravity
	if(!ground) y_speed += 0.046875;
	

	//Ground detection
	while(instance_place(x, y, par_solid))
	{
		y -= 1;	
		ground = true;
		x_speed = 0;
		y_speed = 0;
	}
	
	//Create act clear object
	if(!instance_exists(obj_act_clear) && triggered && angle = 180 && spin_speed = 0) instance_create_depth(0, 0, 0, obj_act_clear)