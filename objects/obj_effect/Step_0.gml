/// @description Script
	//Add frames
	frame += image_speed;
	
	//Disable animation loop
	image_index = min(frame, image_number-1);
	
	//Destroy if animation is done
	if(frame >= image_number)
	{
		instance_destroy();
	}
		
	//Destroy if effect is off-screen
	if(!on_screen(16, 16))
	{
		instance_destroy();
	}
		
	//Physics
	x += x_speed;
	y += y_speed;
	
	//Acceleration
	x_speed += x_accel;
	y_speed += y_accel;
	
	//Update other stuff
	image_alpha += trans_speed
	image_angle += ang_speed
	image_xscale += xscale_spd
	image_yscale += yscale_spd