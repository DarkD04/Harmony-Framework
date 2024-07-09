/// @description Script
	//Add frames
	Frames += image_speed;
	
	//Disable animation loop
	image_index = min(Frames, image_number-1);
	
	//Destroy if animation is done
	if(Frames >= image_number)
		instance_destroy(id);
		
	//Destroy if effect is off-screen
	if(!on_screen(16, 16))
		instance_destroy(id);
		
	if(image_xscale <= 0 or image_yscale <= 0 )
		instance_destroy(id);
		
	//Physics
	x += x_speed;
	y += y_speed;
	
	//Acceleration
	x_speed += x_accel;
	y_speed += y_accel;
	
	//hey
	image_alpha += trans_speed
	image_angle += ang_speed
	image_xscale += xscale_spd
	image_yscale += yscale_spd