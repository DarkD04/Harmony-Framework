/// @description Value and startup

	//Create capsule button
	button = instance_create_depth(x, y+1, depth, obj_capsule_button);
	active = false;
	timer = 0;
	
	//Don't play the animation
	image_speed = 0;