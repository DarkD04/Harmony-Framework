/// @description Script
	//Play the animation
	sprite_index = animation;
	
	//Make animation loop
	if(image_index > image_number - 1)
	{
		image_index = image_number - 1;
	}
	
	//Add timer
	timer += 1;

	//Get screen position
	var cx = camera_get_view_x(view_camera[view_current]);
	var cy = camera_get_view_y(view_camera[view_current]);
	
	//Position the bubble 
	if(image_index < 4){
		screen_x = x - cx;	
		screen_y = y - cy;	
	}else{
		x = cx + screen_x;
		y = cy + screen_y;
	}
	
	//Ded
	if(timer > 110) instance_destroy();